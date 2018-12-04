using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Trangchu_categories : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        laySanPhamTheoMaLoai();
    }

    public void laySanPhamTheoMaLoai()
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

        
        string Select_Query = "Sp_SanPham_SelectByMaLoaiSanPham";
        
        SqlCommand cmd = new SqlCommand(Select_Query, ConnectString.GetConnection());
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@MaLoaiSP", 1));

      
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

        Label1.Text = lsSP[0].GiaBan;
        A1.InnerText = lsSP[0].TenSP;
        A1.Attributes["href"] = "product.aspx?id="+lsSP[0].MaSP;
        Image1.ImageUrl = "../Uploads/" + lsSP[0].HinhDaiDien;

        Label2.Text = lsSP[1].GiaBan;
        A2.InnerText = lsSP[1].TenSP;
        A2.Attributes["href"] = "product.aspx?id=" + lsSP[1].MaSP;
        Image2.ImageUrl = "../Uploads/" + lsSP[1].HinhDaiDien;

        Label3.Text = lsSP[2].GiaBan;
        A3.InnerText = lsSP[2].TenSP;
        A3.Attributes["href"] = "product.aspx?id=" + lsSP[2].MaSP;
        Image3.ImageUrl = "../Uploads/" + lsSP[2].HinhDaiDien;

        Label4.Text = lsSP[3].GiaBan;
        A4.InnerText = lsSP[3].TenSP;
        A4.Attributes["href"] = "product.aspx?id=" + lsSP[3].MaSP;
        Image4.ImageUrl = "../Uploads/" + lsSP[3].HinhDaiDien;

       

        
    }
}