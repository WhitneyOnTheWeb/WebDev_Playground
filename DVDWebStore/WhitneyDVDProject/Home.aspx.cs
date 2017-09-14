using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection conn;
        SqlCommand comm;
        SqlDataReader reader;
        string connectionString = ConfigurationManager.ConnectionStrings["DVDdb"].ConnectionString;
        conn = new SqlConnection(connectionString);
        comm = new SqlCommand("SELECT DVDID, DVDtitle, DVDartist, DVDrating, CONVERT(DECIMAL(10,2), DVDprice) AS DVDprice " +
                              "FROM DVDtable WHERE (DVDtitle NOT LIKE '' AND DVDtitle IS NOT NULL) AND (DVDartist NOT LIKE '' " +
                              "AND DVDartist IS NOT NULL) AND (DVDrating NOT LIKE '' AND DVDrating IS NOT NULL) AND " +
                              "(DVDprice NOT LIKE '' AND DVDprice IS NOT NULL)", conn);
        try
        {
            conn.Open();
            reader = comm.ExecuteReader();
            dvdRepeater.DataSource = reader;
            dvdRepeater.DataBind();
            reader.Close();
        }
        finally
        {
            conn.Close();
        }
    }

    protected void dvdRepeater_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "details")
        {
            Response.Redirect("Details.aspx?id=" + e.CommandArgument);
        }
        else if (e.CommandName == "buy")
        {
            Response.Redirect("BuyDVD.aspx?id=" + e.CommandArgument);
        }
    }


}