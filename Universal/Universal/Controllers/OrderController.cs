using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Universal.Models;

namespace Universal.Controllers
{
    public class OrderController : Controller
    {
        dbQLUniversalDataContext db = new dbQLUniversalDataContext();
        
        // Lấy giỏ hàng
        public List<GioHang> Laygiohang()
        {
            List<GioHang> lstGiohang = Session["Giohang"] as List<GioHang>;
            if (lstGiohang == null)
            {
                lstGiohang = new List<GioHang>();
                Session["Giohang"] = lstGiohang;
            }
            return lstGiohang;
        }

        // Thêm sp vào giỏ hàng
        public ActionResult ThemGioHang(string sMaSP, string strURL)
        {
            List<GioHang> lstGiohang = Laygiohang();
            GioHang SanPham = lstGiohang.Find(n => n.sMaSP == sMaSP);
            if (SanPham == null)
            {
                SanPham = new GioHang(sMaSP);
                lstGiohang.Add(SanPham);
            }
            else
                SanPham.iSoLg++;
             return Redirect(strURL);
        }

        // Tính tổng số lượng
        private int TongSoLuong()
        {
            int iTongSoLg = 0;
            List<GioHang> lstGiohang = Session["GioHang"] as List<GioHang>;
            if (lstGiohang != null)
            {
                iTongSoLg = lstGiohang.Sum(n => n.iSoLg);
            }
            return iTongSoLg;
        }

        // Tính tổng tiền
        private double TongTien()
        {
            double iTongTien = 0;
            List<GioHang> lstGiohang = Session["Giohang"] as List<GioHang>;
            if (lstGiohang != null)
            {
                iTongTien = lstGiohang.Sum(n => (n.dGiaSP - n.dKhuyenMai) * n.iSoLg);
            }
            return iTongTien;
        }

        // Trang giỏ hàng
        public ActionResult Index()
        {
            List<GioHang> lstGiohang = Laygiohang();
            if (lstGiohang.Count == 0)
            {
                return RedirectToAction("Index", "Home");
            }
            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.Tongtien = TongTien();
            return View(lstGiohang);
        }

        // Đặt hàng
        [HttpGet]
        public ActionResult Step1()
        {
            List<GioHang> lstGiohang = Laygiohang();
            ViewBag.TongSoLuong = TongSoLuong();
            ViewBag.TongTien = TongTien();
            return View(lstGiohang);
        }
        public ActionResult Step1(FormCollection collection)
        {
            DonHang ddh = new DonHang();
            ThanhVien tv = (ThanhVien)Session["Taikhoan"];
            List<GioHang> gh = Laygiohang();
            int count = db.DonHangs.Count() + 1;
            String MSDH = Convert.ToString(count);
            if (count < 10)
                ddh.SoDH = String.Concat("DH00", MSDH);
            else if (count < 100)
                ddh.SoDH = String.Concat("DH0", MSDH);
            else
                ddh.SoDH = String.Concat("DH", MSDH);
            ddh.TaiKhoan = tv.TaiKhoan;
            ddh.NgayDat = DateTime.Now;
            var ngaygiao = String.Format("{0:dd/MM/yyyy}", collection["Ngaygiao"]);
            ddh.NgayGiao = DateTime.Parse(ngaygiao);
            ddh.DiaChiGiao = tv.DiaChi;
            ddh.TrangThaiDH = "Chưa thanh toán";
            db.DonHangs.InsertOnSubmit(ddh);
            foreach (var i in gh)
            {
                CTHD ct = new CTHD();
                ct.MaSP = i.sMaSP;
                ct.SoDH = (string) ddh.SoDH;
                ct.SoLuong = i.iSoLg;
                db.CTHDs.InsertOnSubmit(ct);
            }
            db.SubmitChanges();
            return RedirectToAction("Step2", "Order");
        }

        public ActionResult Step2()
        {
            return View();
        }
        public ActionResult Step3()
        {
            return View();
        }

        // Trang xác nhận
        public ActionResult Step4()
        {
            List<GioHang> lstGiohang = Laygiohang();
            if (lstGiohang.Count == 0)
            {
                return RedirectToAction("Index", "Home");
            }
            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.Tongtien = TongTien();
            Session["Giohang"] = null;
            return View(lstGiohang);
        }

        // Trang thông báo
        public ActionResult Message()
        {
            return View();
        }
    }
}