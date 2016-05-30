using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class aktywacja : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS;Initial Catalog='Dziennik elektroniczny';Integrated Security=True");
    SqlCommand cmd = new SqlCommand();
    protected void Page_Load(object sender, EventArgs e)
    {
        LabelZmienione.Visible = false;
        HyperLink1.Visible = false;
    }
    protected void ButtonAktywuj_Click(object sender, EventArgs e)
    {
        string typKonta = Request.QueryString["typKonta"];
        string login = Request.QueryString["login"];
        con.Open();
        cmd.Connection = con;
        cmd.CommandText = "UPDATE " + typKonta + " SET haslo = '" + TextBoxHaslo.Text + "', aktywowany = 'TRUE' WHERE LOGIN = '" + login + "'";
        cmd.ExecuteNonQuery();
        LabelHaslo.Visible = false;
        LabelPotwierdzHaslo.Visible = false;
        TextBoxHaslo.Visible = false;
        TextBoxHasloPotwierdz.Visible = false;
        ButtonAktywuj.Visible = false;
        LabelZmienione.Visible = true;
        HyperLink1.Visible = true;
    }
}