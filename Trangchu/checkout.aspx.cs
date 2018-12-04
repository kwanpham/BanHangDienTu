using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Trangchu_checkout : System.Web.UI.Page
{

    string id;
    protected void Page_Load(object sender, EventArgs e)
    {
        
            getSanPham();
        
       
    }

    public void getSanPham()
    {
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


        Label1.Text = lsSP[0].TenSP;
        Label2.Text = lsSP[0].GiaBan + " đ";
       
    }

    public string ValidateData(string s)
    {
        return s.Replace("<link", "").Replace("<script", "").Replace("</link", "").Replace("</script", "");
    }

    public void InsertDonHang()
    {
       
        

        SqlCommand cmd = new SqlCommand("Sp_DonHang_Insert", ConnectString.GetConnection());
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@TenKhachHang", ValidateData(TextBox1.Text)));
        cmd.Parameters.Add(new SqlParameter("@DiaChiNhan", ValidateData(TextBox2.Text)));
        cmd.Parameters.Add(new SqlParameter("@SDT", ValidateData(TextBox3.Text)));
        cmd.Parameters.Add(new SqlParameter("@Email", ValidateData(TextBox4.Text)));
        cmd.Parameters.Add(new SqlParameter("@GhiChu", ValidateData(TextBox5.Text)));
        cmd.Parameters.Add(new SqlParameter("@MaSP", Int32.Parse(id)));
        cmd.Parameters.Add(new SqlParameter("@NgayDat", DateTime.Now.Year + "/" + DateTime.Now.Month + "/" + DateTime.Now.Day));
        cmd.Parameters.Add(new SqlParameter("@XacNhanMuaHang", "0"));
        cmd.Parameters.Add(new SqlParameter("@DaNhanHang", "0"));
        cmd.Parameters.Add(new SqlParameter("@Active", "1"));
       
        int check =0 ;

      
        try
        {
             check = cmd.ExecuteNonQuery();
        }
        catch (SqlException sql)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Thông báo" , "alert('Đặt hàng không thành công , mời bạn đặt lại " +ValidateData(TextBox1.Text)+" 1');", true);
            //Response.Redirect("index.aspx");
        }

        if(check !=0 ){
            Response.Redirect("index.aspx");
        }
     


    }


    


    protected void btnInsertDonHang1(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text.Equals(""))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Thông báo", "alert('Text NULL');", true);
        }
        else
        {
            InsertDonHang();
        }
       
        
        
    }
}