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

public partial class EditDVD : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadMovieList();
        }
    }

    private void LoadMovieList()
    {
        SqlConnection conn;
        SqlCommand comm;
        SqlDataReader reader;
        string connectionString = ConfigurationManager.ConnectionStrings["DVDdb"].ConnectionString;
        conn = new SqlConnection(connectionString);
        comm = new SqlCommand("SELECT DVDID, DVDtitle, DVDartist, DVDrating, DVDprice FROM DVDtable", conn);
        try
        {
            conn.Open();
            reader = comm.ExecuteReader();
            moviesList.DataSource = reader;
            moviesList.DataValueField = "DVDID";
            moviesList.DataTextField = "DVDtitle";
            moviesList.DataBind();
            reader.Close();
        }
        catch
        {
            dbErrorLabel.ForeColor = Color.Red;
            dbErrorLabel.Text = "Error loading the list of movies!";
        }
        finally
        {
            conn.Close();
        }
        updatemovieButton.Enabled = false;
        updatemovieButton.ForeColor = Color.Gray;
        deletemovieButton.Enabled = false;
        deletemovieButton.ForeColor = Color.Gray;
        titleTextBox.Text = "";
        starTextBox.Text = "";
        ratingTextBox.Text = "";
        priceTextBox.Text = "";
        descriptionTextbox.Text = "";
        imageTextbox.Text = "";
    }

    protected void selectmovieButton_Click(object sender, EventArgs e)
    {
        dbErrorLabel.Visible = false;
        SqlConnection conn;
        SqlCommand comm;
        SqlDataReader reader;
        string connectionString = ConfigurationManager.ConnectionStrings["DVDdb"].ConnectionString;
        conn = new SqlConnection(connectionString);
        comm = new SqlCommand("SELECT DVDtitle, DVDartist, DVDrating, CONVERT(DECIMAL (10,2), DVDprice) " +
            "AS DVDprice, Description, PicURL FROM DVDtable JOIN Details ON DVDtable.DVDID = Details.DVDID " +
            "WHERE DVDtable.DVDID = @DVDID", conn);
        comm.Parameters.Add("@DVDID", System.Data.SqlDbType.Int);
        comm.Parameters["@DVDID"].Value = moviesList.SelectedItem.Value;
        try
        {
            conn.Open();
            reader = comm.ExecuteReader();
            if (reader.Read())
            {
                titleTextBox.Text = reader["DVDtitle"].ToString();
                starTextBox.Text = reader["DVDartist"].ToString();
                ratingTextBox.Text = reader["DVDrating"].ToString();
                priceTextBox.Text = reader["DVDprice"].ToString();
                descriptionTextbox.Text = reader["Description"].ToString();
                imageTextbox.Text = reader["PicURL"].ToString();
            }
            reader.Close();
            updatemovieButton.Enabled = true;
            updatemovieButton.ForeColor = ColorTranslator.FromHtml("#B2577A");
            deletemovieButton.Enabled = true;
            deletemovieButton.ForeColor = ColorTranslator.FromHtml("#B2577A");
            dbErrorLabel.Visible = false;
        }
        catch
        {
            dbErrorLabel.Visible = true;
            dbErrorLabel.ForeColor = Color.Red;
            dbErrorLabel.Text = "Error loading the employee details!";
        }
        finally
        {
            conn.Close();
        }
    }

    protected void updatemovieButton_Click(object sender, EventArgs e)
    {
        dbErrorLabel.Visible = false;
        //Update DVD Table
        SqlConnection conn;
        SqlCommand comm;
        string connectionString = ConfigurationManager.ConnectionStrings["DVDdb"].ConnectionString;
        conn = new SqlConnection(connectionString); 
        comm = new SqlCommand("UPDATE DVDtable SET DVDtitle = @DVDtitle," +
            "DVDartist = @DVDartist, DVDrating = @DVDrating, DVDprice = @DVDprice WHERE DVDID = @DVDID", conn);
        comm.Parameters.Add("@DVDtitle", System.Data.SqlDbType.NVarChar, 50);
        comm.Parameters["@DVDtitle"].Value = titleTextBox.Text;
        comm.Parameters.Add("@DVDartist", System.Data.SqlDbType.NVarChar, 50);
        comm.Parameters["@DVDartist"].Value = starTextBox.Text;
        comm.Parameters.Add("@DVDrating", System.Data.SqlDbType.Int);
        comm.Parameters["@DVDrating"].Value = ratingTextBox.Text;
        comm.Parameters.Add("@DVDprice", System.Data.SqlDbType.Money);
        comm.Parameters["@DVDprice"].Value = priceTextBox.Text;
        comm.Parameters.Add("@DVDID", System.Data.SqlDbType.Int);
        comm.Parameters["@DVDID"].Value = moviesList.SelectedItem.Value;
        try
        {
            conn.Open();
            comm.ExecuteNonQuery();          
        }
        catch
        {
            dbErrorLabel.Visible = true;
            dbErrorLabel.ForeColor = Color.Red;
            dbErrorLabel.Text = "Error updating the movie details!";
        }
        finally
        {
            conn.Close();
        }

        //Update Details Table
        SqlConnection conn2;
        SqlCommand comm2;
        conn2 = new SqlConnection(connectionString);
        comm2 = new SqlCommand("UPDATE Details SET Description = @Description, " +
                               "PicURL = @PicURL WHERE DVDID = @DVDID", conn2);
        comm2.Parameters.Add("@DVDID", System.Data.SqlDbType.Int);
        comm2.Parameters["@DVDID"].Value = moviesList.SelectedItem.Value;
        comm2.Parameters.Add("@Description", System.Data.SqlDbType.NVarChar, 500);
        comm2.Parameters["@Description"].Value = descriptionTextbox.Text;
        comm2.Parameters.Add("@PicURL", System.Data.SqlDbType.NVarChar, 100);
        comm2.Parameters["@PicURL"].Value = imageTextbox.Text;
        try
        {
            conn2.Open();
            comm2.ExecuteNonQuery();
            dbErrorLabel.Visible = true;
            dbErrorLabel.ForeColor = Color.Green;
            dbErrorLabel.Text = "Movie updated successfully!";
        }
        catch
        {
            dbErrorLabel.Visible = true;
            dbErrorLabel.ForeColor = Color.Red;
            dbErrorLabel.Text = "Error updating the movie details!";
        }
        finally
        {
            conn.Close();
        }

        LoadMovieList();
    }

    protected void deletemovieButton_Click(object sender, EventArgs e)
    {
        dbErrorLabel.Visible = false;

        //Delete from DVDs
        SqlConnection conn;
        SqlCommand comm;
        string connectionString = ConfigurationManager.ConnectionStrings["DVDdb"].ConnectionString;
        conn = new SqlConnection(connectionString);
        comm = new SqlCommand("DELETE FROM DVDtable WHERE DVDID = @DVDID", conn);
        comm.Parameters.Add("@DVDID", System.Data.SqlDbType.Int);
        comm.Parameters["@DVDID"].Value = moviesList.SelectedItem.Value;
        try
        {
            conn.Open();
            comm.ExecuteNonQuery();
        }
        catch
        {
            dbErrorLabel.Visible = true;
            dbErrorLabel.ForeColor = Color.Red;
            dbErrorLabel.Text = "Error deleting movie!";
        }
        finally
        {
            conn.Close();
        }

        //Delete from Details
        SqlConnection conn2;
        SqlCommand comm2;
        conn2 = new SqlConnection(connectionString);
        comm2 = new SqlCommand("DELETE FROM Details WHERE DVDID = @DVDID", conn2);
        comm2.Parameters.Add("@DVDID", System.Data.SqlDbType.Int);
        comm2.Parameters["@DVDID"].Value = moviesList.SelectedItem.Value;
        try
        {
            conn.Open();
            comm.ExecuteNonQuery();
            dbErrorLabel.Visible = true;
            dbErrorLabel.ForeColor = Color.Green;
            dbErrorLabel.Text = "Movie deleted successfully!";
        }
        catch
        {
            dbErrorLabel.Visible = true;
            dbErrorLabel.ForeColor = Color.Red;
            dbErrorLabel.Text = "Error deleting movie!";
        }
        finally
        {
            conn.Close();
        }

        LoadMovieList();
    }

    protected void logoutButton_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        Response.Redirect("~/Home.aspx");
    }
}