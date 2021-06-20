using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ModelEF.Model;

namespace ModelEF.DAO
{
    public class UserDAO
    {
            public static string cn = @"Data Source=XUANDUY\SQLEXPRESS;initial catalog=MaiXuanDuyDB;Integrated Security=True";
            SqlConnection conn = new SqlConnection(cn);
            MaiXuanDuyContext context = new MaiXuanDuyContext();

            #region Các thao tác tìm kiếm sản phẩm(Thủ tục)
            public List<SanPham> LaySanPhamTheoLoai(int id)
            {
                var data = context.SanPhams.SqlQuery("[dbo].[LaySanPhamTheoLoai] @MaLoaiSP", new SqlParameter("MaLoaiSP", id)).ToList();
                return data;
            }
            public List<SanPham> LaySanPhamTheoThuongHieuController(int id)
            {
                var data = context.SanPhams.SqlQuery("[dbo].[LaySanPhamTheoThuongHieuController] @MaThuongHieu", new SqlParameter("MaThuongHieu", id)).ToList();
                return data;
            }
            public List<SanPham> LaySanPhamTheoThuongHieuOrderNgayThemView(int id)
            {
                var data = context.SanPhams.SqlQuery("[dbo].[LaySanPhamTheoThuongHieuOrderNgayThemView] @MaThuongHieu", new SqlParameter("MaThuongHieu", id)).ToList();
                return data;
            }
            public List<SanPham> LaySanPhamMoiNhat()
            {
                var data = context.SanPhams.SqlQuery("[dbo].[LaySanPhamMoiNhat]").ToList();
                return data;
            }
            public List<SanPham> LaySanPhamGiamGiaCaoNhatView()
            {
                var data = context.SanPhams.SqlQuery("[dbo].[LaySanPhamGiamGiaCaoNhatView]").ToList();
                return data;
            }
            public List<SanPham> LaySanPhamTheoDanhMuc(int id)
            {
                var data = context.SanPhams.SqlQuery("[dbo].[LaySanPhamTheoDanhMuc] @MaDanhMuc", new SqlParameter("MaDanhMuc", id)).ToList();
                return data;
            }
            public List<SanPham> LaySanPhamTheoTen(string name)
            {
                if (string.IsNullOrEmpty(name))
                {
                    var data = context.SanPhams.SqlQuery("[dbo].[LaySanPhamTheoTen] @TenSP", new SqlParameter("TenSP", DBNull.Value)).ToList();
                    return data;
                }
                else
                {
                    var data = context.SanPhams.SqlQuery("[dbo].[LaySanPhamTheoTen] @TenSP", new SqlParameter("TenSP", name)).ToList();
                    return data;
                }
            }
            public List<SanPham> XemChiTietSanPham(int id)
            {
                var data = context.SanPhams.SqlQuery("[dbo].[XemChiTietSanPham] @MaSP", new SqlParameter("MaSP", id)).ToList();
                return data;
            }
            #endregion
    }
}
