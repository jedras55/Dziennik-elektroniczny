<%@ Page Language="C#" AutoEventWireup="true" CodeFile="loginUser.aspx.cs" Inherits="loginUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 627px;
            text-align: right;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        &nbsp;<div style="text-align: right">
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/loginAdmin.aspx" style="text-align: right">Panel administratora</asp:HyperLink>
        </div>
    
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">Login:&nbsp; </td>
                <td>
                    <asp:TextBox ID="TextBoxLogin" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxLogin" ErrorMessage="Pole Login nie może być puste" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Hasło:&nbsp; </td>
                <td>
                    <asp:TextBox ID="TextBoxHaslo" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxHaslo" ErrorMessage="Pole Hasło nie może być puste" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Typ użytkownika:</td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem Value="nauczyciel">Nauczyciel</asp:ListItem>
                        <asp:ListItem Value="rodzic">Rodzic</asp:ListItem>
                        <asp:ListItem Value="uczen">Uczeń</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Zaloguj" />
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
