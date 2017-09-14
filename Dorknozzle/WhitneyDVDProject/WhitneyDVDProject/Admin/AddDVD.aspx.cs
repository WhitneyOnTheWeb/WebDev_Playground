using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;

public partial class AddDVD : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void addmovieButton_Click(object sender, EventArgs e)
    {

        //Insert into DVD table
        long insertedId = 0;
        SqlConnection conn;
        SqlCommand comm;
        string connectionString = ConfigurationManager.ConnectionStrings["DVDdb"].ConnectionString;
        conn = new SqlConnection(connectionString);
        comm = new SqlCommand("INSERT INTO DVDtable (DVDtitle, DVDartist, DVDrating, DVDprice)" +
                              " VALUES(@DVDtitle, @DVDartist, @DVDrating, @DVDprice);" +
                              " SELECT SCOPE_IDENTITY()", conn);
        comm.Parameters.Add("@DVDtitle", System.Data.SqlDbType.NVarChar, 50);
        comm.Parameters["@DVDtitle"].Value = titleTextBox.Text;
        comm.Parameters.Add("@DVDartist", System.Data.SqlDbType.NVarChar, 50);
        comm.Parameters["@DVDartist"].Value = starTextBox.Text;
        comm.Parameters.Add("@DVDrating", System.Data.SqlDbType.NVarChar, 50);
        comm.Parameters["@DVDrating"].Value = ratingTextBox.Text;
        comm.Parameters.Add("@DVDprice", System.Data.SqlDbType.NVarChar, 50);
        comm.Parameters["@DVDprice"].Value = priceTextBox.Text;

        if (titleTextBox.Text == "" || starTextBox.Text == "" || ratingTextBox.Text == "" || priceTextBox.Text == "")
        {
            dbErrorLabel.ForeColor = System.Drawing.Color.Red;
            dbErrorLabel.Text = "Please enter valid information in each field!";
        }
        else
        {
            try
            {
                conn.Open();
                insertedId = Convert.ToInt64(comm.ExecuteScalar());
                DVDIDLabel.Text = Convert.ToString(insertedId);
            }
            catch
            {
                dbErrorLabel.ForeColor = Color.Red;
                dbErrorLabel.Text = "Error adding movie! <br/>";
            }
            finally
            {
                conn.Close();
            }

        }

        //Insert Into Details Table
        SqlConnection conn2;
        SqlCommand comm2;
        conn2 = new SqlConnection(connectionString);
        comm2 = new SqlCommand("INSERT INTO Details (DVDID, Description, PicURL)" +
                               " VALUES(@DVDID, @Description, @PicURL)", conn2);
        comm2.Parameters.Add("@DVDID", System.Data.SqlDbType.Int);
        comm2.Parameters["@DVDID"].Value = DVDIDLabel.Text;
        comm2.Parameters.Add("@Description", System.Data.SqlDbType.NVarChar, 500);
        comm2.Parameters["@Description"].Value = descriptionTextbox.Text;
        comm2.Parameters.Add("@PicURL", System.Data.SqlDbType.NVarChar, 100);
        comm2.Parameters["@PicURL"].Value = pictureTextbox.Text;

        if (titleTextBox.Text == "" || starTextBox.Text == "" || ratingTextBox.Text == "" || priceTextBox.Text == "")
        {
            dbErrorLabel.ForeColor = System.Drawing.Color.Red;
            dbErrorLabel.Text = "Please enter valid information in each field!";
        }
        else
        {
            try
            {
                conn2.Open();
                comm2.ExecuteNonQuery();
                dbErrorLabel.ForeColor = Color.Green;
                dbErrorLabel.Text = "Movie Added! <br />";
            }
            catch
            {
                dbErrorLabel.ForeColor = Color.Red;
                dbErrorLabel.Text = "Error adding movie! <br/>";
            }
            finally
            {
                conn2.Close();
            }
        }
        titleTextBox.Text = "";
        starTextBox.Text = "";
        ratingTextBox.Text = "";
        priceTextBox.Text = "";
        descriptionTextbox.Text = "";
        pictureTextbox.Text = "";
    }
}