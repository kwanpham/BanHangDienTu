using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Cryptography;
using System.Text;

/// <summary>
/// Summary description for MaHoa
/// </summary>
public class MaHoa
{
	public MaHoa()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static string MaHoaMatKhau(string pass)
    {
        MD5 md5hash = new MD5CryptoServiceProvider();
        UTF8Encoding encoder = new UTF8Encoding();
        byte[] hashBytes;
        hashBytes = md5hash.ComputeHash(encoder.GetBytes(pass));
        return BitConverter.ToString(hashBytes);
    }
}