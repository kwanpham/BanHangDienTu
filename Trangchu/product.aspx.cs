using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Trangchu_product : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        getChiTietSanPham();
    }

    public void getChiTietSanPham()
    {


        string id="";

        if (string.IsNullOrWhiteSpace(Request.QueryString["id"]))
        {
            Response.Redirect("index.aspx");
        }
        else
        {
            id = Request.QueryString["id"].ToString();
        }


       
        string Select_Query = "Sp_SanPham_SelectByMa";
      
        SqlCommand cmd = new SqlCommand(Select_Query, ConnectString.GetConnection());
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@MaSP", id));

     
        SqlDataAdapter da = new SqlDataAdapter(cmd);
       
        DataSet ds = new DataSet();
       
        da.Fill(ds, "SanPham");
        

        List<SanPhamBeam> lsSP = new List<SanPhamBeam>();

        foreach (DataRow row in ds.Tables["SanPham"].Rows)
        {
            string maSP = row["MaSP"].ToString();
            string tenSP = row["TenSP"].ToString();
            string hinhDaiDien = row["HinhDaiDien"].ToString();
            string moTaSP = row["MoTaSP"].ToString();
            string maLoaiSP = row["MaLoaiSP"].ToString();
            string xuatSu = row["XuatSu"].ToString();
            string soLuongTon = row["SoLuongTon"].ToString();
            string giaBan = row["GiaBan"].ToString();
            string isHot = row["isHot"].ToString();
            string active = row["Active"].ToString();

            SanPhamBeam temp = new SanPhamBeam();
            temp.MaSP = maSP;
            temp.TenSP = tenSP;
            temp.HinhDaiDien = hinhDaiDien;
            temp.MoTaSP = moTaSP;
            temp.XuatSu = xuatSu;
            temp.SoLuongTon = soLuongTon;
            temp.GiaBan = giaBan;
            temp.isHot = isHot;
            temp.isActive = active;

            lsSP.Add(temp);
        }

        TenSP.Text = lsSP[0].TenSP;
        GiaSP.Text = lsSP[0].GiaBan +" đ";
        MoTaSP.Text = lsSP[0].MoTaSP;
        btnDatHang.Attributes["href"] = "checkout.aspx?id="+lsSP[0].MaSP;

        AnhDaiDien.ImageUrl = "../Uploads/" + lsSP[0].HinhDaiDien;
     

        

    }
    
}