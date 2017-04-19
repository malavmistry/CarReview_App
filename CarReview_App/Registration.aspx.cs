using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class Registration : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;
        cmd.CommandText = "InsertUser";
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@username", (txtUsername.Text).Trim()));
        cmd.Parameters.Add(new SqlParameter("@Password", (txtPassword.Text).Trim()));
        cmd.Parameters.Add(new SqlParameter("@Fname", (txtFirst.Text).Trim()));
        cmd.Parameters.Add(new SqlParameter("@Mname", (txtMiddle.Text).Trim()));
        cmd.Parameters.Add(new SqlParameter("@Lname", (txtLast.Text).Trim()));
        cmd.Parameters.Add(new SqlParameter("@Address", (txtAddress.Text).Trim()));
        cmd.Parameters.Add(new SqlParameter("@Email", (txtEmail.Text).Trim()));
        cmd.Parameters.Add(new SqlParameter("@Phone", (txtContact.Text).Trim()));
        cmd.Parameters.Add("@output", SqlDbType.VarChar, 100).Direction = ParameterDirection.Output;
        conn.Open();
        int result = cmd.ExecuteNonQuery();
        conn.Close();
        var output = cmd.Parameters["@output"].Value;
        if (result > 0)
        {
            Response.Redirect("Login.aspx?msg=Add");
        }
        else
        {
            lblShow.Text = output.ToString();
        }
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        txtUsername.Text = txtPassword.Text = txtFirst.Text = txtMiddle.Text = txtLast.Text = txtAddress.Text = txtEmail.Text = txtContact.Text = "";
    }
}