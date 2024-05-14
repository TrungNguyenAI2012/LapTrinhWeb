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
    public class UserController : Controller
    {
        dbQLUniversalDataContext data = new dbQLUniversalDataContext();

        // Lấy dánh sách hóa đơn
        private List<DonHang> LayHoaDon()
        {
            ThanhVien session = (ThanhVien) Session["taikhoan"];
            return data.DonHangs.Where(x => x.TaiKhoan == session.TaiKhoan).ToList();
        }

        // Trang danh sách hóa đơn
        public ActionResult Index(int? page)
        {
            int pageSize = 5;
            int pageNum = (page ?? 1);
            var HDon = LayHoaDon();
            return View(HDon.ToPagedList(pageNum, pageSize));
        }

        // Trang chi tiết
        public ActionResult Detail(string id)
        {
            var HDon = from dh in data.DonHangs where dh.SoDH == id select dh;
            return View(HDon.Single());
        }

        // Láy danh sách CTHD
        public ActionResult ChiTiet(string id)
        {
            var chitiet = from ct in data.CTHDs where ct.SoDH == id select ct;
            return PartialView(chitiet);
        }

        // Trang đăng nhập
        [HttpGet]
        public ActionResult Signin()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Signin(FormCollection collection)
        {
            var TenDN = collection["TenDN"];
            var MatKhau = collection["MatKhau"];
            if (String.IsNullOrEmpty(TenDN))
                ViewData["Loi1"] = "Tên đăng nhập không được trống";
            else if (String.IsNullOrEmpty(MatKhau))
                ViewData["Loi2"] = "Mật khẩu không được trống";
            else
            {
                ThanhVien tv = data.ThanhViens.SingleOrDefault(n => n.TaiKhoan == TenDN && n.MatKhau == MatKhau);
                if (tv != null)
                {
                    Session["taikhoan"] = tv;
                    return RedirectToAction("Index", "Home");
                }
                else
                    ViewData["Loi2"] = "Tên đăng nhập hoặc mật khẩu không đúng!";
            }
            return View();
        }

        // Đăng xuất
        public ActionResult LogOut()
        {
            Session.Clear();
            return RedirectToAction("Index", "Home");
        }

        // Trang đăng ký
        [HttpGet]
        public ActionResult Signup()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Signup(FormCollection collection, ThanhVien th)
        {
            var TenDN = collection["TenDN"];
            var MatKhau = collection["MatKhau"];
            var HoKH = collection["HoKH"];
            var TenKH = collection["TenKH"];
            var NgaySinh = collection["birthday"];
            var GioiTinh = collection["gender"];
            var SoDT = collection["SoDT"];
            var Email = collection["Email"];
            var DiaChi = collection["DiaChi"];
            if (String.IsNullOrEmpty(TenDN))
            {
                ViewData["Loi1"] = "Tên đăng nhập không được trống";
            }
            else if (String.IsNullOrEmpty(MatKhau))
            {
                ViewData["Loi2"] = "Mật khẩu không được trống";
            }
            else if (String.IsNullOrEmpty(HoKH))
            {
                ViewData["Loi3"] = "Họ đệm khách hàng không được trống";
            }
            else if (String.IsNullOrEmpty(TenKH))
            {
                ViewData["Loi4"] = "Tên khách hàng không được trống";
            }
            else if (String.IsNullOrEmpty(NgaySinh))
            {
                ViewData["Loi5"] = "Ngày sinh không được trống";
            }
            else
            {
                th.TaiKhoan = TenDN;
                th.MatKhau = MatKhau;
                th.HoDemTV = HoKH;
                th.TenTV = TenKH;
                th.NgaySinh = DateTime.Parse(NgaySinh);
                if (GioiTinh == "male")
                    th.GioiTinh = true;
                else
                    th.GioiTinh = false;
                th.SDT = SoDT;
                th.Email = Email;
                th.DiaChi = DiaChi;
                th.TrangThai = true;
                th.MaNhom = "TK001";
                data.ThanhViens.InsertOnSubmit(th);
                data.SubmitChanges();
                return RedirectToAction("SignIn");
            }
            return this.Signup();
        }

        // Tạo ds yêu thích
        public List<YeuThich> LayYeuThich()
        {
            List<YeuThich> lstYeuthich = Session["Yeuthich"] as List<YeuThich>;
            if (lstYeuthich == null)
            {
                lstYeuthich = new List<YeuThich>();
                Session["Yeuthich"] = lstYeuthich;
            }
            return lstYeuthich;
        }
        
        // Thêm sp vào yêu thích
        public ActionResult ThemYeuThich(string sMaSP, string strURL)
        {
            List<YeuThich> lstYeuthich = LayYeuThich();
            YeuThich SanPham = lstYeuthich.Find(n => n.sMaSP == sMaSP);
            if (SanPham == null)
            {
                SanPham = new YeuThich(sMaSP);
                lstYeuthich.Add(SanPham);
            }
            return Redirect(strURL);
        }

        // Trang yêu thích
        public ActionResult Wishlist()
        {
            List<YeuThich> lstYeuthich = LayYeuThich();
            if (lstYeuthich.Count == 0)
            {
                return RedirectToAction("Index", "Home");
            }
            return View(lstYeuthich);
        }

        // Trang cá nhân
        [HttpGet]
        public ActionResult Account()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Account(FormCollection collection, ThanhVien th)
        {
            // Đổi mật khẩu
            var MatKhauCu = collection["MatKhauCu"];
            var MatKhauMoi = collection["MatKhauMoi"];
            if (String.IsNullOrEmpty(MatKhauCu))
                ViewBag.Loi1 = "Nhập mật khẩu cũ để xác nhận";
            else if (String.IsNullOrEmpty(MatKhauMoi))
                ViewBag.Loi2 = "Nhập mật khẩu mới";
            else
            {
                if (th.MatKhau == MatKhauCu)
                {
                    th.MatKhau = MatKhauMoi;
                    data.SubmitChanges();
                }
                else
                    ViewBag.Loi1 = "Sai mật khẩu cũ";
            }
            
            // Đổi thông tin
            var HoKH = collection["HoKH"];
            var TenKH = collection["TenKH"];
            var NgaySinh = collection["birthday"];
            var GioiTinh = collection["gender"];
            var SoDT = collection["SoDT"];
            var Email = collection["Email"];
            var DiaChi = collection["DiaChi"];
            return this.Account();
        }
    }
}