<%@ Page Title="" Language="C#" MasterPageFile="~/admin/panelAdmin.master" AutoEventWireup="true" CodeFile="adminNauczyciele.aspx.cs" Inherits="admin_adminNauczyciele" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Dziennik elektronicznyConnectionString %>" SelectCommand="SELECT * FROM [nauczyciel]" DeleteCommand="DELETE FROM &quot;NAUCZYCIEL&quot; WHERE &quot;LOGIN&quot; = @LOGIN" InsertCommand="INSERT INTO Nauczyciel(login, haslo, imie, nazwisko, email, aktywowany) VALUES (@login,'1234',@imie,@nazwisko,@email,'FALSE')" UpdateCommand="UPDATE &quot;NAUCZYCIEL&quot; SET &quot;IMIE&quot; = @IMIE, &quot;NAZWISKO&quot; = @NAZWISKO, &quot;EMAIL&quot; = @EMAIL, &quot;AKTYWOWANY&quot; = @AKTYWOWANY WHERE &quot;LOGIN&quot; = @LOGIN">
        <InsertParameters>
            <asp:ControlParameter ControlID="TextBoxImie" Name="imie" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBoxNazwisko" Name="nazwisko" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBoxLogin" Name="login" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBoxEmail" Name="email" PropertyName="Text" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="IMIE" />
            <asp:Parameter Name="NAZWISKO" />
            <asp:Parameter Name="EMAIL" />
            <asp:Parameter Name="AKTYWOWANY" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="login" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="login" HeaderText="Login" ReadOnly="True" SortExpression="login" />
            <asp:TemplateField HeaderText="Imię" SortExpression="imie">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("imie") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox1" Display="None" ErrorMessage="Imię nie może być puste" ValidationGroup="Edytuj"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nazwisko" SortExpression="nazwisko">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("nazwisko") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox2" Display="None" ErrorMessage="Nazwisko nie może być puste" ValidationGroup="Edytuj"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("nazwisko") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="E-mail" SortExpression="email">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox3" Display="None" ErrorMessage="E-mail nie może być pusty" ValidationGroup="Edytuj"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox3" Display="None" ErrorMessage="Podaj poprawny E-mail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="Edytuj"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Aktywowany" SortExpression="aktywowany">
                <EditItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("aktywowany") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("aktywowany") %>' Enabled="false" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="adminiLinkButton2" runat="server" CausesValidation="True" CommandName="Update" Text="Aktualizuj" ValidationGroup="Edytuj"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="adminiLinkButton3" runat="server" CausesValidation="False" CommandName="Cancel" Text="Anuluj"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="adminiLinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edytuj"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="adminiLinkButton4" runat="server" CausesValidation="False" CommandName="Delete" Text="Usuń"></asp:LinkButton>
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
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" ForeColor="#FF3300" ValidationGroup="Edytuj" />
    <br />
    <table class="auto-style1">
        <tr>
            <td class="text-right">Login: </td>
            <td>
                <asp:TextBox ID="TextBoxLogin" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxLogin" Display="None" ErrorMessage="Pole Login nie może być puste" ValidationGroup="Dodaj"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="text-right">Imię: </td>
            <td>
                <asp:TextBox ID="TextBoxImie" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxImie" Display="None" ErrorMessage="Pole Imię nie może być puste" ValidationGroup="Dodaj"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="text-right">Nazwisko: </td>
            <td>
                <asp:TextBox ID="TextBoxNazwisko" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBoxNazwisko" Display="None" ErrorMessage="Pole Nazwisko nie może być puste" ValidationGroup="Dodaj"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="text-right">E-mail: </td>
            <td>
                <asp:TextBox ID="TextBoxEmail" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBoxEmail" Display="None" ErrorMessage="Pole E-mail nie może być puste" ValidationGroup="Dodaj"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBoxEmail" Display="None" ErrorMessage="Podaj poprawny adres E-mail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="Dodaj"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="text-right">&nbsp;</td>
            <td>
                <asp:Button ID="ButtonDodaj" runat="server" OnClick="ButtonDodaj_Click" Text="Dodaj" ValidationGroup="Dodaj" />
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="#FF3300" ValidationGroup="Dodaj" />
    <br />
</asp:Content>

