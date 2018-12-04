using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Web;
using System.Text;
using System.Net;


public partial class DangKy : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        TextBox4.Text = GetLocalIP();
    }
    protected void btnDangKy(object sender, EventArgs e)
    {
        if (GetLocalIP().Equals("192.168.18.2"))
        {


            string taikhoan = TextBox1.Text;
            string matkhau = TextBox2.Text;
            string hovaten = TextBox3.Text;

            if (ValidateAntiXSS(taikhoan) && ValidateAntiXSS(matkhau) && ValidateAntiXSS(hovaten))
            {


                SqlCommand cmd = new SqlCommand("Sp_Users_Insert", ConnectString.GetConnection());
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter("@TaiKhoan", taikhoan));
                cmd.Parameters.Add(new SqlParameter("@MatKhau", MaHoa.MaHoaMatKhau(matkhau)));
                cmd.Parameters.Add(new SqlParameter("@HoTen", hovaten));


                cmd.ExecuteNonQuery();
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Thông báo", "alert('Bạn Nhập Không Đúng Định Dạng');", true);
            }

        }
        else
        {
            Response.Redirect("DangKy.aspx");
        }

        
    }


    public static bool ValidateAntiXSS(string inputParameter)
    {
        if (string.IsNullOrEmpty(inputParameter))
            return true;

        

        var pattren = new StringBuilder();

        //Checks any js events i.e. onKeyUp(), onBlur(), alerts and custom js functions etc.             
        pattren.Append(@"((alert|on\w+|function\s+\w+)\s*\(\s*(['+\d\w](,?\s*['+\d\w]*)*)*\s*\))");

        //Checks any html tags i.e. <script, <embed, <object etc.
        pattren.Append(@"|(<(script|iframe|embed|frame|frameset|object|img|applet|body|html|style|layer|link|ilayer|meta|bgsound))");


        return !Regex.IsMatch(System.Web.HttpUtility.UrlDecode(inputParameter), pattren.ToString(), RegexOptions.IgnoreCase | RegexOptions.Compiled);
    }

    public static string GetLocalIP()
    {
        string ipv4Address = String.Empty;
        foreach (IPAddress currrentIPAddress in Dns.GetHostAddresses(Dns.GetHostName()))
        {
            if (currrentIPAddress.AddressFamily.ToString() == System.Net.Sockets.AddressFamily.InterNetwork.ToString())
            {
                ipv4Address = currrentIPAddress.ToString();
                break;
            }
        }
        return ipv4Address;
    }
}