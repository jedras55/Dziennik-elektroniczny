using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class admin_adminUczniowie : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS;Initial Catalog='Dziennik elektroniczny';Integrated Security=True");
    SqlDataReader dr;
    protected void Page_Load(object sender, EventArgs e)
    {
        String a = Request.QueryString["id"];
        SqlCommand cmd = new SqlCommand("SELECT NAZWA FROM KLASA WHERE id_klasa = " + a, new SqlConnection("Data Source=.\\SQLEXPRESS;Initial Catalog='Dziennik elektroniczny';Integrated Security=True"));
        cmd.Connection = con;
        con.Open();
        LabelNazwaKlasy.Text = cmd.ExecuteScalar().ToString();
    }
    protected void ButtonDodaj_Click(object sender, EventArgs e)
    {
        SqlDataSource1.Insert();
        SqlDataSource1.DataBind();
        TextBoxLogin.Text = "";
        TextBoxImie.Text = "";
        TextBoxNazwisko.Text = "";
        TextBoxDataUrodzenia.Text = "";
        TextBoxPesel.Text = "";
        TextBoxMiasto.Text = "";
        TextBoxUlica.Text = "";
        TextBoxNumerDomu.Text = "";
        TextBoxEmail.Text = "";
    }
    protected void ButtonDodajPrzedmiot_Click(object sender, EventArgs e)
    {
        SqlDataSource2.Insert();
        SqlDataSource2.DataBind();
        TextBoxNazwaPrzedmiotu.Text = "";
    }
}