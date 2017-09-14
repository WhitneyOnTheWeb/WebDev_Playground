using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void submitButton_Click(object sender, EventArgs e)
    {
        if (FormsAuthentication.Authenticate(usernameTextBox.Text, passwordTextBox.Text))
        {
            FormsAuthentication.RedirectFromLoginPage(usernameTextBox.Text, true);
        }
    }
}