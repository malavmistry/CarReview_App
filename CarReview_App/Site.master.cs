using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SiteMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            if (Session["ID"] == null && !Request.RawUrl.Contains("Login.aspx"))
            {
                Response.Redirect("Login.aspx?msg=logout");
            }
        }
    }
}
