using System;
using MonoTouch.UIKit;
using MonoTouch.Accelerate;
using System.Diagnostics;
using System.Drawing;
using MonoTouch.CoreGraphics;

namespace JTSImageViewController
{
    public class JTSImageViewController : UIViewController, IUIScrollViewDelegate
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
            if (Mode == JTSImageViewControllerMode.Image) {
                SetupImageAndDownloadIfNecessary (imageInfo);
            }

            Flags = new JTSImageViewControllerFlags ();
            StartingInfo = new JTSImageViewControllerStartingInfo ();
        }

        // Public Methods
        public void ShowFromViewController(UIViewController viewController, JTSImageViewControllerTransition transition) 
        {
            // self.setTransition = transition // where is he getting this setTransition method?
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

        }

        private void ShowImageViewerByExpandingFromOriginalPositionFromViewController(UIViewController viewController)
        {
            Flags.IsAnimatingAPresentationOrDismissal = true;
            View.UserInteractionEnabled = false;

            SnapshotView = SnapshotFromParentmostViewController (viewController); // IMPLEMENT THIS

            if (BackgroundStyle == JTSImageViewControllerBackgroundStyle.ScaledDimmedBlurred) {
                BlurredSnapshotView = BlurredSnapshotFromParentmostViewController (viewController);
                SnapshotView.AddSubview (BlurredSnapshotView);
                BlurredSnapshotView.Alpha = 0;
            }

            View.InsertSubview (SnapshotView, 0);
            StartingInfo.StartingInterfaceOrientation = UIApplication.SharedApplication.StatusBarOrientation;
            LastUsedOrientation = UIApplication.SharedApplication.StatusBarOrientation;

            RectangleF referenceFrameInWindow = ImageInfo.referenceView.ConvertRectToView (ImageInfo.referenceRect, null);
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


                }, () => {
                    // completion handler
                });

            });
        }

        private void ShowAltTextFromViewController(UIViewController viewController)
        {

        }

        private UIView SnapshotFromParentmostViewController(UIViewController viewController)
        {
            return new UIView ();
        }

        private UIView BlurredSnapshotFromParentmostViewController(UIViewController viewController)
        {
            return new UIView ();
        }



        // TODO: COMPLETE THIS METHOD LATER
        private void SetupImageAndDownloadIfNecessary(JTSImageInfo imageInfo) 
        {
            if (imageInfo.Image != null) {
                Image = imageInfo.Image;
            } else {
                Image = UIImage.FromBundle ("banecat");
            }
        }

        // TODO: COMPLETE THIS METHOD
        private void ViewDidLoadForImageMode() 
        {
            View.BackgroundColor = UIColor.Black;
            View.AutoresizingMask = UIViewAutoresizing.FlexibleHeight | UIViewAutoresizing.FlexibleWidth;

            this.BlackBackdrop = new UIView (new RectangleF (View.Bounds.X, View.Bounds.Y, -512, -512));
            this.BlackBackdrop.BackgroundColor = UIColor.Black;
            this.BlackBackdrop.Alpha = 0;
            View.AddSubview (BlackBackdrop);

            ScrollView = new UIScrollView (View.Bounds);
            // ScrollView.Delegate = this; TODO: SET DELEGATE TO SELF
            ScrollView.ZoomScale = 1.0f;
            ScrollView.MaximumZoomScale = 8.0f;
            ScrollView.ScrollEnabled = false;
            ScrollView.IsAccessibilityElement = true;
            //self.scrollView.accessibilityLabel = self.accessibilityLabel; // NEED TO IMPLEMENT THIS
            ScrollView.AccessibilityHint = AccessibilityHintZoomedOut ();
            View.AddSubview (ScrollView);


            // CGRect referenceFrameInWindow = [self.imageInfo.referenceView convertRect:self.imageInfo.referenceRect toView:nil];
            // CGRect referenceFrameInMyView = [self.view convertRect:referenceFrameInWindow fromView:nil];

            RectangleF referenceFrameInWindow = ImageInfo.referenceView.ConvertRectToView (ImageInfo.referenceRect, null);
            RectangleF referenceFrameInMyView = View.ConvertRectToView (referenceFrameInWindow, null);

            ImageView = new UIImageView (referenceFrameInMyView);
            ImageView.ContentMode = UIViewContentMode.ScaleAspectFill;
            ImageView.UserInteractionEnabled = true;
            ImageView.IsAccessibilityElement = false;
            ImageView.ClipsToBounds = true;

            SetupImageModeGestureRecognizers ();

            ProgressContainer = new UIView (new RectangleF (0, 0, 128.0f, 128.0f));
            View.AddSubview (ProgressContainer);



            Animator = new UIDynamicAnimator (ScrollView);

        }

        private void ViewDidLoadForAltTextMode()
        {

        }

        private void CancelCurrentImageDrag(bool animated)
        {

        }

        private void UpdateDimmingViewForCurrentZoomScale(bool animated)
        {

        }

        private void SetupImageModeGestureRecognizers()
        {
        }

        private UIColor BackgroundColorForImageView()
        {
            return UIColor.Blue;
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

            SnapshotView.Center = new PointF (View.Bounds.Size.Width / 2.0f, View.Bounds.Size.Height / 2.0f);

            if (Flags.RotationTransformIsDirty) {
                Flags.RotationTransformIsDirty = false;
                CurrentSnapshotRotationTransform = transform;
                if (Flags.IsPresented) {
                    if (Mode == JTSImageViewControllerMode.Image) {
                        ScrollView.Frame = View.Bounds;
                    }
                    float scaling = JTSImageViewController.JTSImageViewController_MinimumBackgroundScaling;
                    // SnapshotView.Transform = CGAffineTransform.CGRectApplyAffineTransform 

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
            /*
             *     dispatch_after(dispatch_time(DISPATCH_TIME_NOW, duration * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                    _flags.isRotating = NO;
                    });
             */
        }

        // Dismissal Methods
        private void DismissByCollapsingImageBackToOriginalPosition()
        {
            View.UserInteractionEnabled = false;
            Flags.IsAnimatingAPresentationOrDismissal = true;
            Flags.IsDismissing = true;


        }

        private void DismissByExpandingAltTextToOffscreenPosition()
        {

        }

        private void DismissByCleaningUpAfterImageWasFlickedOffscreen()
        {

        }

        private void DismissByExpandingImageToOffscreenPosition()
        {

        }

        // Delegate Methods
        private void ImageViewerDidDismiss(JTSImageViewController imageViewer)
        {

        }


        // Accessibility Methods
        public string AccessibilityHintZoomedOut() 
        {
            return null;
        }
    }
}

