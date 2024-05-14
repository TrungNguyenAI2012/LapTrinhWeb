using System.Web;
using System.Web.Optimization;

namespace Universal
{
    public class BundleConfig
    {
        // For more information on bundling, visit https://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/scripts").Include(
                    "~/Scripts/jquery.parallax-1.1.3.js",
                    "~/Scripts/front.js"));
            bundles.Add(new ScriptBundle("~/bundles/vendor/scripts").Include(
                    "~/Vendor/jquery/jquery.min.js",
                    "~/Vendor/popper.js/umd/popper.min.js",
                    "~/Vendor/bootstrap/js/bootstrap.min.js",
                    "~/Vendor/jquery.cookie/jquery.cookie.js",
                    "~/Vendor/waypoints/lib/jquery.waypoints.min.js",
                    "~/Vendor/jquery.counterup/jquery.counterup.min.js",
                    "~/Vendor/owl.carousel/owl.carousel.min.js",
                    "~/Vendor/owl.carousel2.thumbs/owl.carousel2.thumbs.min.js",
                    "~/Vendor/bootstrap-select/js/bootstrap-select.min.js",
                    "~/Vendor/jquery.scrollto/jquery.scrollTo.min.js"));

            bundles.Add(new StyleBundle("~/bundles/styles").Include(
                    "~/Content/style.default.css",
                    "~/Content/font.css",
                    "~/Content/custom.css"));
            bundles.Add(new StyleBundle("~/bundles/vendor/styles").Include(
                    "~/Vendor/bootstrap/css/bootstrap.min.css",
                    "~/Vendor/font-awesome/css/font-awesome.min.css",
                    "~/Vendor/bootstrap-select/css/bootstrap-select.min.css",
                    "~/Vendor/owl.carousel/assets/owl.carousel.css",
                    "~/Vendor/owl.carousel/assets/owl.theme.default.css"));
        }
    }
}
