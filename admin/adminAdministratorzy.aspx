<%@ Page Title="" Language="C#" MasterPageFile="~/admin/panelAdmin.master" AutoEventWireup="true" CodeFile="adminAdministratorzy.aspx.cs" Inherits="admin_adminAdministratorzy2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 180px;
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" Runat="Server">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Dziennik elektronicznyConnectionString %>" SelectCommand="SELECT * FROM [admin]" UpdateCommand="UPDATE &quot;ADMIN&quot; SET &quot;HASLO&quot; = @HASLO WHERE &quot;LOGIN&quot; = @LOGIN" InsertCommand="INSERT INTO ADMIN (login, haslo) VALUES(@login,@haslo);" DeleteCommand="DELETE FROM &quot;ADMIN&quot; WHERE &quot;LOGIN&quot; = @LOGIN">
            <DeleteParameters>
                <asp:Parameter Name="LOGIN" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="TextBoxLogin" Name="login" PropertyName="Text" />
                <asp:ControlParameter ControlID="TextBoxHaslo" Name="haslo" PropertyName="Text" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="LOGIN" />
                <asp:Parameter Name="HASLO" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="login" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="login" HeaderText="Login" ReadOnly="True" SortExpression="login" />
                <asp:TemplateField HeaderText="Hasło" SortExpression="haslo">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("haslo") %>' TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox1" Display="None" ErrorMessage="Pole Hasło nie może być puste" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("haslo", "*****") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="administratorzyLinkButton2" runat="server" CausesValidation="True" CommandName="Update" Text="Zmień hasło"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="administratorzyLinkButton3" runat="server" CausesValidation="False" CommandName="Cancel" Text="Anuluj"></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="administratorzyLinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Zmień hasło"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="administratorzyLinkButton4" runat="server" CausesValidation="False" CommandName="Delete" Text="Usuń"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:ValidationSummary ID="ValidationSummary2" runat="server" ForeColor="#FF3300" />
        <br />


        <table class="nav-justified">
            <tr>
                <td class="auto-style1">Login</td>
                <td>
                    <asp:TextBox ID="TextBoxLogin" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxLogin" Display="None" ErrorMessage="Pole Login nie może być puste" ForeColor="#FF3300" ValidationGroup="Dodaj"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Hasło</td>
                <td>
                    <asp:TextBox ID="TextBoxHaslo" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidatorHaslo" runat="server" ControlToCompare="TextBoxHaslo" ControlToValidate="TextBoxPotwierdzHaslo" Display="None" ErrorMessage="Hasła nie mogą się różnić" ForeColor="#FF3300" ValidationGroup="Dodaj"></asp:CompareValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxHaslo" Display="None" ErrorMessage="Pole Hasło nie może być puste" ForeColor="#FF3300" ValidationGroup="Dodaj"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Potwierdź hasło</td>
                <td>
                    <asp:TextBox ID="TextBoxPotwierdzHaslo" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBoxPotwierdzHaslo" Display="None" ErrorMessage="Potwierdzenie hasła nie może być puste" ForeColor="#FF3300" ValidationGroup="Dodaj"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td>
                    <asp:Button ID="ButtonDodaj" runat="server" OnClick="ButtonDodaj_Click" Text="Dodaj" ValidationGroup="Dodaj" />
                </td>
            </tr>
        </table>

        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="#FF3300" ValidationGroup="Dodaj" />
</asp:Content>

