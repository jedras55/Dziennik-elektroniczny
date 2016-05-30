<%@ Page Language="C#" AutoEventWireup="true" CodeFile="loginAdmin.aspx.cs" Inherits="loginAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="css/loginStyle.css">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
    <div class="row">
        <div class="col-md-offset-5 col-md-3">
            <div class="form-login">
            <h3>Panel administracyjny.</h3>
            <asp:TextBox ID="userName" runat="server" class="form-control chat-input" placeholder="login"></asp:TextBox>
            </br>
            <asp:TextBox ID="userPassword" runat="server" class="form-control chat-input" placeholder="hasło" TextMode="Password"></asp:TextBox>
            </br>
            <div class="wrapper">
            <span class="group-btn">  
                <asp:Button ID="ButtonZaloguj" runat="server" class="btn btn-primary btn-md" Text="Zaloguj" OnClick="ButtonZaloguj_Click1" />   
            </span>
            </div>
            </div>
        
        </div>
    </div>
</div>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/loginUser.aspx">Panel użytkownika</asp:HyperLink>
        </p>
    </form>
</body>
</html>

