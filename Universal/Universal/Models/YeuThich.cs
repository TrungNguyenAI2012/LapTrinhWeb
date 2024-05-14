using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Universal.Models
{
    public class YeuThich
    {
        dbQLUniversalDataContext db = new dbQLUniversalDataContext();
        public string sMaSP { set; get; }
        public string sTenSP { set; get; }
        public string sHinhSP { set; get; }
        public Double dGiaSP { set; get; }

        public YeuThich(string MaSP)
        {
            sMaSP = MaSP;
            SanPham sp = db.SanPhams.Single(n => n.MaSP == sMaSP);
            sTenSP = sp.TenSP;
            sHinhSP = sp.DDHinh;
            dGiaSP = double.Parse(sp.GiaBan.ToString());
        }
    }
}