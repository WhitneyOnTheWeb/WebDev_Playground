using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;

    public partial class Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            labelDVDID.Text = Request.QueryString["id"];
            SqlConnection conn;
            SqlCommand comm;
            SqlDataReader reader;
            string connectionString = ConfigurationManager.ConnectionStrings["DVDdb"].ConnectionString;
            conn = new SqlConnection(connectionString);
            comm = new SqlCommand("SELECT Details.DVDID, DVDtitle, DVDartist, DVDrating, Description, PicURL" +
                                  " FROM Details JOIN DVDtable ON Details.DVDID = DVDtable.DVDID" +
                                  " WHERE Details.DVDID = @DVDID", conn);
            comm.Parameters.Add("@DVDID", System.Data.SqlDbType.Int);
            comm.Parameters["@DVDID"].Value = labelDVDID.Text;
            try
            {
                conn.Open();
                reader = comm.ExecuteReader();
                if (reader.Read())
                {
                    titleLabel.Text = reader["DVDtitle"].ToString();
                    starLabel.Text = reader["DVDartist"].ToString();
                    ratingLabel.Text = reader["DVDrating"].ToString();
                    descriptionLabel.Text = reader["Description"].ToString();
                    Pic.ImageUrl = reader["PicURL"].ToString();
                }
                reader.Close();
            }
            finally
            {
                conn.Close();
            }
        }

        protected void DoneButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
