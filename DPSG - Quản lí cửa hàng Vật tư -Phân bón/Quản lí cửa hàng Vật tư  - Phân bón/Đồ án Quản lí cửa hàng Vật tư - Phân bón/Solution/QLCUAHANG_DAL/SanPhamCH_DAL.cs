﻿using QLCUAHANG_DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Drawing;
using System.IO;

namespace QLCUAHANG_DAL
{
   public class SanPhamCH_DAL
    {
        public static List<SanPhamCH_DTO> LoadSanPhamCH()
        {
            // 1. Tạo chuối kết nối
            SqlConnection con = DataProvider.KetNoi();
            // 2. Tạo chuối truy vấn và thực thi truy vấn
            SqlCommand cmd = new SqlCommand("DSSanPhamCH", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;

            // 3. Đổ dữ liệu lên DataTable
            DataTable dt = new DataTable();
            da.Fill(dt);

            if (dt.Rows.Count == 0)
                return null;
            // 4. Đỏ dữ liệu lên List
            List<SanPhamCH_DTO> listSP = new List<SanPhamCH_DTO>();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                SanPhamCH_DTO sanpham = new SanPhamCH_DTO();
                sanpham.MaSPCH = dt.Rows[i]["MaSPCH"].ToString();
                sanpham.TenSP = dt.Rows[i]["TenSP"].ToString();
                sanpham.Gia = Double.Parse(dt.Rows[i]["Gia"].ToString());
                sanpham.DonVi = dt.Rows[i]["DonVi"].ToString();
                sanpham.SoLuong = Int32.Parse(dt.Rows[i]["SoLuong"].ToString());
                sanpham.HinhAnh = dt.Rows[i]["HinhAnh"].ToString();
                sanpham.ThongSo= dt.Rows[i]["ThongSo"].ToString();
                sanpham.BanLe = Convert.ToInt32(dt.Rows[i]["BanLe"].ToString());
                sanpham.SoLuongLe= Convert.ToInt32(dt.Rows[i]["SoLuongLe"].ToString());

                listSP.Add(sanpham);
            }

            DataProvider.DongKetNoi(con);
            return listSP;
        }

        public static SanPhamCH_DTO TimKiemTenSP(string t)
        {
            
            SqlConnection con = DataProvider.KetNoi();
            string query = string.Format("EXEC dbo.TimKiemTHSP @TenSP = N'" + t + "'");
            DataTable dt = DataProvider.LayDataTable(query, con);
            if (dt.Rows.Count == 0)
                return null;

            if (dt.Rows.Count == 0)
                return null;
            // 4. Đỏ dữ liệu lên List
            SanPhamCH_DTO sanpham = new SanPhamCH_DTO();
            sanpham.MaSPCH = dt.Rows[0]["MaSPCH"].ToString();
            sanpham.TenSP = dt.Rows[0]["TenSP"].ToString();
            sanpham.Gia = Double.Parse(dt.Rows[0]["Gia"].ToString());
            sanpham.DonVi = dt.Rows[0]["DonVi"].ToString();
            sanpham.SoLuong = Int32.Parse(dt.Rows[0]["SoLuong"].ToString());
            sanpham.HinhAnh = dt.Rows[0]["HinhAnh"].ToString();
            sanpham.ThongSo = dt.Rows[0]["ThongSo"].ToString();
            sanpham.BanLe = Convert.ToInt32(dt.Rows[0]["BanLe"].ToString());
            sanpham.SoLuongLe = Convert.ToInt32(dt.Rows[0]["SoLuongLe"].ToString());


            DataProvider.DongKetNoi(con);
            return sanpham;
        }

        public static bool SuaSanPhamCH(SanPhamCH_DTO sanpham)
        {
            SqlConnection con = DataProvider.KetNoi();
            SqlCommand cmd = new SqlCommand("SuaSPCH", con);

            try
            {
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter p = new SqlParameter("@MaSPCH", sanpham.MaSPCH);
                cmd.Parameters.Add(p);
                p = new SqlParameter("@TenSP", sanpham.TenSP);
                cmd.Parameters.Add(p);
                p = new SqlParameter("@DonVi", sanpham.DonVi);
                cmd.Parameters.Add(p);
                p = new SqlParameter("@Gia", sanpham.Gia);
                cmd.Parameters.Add(p);
                p = new SqlParameter("@SoLuong", sanpham.SoLuong);
                cmd.Parameters.Add(p);
                p = new SqlParameter("@HinhAnh", sanpham.HinhAnh);
                cmd.Parameters.Add(p);
                p = new SqlParameter("@ThongSo", sanpham.ThongSo);
                cmd.Parameters.Add(p);

                p = new SqlParameter("@BanLe", sanpham.BanLe);
                cmd.Parameters.Add(p);
                p = new SqlParameter("@SoLuongLe", sanpham.SoLuongLe);
                cmd.Parameters.Add(p);

                cmd.ExecuteNonQuery();

                DataProvider.DongKetNoi(con);
                return true;
            }
            catch
            {
                DataProvider.DongKetNoi(con);
                return false;
            }
        }
        public static bool XoaSPCH(SanPhamCH_DTO sanpham)
        {
            SqlConnection con = DataProvider.KetNoi();
            SqlCommand cmd = new SqlCommand("XoaSPCH", con);

            try
            {
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter p = new SqlParameter("@MaSPCH", sanpham.MaSPCH);
                cmd.Parameters.Add(p);

                cmd.ExecuteNonQuery();

                DataProvider.DongKetNoi(con);
                return true;
            }
            catch
            {
                DataProvider.DongKetNoi(con);
                return false;
            }
        }
    }
}
