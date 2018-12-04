using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class QuanLyDonHang : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] == null || Session["User"].ToString().Length == 0)
        {
            Response.Redirect("DangNhap.aspx");
        }
        else
        {
            getData();
        }
    }


    public void getData()
    {
        
       
        string Select_Query = "Sp_DonHang_SelectByQuyen";
       
        SqlCommand cmd = new SqlCommand(Select_Query, ConnectString.GetConnection());
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@PhanQuyen", CheckQuyen()));
     
        SqlDataAdapter da = new SqlDataAdapter(cmd);
     
        DataSet ds = new DataSet();
       
        da.Fill(ds, "SanPham");
      
        dgvSanPham.DataSource = ds.Tables["SanPham"];
        dgvSanPham.DataBind();
    }

    public string CheckQuyen()
    {
        if (Session["User"] == null || Session["User"].ToString().Length == 0)
        {
            return "0";
        }
       
        string Select_Query = "Sp_Users_CheckQuyen";
      
        SqlCommand cmd = new SqlCommand(Select_Query, ConnectString.GetConnection());
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@TaiKhoan", Session["User"]));
      
        string Quyen = cmd.ExecuteScalar().ToString();
      
       

        return Quyen;
    }

    public string GetTenSP(string MaSP)
    {
       
        string Select_Query = "Sp_SanPham_SelectByMa";

        SqlCommand cmd = new SqlCommand(Select_Query, ConnectString.GetConnection());
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@MaSP", MaSP));
       
        SqlDataAdapter da = new SqlDataAdapter(cmd);
     
        DataSet ds = new DataSet();
      
        da.Fill(ds, "LoaiSP");

        return ds.Tables["LoaiSP"].Rows[0].ItemArray[1].ToString();
    }

    public void UpdateDonHang()
    {
       
       
     
        SqlCommand cmd = new SqlCommand("Sp_DonHang_Insert", ConnectString.GetConnection());
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add(new SqlParameter("@TenKhachHang", ValidateData(txtTenSP.Text)));
       

       
        cmd.Parameters.Add(new SqlParameter("@DiaChiNhan", ValidateData(txtMoTa.Text)));
        cmd.Parameters.Add(new SqlParameter("@SDT", txtMaLoaiSP.Text));
        cmd.Parameters.Add(new SqlParameter("@Email", ValidateData(txtMaNCC.Text)));
        cmd.Parameters.Add(new SqlParameter("@GhiChu", ValidateData(txtSoLuongTon.Text)));

        cmd.Parameters.Add(new SqlParameter("@MaSP", ValidateData(txtGiaBan.Text)));
        cmd.Parameters.Add(new SqlParameter("@XacNhanMuaHang", chkIsHot.Checked));
        cmd.Parameters.Add(new SqlParameter("@DaNhanHang", chkActive.Checked));
        cmd.Parameters.Add(new SqlParameter("@Active", chkActive.Checked));

        
        cmd.ExecuteNonQuery();
       
      

    
        getData();
     
        ClearText();
    }

    public void ClearText()
    {

        txtTenSP.Text = "";
        //txtHinhAnh.Text = "";
        txtMoTa.Text = "";
        txtMaLoaiSP.Text = "";
        txtMaNCC.Text = "";
        txtSoLuongTon.Text = "";

        txtGiaBan.Text = "";
        chkIsHot.Checked = true;
        CheckBox1.Checked = true;
        chkActive.Checked = true;
    }

    public string ValidateData(string s)
    {
        return s.Replace("<link", "").Replace("<script", "").Replace("</link", "").Replace("</script", "");
    }


    protected void btnSua_Click(object sender, EventArgs e)
    {
        if (CheckQuyen() == "1" || CheckQuyen() == "2")
        {
            UpdateDonHang();
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Thông báo", "alert('Bạn không có quyền thực hiện chức năng này!');", true);
        }
    }

    protected void btnSua_Command(object sender, CommandEventArgs e)
    {
        string MaSP = e.CommandArgument.ToString();

        
        string Select_Query = "Sp_DonHang_SelectByMa";
     
        SqlCommand cmd = new SqlCommand(Select_Query, ConnectString.GetConnection());
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@MaDH", MaSP));
      
        SqlDataAdapter da = new SqlDataAdapter(cmd);
       
        DataSet ds = new DataSet();
       
        da.Fill(ds, "SanPham");

        txtMaSP.Text = ds.Tables["SanPham"].Rows[0].ItemArray[0].ToString();
        txtTenSP.Text = ds.Tables["SanPham"].Rows[0].ItemArray[1].ToString();
       
       
        txtMoTa.Text = ds.Tables["SanPham"].Rows[0].ItemArray[2].ToString();
        txtMaLoaiSP.Text = ds.Tables["SanPham"].Rows[0].ItemArray[3].ToString();
        txtMaNCC.Text = ds.Tables["SanPham"].Rows[0].ItemArray[4].ToString();
        txtSoLuongTon.Text = ds.Tables["SanPham"].Rows[0].ItemArray[5].ToString();
       txtGiaBan.Text = ds.Tables["SanPham"].Rows[0].ItemArray[6].ToString();
        chkIsHot.Checked = ds.Tables["SanPham"].Rows[0].ItemArray[8].ToString() == "True" ? true : false;
        CheckBox1.Checked = ds.Tables["SanPham"].Rows[0].ItemArray[8].ToString() == "True" ? true : false;
        chkActive.Checked = ds.Tables["SanPham"].Rows[0].ItemArray[10].ToString() == "True" ? true : false;
    }


    protected void btnXoa_Command(object sender, CommandEventArgs e)
    {
       
        string MaSP = e.CommandArgument.ToString();
        
        if (CheckQuyen() == "1")
        {
           
           
            SqlCommand cmd = new SqlCommand("Sp_DonHang_DeActive", ConnectString.GetConnection());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@MaDH", MaSP));
          
            cmd.ExecuteNonQuery();
            
          
            getData();
          
            ClearText();
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Thông báo", "alert('Bạn không có quyền thực hiện chức năng này!');", true);
        }
    }

}