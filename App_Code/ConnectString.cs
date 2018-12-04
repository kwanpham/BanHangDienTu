using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for ConnectString
/// </summary>
public class ConnectString
{
	public ConnectString()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static string ConnectionString = "Data Source = USERMIC-OB7C2M4; Initial Catalog = BANHANGDIENTU; Uid = quan1; Pwd = 123;";

    public static SqlConnection GetConnection()
    {
        SqlConnection con = new SqlConnection(ConnectionString);
        con.Open();
        return con;
    }


}