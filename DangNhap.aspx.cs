using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class DangNhap : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnDangNhap(object sender, EventArgs e)
    {
        string TaiKhoan = TextBox1.Text;
        string MatKhau = MaHoa.MaHoaMatKhau(TextBox2.Text);

        SqlCommand cmd = new SqlCommand("Sp_Users_CheckLogin", ConnectString.GetConnection());
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add(new SqlParameter("@TaiKhoan", TaiKhoan));
        cmd.Parameters.Add(new SqlParameter("@MatKhau", MatKhau));

        string SoLuong = cmd.ExecuteScalar().ToString();
        if (SoLuong == "1")
        {
            Session["User"] = TaiKhoan;
            Response.Redirect("QuanLyLoaiSanPham.aspx");
        }
        else
        {
            lbError.Text = "Tài khoản hoặc mật khẩu không đúng.";
        }
    }
}