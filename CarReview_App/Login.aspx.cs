using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class Login : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["msg"] == "Add")
            {
                lblShow.Text = "Information Save Successfully";
            }
            if (Request.QueryString["msg"] == "logout")
            {
                Session.Abandon();
            }
        }
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string query = "select * from Users where username='" + txtUsername.Text + "' and password='" + txtPassword.Text + "'";
        SqlDataAdapter da = new SqlDataAdapter(query, conn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            Session["ID"] = Convert.ToInt32(dt.Rows[0]["Id"]);
            Session["name"] = dt.Rows[0]["Fname"].ToString() + " " + dt.Rows[0]["lName"].ToString();
            Response.Redirect("index.aspx");
        }
        else
        {
            lblShow.Text = "Invalid Username and Password";
            txtUsername.Text = "";
            txtPassword.Text = "";
            txtUsername.Focus();
        }
    }
}