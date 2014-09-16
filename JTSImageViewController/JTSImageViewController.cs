using System;
using MonoTouch.UIKit;
using MonoTouch.Accelerate;
using System.Diagnostics;
using System.Drawing;
using MonoTouch.CoreGraphics;

namespace JTSImageViewController
{
    public class JTSImageViewController
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


        // Public Properties
        public JTSImageInfo ImageInfo { get; set; }
        public UIImage Image { get; set; }
        public JTSImageViewControllerMode Mode { get; set; }
        public JTSImageViewControllerBackgroundStyle BackgroundStyle { get; set; }

        // Private Properties


        // Definitions
        // constants
        public const float JTSImageViewController_DefaultAlphaForBackgroundDimmingOverlay = 0.66f;
        public const float JTSImageViewController_DefaultBackgroundBlurRadius = 2.0f;


        public JTSImageViewController (JTSImageInfo imageInfo, JTSImageViewControllerMode imageMode, JTSImageViewControllerBackgroundStyle backgroundStyle)
        {

        }

        // Public Methods
        public void ShowFromViewController(UIViewController viewController, JTSImageViewControllerTransition transition) 
        {

        }

        public void Dismiss(bool animated)
        {

        }

        // Private Methods

    }
}

