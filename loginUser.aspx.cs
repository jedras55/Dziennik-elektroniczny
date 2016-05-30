using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class loginUser : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS;Initial Catalog='Dziennik elektroniczny';Integrated Security=True");
    SqlCommand cmd = new SqlCommand();
    SqlDataReader dr;

    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        con.Open();
        cmd.Connection = con;
        cmd.CommandText = "SELECT * FROM " + DropDownList1.SelectedValue + " WHERE login = '" + TextBoxLogin.Text + "' AND haslo = '" + TextBoxHaslo.Text + "'";
        dr = cmd.ExecuteReader();
        dr.Read();
        if (dr.HasRows)
        {
            Session["login"] = DropDownList1.SelectedValue;
            Session["username"] = TextBoxLogin.Text;
            if (Session["login"] == "nauczyciel")
            {
                Response.Redirect("nauczyciel/panelNauczyciel.aspx");
            }
            else if (Session["login"] == "rodzic")
            {
                Response.Redirect("rodzic/panelRodzic.aspx");
            }
            else if (Session["login"] == "nauczyciel")
            {
                Response.Redirect("uczen/panelUczen.aspx");
            }
        }
        else
        {
            Response.Write("Login jest nieprawidłowy");
        }
        con.Close();
    }
}