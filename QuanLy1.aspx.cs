using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data;
using System.Data.SqlClient;


public partial class QuanLy1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


        getData();

    }

    public void getData()
    {
        
        string Select_Query = "Sp_SanPham_SelectByQuyen";
      
        SqlCommand cmd = new SqlCommand(Select_Query, ConnectString.GetConnection());
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@PhanQuyen", CheckQuyen()));
       
        SqlDataAdapter da = new SqlDataAdapter(cmd);
       
        DataSet ds = new DataSet();
       
        da.Fill(ds, "SanPham");
        
        dgvSanPham.DataSource = ds.Tables["SanPham"];
        dgvSanPham.DataBind();
    }

    public string GetTenLoaiSP(string MaLoaiSP)
    {
        
        string Select_Query = "Sp_LoaiSP_SelectByMa";
       
        SqlCommand cmd = new SqlCommand(Select_Query, ConnectString.GetConnection());
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("MaLoaiSP", MaLoaiSP));
       
        SqlDataAdapter da = new SqlDataAdapter(cmd);
     
        DataSet ds = new DataSet();
  
        da.Fill(ds, "LoaiSP");

        return ds.Tables["LoaiSP"].Rows[0].ItemArray[1].ToString();
    }

   

    public string CheckQuyen()
    {
        if (Session["User"] == null || Session["User"].ToString().Length == 0)
        {
            return "1";
        }
       
        string Select_Query = "Sp_Users_CheckQuyen";
       
        SqlCommand cmd = new SqlCommand(Select_Query, ConnectString.GetConnection());
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@TaiKhoan", Session["User"]));
       
        string Quyen = cmd.ExecuteScalar().ToString();
      

        return Quyen;
    }

    protected void Unnamed_Click(object sender, EventArgs e)
    {
        if (CheckQuyen() == "0" || CheckQuyen() == "1")
        {
            Insert();
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Thông báo", "alert('Bạn không có quyền thực hiện chức năng này!');", true);
        }
    }

    bool CheckFileType(string fileName)
    {
        string[] s = fileName.Split('.');
        string ext = s[s.Length - 1];
        switch (ext.ToLower())
        {
            case ".gif":
                return true;
            case ".png":
                return true;
            case ".jpg":
                return true;
            case ".jpeg":
                return true;
            default:
                return false;
        }
    }

    public void Insert()
    {
       
    
     
        SqlCommand cmd = new SqlCommand("Sp_SanPham_Insert", ConnectString.GetConnection());
        cmd.CommandType = CommandType.StoredProcedure;
       
        cmd.Parameters.Add(new SqlParameter("@TenSP", ValidateData(txtTenSP.Text)));
        //cmd.Parameters.Add(new SqlParameter("@HinhDaiDien", ValidateData(txtHinhAnh.Text)));

        if (upHinhAnh.HasFile && CheckFileType(upHinhAnh.FileName) == true)
        {
            string Filename = upHinhAnh.FileName;
            string[] s = Filename.Split('.');
            string Fake_FileName = DateTime.Now.Year + "" + DateTime.Now.Month + "" + DateTime.Now.Day + "" + DateTime.Now.Hour + "" + DateTime.Now.Minute + "" + DateTime.Now.Second + "." + s[s.Length - 1];
            upHinhAnh.SaveAs(Server.MapPath("../Uploads/") + Fake_FileName);
            cmd.Parameters.Add(new SqlParameter("@HinhDaiDien", Fake_FileName));
        }
        else
        {
            cmd.Parameters.Add(new SqlParameter("@HinhDaiDien", ""));
        }
        cmd.Parameters.Add(new SqlParameter("@MoTaSP", ValidateData(txtMoTa.Text)));
        cmd.Parameters.Add(new SqlParameter("@MaLoaiSP", txtMaLoaiSP.Text));
        cmd.Parameters.Add(new SqlParameter("@XuatSu", ValidateData(txtMaNCC.Text)));
        cmd.Parameters.Add(new SqlParameter("@SoLuongTon", ValidateData(txtSoLuongTon.Text)));
       
        cmd.Parameters.Add(new SqlParameter("@GiaBan", ValidateData(txtGiaBan.Text)));
        cmd.Parameters.Add(new SqlParameter("@isHot", chkIsHot.Checked));
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
        chkActive.Checked = true;
    }

    protected void btnXoa_Command(object sender, CommandEventArgs e)
    {
        //Lấy Mã sản phẩm cần xóa tương ứng với Button xóa
        string MaSP = e.CommandArgument.ToString();
        //Sp_SanPham_DeActive
        if (CheckQuyen() == "1")
        {
           
          
            SqlCommand cmd = new SqlCommand("Sp_SanPham_DeActive", ConnectString.GetConnection());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@MaSP", MaSP));
          
            cmd.ExecuteNonQuery();
         
            getData();
         
            ClearText();
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Thông báo", "alert('Bạn không có quyền thực hiện chức năng này!');", true);
        }
    }

    protected void btnSua_Command(object sender, CommandEventArgs e)
    {
        string MaSP = e.CommandArgument.ToString();

      
        string Select_Query = "Sp_SanPham_SelectByMa";
       
        SqlCommand cmd = new SqlCommand(Select_Query, ConnectString.GetConnection());
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("MaSP", MaSP));
      
        SqlDataAdapter da = new SqlDataAdapter(cmd);
     
        DataSet ds = new DataSet();
     
        da.Fill(ds, "SanPham");

        txtMaSP.Text = ds.Tables["SanPham"].Rows[0].ItemArray[0].ToString();
        txtTenSP.Text = ds.Tables["SanPham"].Rows[0].ItemArray[1].ToString();
        //txtHinhAnh.Text = ds.Tables["SanPham"].Rows[0].ItemArray[2].ToString();
        hfHinhAnh.Value = ds.Tables["SanPham"].Rows[0].ItemArray[2].ToString();
        // imgHinhAnh.ImageUrl = "../Uploads/" + ds.Tables["SanPham"].Rows[0].ItemArray[2].ToString();
        txtMoTa.Text = ds.Tables["SanPham"].Rows[0].ItemArray[3].ToString();
        txtMaLoaiSP.Text = ds.Tables["SanPham"].Rows[0].ItemArray[4].ToString();
        txtMaNCC.Text = ds.Tables["SanPham"].Rows[0].ItemArray[5].ToString();
        txtSoLuongTon.Text = ds.Tables["SanPham"].Rows[0].ItemArray[6].ToString();
        txtGiaBan.Text = ds.Tables["SanPham"].Rows[0].ItemArray[7].ToString();
        chkIsHot.Checked = ds.Tables["SanPham"].Rows[0].ItemArray[8].ToString() == "True" ? true : false;
        chkActive.Checked = ds.Tables["SanPham"].Rows[0].ItemArray[9].ToString() == "True" ? true : false;
    }

    protected void btnSua_Click(object sender, EventArgs e)
    {
        if (CheckQuyen() == "1" || CheckQuyen() == "2")
        {
            Update();
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Thông báo", "alert('Bạn không có quyền thực hiện chức năng này!');", true);
        }
    }

    public void Update()
    {
     
        
      
        SqlCommand cmd = new SqlCommand("Sp_SanPham_Update", ConnectString.GetConnection());
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@MaSP", ValidateData(txtMaSP.Text)));
        cmd.Parameters.Add(new SqlParameter("@TenSP", ValidateData(txtTenSP.Text)));
        //cmd.Parameters.Add(new SqlParameter("@HinhDaiDien", ValidateData(txtHinhAnh.Text)));
        if (upHinhAnh.HasFile && CheckFileType(upHinhAnh.FileName) == true)
        {
            string Filename = upHinhAnh.FileName;
            string[] s = Filename.Split('.');
            string Fake_FileName = DateTime.Now.Year + "" + DateTime.Now.Month + "" + DateTime.Now.Day + "" + DateTime.Now.Hour + "" + DateTime.Now.Minute + "" + DateTime.Now.Second + "." + s[s.Length - 1];
            //   upHinhAnh.SaveAs(Server.MapPath("../Uploads/") + Fake_FileName);
            cmd.Parameters.Add(new SqlParameter("@HinhDaiDien", Fake_FileName));
        }
        else
        {
            cmd.Parameters.Add(new SqlParameter("@HinhDaiDien", hfHinhAnh.Value.ToString()));
        }
        cmd.Parameters.Add(new SqlParameter("@MoTaSP", ValidateData(txtMoTa.Text)));
        cmd.Parameters.Add(new SqlParameter("@MaLoaiSP", txtMaLoaiSP.Text));
        cmd.Parameters.Add(new SqlParameter("@XuatSu", ValidateData(txtMaNCC.Text)));
        cmd.Parameters.Add(new SqlParameter("@SoLuongTon", ValidateData(txtSoLuongTon.Text)));
        
        cmd.Parameters.Add(new SqlParameter("@GiaBan", ValidateData(txtGiaBan.Text)));
        cmd.Parameters.Add(new SqlParameter("@isHot", chkIsHot.Checked));
        cmd.Parameters.Add(new SqlParameter("@Active", chkActive.Checked));
     
        cmd.ExecuteNonQuery();
       

        
        getData();
      
        ClearText();
    }

    public string ValidateData(string s)
    {
        return s.Replace("<link", "").Replace("<script", "").Replace("</link", "").Replace("</script", "");
     
        //<script>alert("XSS Detected !")</script>
    }

}