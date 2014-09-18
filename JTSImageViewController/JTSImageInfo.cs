using System;
using MonoTouch.UIKit;
using MonoTouch.Foundation;
using System.Drawing;
using System.Collections.Generic;

namespace JTSImageViewController
{
    public class JTSImageInfo
    {
        public UIImage Image { get; set; }
        public UIImage PlaceholderImage { get; set; }
        public NSUrl ImageURL { get; set; }
        public NSUrl CanonicalImageURL { get; set; }
        public string AltText { get; set; }
        public string Title { get; set; }
        public RectangleF ReferenceRect { get; set; }
        public UIView ReferenceView { get; set; }
        public Dictionary<string, string> UserInfo { get; set; }

        public JTSImageInfo()
        {
            UserInfo = new Dictionary<string, string> ();
        }

        public string DisplayableTitleAltTextSummary()
        {
            var text = "";
            if (Title.Length > 0) {
                text = Title;
            } else if (AltText.Length > 0) {
                text = AltText;
            }
            return text;
        }

        public string CombinedTitleAndAltText()
        {
            var text = "";
            if (Title.Length > 0) {
                text += Title;
            }
            if (AltText.Length > 0 && Title != AltText) {
                text += "\n\n- - -\n\n" + AltText;
            }
            return text;
        }

        // NOT YET IMPLEMENTED
        public string Description()
        {
            var description = "IMPLEMENT THIS DESCRIPTION";
            return description;
        }

        public PointF ReferenceRectCenter()
        {
            PointF center = new PointF ();
            center.X = (float)(this.ReferenceRect.Size.Width / 2.0);
            center.Y = (float)(this.ReferenceRect.Size.Height / 2.0);

            return center;
        }
    }
}

