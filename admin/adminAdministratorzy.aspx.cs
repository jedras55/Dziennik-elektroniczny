using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_adminAdministratorzy2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ButtonDodaj_Click(object sender, EventArgs e)
    {
        SqlDataSource1.Insert();
        SqlDataSource1.DataBind();
        TextBoxLogin.Text = "";
    }
}