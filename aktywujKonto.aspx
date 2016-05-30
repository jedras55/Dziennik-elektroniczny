<%@ Page Language="C#" AutoEventWireup="true" CodeFile="aktywujKonto.aspx.cs" Inherits="aktywujKonto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: center">
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Twoje konto jest nieaktywne"></asp:Label>
        <br />
&nbsp;<asp:Button ID="ButtonWyslijLink" runat="server" OnClick="ButtonWyslijLink_Click" Text="Wyślij link aktywacyjny" />
        <br />
    </div>
        <div class="auto-style1">
            <asp:Label ID="Label2" runat="server" Text="Link został wysłany"></asp:Label>
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/loginUser.aspx">Powrót do strony logowania</asp:HyperLink>
        </div>
    </form>
</body>
</html>
