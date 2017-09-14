using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ErrorTest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int[] a = new int[10];
        int i;

        try
        {
            for (i = 0; i < 11; i++)
            {
                a[i] = i;
            }
        }
        catch(Exception ex)
        {
            messageLabel.Text = "Exception!</br>" + ex.Message;
        }
    }
}