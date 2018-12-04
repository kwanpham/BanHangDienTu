using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class QuanLyLoaiSanPham : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        GetData();
    }

    public void GetData()
    {
        SqlConnection conn = new SqlConnection(@"Data Source = USERMIC-OB7C2M4; Initial Catalog = BANHANGDIENTU; Uid = quan1; Pwd = 123;");

        string Select_Query = "Sp_LoaiSP_Select";
       
        SqlCommand cmd = new SqlCommand(Select_Query, conn);
        cmd.CommandType = CommandType.StoredProcedure;
        //cmd.Parameters.Add(new SqlParameter("@PhanQuyen", CheckQuyen()));
      
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
        
        SqlConnection conn = new SqlConnection(@"Data Source = USERMIC-OB7C2M4; Initial Catalog = QLBT_D10QTANM; Uid = sa; Pwd = 123456;");
        
        string Select_Query = "Sp_Users_CheckQuyen";
       
        SqlCommand cmd = new SqlCommand(Select_Query, conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@TaiKhoan", Session["User"]));
      
        conn.Open();
      
        string Quyen = cmd.ExecuteScalar().ToString();
       
        conn.Close();

        return Quyen;
    }

    public string ValidateData(string s)
    {
        return s.Replace("<link", "").Replace("<script", "").Replace("</link", "").Replace("</script", "");
    }

    public void InsertLoaiSanPham()
    {
        SqlConnection conn = new SqlConnection(@"Data Source = USERMIC-OB7C2M4; Initial Catalog = BANHANGDIENTU; Uid = quan1; Pwd = 123;");
      
        conn.Open();
        
        SqlCommand cmd = new SqlCommand("Sp_LoaiSP_Insert", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add(new SqlParameter("@TenLoaiSP", ValidateData(txtTenSP.Text)));
        cmd.Parameters.Add(new SqlParameter("@Active", "1"));

        cmd.ExecuteNonQuery();
    }

    public void UpdateLoaiSanPham()
    {

        SqlConnection conn = new SqlConnection(@"Data Source = USERMIC-OB7C2M4; Initial Catalog = BANHANGDIENTU; Uid = quan1; Pwd = 123;");

        conn.Open();

        SqlCommand cmd = new SqlCommand("Sp_LoaiSanPham_Insert", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add(new SqlParameter("@TenSP", ValidateData(txtTenSP.Text)));
        cmd.Parameters.Add(new SqlParameter("@Active", "1"));

        cmd.ExecuteNonQuery();
    }

    protected void btnThem_Click(object sender, EventArgs e)
    {
        if (CheckQuyen() == "0" || CheckQuyen() == "2")
        {
            InsertLoaiSanPham();
         
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Thông báo", "alert('Bạn không có quyền thực hiện chức năng này!');", true);
        }
    }

    protected void btnSua_Command(object sender, CommandEventArgs e)
    {
        string MaLoaiSP = e.CommandArgument.ToString();

        
       
        string Select_Query = "Sp_LoaiSP_SelectByMa";
       
        SqlCommand cmd = new SqlCommand(Select_Query, ConnectString.GetConnection());
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@MaLoaiSP", MaLoaiSP));
       
        SqlDataAdapter da = new SqlDataAdapter(cmd);
       
        DataSet ds = new DataSet();
      
        da.Fill(ds, "SanPham");

        txtMaSP.Text = ds.Tables["SanPham"].Rows[0].ItemArray[0].ToString();
        txtTenSP.Text = ds.Tables["SanPham"].Rows[0].ItemArray[1].ToString();
        chkActive.Checked = ds.Tables["SanPham"].Rows[0].ItemArray[2].ToString() == "True" ? true : false;


    }

    protected void btnSua_Click(object sender, EventArgs e)
    {
        if (CheckQuyen() == "0" || CheckQuyen() == "2")
        {
            UpdateLoaiSanPham();
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Thông báo", "alert('Bạn không có quyền thực hiện chức năng này!');", true);
        }
    }

    protected void btnXoa_Command(object sender, CommandEventArgs e)
    {
        
        string MaSP = e.CommandArgument.ToString();
       
        if (CheckQuyen() == "1")
        {
            
            SqlConnection conn = new SqlConnection(@"Data Source = USERMIC-OB7C2M4; Initial Catalog = BANHANGDIENTU; Uid = quan1; Pwd = 123;");
        
            conn.Open();
            
            SqlCommand cmd = new SqlCommand("Sp_LoaiSanPham_DeActive", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@MaSP", MaSP));
          
            cmd.ExecuteNonQuery();
          
            conn.Close();

            
            GetData();
           
            ClearText();
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Thông báo", "alert('Bạn không có quyền thực hiện chức năng này!');", true);
        }
    }

    public void ClearText()
    {
        txtMaSP.Text = "";
        txtTenSP.Text = "";
        chkActive.Checked = true;
    }







    


}