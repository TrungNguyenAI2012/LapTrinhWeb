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
    public class ProductController : Controller
    {
        dbQLUniversalDataContext data = new dbQLUniversalDataContext();
        
        // Lấy sản phẩm
        private List<SanPham> LaySanPham()
        {
            return data.SanPhams.ToList();
        }

        // Lấy n sản phẩm
        private List<SanPham> LaySanPham(int count)
        {
            return data.SanPhams.OrderByDescending(x => x.NgayDang).Take(count).ToList();
        }

        // Lấy 4 sản phẩm
        public ActionResult SPham()
        {
            var SPham = LaySanPham(4);
            return PartialView(SPham);
        }

        // Trang danh sách
        public ActionResult Index(int? page, string id = "0")
        {
            int pageSize = 6;
            int pageNum = (page ?? 1);
            if (id != "0" && id.Substring(0, 2) == "TL")
            {
                var SPhamTL = from sp in data.SanPhams where sp.MaLoai == id select sp;
                return View(SPhamTL.ToPagedList(pageNum, pageSize));
            }
            if (id != "0" && id.Substring(0, 2) == "TH")
            {
                var SPhamTH = from sp in data.SanPhams where sp.MaTH == id select sp;
                return View(SPhamTH.ToPagedList(pageNum, pageSize));
            }
            var SPham = LaySanPham();
            return View(SPham.ToPagedList(pageNum, pageSize));
        }

        // Danh sách chủ đề
        public ActionResult ChuDe()
        {
            var chude = from cd in data.TheLoais select cd;
            return PartialView(chude);
        }

        // Danh sách thương hiệu
        public ActionResult ThuongHieu()
        {
            var thuonghieu = from th in data.ThuongHieus select th;
            return PartialView(thuonghieu);
        }

        // Danh sách thẻ
        public ActionResult The()
        {
            var the = from t in data.Thes select t;
            return PartialView(the.Take(7));
        }

        // Trang chi tiết
        public ActionResult Detail(string id)
        {
            var Spham = from sp in data.SanPhams where sp.MaSP == id select sp;
            return View(Spham.Single());
        }
    }
}