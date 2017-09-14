using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;
using System.Web.Security;

public partial class Reports : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void LogoffButton_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        Response.Redirect("~/Home.aspx");
    }

    protected void ListCustButton_Click(object sender, EventArgs e)
    {
        SqlConnection conn;
        SqlCommand comm;
        SqlDataReader reader;
        string connectionString = ConfigurationManager.ConnectionStrings["DVDdb"].ConnectionString;
        conn = new SqlConnection(connectionString);
        comm = new SqlCommand("SELECT CustomerID, FirstName, LastName FROM Customers", conn);
        try
        {
            conn.Open();
            reader = comm.ExecuteReader();
            customersRepeater.DataSource = reader;
            customersRepeater.DataBind();
            reader.Close();
        }
        finally
        {
            conn.Close();
        }
        custbee.Visible = true;
    }

    protected void GetOrdersButton_Click(object sender, EventArgs e)
    {
        SqlConnection conn;
        SqlCommand comm;
        SqlDataReader reader;
        string connectionString = ConfigurationManager.ConnectionStrings["DVDdb"].ConnectionString;
        conn = new SqlConnection(connectionString);

        if (CustNumTextbox.Text.Length < 1) //check if customer number has been entered, if not pull all orders
        {
            comm = new SqlCommand("SELECT Orders.OrderID, Orders.CustomerID,  DVDsOrdered.DVDID, DVDtable.DVDtitle FROM Orders  " +
                      " INNER JOIN DVDsOrdered ON DVDsOrdered.OrderID = Orders.OrderID " +
                      " INNER JOIN DVDtable ON DVDsOrdered.DVDID = DVDtable.DVDID ", conn);
            try
            {
                conn.Open();
                reader = comm.ExecuteReader();
                ordersRepeater.DataSource = reader;
                ordersRepeater.DataBind();
                reader.Close();
            }
            finally
            {
                conn.Close();
            }
        }
        else
        {
            comm = new SqlCommand("SELECT Orders.OrderID, Orders.CustomerID,  DVDsOrdered.DVDID, DVDtable.DVDtitle FROM Orders  " +
                                  " INNER JOIN DVDsOrdered ON DVDsOrdered.OrderID = Orders.OrderID " +
                                  " INNER JOIN DVDtable ON DVDsOrdered.DVDID = DVDtable.DVDID " +
                                  " WHERE CustomerID = @CustomerID", conn);
            comm.Parameters.Add("@CustomerID", System.Data.SqlDbType.Int);
            comm.Parameters["@CustomerID"].Value = CustNumTextbox.Text;
            try
            {
                conn.Open();
                reader = comm.ExecuteReader();
                ordersRepeater.DataSource = reader;
                ordersRepeater.DataBind();
                reader.Close();
            }
            finally
            {
                conn.Close();
            }
        }
        orderbee.Visible = true;
    }
}