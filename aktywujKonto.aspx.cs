using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class aktywujKonto : System.Web.UI.Page{

    SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS;Initial Catalog='Dziennik elektroniczny';Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        Label2.Visible = false;
        HyperLink1.Visible = false;
    }
    protected void ButtonWyslijLink_Click(object sender, EventArgs e)
    {
        SendEmail();
        Label1.Visible = false;
        ButtonWyslijLink.Visible = false;
        Label2.Visible = true;
        //HyperLink1.Visible = true;
    }
    public void SendEmail()
    {
        string typKonta = Session["login"].ToString();
        string login = Session["username"].ToString();
        SqlCommand cmd = new SqlCommand("SELECT EMAIL FROM " +  typKonta + " WHERE login = '" + login + "'", new SqlConnection("Data Source=.\\SQLEXPRESS;Initial Catalog='Dziennik elektroniczny';Integrated Security=True"));
        cmd.Connection = con;
        con.Open();
        string adresEmail = cmd.ExecuteScalar().ToString();
        MailMessage message = new MailMessage();
        SmtpClient client = new SmtpClient();
        client.Host = "smtp.gmail.com";
        client.Port = 587;

        string linkPotwierdzajacy = "http://localhost:56465/aktywacja.aspx?typKonta=" + typKonta + "&login=" + login;
        message.From = new MailAddress("dziennik.elektroniczny.pwsz@gmail.com");
        message.To.Add(adresEmail);
        message.Subject  = "Aktywacja konta";
        message.Body = "Witaj " + login + ",</br> twój link potwierdzający: </br> <a href='" + linkPotwierdzajacy + "'> Kliknij tutaj </a>";
        message.IsBodyHtml = true;
        client.EnableSsl = true;
        client.UseDefaultCredentials = true;
        client.Credentials = new System.Net.NetworkCredential("dziennik.elektroniczny.pwsz@gmail.com","aplikacje");
        client.Send(message);
    }
}