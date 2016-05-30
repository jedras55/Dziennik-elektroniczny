using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_adminRodzic : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS;Initial Catalog='Dziennik elektroniczny';Integrated Security=True");
    SqlDataReader dr;
    protected void Page_Load(object sender, EventArgs e)
    {
        String a = Request.QueryString["id"];
        //SqlCommand cmd = new SqlCommand("SELECT LOGIN FROM KLASA WHERE id_klasa = " + a, new SqlConnection("Data Source=.\\SQLEXPRESS;Initial Catalog='Dziennik elektroniczny';Integrated Security=True"));
        //cmd.Connection = con;
        //con.Open();
        LabelRodzic.Text = a;
    }
}