<%@ Page Language="C#" AutoEventWireup="true" CodeFile="aktywacja.aspx.cs" Inherits="aktywacja" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
            font-size: xx-large;
        }
        .auto-style2 {
            width: 100%;
        }
        .auto-style3 {
            text-align: right;
            width: 558px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        &nbsp;<p class="auto-style1">
                <strong>Aktywuj konto</strong></p>
            <div>
                <table class="auto-style2">
                    <tr>
                        <td class="auto-style3">
                            <asp:Label ID="LabelHaslo" runat="server" Text="Hasło: "></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxHaslo" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxHaslo" ErrorMessage="Polę Hasło nie może być puste" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBoxHasloPotwierdz" ControlToValidate="TextBoxHaslo" ErrorMessage="Hasła nie mogą być różne" ForeColor="#FF3300"></asp:CompareValidator>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">
                            <asp:Label ID="LabelPotwierdzHaslo" runat="server" Text="Potwierdź hasło: "></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxHasloPotwierdz" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxHasloPotwierdz" ErrorMessage="Potwierdzenie hasła nie może być puste" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">&nbsp;</td>
                        <td>
                            <asp:Button ID="ButtonAktywuj" runat="server" OnClick="ButtonAktywuj_Click" Text="Aktywuj" />
                        </td>
                    </tr>
                </table>
                <br />
                <div style="text-align: center">
                    <asp:Label ID="LabelZmienione" runat="server" Text="Konto zostało aktywowane"></asp:Label>
                    <br />
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/loginUser.aspx">Powrót do strony logowania</asp:HyperLink>
                </div>
            </div>
    </form>
</body>
</html>
