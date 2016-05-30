using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_panelAdmin : System.Web.UI.MasterPage
{
    SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS;Initial Catalog='Dziennik elektroniczny';Integrated Security=True");
    SqlCommand cmd = new SqlCommand();
    SqlDataReader dr;

    SqlConnection conk = new SqlConnection("Data Source=.\\SQLEXPRESS;Initial Catalog='Dziennik elektroniczny';Integrated Security=True");
    SqlDataReader drk;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["login"] != "nauczyciel")
        {
            Response.Redirect("../loginUser.aspx");
        }
        LabelLogin.Text = Session["username"].ToString();
        con.Open();
        cmd.Connection = con;
        cmd.CommandText = "SELECT * FROM KLASA WHERE nauczyciel_login = '" + Session["username"].ToString() + "'";
        dr = cmd.ExecuteReader();
        dr.Read();
        mojaKlasa.Visible = false;
        if (dr.HasRows)
        {
            mojaKlasa.Visible = true;
        }
        con.Close();
        String login = Session["username"].ToString();
        SqlCommand cmdk = new SqlCommand("SELECT AKTYWOWANY FROM NAUCZYCIEL WHERE login = '" + login + "'", new SqlConnection("Data Source=.\\SQLEXPRESS;Initial Catalog='Dziennik elektroniczny';Integrated Security=True"));
        cmdk.Connection = con;
        con.Open();
        String czyAktywowany = cmdk.ExecuteScalar().ToString();
        if (czyAktywowany == "False")
        {
            Response.Redirect("../aktywujKonto.aspx");
        }
    }
    protected void ButtonLogout_Click(object sender, EventArgs e)
    {
        Session["login"] = null;
        Session["username"] = null;
        Response.Redirect("../loginUser.aspx");
    }
}
