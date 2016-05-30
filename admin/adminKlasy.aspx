<%@ Page Title="" Language="C#" MasterPageFile="~/admin/panelAdmin.master" AutoEventWireup="true" CodeFile="adminKlasy.aspx.cs" Inherits="admin_adminKlasy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            text-align: right;
            width: 152px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Dziennik elektronicznyConnectionString %>" SelectCommand="SELECT nauczyciel.imie, nauczyciel.nazwisko, nauczyciel.login, klasa.id_klasa, klasa.nazwa, klasa.nauczyciel_login FROM nauczyciel INNER JOIN klasa ON nauczyciel.login = klasa.nauczyciel_login" UpdateCommand="UPDATE &quot;KLASA&quot; SET &quot;NAZWA&quot; = @NAZWA, &quot;NAUCZYCIEL_LOGIN&quot; = @NAUCZYCIEL_LOGIN WHERE &quot;ID_KLASA&quot; = @ID_KLASA" DeleteCommand="DELETE FROM &quot;KLASA&quot; WHERE &quot;ID_KLASA&quot; = @ID_KLASA" InsertCommand="INSERT INTO Klasa(nazwa,nauczyciel_login) VALUES (@nazwa,@nauczyciel_login)">
        <DeleteParameters>
            <asp:Parameter Name="ID_KLASA" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="TextBoxNazwaKlasy" Name="nazwa" PropertyName="Text" />
            <asp:ControlParameter ControlID="DropDownListNauczycielLogin" Name="nauczyciel_login" PropertyName="SelectedValue" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="NAZWA" />
            <asp:ControlParameter ControlID="GridView1" Name="NAUCZYCIEL_LOGIN" PropertyName="SelectedValue" />
            <asp:Parameter Name="ID_KLASA" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Dziennik elektronicznyConnectionString %>" SelectCommand="SELECT * FROM [nauczyciel]"></asp:SqlDataSource>
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_klasa" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    <Columns>
        <asp:TemplateField HeaderText="Klasa" SortExpression="nazwa">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("nazwa") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("id_klasa", "~/admin/adminUczniowie.aspx?id={0}") %>' Text='<%# Eval("nazwa") %>'></asp:HyperLink>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Wychowawca" SortExpression="nauczyciel_login">
            <EditItemTemplate>
                <asp:DropDownList ID="NAUCZYCIEL_LOGIN" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="login" DataValueField="login" SelectedValue='<%# Bind("nauczyciel_login") %>'>
                </asp:DropDownList>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("nauczyciel_login") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="imie" HeaderText="Imię" SortExpression="imie" ReadOnly="True" />
        <asp:BoundField DataField="nazwisko" HeaderText="Nazwisko" ReadOnly="True" SortExpression="nazwisko" />
        <asp:TemplateField ShowHeader="False">
            <EditItemTemplate>
                <asp:LinkButton ID="klasyLinkButton2" runat="server" CausesValidation="True" CommandName="Update" Text="Aktualizuj" ValidationGroup="Edytuj"></asp:LinkButton>
                &nbsp;<asp:LinkButton ID="klasyLinkButton3" runat="server" CausesValidation="False" CommandName="Cancel" Text="Anuluj"></asp:LinkButton>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:LinkButton ID="klasyLinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edytuj"></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField ShowHeader="False">
            <ItemTemplate>
                <asp:LinkButton ID="klasyLinkButton4" runat="server" CausesValidation="False" CommandName="Delete" Text="Usuń"></asp:LinkButton>
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
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="#FF3300" ValidationGroup="Edytuj" />
    <br />
    <table class="auto-style1">
        <tr>
            <td class="auto-style2">Nazwa klasy:</td>
            <td>
                <asp:TextBox ID="TextBoxNazwaKlasy" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxNazwaKlasy" Display="None" ErrorMessage="Pole Nazwa klasy nie może być puste" ForeColor="#FF3300" ValidationGroup="Dodaj"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Wychowawca</td>
            <td>
                <asp:DropDownList ID="DropDownListNauczycielLogin" runat="server" DataSourceID="SqlDataSource2" DataTextField="login" DataValueField="login">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td>
                <asp:Button ID="ButtonDodaj" runat="server" OnClick="ButtonDodaj_Click" Text="Dodaj" ValidationGroup="Dodaj" />
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" ForeColor="#FF3300" ValidationGroup="Dodaj" />
    <br />
</asp:Content>

