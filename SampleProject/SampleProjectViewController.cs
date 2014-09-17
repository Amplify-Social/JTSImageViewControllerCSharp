using System;
using System.Drawing;

using MonoTouch.Foundation;
using MonoTouch.UIKit;
using JTSImageViewController;

namespace SampleProject
{
    public partial class SampleProjectViewController : UIViewController
    {
        UIButton catImageButton;

        public SampleProjectViewController (IntPtr handle) : base (handle)
        {
        }

        #region View lifecycle

        public override void ViewDidLoad ()
        {
            base.ViewDidLoad ();
            
            // Perform any additional setup after loading the view, typically from a nib.
            catImageButton = new UIButton ();
            catImageButton.Frame = new RectangleF (0, 0, (float)View.Frame.Width, (float)(View.Frame.Height / 2.0)); 
            catImageButton.SetBackgroundImage (UIImage.FromBundle ("banecat.jpg"), UIControlState.Normal);
            View.AddSubview (catImageButton);

            catImageButton.TouchUpInside += CatImageButtonTapped;
        }

        public void CatImageButtonTapped(object sender, EventArgs e)
        {
            JTSImageInfo imageInfo = new JTSImageInfo ();
            imageInfo.Image = UIImage.FromBundle ("banecat.jpg");
            imageInfo.referenceRect = catImageButton.Frame;
            imageInfo.referenceView = catImageButton.Superview;

            var imageViewer = new JTSImageViewController.JTSImageViewController (imageInfo, JTSImageViewController.JTSImageViewController.JTSImageViewControllerMode.Image, JTSImageViewController.JTSImageViewController.JTSImageViewControllerBackgroundStyle.ScaledDimmed);
            imageViewer.ShowFromViewController (this, JTSImageViewController.JTSImageViewController.JTSImageViewControllerTransition.FromOriginalPosition);
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

