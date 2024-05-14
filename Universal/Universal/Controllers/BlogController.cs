using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Universal.Models;
using PagedList;
using PagedList.Mvc;

namespace Universal.Controllers
{
    public class BlogController : Controller
    {
        dbQLUniversalDataContext data = new dbQLUniversalDataContext();

        // Lấy bài viết
        private List<BaiViet> LayBaiViet()
        {
            return data.BaiViets.ToList();
        }

        // Trang danh sách
        public ActionResult Index(int? page, string id = "0")
        {
            int pageSize = 2;
            int pageNum = (page ?? 1);
            if (id != "0" && id.Substring(0, 2) == "TL")
            {
                var BVietTL = from bv in data.BaiViets where bv.MaLoai == id select bv;
                return View(BVietTL.ToPagedList(pageNum, pageSize));
            }
            if (id != "0")
            {
                var BVietTK = from bv in data.BaiViets where bv.TaiKhoan == id select bv;
                return View(BVietTK.ToPagedList(pageNum, pageSize));
            }
            var BViet = LayBaiViet();
            return View(BViet.ToPagedList(pageNum, pageSize));
        }

        // Danh sách chủ đề
        public ActionResult ChuDe()
        {
            var chude = from cd in data.TheLoais select cd;
            return PartialView(chude);
        }

        // Danh sách thẻ
        public ActionResult The()
        {
            var the = from t in data.Thes select t;
            return PartialView(the.Skip(7));
        }

        // Nhận xét
        public ActionResult NhanXet(string id)
        {
            var nhanxet = from nx in data.NhanXets where nx.MaBV == id select nx;
            return PartialView(nhanxet);
        }

        // Trang chi tiết
        public ActionResult Detail(string id)
        {
            var BViet = from bv in data.BaiViets where bv.MaBV == id select bv;
            return View(BViet.Single());
        }
    }
}