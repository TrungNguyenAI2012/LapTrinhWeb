using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Universal.Models;

namespace Universal.Controllers
{
    public class HomeController : Controller
    {
        dbQLUniversalDataContext data = new dbQLUniversalDataContext();

        // Lấy n sản phẩm
        private List<SanPham> LaySanPham(int count)
        {
            return data.SanPhams.OrderByDescending(x => x.NgayDang).Take(count).ToList();
        }

        // Lấy n bài viết
        private List<BaiViet> LayBaiViet(int count)
        {
            return data.BaiViets.OrderByDescending(x => x.NgayDang).Take(count).ToList();
        }

        // Lấy 3 sản phẩm
        public ActionResult SPham()
        {
            var SPham = LaySanPham(6);
            return PartialView(SPham);
        }

        // Lấy 4 bài viết
        public ActionResult BViet()
        {
            var BViet = LayBaiViet(4);
            return PartialView(BViet);
        }

        // Trang chủ
        public ActionResult Index()
        {
            return View();
        }

        // Trang liên hệ
        public ActionResult Contact()
        {
            return View();
        }

        // Trang giới thiệu
        public ActionResult About()
        {
            return View();
        }

        // Trang câu hỏi thường gặp
        public ActionResult Faq()
        {
            return View();
        }

        // Trang lỗi 404
        [HandleError]
        public ActionResult Error()
        {
            return View();
        }
    }
}