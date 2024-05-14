using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Universal.Models
{
    public class GioHang
    {
        dbQLUniversalDataContext db = new dbQLUniversalDataContext();
        public string sMaSP { set; get; }
        public string sTenSP { set; get; }
        public string sHinhSP { set; get; }
        public int iSoLg { set; get; }
        public Double dGiaSP { set; get; }
        public Double dKhuyenMai { set; get; }
        public Double dTongTien { 
            get { return iSoLg * (dGiaSP - dKhuyenMai); }
        }

        public GioHang(string MaSP)
        {
            sMaSP = MaSP;
            SanPham sp = db.SanPhams.Single(n => n.MaSP == sMaSP);
            sTenSP = sp.TenSP;
            sHinhSP = sp.DDHinh;
            dGiaSP = double.Parse(sp.GiaBan.ToString());
            dKhuyenMai = double.Parse(sp.GiaGiam.ToString());
            iSoLg = 1;
        }
    }
}