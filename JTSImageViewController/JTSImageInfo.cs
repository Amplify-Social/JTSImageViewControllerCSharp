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
        public string altText { get; set; }
        public string title { get; set; }
        public RectangleF referenceRect { get; set; }
        public UIView referenceView { get; set; }
        public Dictionary<string, string> userInfo { get; set; }

        public JTSImageInfo()
        {
            userInfo = new Dictionary<string, string> ();
        }

        public string DisplayableTitleAltTextSummary()
        {
            var text = "";
            if (title.Length > 0) {
                text = title;
            } else if (altText.Length > 0) {
                text = altText;
            }
            return text;
        }

        public string CombinedTitleAndAltText()
        {
            var text = "";
            if (title.Length > 0) {
                text += title;
            }
            if (altText.Length > 0 && title != altText) {
                text += "\n\n- - -\n\n" + altText;
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
            center.X = (float)(this.referenceRect.Size.Width / 2.0);
            center.Y = (float)(this.referenceRect.Size.Height / 2.0);

            return center;
        }
    }
}

