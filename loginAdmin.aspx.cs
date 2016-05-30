using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class loginAdmin : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS;Initial Catalog='Dziennik elektroniczny';Integrated Security=True");
    SqlCommand cmd = new SqlCommand();
    SqlDataReader dr;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ButtonZaloguj_Click1(object sender, EventArgs e)
    {
        con.Open();
        cmd.Connection = con;
        cmd.CommandText = "SELECT * FROM admin WHERE login = '" + userName.Text + "' AND haslo = '" + userPassword.Text + "'";
        dr = cmd.ExecuteReader();
        dr.Read();
        if (dr.HasRows)
        {
            Session["login"] = "admin";
            Session["username"] = userName.Text;
            Response.Redirect("admin/panelAdmin.aspx");
        }
        else
        {
            Response.Write("Login jest nieprawidłowy");
        }
        con.Close();
    }
}