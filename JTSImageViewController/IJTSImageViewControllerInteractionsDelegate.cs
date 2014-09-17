using System;

namespace JTSImageViewController
{
    public interface IJTSImageViewControllerInteractionsDelegate
    {
        void ImageViewerDidLongPress(JTSImageViewController imageViewer);
        bool ImageViewerShouldTemporarilyIgnoreTouches(JTSImageViewController imageViewer);
        bool ImageViewerAllowCopyToPasteboard(JTSImageViewController imageViewer);
    }
}

