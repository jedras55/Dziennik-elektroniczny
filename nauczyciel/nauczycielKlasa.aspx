<%@ Page Title="" Language="C#" MasterPageFile="~/nauczyciel/panelNauczyciel.master" AutoEventWireup="true" CodeFile="nauczycielKlasa.aspx.cs" Inherits="nauczyciel_nauczycielKlasa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Dziennik elektronicznyConnectionString %>" SelectCommand="SELECT * FROM [uczen] WHERE ([klasa_id_klasa] = @klasa_id_klasa)">
        <SelectParameters>
            <asp:QueryStringParameter Name="klasa_id_klasa" QueryStringField="id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="login" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:TemplateField SortExpression="login">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("login", "nauczycielUczen.aspx?login={0}") %>' Text='<%# Bind("login") %>'></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="imie" HeaderText="Imię" SortExpression="imie" />
            <asp:BoundField DataField="nazwisko" HeaderText="Nazwisko" SortExpression="nazwisko" />
            <asp:BoundField DataField="data_urodzenia" HeaderText="Data urodzenia" SortExpression="data_urodzenia" />
            <asp:BoundField DataField="pesel" HeaderText="PESEL" SortExpression="pesel" />
            <asp:BoundField DataField="miasto" HeaderText="Miasto" SortExpression="miasto" />
            <asp:BoundField DataField="ulica" HeaderText="Ulica" SortExpression="ulica" />
            <asp:BoundField DataField="numer_domu" HeaderText="Numer domu" SortExpression="numer_domu" />
            <asp:BoundField DataField="email" HeaderText="E-mail" SortExpression="email" />
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
    <asp:Label ID="LabelIdKlasy" runat="server" Text="Label" Visible="False"></asp:Label>
</asp:Content>

