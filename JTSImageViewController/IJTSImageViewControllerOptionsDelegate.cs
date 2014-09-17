using System;
using MonoTouch.UIKit;

namespace JTSImageViewController
{
    public interface IJTSImageViewControllerOptionsDelegate
    {
        bool ImageViewerShouldFadeThumbnailsDuringPresentationAndDismissal(JTSImageViewController imageViewer);
        UIFont FontForAltTextInImageViewer(JTSImageViewController imageViewer);
        UIColor AccentColorForAltTextInImageViewer(JTSImageViewController imageViewer);
        UIColor BackgroundColorImageViewInImageViewer(JTSImageViewController imageViewer);
        float AlphaForBackgroundDimmingOverlayInImageViewer(JTSImageViewController imageViewer);
        float BackgroundBlurRadiusForImageViewer(JTSImageViewController imageViewer);
    }
}

