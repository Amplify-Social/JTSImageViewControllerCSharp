using System;
using MonoTouch.UIKit;
using MonoTouch.Accelerate;
using System.Diagnostics;
using System.Drawing;
using MonoTouch.CoreGraphics;

namespace JTSImageViewController
{
    public class JTSImageViewController : UIViewController, IJTSImageViewControllerDismissalDelegate
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
        public struct JTSImageViewControllerStartingInfo
        {
            public bool StatusBarHiddenPriorToPresentation { get; set; }
            public UIStatusBarStyle StatusBarStylePriorToPresentation { get; set; }
            public RectangleF StartingReferenceFrameForThumbnail { get; set; }
            public RectangleF StartingReferenceFrameForThumbnailInPresentingViewControllersOriginalOrientation { get; set; }
            public PointF StartingReferenceCenterForThumbnail { get; set; }
            public UIInterfaceOrientation StartingInterfaceOrientation { get; set; }
            public bool PresentingViewControllerPresentedFromItsUnsupportedOrientation { get; set; }
        }

        public struct JTSImageViewControllerFlags
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
        }

        // Public Methods
        public void ShowFromViewController(UIViewController viewController, JTSImageViewControllerTransition transition) 
        {
            StartingInfo.StatusBarHiddenPriorToPresentation = UIApplication.SharedApplication.StatusBarHidden;
            StartingInfo.StatusBarStylePriorToPresentation = UIApplication.SharedApplication.StatusBarStyle;


        }

        public void Dismiss(bool animated)
        {

        }

        // Private Methods
        public void SetupImageAndDownloadIfNecessary(JTSImageInfo imageInfo) 
        {

        }


        // UIViewController Methods

        // Delegate Methods
        public void ImageViewerDidDismiss(JTSImageViewController imageViewer)
        {

        }
    }
}

