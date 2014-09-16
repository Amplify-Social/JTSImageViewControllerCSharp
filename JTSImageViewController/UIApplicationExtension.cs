using System;
using MonoTouch.UIKit;

namespace JTSImageViewController
{
    public static class UIApplicationExtension
    {
        public static bool UsesViewControllerBasedStatusBarAppearance(this UIApplication app)
        {
            return true;
        }
    }
}

