using System;
using System.Drawing;

using MonoTouch.Foundation;
using MonoTouch.UIKit;
using JTSImageViewController;

namespace SampleProject
{
    public partial class SampleProjectViewController : UIViewController
    {
        public SampleProjectViewController (IntPtr handle) : base (handle)
        {
        }

        #region View lifecycle

        public override void ViewDidLoad ()
        {
            base.ViewDidLoad ();
            
            // Perform any additional setup after loading the view, typically from a nib.
        }

        public override void ViewWillAppear (bool animated)
        {
            base.ViewWillAppear (animated);
        }

        public override void ViewDidAppear (bool animated)
        {
            base.ViewDidAppear (animated);
        }

        public override void ViewWillDisappear (bool animated)
        {
            base.ViewWillDisappear (animated);
        }

        public override void ViewDidDisappear (bool animated)
        {
            base.ViewDidDisappear (animated);
        }

        #endregion
    }
}

