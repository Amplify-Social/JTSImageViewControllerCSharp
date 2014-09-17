using System;

namespace JTSImageViewController
{
    public interface IJTSImageViewControllerAccessibilityDelegate
    {
        string AccessibilityLabelForImageViewer(JTSImageViewController imageViewer);
        string AccessibilityHintZoomedInForImageViewer(JTSImageViewController imageViewer);
        string AccessibilityHintZoomedOutForImageViewer(JTSImageViewController imageViewer);
    }
}

