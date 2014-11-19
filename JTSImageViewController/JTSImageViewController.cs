using System;
using MonoTouch.UIKit;
using MonoTouch.Accelerate;
using System.Diagnostics;
using System.Drawing;
using MonoTouch.CoreGraphics;
using MonoTouch.Foundation;
using MonoTouch.CoreAnimation;
using System.Threading.Tasks;
using System.Threading;
using SDWebImage;

namespace JTSImageViewController
{
    public class JTSImageViewController : UIViewController, IUIScrollViewDelegate, IUIGestureRecognizerDelegate
    {
        // Enums
        public enum JTSImageViewControllerMode 
        {
            Image,
            AltText
        }

        public enum JTSImageViewControllerTransition
        {
            FromOriginalPosition,
            FromOffscreen
        }

        public enum JTSImageViewControllerBackgroundStyle
        {
            ScaledDimmed,
            ScaledDimmedBlurred
        }

        // Structs
        public class JTSImageViewControllerStartingInfo
        {
            public bool StatusBarHiddenPriorToPresentation { get; set; }
            public UIStatusBarStyle StatusBarStylePriorToPresentation { get; set; }
            public RectangleF StartingReferenceFrameForThumbnail { get; set; }
            public RectangleF StartingReferenceFrameForThumbnailInPresentingViewControllersOriginalOrientation { get; set; }
            public PointF StartingReferenceCenterForThumbnail { get; set; }
            public UIInterfaceOrientation StartingInterfaceOrientation { get; set; }
            public bool PresentingViewControllerPresentedFromItsUnsupportedOrientation { get; set; }
        }

        public class JTSImageViewControllerFlags
        {
            public bool IsAnimatingAPresentationOrDismissal { get; set; }
            public bool IsDismissing { get; set; }
            public bool IsTransitioningFromInitialModalToInteractiveState { get; set; }
            public bool ViewHasAppeared { get; set; }
            public bool IsRotating { get; set; }
            public bool IsPresented { get; set; }
            public bool RotationTransformIsDirty { get; set; }
            public bool ImageIsFlickingAwayForDismissal { get; set; }
            public bool IsDraggingImage { get; set; }
            public bool ScrollViewIsAnimatingAZoom { get; set; }
            public bool ImageIsBeingReadFromDisk { get; set; }
            public bool IsManuallyResizingTheScrollViewFrame { get; set; }
            public bool ImageDownloadFailed { get; set; }
        }

        // Public Properties
        public JTSImageInfo ImageInfo { get; set; }
        public UIImage Image { get; set; }
        public JTSImageViewControllerMode Mode { get; set; }
        public JTSImageViewControllerBackgroundStyle BackgroundStyle { get; set; }

        // Private Properties
        private JTSImageViewControllerStartingInfo StartingInfo { get; set; }
        private JTSImageViewControllerFlags Flags { get; set; }

        // Private Properties - Autorotation
        private UIInterfaceOrientation LastUsedOrientation { get; set; }
        private CGAffineTransform CurrentSnapshotRotationTransform { get; set; }

        // Private Properties - Views
        private UIView ProgressContainer { get; set; }
        private UIView OuterContainerForScrollView { get; set; }
        private UIView SnapshotView { get; set; }
        private UIView BlurredSnapshotView { get; set; }
        private UIView BlackBackdrop { get; set; }
        private UIImageView ImageView { get; set; }
        private UIScrollView ScrollView { get; set; }
        private UITextView TextView { get; set; }
        private UIProgressView ProgressView { get; set; }
        private UIActivityIndicatorView Spinner { get; set; }

        // Private Properties - Gesture Recognizers
        private UITapGestureRecognizer SingleTapperPhoto { get; set; }
        private UITapGestureRecognizer DoubleTapperPhoto { get; set; }
        private UITapGestureRecognizer SingleTapperText { get; set; }
        private UILongPressGestureRecognizer LongPresserPhoto { get; set; }
        private UIPanGestureRecognizer PanRecognizer { get; set; }

        // Private Properties - UIDynamics
        private UIDynamicAnimator Animator { get; set; }
        private UIAttachmentBehavior AttachmentBehavior { get; set; }
        private PointF ImageDragStartingPoint { get; set; }
        private UIOffset ImageDragOffsetFromActualTranslation { get; set; }
        private UIOffset ImageDragOffsetFromImageCenter { get; set; }
        private JTSImageViewControllerTransition Transition { get; set; }

        // Delegates
        private JTSImageViewControllerDismissalDelegate DismissalDelegate { get; set; }
        private JTSImageViewControllerOptionsDelegate OptionsDelegate { get; set; }
        private JTSImageViewControllerInteractionsDelegate InteractionDelegate { get; set; }
        private JTSImageViewControllerAccessibilityDelegate AccessibilityDelegate { get; set; }

        // Private Properties - Image Downloading
        // @property (strong, nonatomic) NSURLSessionDataTask *imageDownloadDataTask;
        // @property (strong, nonatomic) NSTimer *downloadProgressTimer;

        // Definitions
        // constants
        public const float JTSImageViewController_DefaultAlphaForBackgroundDimmingOverlay = 0.66f;
        public const float JTSImageViewController_DefaultBackgroundBlurRadius = 2.0f;
        private const float JTSImageViewController_MinimumBackgroundScaling = 0.94f;
        private const float JTSImageViewController_TargetZoomForDoubleTap = 3.0f;
        private const float JTSImageViewController_MaxScalingForExpandingOffscreenStyleTransition = 1.25f;
        private const float JTSImageViewController_TransitionAnimationDuration = 0.3f;
        private const float JTSImageViewController_MinimumFlickDismissalVelocity = 800.0f;


        public JTSImageViewController (JTSImageInfo imageInfo, JTSImageViewControllerMode imageMode, JTSImageViewControllerBackgroundStyle backgroundStyle)
        {
            ImageInfo = imageInfo;
            CurrentSnapshotRotationTransform = CGAffineTransform.MakeIdentity();
            Mode = imageMode;
            BackgroundStyle = backgroundStyle;
//            if (Mode == JTSImageViewControllerMode.Image) {
//                SetupImageAndDownloadIfNecessary (imageInfo);
//            }

            Flags = new JTSImageViewControllerFlags ();
            StartingInfo = new JTSImageViewControllerStartingInfo ();

            DismissalDelegate = new JTSImageViewControllerDismissalDelegate ();
            OptionsDelegate = new JTSImageViewControllerOptionsDelegate ();
            InteractionDelegate = new JTSImageViewControllerInteractionsDelegate ();
            AccessibilityDelegate = new JTSImageViewControllerAccessibilityDelegate ();
        }

        // Public Methods

        public async Task DownloadThenShowFromViewController(
            UIViewController viewController, 
            JTSImageViewControllerTransition transition,
            UIView fromView,
            CancellationToken cancel,
            int progressHeight = 0,
            UIActivityIndicatorView spinner = null
        )
        {
            bool newSpinner = false;
            if (spinner == null)
            {
                newSpinner = true;
                spinner = new UIActivityIndicatorView (UIActivityIndicatorViewStyle.WhiteLarge) 
                { BackgroundColor = UIColor.Black.ColorWithAlpha (.5f) };
                spinner.Layer.CornerRadius = 5.0f;

                fromView.AddSubview (spinner);
                spinner.Frame = new RectangleF(
                    fromView.Frame.X,
                    fromView.Frame.Y,
                    fromView.Frame.Width,
                    progressHeight == 0 ? fromView.Frame.Height : progressHeight
                );


            }

            spinner.StartAnimating ();
            spinner.Hidden = false;
            Image = await SetupImageAndDownloadIfNecessary (ImageInfo);
            spinner.StopAnimating ();
            spinner.Hidden = true;

            if (newSpinner)
            {
                spinner.RemoveFromSuperview ();
            }

            if (cancel.IsCancellationRequested)
                return;
            ImageInfo.Image = Image;
            ShowFromViewController (viewController, transition);
            UpdateInterfaceWithImage (Image);
        }

        public void ShowFromViewController(UIViewController viewController, 
            JTSImageViewControllerTransition transition) 
        {

            this.Transition = transition;

            StartingInfo.StatusBarHiddenPriorToPresentation = UIApplication.SharedApplication.StatusBarHidden;
            StartingInfo.StatusBarStylePriorToPresentation = UIApplication.SharedApplication.StatusBarStyle;

            if (Mode == JTSImageViewControllerMode.Image) {
                if (this.Transition == JTSImageViewControllerTransition.FromOffscreen) {
                    ShowImageViewerByScalingDownFromOffscreenPositionWithViewController (viewController);
                } else {
                    ShowImageViewerByExpandingFromOriginalPositionFromViewController (viewController);
                }
            } else if (Mode == JTSImageViewControllerMode.AltText) {
                ShowAltTextFromViewController (viewController);
            }
        }

        public void Dismiss(bool animated)
        {
            if (Flags.IsPresented == false) {
                return;
            }

            Flags.IsPresented = false;

            if (Mode == JTSImageViewControllerMode.AltText) {
                DismissByExpandingAltTextToOffscreenPosition ();
            } else if (Mode == JTSImageViewControllerMode.Image) {
                if (Flags.ImageIsFlickingAwayForDismissal) {
                    DismissByCleaningUpAfterImageWasFlickedOffscreen ();
                } else if (this.Transition == JTSImageViewControllerTransition.FromOffscreen) { // TODO: self.transition == JTSImageViewControllerTransition_FromOffscreen
                    DismissByExpandingImageToOffscreenPosition ();
                } else {
                    bool startingRectForThumbnailIsNonZero = !(StartingInfo.StartingReferenceFrameForThumbnail.X == 0 && StartingInfo.StartingReferenceFrameForThumbnail.Y == 0); 
                    bool useCollapsingThumbnailStyle = startingRectForThumbnailIsNonZero && Image != null && this.Transition != JTSImageViewControllerTransition.FromOffscreen;

                    if (useCollapsingThumbnailStyle) {
                        DismissByCollapsingImageBackToOriginalPosition ();
                    } else {
                        DismissByExpandingImageToOffscreenPosition ();
                    }
                }
            }

        }

        // Private Methods
        private void ShowImageViewerByScalingDownFromOffscreenPositionWithViewController(UIViewController viewController)
        {
            Flags.IsAnimatingAPresentationOrDismissal = true;
            View.UserInteractionEnabled = false;

            SnapshotView = SnapshotFromParentmostViewController (viewController);

            if (BackgroundStyle == JTSImageViewControllerBackgroundStyle.ScaledDimmedBlurred) {
                BlurredSnapshotView = BlurredSnapshotFromParentmostViewController (viewController);
                SnapshotView.AddSubview (BlurredSnapshotView);
                BlurredSnapshotView.Alpha = 0;
            }

            View.InsertSubview (SnapshotView, 0);
            StartingInfo.StartingInterfaceOrientation = UIApplication.SharedApplication.StatusBarOrientation;
            LastUsedOrientation = UIApplication.SharedApplication.StatusBarOrientation;

            RectangleF referenceFrameInWindow = ImageInfo.ReferenceView.ConvertRectToView (ImageInfo.ReferenceRect, null);
            StartingInfo.StartingReferenceFrameForThumbnailInPresentingViewControllersOriginalOrientation = View.ConvertRectFromView (referenceFrameInWindow, null);

            ScrollView.AddSubview (ImageView);
            viewController.PresentViewController (this, false, () => {
                if (UIApplication.SharedApplication.StatusBarOrientation != StartingInfo.StartingInterfaceOrientation) {
                    StartingInfo.PresentingViewControllerPresentedFromItsUnsupportedOrientation = true;
                }

                ScrollView.Alpha = 0;
                ScrollView.Frame = View.Bounds;
                UpdateScrollViewAndImageViewForCurrentMetrics();

                float scaling = JTSImageViewController.JTSImageViewController_MaxScalingForExpandingOffscreenStyleTransition;
                ScrollView.Transform = CGAffineTransform.MakeScale(scaling, scaling);

                float duration = JTSImageViewController.JTSImageViewController_TransitionAnimationDuration;

                // dispatch_async(dispatch_get_main_queue()
                UIView.Animate(duration, 0, UIViewAnimationOptions.BeginFromCurrentState | UIViewAnimationOptions.CurveEaseInOut, () => {
                    // animation
                    Flags.IsTransitioningFromInitialModalToInteractiveState = true;

                    UIApplication.SharedApplication.SetStatusBarHidden(true, UIStatusBarAnimation.Fade);
                    float scaling_new = JTSImageViewController.JTSImageViewController_MinimumBackgroundScaling;

                    // weakSelf.snapshotView.transform = CGAffineTransformConcat(weakSelf.snapshotView.transform, CGAffineTransformMakeScale(scaling, scaling));
                    SnapshotView.Transform = SnapshotView.Transform * CGAffineTransform.MakeScale(scaling_new, scaling_new);

                    if (BackgroundStyle == JTSImageViewControllerBackgroundStyle.ScaledDimmedBlurred)
                        BlurredSnapshotView.Alpha = 1;

                    AddMotionEffectsToSnapshotView();
                    BlackBackdrop.Alpha = AlphaForBackgroundDimmingOverlay();

                    ScrollView.Alpha = 1;
                    ScrollView.Transform = CGAffineTransform.MakeIdentity();

                    if (Image == null) 
                        ProgressContainer.Alpha = 1;

                }, () => {
                    // completion handler
                    Flags.IsTransitioningFromInitialModalToInteractiveState = false;
                    Flags.IsAnimatingAPresentationOrDismissal = false;
                    View.UserInteractionEnabled = true;
                    Flags.IsPresented = true;

                    if (Flags.ImageDownloadFailed)
                        Dismiss(true);
                });
            });
        }

        private void ShowImageViewerByExpandingFromOriginalPositionFromViewController(UIViewController viewController)
        {
            Flags.IsAnimatingAPresentationOrDismissal = true;
            View.UserInteractionEnabled = false;

            SnapshotView = SnapshotFromParentmostViewController (viewController);

            // The view is gone!? well guess we wont be showing any picture then.
            if (SnapshotView == null)
                return;
           
            if (BackgroundStyle == JTSImageViewControllerBackgroundStyle.ScaledDimmedBlurred) {
                BlurredSnapshotView = BlurredSnapshotFromParentmostViewController (viewController);
                SnapshotView.AddSubview (BlurredSnapshotView);
                BlurredSnapshotView.Alpha = 0;
            }

            View.InsertSubview (SnapshotView, 0);
            StartingInfo.StartingInterfaceOrientation = UIApplication.SharedApplication.StatusBarOrientation;
            LastUsedOrientation = UIApplication.SharedApplication.StatusBarOrientation;

            RectangleF referenceFrameInWindow = ImageInfo.ReferenceView.ConvertRectToView (ImageInfo.ReferenceRect, null);
            StartingInfo.StartingReferenceFrameForThumbnailInPresentingViewControllersOriginalOrientation = View.ConvertRectFromView (referenceFrameInWindow, null);

            View.AddSubview (ImageView);

            viewController.PresentViewController (this, false, () => {
                if (UIApplication.SharedApplication.StatusBarOrientation != StartingInfo.StartingInterfaceOrientation) {
                    StartingInfo.PresentingViewControllerPresentedFromItsUnsupportedOrientation = true;
                }

                RectangleF referenceFrameInMyView = View.ConvertRectFromView(referenceFrameInWindow, null);
                StartingInfo.StartingReferenceFrameForThumbnail = referenceFrameInMyView;
                UpdateScrollViewAndImageViewForCurrentMetrics();

                bool mustRotateDuringTransition = UIApplication.SharedApplication.StatusBarOrientation != StartingInfo.StartingInterfaceOrientation;
                if (mustRotateDuringTransition) {
                    RectangleF newStartingRect = SnapshotView.ConvertRectToView(StartingInfo.StartingReferenceFrameForThumbnail, View);
                    ImageView.Frame = newStartingRect;
                    UpdateScrollViewAndImageViewForCurrentMetrics();

                    ImageView.Transform = SnapshotView.Transform;
                    PointF centerInRect = new PointF(0 + StartingInfo.StartingReferenceFrameForThumbnail.Size.Width/2.0f, 0 + StartingInfo.StartingReferenceFrameForThumbnail.Size.Height/2.0f);
                    ImageView.Center = centerInRect;
                }

                /* OPTIONAL METHOD TO IMPLEMENT IN THE FUTURE
                if ([self.optionsDelegate respondsToSelector:@selector(imageViewerShouldFadeThumbnailsDuringPresentationAndDismissal:)]) {
                    if ([self.optionsDelegate imageViewerShouldFadeThumbnailsDuringPresentationAndDismissal:self]) {
                        [self.imageView setAlpha:0];
                        [UIView animateWithDuration:0.15f animations:^{
                            [self.imageView setAlpha:1];
                        }];
                    }
                }
                */

                float duration = JTSImageViewController.JTSImageViewController_TransitionAnimationDuration;
                UIView.Animate(duration, 0, UIViewAnimationOptions.BeginFromCurrentState | UIViewAnimationOptions.CurveEaseInOut, () => {
                    // animations
                    Flags.IsTransitioningFromInitialModalToInteractiveState = true;

                    // if ([UIApplication sharedApplication].jts_usesViewControllerBasedStatusBarAppearance) {
                    //    [weakSelf setNeedsStatusBarAppearanceUpdate];
                    UIApplication.SharedApplication.SetStatusBarHidden(true, UIStatusBarAnimation.Fade);

                    float scaling = JTSImageViewController.JTSImageViewController_MinimumBackgroundScaling;

                    // weakSelf.snapshotView.transform = CGAffineTransformConcat(weakSelf.snapshotView.transform, CGAffineTransformMakeScale(scaling, scaling));
                    SnapshotView.Transform = SnapshotView.Transform * CGAffineTransform.MakeScale(scaling, scaling);

                    if (BackgroundStyle == JTSImageViewControllerBackgroundStyle.ScaledDimmedBlurred) {
                        BlurredSnapshotView.Alpha = 1;
                    }
                    AddMotionEffectsToSnapshotView();
                    BlackBackdrop.Alpha = JTSImageViewController_DefaultAlphaForBackgroundDimmingOverlay;

                    if (mustRotateDuringTransition)
                        ImageView.Transform = CGAffineTransform.MakeIdentity();

                    RectangleF endFrameForImageView;
                    if (Image != null) {
                        endFrameForImageView = ResizedFrameForAutorotatingImageView(Image.Size);
                    }   else {
                        endFrameForImageView = ResizedFrameForAutorotatingImageView(ImageInfo.ReferenceRect.Size);
                    }

                    ImageView.Frame = endFrameForImageView;

                    PointF endCenterForImageView = new PointF(View.Bounds.Size.Width/2.0f, View.Bounds.Size.Height/2.0f);
                    ImageView.Center = endCenterForImageView;

                    if (Image == null) {
                        ProgressContainer.Alpha = 1.0f;
                    }

                }, () => {
                    // completion handler
                    Flags.IsManuallyResizingTheScrollViewFrame = true;
                    ScrollView.Frame = View.Bounds;
                    Flags.IsManuallyResizingTheScrollViewFrame = false;
                    ScrollView.AddSubview(ImageView);

                    Flags.IsTransitioningFromInitialModalToInteractiveState = false;
                    Flags.IsAnimatingAPresentationOrDismissal = false;
                    Flags.IsPresented = true;

                    UpdateScrollViewAndImageViewForCurrentMetrics();

                    if (Flags.ImageDownloadFailed) {
                        Dismiss(true);
                    } else {
                        View.UserInteractionEnabled = true;
                    }

                });

            });
        }

        private void ShowAltTextFromViewController(UIViewController viewController)
        {

        }

        // Snapshots Methods
        private UIView SnapshotFromParentmostViewController(UIViewController viewController)
        {
            if (viewController == null)
                return null;

            var window = viewController.View.Window;
            if (window == null)
                return null;

            UIViewController presentingViewController = window.RootViewController;
            // present viewcontroller is gone?! well gues we're done here then, return null, no image is shown
            // this happes nwhen someone starts an image load on a view controller, navigates to a different vc.
            if (presentingViewController == null)
                return null;

            while (presentingViewController.PresentedViewController != null)
                presentingViewController = presentingViewController.PresentedViewController;
            UIView snapShot = presentingViewController.View.SnapshotView (true);
            snapShot.ClipsToBounds = true;
            return snapShot;
        }

        // TODO: This isn't working just yet I dont think
        private UIView BlurredSnapshotFromParentmostViewController(UIViewController viewController)
        {
            var presentingVc = viewController.View.Window.RootViewController;

            var outerBleed = 20f;
            var performanceDownScalingFactor = 0.25f;
            var scaledOuterBleed = outerBleed * performanceDownScalingFactor;
            var contextBounds = RectangleF.Inflate (presentingVc.View.Bounds, -outerBleed, -outerBleed);
            var scaledBounds = contextBounds;
            scaledBounds.Width *= performanceDownScalingFactor;
            scaledBounds.Height *= performanceDownScalingFactor;
            var scaledDrawingArea = presentingVc.View.Bounds;
            scaledDrawingArea.Width *= performanceDownScalingFactor;
            scaledDrawingArea.Height *= performanceDownScalingFactor;

            UIGraphics.BeginImageContextWithOptions (scaledBounds.Size, true, 0);
            var context = UIGraphics.GetCurrentContext ();
            context.ConcatCTM (CGAffineTransform.MakeTranslation (scaledOuterBleed, scaledOuterBleed));
            presentingVc.View.DrawViewHierarchy (scaledDrawingArea, true);
            var image = UIGraphics.GetImageFromCurrentImageContext ();

            UIGraphics.EndImageContext ();

            var blurRadius = 2.0f;
            var blurredImage = image.ApplyBlur (blurRadius, null, 1f, null);
            var imageView = new UIImageView (contextBounds);
            imageView.Image = blurredImage;
            imageView.AutoresizingMask = UIViewAutoresizing.FlexibleHeight | UIViewAutoresizing.FlexibleWidth;
            imageView.BackgroundColor = UIColor.Black;
            return imageView;

        }

        // Motion Effects Methods
        private void AddMotionEffectsToSnapshotView()
        {
            NSNumber positiveValue = new NSNumber(12);
            NSNumber negativeValue = new NSNumber (-12);

            UIInterpolatingMotionEffect verticalEffect;
            verticalEffect = new UIInterpolatingMotionEffect ("center.y", UIInterpolatingMotionEffectType.TiltAlongVerticalAxis);
            verticalEffect.MinimumRelativeValue = positiveValue;
            verticalEffect.MaximumRelativeValue = negativeValue;

            UIInterpolatingMotionEffect horizontalEffect;
            horizontalEffect = new UIInterpolatingMotionEffect ("center.x", UIInterpolatingMotionEffectType.TiltAlongHorizontalAxis);
            horizontalEffect.MinimumRelativeValue = positiveValue;
            horizontalEffect.MaximumRelativeValue = negativeValue;

            UIMotionEffectGroup effectGroup = new UIMotionEffectGroup ();
            effectGroup.MotionEffects = new UIMotionEffect[] { verticalEffect, horizontalEffect };
            SnapshotView.AddMotionEffect (effectGroup);
        }

        private RectangleF ResizedFrameForAutorotatingImageView(SizeF imageSize)
        {
            RectangleF frame = View.Bounds;
            float screenWidth = frame.Size.Width * ScrollView.ZoomScale;
            float screenHeight = frame.Size.Height * ScrollView.ZoomScale;
            float targetWidth = screenWidth;
            float targetHeight = screenHeight;
            float nativeHeight = screenHeight;
            float nativeWidth = screenWidth;

            if (imageSize.Width > 0 && imageSize.Height > 0) {
                nativeHeight = (imageSize.Height > 0) ? imageSize.Height : screenHeight;
                nativeWidth = (imageSize.Width > 0) ? imageSize.Width : screenWidth;
            }
            if (nativeHeight > nativeWidth) {
                if (screenHeight / screenWidth < nativeHeight / nativeWidth) {
                    targetWidth = screenHeight / (nativeHeight / nativeWidth);
                } else {
                    targetHeight = screenWidth / (nativeWidth / nativeHeight);
                }
            } else {
                if (screenWidth / screenHeight < nativeWidth / nativeHeight) {
                    targetHeight = screenWidth / (nativeWidth / nativeHeight);
                } else {
                    targetWidth = screenHeight / (nativeHeight / nativeWidth);
                }
            }

            frame.Size = new SizeF (targetWidth, targetHeight);
            frame.X = 0;
            frame.Y = 0;
            return frame;
        }

        // TODO: COMPLETE THIS METHOD LATER
        private Task<UIImage> SetupImageAndDownloadIfNecessary(JTSImageInfo imageInfo) 
        {
            var tcs = new TaskCompletionSource<UIImage> ();

            if (imageInfo.Image != null) {
                tcs.SetResult (imageInfo.Image);

            } else {
//                Image = imageInfo.PlaceholderImage;

                RectangleF referenceFrameInWindow = ImageInfo.ReferenceView.ConvertRectToView (ImageInfo.ReferenceRect, null);
                StartingInfo.StartingReferenceFrameForThumbnailInPresentingViewControllersOriginalOrientation = View.ConvertRectFromView (referenceFrameInWindow, null);

                // RUN TASK TO DOWNLOAD IMAGE HERE
                SDWebImageDownloader.SharedDownloader.DownloadImage (
                    url: imageInfo.ImageURL,
                    options: SDWebImageDownloaderOptions.HighPriority,
                    progressHandler: (receivedSize, expectedSize) => {
                        //Console.WriteLine("Downloaded " + (float)receivedSize / (float)expectedSize + "%");
                    },
                    completedHandler: (image, data, error, finished) => {
                        if (image != null && finished) {
                            tcs.SetResult(image);
                        }
                    }
                );
            }
            return tcs.Task;
        }
            
        private void ViewDidLoadForImageMode() 
        {
            View.BackgroundColor = UIColor.Black;
            View.AutoresizingMask = UIViewAutoresizing.FlexibleHeight | UIViewAutoresizing.FlexibleWidth;

            this.BlackBackdrop = new UIView (new RectangleF (View.Bounds.X, View.Bounds.Y, -512, -512));
            this.BlackBackdrop.BackgroundColor = UIColor.Black;
            this.BlackBackdrop.Alpha = 0;
            View.AddSubview (BlackBackdrop);

            ScrollView = new UIScrollView (View.Bounds);
            ScrollView.WeakDelegate = this;
            ScrollView.ZoomScale = 1.0f;
            ScrollView.MaximumZoomScale = 8.0f;
            ScrollView.ScrollEnabled = false;
            ScrollView.IsAccessibilityElement = true;
            //self.scrollView.accessibilityLabel = self.accessibilityLabel; // NEED TO IMPLEMENT THIS
            ScrollView.AccessibilityHint = AccessibilityHintZoomedOut ();
            View.AddSubview (ScrollView);

            RectangleF referenceFrameInWindow = ImageInfo.ReferenceView.ConvertRectToView (ImageInfo.ReferenceRect, null);
            RectangleF referenceFrameInMyView = View.ConvertRectFromView (referenceFrameInWindow, null);

            ImageView = new UIImageView (referenceFrameInMyView);
            ImageView.ContentMode = UIViewContentMode.ScaleAspectFill;
            ImageView.UserInteractionEnabled = true;
            ImageView.IsAccessibilityElement = false;
            ImageView.ClipsToBounds = true;
            ImageView.Layer.AllowsEdgeAntialiasing = true;

            SetupImageModeGestureRecognizers ();

            ProgressContainer = new UIView (new RectangleF (0, 0, 128.0f, 128.0f));
            View.AddSubview (ProgressContainer);

            ProgressView = new UIProgressView (UIProgressViewStyle.Default);
            ProgressView.Progress = 0;
            ProgressView.TintColor = UIColor.White;
            ProgressView.TrackTintColor = UIColor.DarkGray;

            RectangleF progressFrame = ProgressView.Frame;
            ProgressView.Frame = progressFrame;
            ProgressView.Center = new PointF (64.0f, 64.0f);
            ProgressView.Alpha = 0;
            ProgressContainer.AddSubview (ProgressView);
            Spinner = new UIActivityIndicatorView (UIActivityIndicatorViewStyle.WhiteLarge);
            Spinner.Center = new PointF (64.0f, 64.0f);
            Spinner.StartAnimating();
            ProgressContainer.AddSubview (Spinner);
            ProgressContainer.Alpha = 0;

            Animator = new UIDynamicAnimator (ScrollView);

            if (Image != null) {
                UpdateInterfaceWithImage (Image);
            }
        }

        // TODO: COMPLETE THIS METHOD LATER
        private void ViewDidLoadForAltTextMode()
        {

        }

        private void UpdateDimmingViewForCurrentZoomScale(bool animated)
        {
            float targetAlpha = (ScrollView.ZoomScale > 1) ? 1.0f : AlphaForBackgroundDimmingOverlay ();
            float duration = (animated) ? 0.35f : 0;
            UIView.Animate (duration, 0, UIViewAnimationOptions.CurveLinear | UIViewAnimationOptions.BeginFromCurrentState, () => {
                // animation
                BlackBackdrop.Alpha = targetAlpha;
            }, null);               
        }

        // Options Delegate Convenience Methods
        private float AlphaForBackgroundDimmingOverlay()
        {
            float alpha = JTSImageViewController_DefaultAlphaForBackgroundDimmingOverlay;
            return alpha;
        }

        private void SetupImageModeGestureRecognizers()
        {
            UITapGestureRecognizer doubleTapper = null;
            doubleTapper = new UITapGestureRecognizer (ImageDoubleTapped);
            doubleTapper.NumberOfTapsRequired = 2;
            doubleTapper.WeakDelegate = this;
            DoubleTapperPhoto = doubleTapper;

            UILongPressGestureRecognizer longPresser = new UILongPressGestureRecognizer (ImageLongPressed);
            longPresser.WeakDelegate = this;
            LongPresserPhoto = longPresser;

            UITapGestureRecognizer singleTapper = null;
            singleTapper = new UITapGestureRecognizer (ImageSingleTapped);
            singleTapper.RequireGestureRecognizerToFail (doubleTapper);
            singleTapper.RequireGestureRecognizerToFail (longPresser);
            singleTapper.WeakDelegate = this;
            SingleTapperPhoto = singleTapper;

            UIPanGestureRecognizer panner = new UIPanGestureRecognizer (dismissingPanGestureRecognizerPanned);
            panner.WeakDelegate = this;
            ScrollView.AddGestureRecognizer (panner);
            PanRecognizer = panner;

            View.AddGestureRecognizer (singleTapper);
            View.AddGestureRecognizer (doubleTapper);
            View.AddGestureRecognizer (longPresser);
        }

        private UIColor BackgroundColorForImageView()
        {
            return UIColor.Clear;
        }

        // Interface Updates
        private void UpdateInterfaceWithImage(UIImage image)
        {
            if (image != null) {
                Image = image;
                ImageView.Image = image;
                ProgressContainer.Alpha = 0;

                ImageView.BackgroundColor = BackgroundColorForImageView ();

                if (Flags.IsDraggingImage == false) {
                    UpdateLayoutsForCurrentOrientation ();
                }
            }
        }

        private void UpdateLayoutsForCurrentOrientation()
        {
            if (Mode == JTSImageViewControllerMode.Image) {
                UpdateScrollViewAndImageViewForCurrentMetrics ();
                ProgressContainer.Center = new PointF (View.Bounds.Size.Width / 2.0f, View.Bounds.Size.Height / 2.0f);
            } else if (Mode == JTSImageViewControllerMode.AltText) {
                if (Flags.IsTransitioningFromInitialModalToInteractiveState == false) {
                    VerticallyCenterTextInTextView ();
                }
            }

            CGAffineTransform transform = CGAffineTransform.MakeIdentity ();

            if (StartingInfo.StartingInterfaceOrientation == UIInterfaceOrientation.Portrait) {
                switch (UIApplication.SharedApplication.StatusBarOrientation) {
                case UIInterfaceOrientation.LandscapeLeft:
                    transform = CGAffineTransform.MakeRotation ((float)Math.PI / 2.0f);
                    break;
                case UIInterfaceOrientation.LandscapeRight:
                    transform = CGAffineTransform.MakeRotation ((float)-Math.PI / 2.0f);
                    break;
                case UIInterfaceOrientation.Portrait:
                    transform = CGAffineTransform.MakeIdentity ();
                    break;
                case UIInterfaceOrientation.PortraitUpsideDown:
                    transform = CGAffineTransform.MakeRotation ((float)Math.PI);
                    break;
                default:
                    break;
                }

            } else if (StartingInfo.StartingInterfaceOrientation == UIInterfaceOrientation.PortraitUpsideDown) {
                switch (UIApplication.SharedApplication.StatusBarOrientation) {
                case UIInterfaceOrientation.LandscapeLeft:
                    transform = CGAffineTransform.MakeRotation ((float)-Math.PI / 2.0f);
                    break;
                case UIInterfaceOrientation.LandscapeRight:
                    transform = CGAffineTransform.MakeRotation ((float)Math.PI / 2.0f);
                    break;
                case UIInterfaceOrientation.Portrait:
                    transform = CGAffineTransform.MakeRotation ((float)Math.PI);
                    break;
                case UIInterfaceOrientation.PortraitUpsideDown:
                    transform = CGAffineTransform.MakeIdentity ();
                    break;
                default:
                    break;
                }
            } else if (StartingInfo.StartingInterfaceOrientation == UIInterfaceOrientation.LandscapeLeft) {
                switch (UIApplication.SharedApplication.StatusBarOrientation) {
                case UIInterfaceOrientation.LandscapeLeft:
                    transform = CGAffineTransform.MakeIdentity ();
                    break;
                case UIInterfaceOrientation.LandscapeRight:
                    transform = CGAffineTransform.MakeRotation ((float)Math.PI);
                    break;
                case UIInterfaceOrientation.Portrait:
                    transform = CGAffineTransform.MakeRotation ((float)-Math.PI / 2.0f);
                    break;
                case UIInterfaceOrientation.PortraitUpsideDown:
                    transform = CGAffineTransform.MakeRotation ((float)Math.PI / 2.0f);
                    break;
                default:
                    break;
                }
            } else if (StartingInfo.StartingInterfaceOrientation == UIInterfaceOrientation.LandscapeRight) {
                switch (UIApplication.SharedApplication.StatusBarOrientation) {
                case UIInterfaceOrientation.LandscapeLeft:
                    transform = CGAffineTransform.MakeRotation ((float)Math.PI);
                    break;
                case UIInterfaceOrientation.LandscapeRight:
                    transform = CGAffineTransform.MakeIdentity ();
                    break;
                case UIInterfaceOrientation.Portrait:
                    transform = CGAffineTransform.MakeRotation ((float)Math.PI / 2.0f);
                    break;
                case UIInterfaceOrientation.PortraitUpsideDown:
                    transform = CGAffineTransform.MakeRotation ((float)-Math.PI / 2.0f);
                    break;
                default:
                    break;
                }
            }

            // TEST CODE BELOW - DELETE LATER
            // SnapshotView = new UIView ();
            // TEST CODE ABOVE - DELETE LATER

            if (SnapshotView != null) {
                SnapshotView.Center = new PointF (View.Bounds.Size.Width / 2.0f, View.Bounds.Size.Height / 2.0f);
            }

            if (Flags.RotationTransformIsDirty) {
                Flags.RotationTransformIsDirty = false;
                CurrentSnapshotRotationTransform = transform;
                if (Flags.IsPresented) {
                    if (Mode == JTSImageViewControllerMode.Image) {
                        ScrollView.Frame = View.Bounds;
                    }
                    float scaling = JTSImageViewController.JTSImageViewController_MinimumBackgroundScaling;

                    if (SnapshotView != null) {
                        SnapshotView.Transform = transform * CGAffineTransform.MakeScale (scaling, scaling);
                    }
                } else {
                    if (SnapshotView != null) {
                        SnapshotView.Transform = transform;
                    }
                }
            }

        }

        private void VerticallyCenterTextInTextView() // COMPLETE
        {
            RectangleF boundingRect = TextView.LayoutManager.GetUsedRectForTextContainer (TextView.TextContainer);
            UIEdgeInsets insets = TextView.ContentInset;
            if (View.Bounds.Size.Height > boundingRect.Size.Height) {
                insets.Top = (View.Bounds.Size.Height - boundingRect.Size.Height) / 2.0f;
            } else {
                insets.Top = 0;
            }

            TextView.ContentInset = insets;
            TextView.ContentOffset = new PointF (0, 0 - insets.Top);
        }

        private void UpdateScrollViewAndImageViewForCurrentMetrics()
        {
            if (Flags.IsAnimatingAPresentationOrDismissal == false) {
                Flags.IsManuallyResizingTheScrollViewFrame = true;
                ScrollView.Frame = View.Bounds;
                Flags.IsManuallyResizingTheScrollViewFrame = false;
            }

            bool usingOriginalPositionTransition = (this.Transition == JTSImageViewControllerTransition.FromOriginalPosition);
            bool suppressAdjustments = usingOriginalPositionTransition && Flags.IsAnimatingAPresentationOrDismissal;

            if (suppressAdjustments == false) {
                if (Image != null)
                    ImageView.Frame = ResizedFrameForAutorotatingImageView (Image.Size);
                else
                    ImageView.Frame = ResizedFrameForAutorotatingImageView (ImageInfo.ReferenceRect.Size);
                ScrollView.ContentSize = ImageView.Frame.Size;
                ScrollView.ContentInset = ContentInsetForScrollView (ScrollView.ZoomScale);
            }

        }

        private UIEdgeInsets ContentInsetForScrollView(float targetZoomScale)
        {
            UIEdgeInsets inset = UIEdgeInsets.Zero;
            float boundsHeight = ScrollView.Bounds.Size.Height;
            float boundsWidth = ScrollView.Bounds.Size.Width;
            float contentHeight = (Image.Size.Height > 0) ? Image.Size.Height : boundsHeight;
            float contentWidth = (Image.Size.Width > 0) ? Image.Size.Width : boundsWidth;
            float minContentHeight;
            float minContentWidth;

            if (contentHeight > contentWidth) {
                if (boundsHeight / boundsWidth < contentHeight / contentWidth) {
                    minContentHeight = boundsHeight;
                    minContentWidth = contentWidth * (minContentHeight / contentHeight);
                } else {
                    minContentWidth = boundsWidth;
                    minContentHeight = contentHeight * (minContentWidth / contentWidth);
                }
            } else {
                if (boundsWidth / boundsHeight < contentWidth / contentHeight) {
                    minContentWidth = boundsWidth;
                    minContentHeight = contentHeight * (minContentWidth / contentWidth);
                } else {
                    minContentHeight = boundsHeight;
                    minContentWidth = contentWidth * (minContentHeight / contentHeight);
                }
            }
             
            float myHeight = View.Bounds.Size.Height;
            float myWidth = View.Bounds.Size.Width;
            minContentWidth *= targetZoomScale;
            minContentHeight *= targetZoomScale;
            if (minContentHeight > myHeight && minContentWidth > myWidth) {
                inset = UIEdgeInsets.Zero;
            } else {
                float verticalDiff = boundsHeight - minContentHeight;
                float horizontalDiff = boundsWidth - minContentWidth;
                verticalDiff = (verticalDiff > 0) ? verticalDiff : 0;
                horizontalDiff = (horizontalDiff > 0) ? horizontalDiff : 0;
                inset.Top = verticalDiff / 2.0f;
                inset.Bottom = verticalDiff / 2.0f;
                inset.Left = horizontalDiff / 2.0f;
                inset.Right = horizontalDiff / 2.0f;
            }

            return inset;
        }


        // UIViewController Methods
        public override UIInterfaceOrientationMask GetSupportedInterfaceOrientations () // COMPLETE
        {
            UIInterfaceOrientationMask mask;

            if (Flags.ViewHasAppeared == false) {
                switch (UIApplication.SharedApplication.StatusBarOrientation) 
                {
                case UIInterfaceOrientation.LandscapeLeft:
                    mask = UIInterfaceOrientationMask.LandscapeLeft;
                    break;

                case UIInterfaceOrientation.LandscapeRight:
                    mask = UIInterfaceOrientationMask.LandscapeRight;
                    break;

                case UIInterfaceOrientation.Portrait:
                    mask = UIInterfaceOrientationMask.Portrait;
                    break;

                case UIInterfaceOrientation.PortraitUpsideDown:
                    mask = UIInterfaceOrientationMask.PortraitUpsideDown;
                    break;

                default:
                    mask = UIInterfaceOrientationMask.Portrait;
                    break;

                }
            }
            else if (UIDevice.CurrentDevice.UserInterfaceIdiom == UIUserInterfaceIdiom.Pad) {
                mask = UIInterfaceOrientationMask.All;
            }
            else {
                mask = UIInterfaceOrientationMask.AllButUpsideDown;
            }

            return mask;
        }

        public override bool ShouldAutorotate () // COMPLETE
        {
            return Flags.IsAnimatingAPresentationOrDismissal == false;
        }

        public override bool PrefersStatusBarHidden () // COMPLETE
        {
            if (Flags.IsPresented || Flags.IsTransitioningFromInitialModalToInteractiveState) {
                return true;
            }
            return StartingInfo.StatusBarHiddenPriorToPresentation;
        }

        public override UIStatusBarAnimation PreferredStatusBarUpdateAnimation { // COMPLETE
            get {
                return UIStatusBarAnimation.Fade;
            }
        }

        public override UIModalTransitionStyle ModalTransitionStyle { // COMPLETE
            get {
                return UIModalTransitionStyle.CrossDissolve;
            }
        }

        public override UIStatusBarStyle PreferredStatusBarStyle () // COMPLETE
        {
            return StartingInfo.StatusBarStylePriorToPresentation;
        }

        public override void ViewDidLoad () // COMPLETE
        {
            base.ViewDidLoad ();
            if (Mode == JTSImageViewControllerMode.Image) {
                ViewDidLoadForImageMode ();
            } else if (Mode == JTSImageViewControllerMode.AltText) {
                ViewDidLoadForAltTextMode ();
            }
        }

        public override void ViewDidLayoutSubviews () // COMPLETE
        {
            UpdateLayoutsForCurrentOrientation ();
        }

        public override void ViewWillAppear (bool animated) // COMPLETE
        {
            base.ViewWillAppear (animated);

            if (LastUsedOrientation != UIApplication.SharedApplication.StatusBarOrientation) {
                LastUsedOrientation = UIApplication.SharedApplication.StatusBarOrientation;
                Flags.RotationTransformIsDirty = true;
                UpdateLayoutsForCurrentOrientation ();
            }
        }

        public override void ViewDidAppear (bool animated) // COMPLETE
        {
            base.ViewDidAppear (animated);
            Flags.ViewHasAppeared = true;
        }

        public override void WillRotate (UIInterfaceOrientation toInterfaceOrientation, double duration) // COMPLETE
        {
            base.WillRotate (toInterfaceOrientation, duration);
            Flags.RotationTransformIsDirty = true;
            Flags.IsRotating = true;
        }

        public override void WillAnimateRotation (UIInterfaceOrientation toInterfaceOrientation, double duration) // COMPLETE
        {
            base.WillAnimateRotation (toInterfaceOrientation, duration);
            CancelCurrentImageDrag (false);
            UpdateLayoutsForCurrentOrientation ();
            UpdateDimmingViewForCurrentZoomScale (false);

            InvokeInBackground(() => {
                Thread.Sleep((int)(duration * 1000));
                InvokeOnMainThread(() => {
                        Flags.IsRotating = true;
                    }
                );
            });
        }

        // Dismissal Methods
        private void DismissByCollapsingImageBackToOriginalPosition()
        {
            View.UserInteractionEnabled = false;
            Flags.IsAnimatingAPresentationOrDismissal = true;
            Flags.IsDismissing = true;

            if (OptionsDelegate.ImageViewerShouldFadeThumbnailsDuringPresentationAndDismissal (this)) {
                UIView.Animate(0.15, 0.18, 0, () => {
                    // animate
                    ImageView.Alpha = 0;
                }, null);
            }

            RectangleF imageFrame = View.ConvertRectFromView (ImageView.Frame, ScrollView);
            ImageView.AutoresizingMask = UIViewAutoresizing.None;
            ImageView.Transform = CGAffineTransform.MakeIdentity ();
            ImageView.Layer.Transform = CATransform3D.Identity;
            ImageView.RemoveFromSuperview ();
            ImageView.Frame = imageFrame;
            View.AddSubview (ImageView);
            ScrollView.RemoveFromSuperview ();
            ScrollView = null;

            // Have to dispatch after or else the image view changes above won't be
            // committed prior to the animations below. A single dispatch_async(dispatch_get_main_queue()
            // wouldn't work under certain scrolling conditions, so it has to be an ugly
            // two runloops ahead.
            float duration = JTSImageViewController.JTSImageViewController_TransitionAnimationDuration;
            UIView.Animate (duration, 0, UIViewAnimationOptions.BeginFromCurrentState | UIViewAnimationOptions.CurveEaseInOut, () => {
                // animation
                SnapshotView.Transform = CurrentSnapshotRotationTransform;
                RemoveMotionEffectsFromSnapshotView();
                BlackBackdrop.Alpha = 0;

                if (BackgroundStyle == JTSImageViewControllerBackgroundStyle.ScaledDimmedBlurred)
                    BlurredSnapshotView.Alpha = 0;

                bool mustRotateDuringTransition = (UIApplication.SharedApplication.StatusBarOrientation != StartingInfo.StartingInterfaceOrientation);
                if (mustRotateDuringTransition) {
                    RectangleF newEndingRect;
                    PointF centerInRect;

                    if (StartingInfo.PresentingViewControllerPresentedFromItsUnsupportedOrientation) {
                        RectangleF rectToConvert = StartingInfo.StartingReferenceFrameForThumbnailInPresentingViewControllersOriginalOrientation;
                        RectangleF rectForCentering = SnapshotView.ConvertRectToView(rectToConvert, View);
                        centerInRect = new PointF(0 + rectForCentering.Size.Width/2.0f, 0 + rectForCentering.Size.Height/2.0f);
                        newEndingRect = StartingInfo.StartingReferenceFrameForThumbnailInPresentingViewControllersOriginalOrientation;
                    } else {
                        newEndingRect = StartingInfo.StartingReferenceFrameForThumbnail;
                        RectangleF rectForCentering = SnapshotView.ConvertRectToView(StartingInfo.StartingReferenceFrameForThumbnail, View);
                        centerInRect = new PointF(0 + rectForCentering.Size.Width/2.0f, 0 + rectForCentering.Size.Height/2.0f);
                    }

                    ImageView.Frame = newEndingRect;
                    ImageView.Transform = CurrentSnapshotRotationTransform;
                    ImageView.Center = centerInRect;
                } else {
                    if (StartingInfo.PresentingViewControllerPresentedFromItsUnsupportedOrientation) {
                        ImageView.Frame = StartingInfo.StartingReferenceFrameForThumbnailInPresentingViewControllersOriginalOrientation;
                    } else {
                        ImageView.Frame = StartingInfo.StartingReferenceFrameForThumbnail;
                    }

                    // Rotation not needed, so fade the status bar back in. Looks nicer.
                    UIApplication.SharedApplication.SetStatusBarHidden(StartingInfo.StatusBarHiddenPriorToPresentation, UIStatusBarAnimation.Fade);
                }
            }, () => {
                PresentingViewController.DismissViewController(false, () => {
                    DismissalDelegate.ImageViewerDidDismiss(this);
                });
            });


        }

        private void DismissByExpandingAltTextToOffscreenPosition()
        {

        }

        private void DismissByCleaningUpAfterImageWasFlickedOffscreen()
        {
            View.UserInteractionEnabled = false;
            Flags.IsAnimatingAPresentationOrDismissal = true;
            Flags.IsDismissing = true;


            float duration = JTSImageViewController.JTSImageViewController_TransitionAnimationDuration;
            UIView.Animate (duration, 0, UIViewAnimationOptions.BeginFromCurrentState | UIViewAnimationOptions.CurveEaseInOut, () => {
                // animation
                SnapshotView.Transform = CurrentSnapshotRotationTransform;
                RemoveMotionEffectsFromSnapshotView();
                BlackBackdrop.Alpha = 0;

                if (BackgroundStyle == JTSImageViewControllerBackgroundStyle.ScaledDimmedBlurred)
                    BlurredSnapshotView.Alpha = 0;

                // Rotation not needed, so fade the status bar back in. Looks nicer.
                UIApplication.SharedApplication.SetStatusBarHidden(StartingInfo.StatusBarHiddenPriorToPresentation, UIStatusBarAnimation.Fade);

            }, () => {
                PresentingViewController.DismissViewController(false, () => {
                    DismissalDelegate.ImageViewerDidDismiss(this);
                });
            });

        }



        private void DismissByExpandingImageToOffscreenPosition()
        {

        }

        private void RemoveMotionEffectsFromSnapshotView() // COMPLETE
        {
            foreach (var effect in SnapshotView.MotionEffects) {
                SnapshotView.RemoveMotionEffect (effect);
            }
        }

        private void DismissImageWithFlick(PointF velocity) // COMPLETE
        {
            Flags.ImageIsFlickingAwayForDismissal = true;
            UIPushBehavior push = new UIPushBehavior (new IUIDynamicItem[] { ImageView }, UIPushBehaviorMode.Instantaneous);

            push.PushDirection = new CGVector ((float)(velocity.X * 0.12), (float)(velocity.Y * 0.12));
            push.SetTargetOffset (ImageDragOffsetFromImageCenter, ImageView);
            push.Action = () => {
                if (ImageViewIsOffscreen()) {
                    Animator.RemoveAllBehaviors();
                    AttachmentBehavior = null;
                    ImageView.RemoveFromSuperview();
                    Dismiss(true);
                }
            };
            Animator.RemoveBehavior (AttachmentBehavior);
            Animator.AddBehavior (push);
        }

        private bool ImageViewIsOffscreen()
        {
            RectangleF visibleRect = ScrollView.ConvertRectFromView (View.Bounds, View);
            return Animator.GetDynamicItems (visibleRect).Length == 0;
        }

        // Gesture Recognizer Methods
        private void ImageDoubleTapped(UITapGestureRecognizer sender)
        {
            if (Flags.ScrollViewIsAnimatingAZoom)
                return;

            PointF rawLocation = sender.LocationInView (sender.View);
            PointF point = ScrollView.ConvertPointFromView (rawLocation, sender.View);
            RectangleF targetZoomRect;
            UIEdgeInsets targetInsets;

            if (ScrollView.ZoomScale == 1.0f) {
                ScrollView.AccessibilityHint = AccessibilityHintZoomedIn ();
                float zoomWidth = View.Bounds.Size.Width / JTSImageViewController.JTSImageViewController_TargetZoomForDoubleTap;
                float zoomHeight = View.Bounds.Size.Height / JTSImageViewController.JTSImageViewController_TargetZoomForDoubleTap;
                targetZoomRect = new RectangleF (point.X - (zoomWidth / 2.0f), point.Y - (zoomHeight / 2.0f), zoomWidth, zoomHeight);
                targetInsets = ContentInsetForScrollView(JTSImageViewController.JTSImageViewController_TargetZoomForDoubleTap);
            } else {
                ScrollView.AccessibilityHint = AccessibilityHintZoomedOut ();
                float zoomWidth = View.Bounds.Size.Width * ScrollView.ZoomScale;
                float zoomHeight = View.Bounds.Size.Height * ScrollView.ZoomScale;
                targetZoomRect = new RectangleF (point.X - (zoomWidth / 2.0f), point.Y - (zoomHeight / 2.0f), zoomWidth, zoomHeight);
                targetInsets = ContentInsetForScrollView (1.0f);
            }

            View.UserInteractionEnabled = false;
            Flags.ScrollViewIsAnimatingAZoom = true;
            ScrollView.ContentInset = targetInsets;
            ScrollView.ZoomToRect (targetZoomRect, true);

            InvokeInBackground(() => {
                Thread.Sleep((int)(0.35 * 1000));

                InvokeOnMainThread(() => {
                    this.View.UserInteractionEnabled = true;
                    Flags.ScrollViewIsAnimatingAZoom = false;
                });
            });
        }

        private void ImageSingleTapped(NSObject sender) 
        {
            if (Flags.ScrollViewIsAnimatingAZoom)
                return;
            Dismiss (true);
        }

        private void ImageLongPressed(UILongPressGestureRecognizer sender)
        {
            if (Flags.ScrollViewIsAnimatingAZoom)
                return;

            if (Image != null && sender.State == UIGestureRecognizerState.Began) {
                this.InteractionDelegate.ImageViewerDidLongPress (this);
            }

            bool allowCopy = false;
            allowCopy = this.InteractionDelegate.ImageViewerAllowCopyToPasteboard (this);

            if (allowCopy) {
                PointF location = sender.LocationInView (ImageView);
                UIMenuController menuController = UIMenuController.SharedMenuController;

                menuController.SetTargetRect (new RectangleF (location.X, location.Y, 0.0f, 0.0f), ImageView);
                menuController.SetMenuVisible (true, true);
            }
        }

        private void dismissingPanGestureRecognizerPanned(UIPanGestureRecognizer panner)
        {
            if (Flags.ScrollViewIsAnimatingAZoom || Flags.IsAnimatingAPresentationOrDismissal) 
                return;

            PointF translation = panner.TranslationInView (panner.View);
            PointF locationInView = panner.LocationInView (panner.View);
            PointF velocity = panner.VelocityInView (panner.View);
            float vectorDistance = (float)Math.Sqrt (Math.Pow (velocity.X, 2) + Math.Pow (velocity.Y, 2));

            if (panner.State == UIGestureRecognizerState.Began) {
                Flags.IsDraggingImage = ImageView.Frame.Contains (locationInView);
                if (Flags.IsDraggingImage)
                    StartImageDragging (locationInView, new UIOffset ());
            } else if (panner.State == UIGestureRecognizerState.Changed) {
                if (Flags.IsDraggingImage) {
                    PointF newAnchor = ImageDragStartingPoint;
                    newAnchor.X += translation.X + ImageDragOffsetFromActualTranslation.Horizontal;
                    newAnchor.Y += translation.Y + ImageDragOffsetFromActualTranslation.Vertical;
                    AttachmentBehavior.AnchorPoint = newAnchor;
                } else {
                    Flags.IsDraggingImage = ImageView.Frame.Contains (locationInView);
                    if (Flags.IsDraggingImage) {
                        UIOffset translationOffset = new UIOffset (-1 * translation.X, -1 * translation.Y);
                        StartImageDragging (locationInView, translationOffset);
                    }
                }
            } else {
                if (vectorDistance > JTSImageViewController.JTSImageViewController_MinimumFlickDismissalVelocity) {
                    if (Flags.IsDraggingImage) {
                        DismissImageWithFlick (velocity);
                    } else {
                        Dismiss (true);
                    }
                } else {
                    CancelCurrentImageDrag (true);
                }
            }
        }

        private void TextViewSingleTapped(NSObject sender)
        {
            Dismiss (true);
        }

        // Dynamic Image Dragging Methods
        private void StartImageDragging(PointF panGestureLocationInView, UIOffset translationOffset)
        {
            ImageDragStartingPoint = panGestureLocationInView;
            ImageDragOffsetFromActualTranslation = translationOffset;
            PointF anchor = ImageDragStartingPoint;
            PointF imageCenter = ImageView.Center;
            UIOffset offset = new UIOffset (panGestureLocationInView.X - imageCenter.X, panGestureLocationInView.Y - imageCenter.Y);
            ImageDragOffsetFromImageCenter = offset;
            AttachmentBehavior = new UIAttachmentBehavior (ImageView, offset, anchor);
            Animator.AddBehavior (AttachmentBehavior);
            UIDynamicItemBehavior modifier = new UIDynamicItemBehavior(new IUIDynamicItem[] { ImageView });
            modifier.AngularResistance = AppropriateAngularResistanceForView (ImageView);
            Animator.AddBehavior (modifier);
        }

        private void CancelCurrentImageDrag(bool animated)
        {
            Animator.RemoveAllBehaviors ();
            AttachmentBehavior = null;
            Flags.IsDraggingImage = false;

            if (animated == false) {
                ImageView.Transform = CGAffineTransform.MakeIdentity ();
                ImageView.Center = new PointF (ScrollView.ContentSize.Width / 2.0f, ScrollView.ContentSize.Height / 2.0f);
            } else {
                UIView.AnimateNotify (0.5, 0, 0.55f, 0.7f, UIViewAnimationOptions.AllowAnimatedContent | UIViewAnimationOptions.BeginFromCurrentState, () => {
                    // animation
                    if (Flags.IsDraggingImage == false) {
                        ImageView.Transform = CGAffineTransform.MakeIdentity();
                        if (ScrollView.Dragging == false && ScrollView.Decelerating == false) {
                            ImageView.Center = new PointF(ScrollView.ContentSize.Width/2.0f, ScrollView.ContentSize.Height/2.0f);
                            UpdateScrollViewAndImageViewForCurrentMetrics();
                        }
                    }
                }, null);
            }
        }

        private float AppropriateAngularResistanceForView(UIView view) // COMPLETE
        {
            float height = View.Bounds.Size.Height;
            float width = view.Bounds.Size.Width;
            float actualArea = height * width;
            float referenceArea = view.Bounds.Size.Width * view.Bounds.Size.Height;
            float factor = referenceArea / actualArea;
            float defaultResistance = 2.0f; // originally 4.0f
            float screenWidth = UIScreen.MainScreen.Bounds.Size.Width;
            float screenHeight = UIScreen.MainScreen.Bounds.Size.Height;
            float resistance = (float)(defaultResistance * ((320.0 * 480.0) / (screenWidth * screenHeight)));
            return resistance * factor;
        }

        private float AppropriateDensityForView(UIView view) // COMPLETE
        {
            float height = view.Bounds.Size.Height;
            float width = view.Bounds.Size.Width;
            float actualArea = height * width;
            float referenceArea = view.Bounds.Size.Width * view.Bounds.Size.Height;
            float factor = referenceArea / actualArea;
            float defaultDensity = 0.5f;
            float screenWidth = UIScreen.MainScreen.Bounds.Size.Width;
            float screenHeight = UIScreen.MainScreen.Bounds.Size.Height;
            float appropriateDensity = (float)(defaultDensity * ((320.0 * 480.0) / (screenWidth * screenHeight)));
            return appropriateDensity * factor;
        }

        private PointF TargetDismissalPoint(PointF startingCenter, PointF velocity)
        {
            return new PointF ((float)(startingCenter.X + velocity.X / 3.0), (float)(startingCenter.Y + velocity.Y / 3.0));
        }

        // Gesture Recognizer Delegate Methods
        [MonoTouch.Foundation.Export ("gestureRecognizer:shouldReceiveTouch:")]
        private bool GestureRecognizer(UIGestureRecognizer gestureRecognizer, UITouch touch) // COMPLETE
        {
            bool shouldReceiveTouch = true;

            // shouldReceiveTouch = !(InteractionDelegate.ImageViewerShouldTemporarilyIgnoreTouches (this));
            if (shouldReceiveTouch && gestureRecognizer == PanRecognizer) {
                shouldReceiveTouch = (ScrollView.ZoomScale == 1 && Flags.ScrollViewIsAnimatingAZoom == false);
            }

            return shouldReceiveTouch;
        }

        private bool GestureRecognizer(UIGestureRecognizer gestureRecognizer, UIGestureRecognizer otherGestureRecognizer) // COMPLETE
        {
            return gestureRecognizer == SingleTapperText;
        }

        // Progress Bar Methods
        private void StartProgressTimer()
        {
           
        }

        private void CancelProgressTimer()
        {

        }

        private void ProgressTimerFired(NSTimer timer)
        {

        }



        // UIScrollViewDelegate Methods
        [MonoTouch.Foundation.Export ("viewForZoomingInScrollView:")]
        public MonoTouch.UIKit.UIView ViewForZoomingInScrollView (MonoTouch.UIKit.UIScrollView scrollView)
        {
            return this.ImageView;
        }

        [MonoTouch.Foundation.Export ("scrollViewDidZoom:")]
        public void DidZoom (MonoTouch.UIKit.UIScrollView scrollView)
        {
            if (Flags.ImageIsFlickingAwayForDismissal) {
                return;
            }

            scrollView.ContentInset = ContentInsetForScrollView (scrollView.ZoomScale);
            if (scrollView.ScrollEnabled == false) {
                scrollView.ScrollEnabled = true;
            }

            if (Flags.IsAnimatingAPresentationOrDismissal == false && Flags.IsManuallyResizingTheScrollViewFrame == false) {
                UpdateDimmingViewForCurrentZoomScale (true);
            }
        }

        [MonoTouch.Foundation.Export ("scrollViewDidEndZooming:withView:atScale:")]
        public void ZoomingEnded (MonoTouch.UIKit.UIScrollView scrollView, MonoTouch.UIKit.UIView withView, float atScale)
        {
            if (Flags.ImageIsFlickingAwayForDismissal) {
                return;
            }

            scrollView.ScrollEnabled = (atScale > 1);
            scrollView.ContentInset = ContentInsetForScrollView (atScale);
        }

        [MonoTouch.Foundation.Export ("scrollViewDidEndDragging:willDecelerate:")]
        public void DraggingEnded (MonoTouch.UIKit.UIScrollView scrollView, bool willDecelerate)
        {
            if (Flags.ImageIsFlickingAwayForDismissal) {
                return;
            }

            PointF velocity = scrollView.PanGestureRecognizer.VelocityInView (scrollView.PanGestureRecognizer.View);
            if (scrollView.ZoomScale == 1 && (Math.Abs (velocity.X) > 1600 || Math.Abs (velocity.Y) > 1600)) {
                Dismiss (true);
            }
        }

        // Accessibility Methods
        private string AccessibilityHintZoomedOut() 
        {
            string hint = "";

            return hint;
        }

        private string AccessibilityHintZoomedIn()
        {
            string hint = "";
            return hint;
        }

        private string DefaultAccessibilityLabelForScrollView()
        {
            return "Full-Screen Image Viewer";
        }

        private string DefaultAccessibilityHintForScrollView(bool zoomedIn)
        {
            string hint = "";
            if (zoomedIn) {
                hint = "Image is zoomed in. Pan around the image using three fingers. Double tap to dismiss this screen. Double tap and hold for more options. Triple tap the image to zoom out.";
            } else {
                hint = "Image is zoomed out. Double tap to dismiss this screen. Double tap and hold for more options. Triple tap the image to zoom in.";
            }
            return hint;
        }

        // Delegate class implementation
        public class JTSImageViewControllerDismissalDelegate : IJTSImageViewControllerDismissalDelegate
        {
            public void ImageViewerDidDismiss(JTSImageViewController imageViewer)
            {

            }
        }

        public class JTSImageViewControllerOptionsDelegate : IJTSImageViewControllerOptionsDelegate
        {
            public bool ImageViewerShouldFadeThumbnailsDuringPresentationAndDismissal(JTSImageViewController imageViewer)
            {
                return false;
            }

            public UIFont FontForAltTextInImageViewer(JTSImageViewController imageViewer)
            {
                return UIFont.PreferredBody;
            }

            public UIColor AccentColorForAltTextInImageViewer(JTSImageViewController imageViewer)
            {
                return UIColor.White;
            }

            public UIColor BackgroundColorImageViewInImageViewer(JTSImageViewController imageViewer)
            {
                return UIColor.White;
            }

            public float AlphaForBackgroundDimmingOverlayInImageViewer(JTSImageViewController imageViewer)
            {
                return 0;
            }

            public float BackgroundBlurRadiusForImageViewer(JTSImageViewController imageViewer)
            {
                return 0;
            }
        }

        public class JTSImageViewControllerInteractionsDelegate : IJTSImageViewControllerInteractionsDelegate
        {
            public void ImageViewerDidLongPress(JTSImageViewController imageViewer)
            {

            }

            public bool ImageViewerShouldTemporarilyIgnoreTouches(JTSImageViewController imageViewer)
            {
                return true;
            }

            public bool ImageViewerAllowCopyToPasteboard(JTSImageViewController imageViewer)
            {
                return true;
            }
        }

        public class JTSImageViewControllerAccessibilityDelegate : IJTSImageViewControllerAccessibilityDelegate
        {
            public string AccessibilityLabelForImageViewer(JTSImageViewController imageViewer)
            {
                return "";
            }

            public string AccessibilityHintZoomedInForImageViewer(JTSImageViewController imageViewer)
            {
                return "";
            }

            public string AccessibilityHintZoomedOutForImageViewer(JTSImageViewController imageViewer)
            {
                return "";
            }
        }

    }
}

