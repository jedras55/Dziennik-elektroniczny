using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_panelAdmin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["login"] != "admin")
        {
            Response.Redirect("../loginAdmin.aspx");
        }
        LabelLogin.Text = Session["username"].ToString();
    }
    protected void ButtonLogout_Click(object sender, EventArgs e)
    {
        Session["login"] = null;
        Session["username"] = null;
        Response.Redirect("../loginAdmin.aspx");
    }
}
