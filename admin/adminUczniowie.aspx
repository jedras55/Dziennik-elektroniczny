<%@ Page Title="" Language="C#" MasterPageFile="~/admin/panelAdmin.master" AutoEventWireup="true" CodeFile="adminUczniowie.aspx.cs" Inherits="admin_adminUczniowie" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 257px;
            text-align: right;
        }
        .auto-style3 {
            width: 257px;
            text-align: right;
            height: 25px;
        }
        .auto-style4 {
            height: 25px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Dziennik elektronicznyConnectionString %>" SelectCommand="SELECT uczen.login, uczen.haslo, uczen.imie, uczen.nazwisko, uczen.data_urodzenia, uczen.pesel, uczen.miasto, uczen.ulica, uczen.numer_domu, uczen.email, uczen.aktywowany, uczen.klasa_id_klasa, klasa.id_klasa, klasa.nazwa FROM klasa INNER JOIN uczen ON klasa.id_klasa = uczen.klasa_id_klasa WHERE klasa_id_klasa = @klasa_id_klasa" UpdateCommand="UPDATE &quot;UCZEN&quot; SET &quot;IMIE&quot; = @IMIE, &quot;NAZWISKO&quot; = @NAZWISKO, DATA_URODZENIA = @DATA_URODZENIA, PESEL = @PESEL, MIASTO = @MIASTO, ULICA =@ULICA, NUMER_DOMU = @NUMER_DOMU, EMAIL = @EMAIL, AKTYWOWANY = @AKTYWOWANY, KLASA_ID_KLASA = @KLASA_ID_KLASA WHERE &quot;LOGIN&quot; = @LOGIN" DeleteCommand="DELETE FROM &quot;UCZEN&quot; WHERE &quot;LOGIN&quot; = @LOGIN" EnableCaching="True" InsertCommand="INSERT INTO UCZEN(login,haslo,imie,nazwisko,data_urodzenia,pesel,miasto,ulica,numer_domu,email,aktywowany,klasa_id_klasa) VALUES(@login,'1234',@imie,@nazwisko,@data_urodzenia,@pesel,@miasto,@ulica,@numer_domu,@email,'FALSE',@klasa_id_klasa)">
        <InsertParameters>
            <asp:ControlParameter ControlID="TextBoxLogin" Name="login" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBoxImie" Name="imie" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBoxNazwisko" Name="nazwisko" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBoxDataUrodzenia" Name="data_urodzenia" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBoxPesel" Name="pesel" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBoxMiasto" Name="miasto" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBoxUlica" Name="ulica" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBoxNumerDomu" Name="numer_domu" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBoxEmail" Name="email" PropertyName="Text" />
            <asp:QueryStringParameter Name="klasa_id_klasa" QueryStringField="id" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="klasa_id_klasa" QueryStringField="id" />
        </SelectParameters>
        <UpdateParameters>
            <asp:QueryStringParameter Name="KLASA_ID_KLASA" QueryStringField="id" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Dziennik elektronicznyConnectionString %>" DeleteCommand="DELETE FROM PRZEDMIOT WHERE id_przedmiot = @id_przedmiot" InsertCommand="INSERT INTO PRZEDMIOT(nazwa, nauczyciel_login,klasa_id_klasa) VALUES (@przedmiot, @nauczyciel_login, @klasa_id_klasa)" SelectCommand="SELECT przedmiot.id_przedmiot, przedmiot.nazwa, przedmiot.klasa_id_klasa, przedmiot.nauczyciel_login, nauczyciel.login, nauczyciel.imie, nauczyciel.nazwisko FROM przedmiot INNER JOIN nauczyciel ON przedmiot.nauczyciel_login = nauczyciel.login WHERE przedmiot.klasa_id_klasa = @klasa_id_klasa" UpdateCommand="UPDATE &quot;PRZEDMIOT&quot; SET &quot;NAZWA&quot; = @NAZWA, &quot;NAUCZYCIEL_LOGIN&quot; = @NAUCZYCIEL_LOGIN WHERE &quot;ID_PRZEDMIOT&quot; = @ID_PRZEDMIOT">
        <InsertParameters>
            <asp:ControlParameter ControlID="TextBoxNazwaPrzedmiotu" Name="przedmiot" PropertyName="Text" />
            <asp:ControlParameter ControlID="DropDownListNauczyciel" Name="nauczyciel_login" PropertyName="SelectedValue" />
            <asp:QueryStringParameter Name="klasa_id_klasa" QueryStringField="id" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="klasa_id_klasa" QueryStringField="id" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="NAZWA" />
            <asp:ControlParameter ControlID="GridView2" Name="NAUCZYCIEL_LOGIN" PropertyName="SelectedValue" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Dziennik elektronicznyConnectionString %>" SelectCommand="SELECT * FROM [nauczyciel]"></asp:SqlDataSource>
    <div class="page-header">
        <h1>Klasa 
            <asp:Label ID="LabelNazwaKlasy" runat="server"></asp:Label>
        </h1>
    </div>
    <h3>
        Uczniowie:</h3>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="login,id_klasa" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="login" HeaderText="Login" ReadOnly="True" SortExpression="login" />
            <asp:TemplateField HeaderText="Imię" SortExpression="imie">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("imie") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" Display="None" ErrorMessage="Pole Imię nie może być puste" ValidationGroup="Edytuj"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nazwisko" SortExpression="nazwisko">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("nazwisko") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" Display="None" ErrorMessage="Pole Nazwisko nie może być puste" ValidationGroup="Edytuj"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("nazwisko") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Data urodzenia" SortExpression="data_urodzenia">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("data_urodzenia", "{0:d}") %>' TextMode="Date"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextBox1" Display="None" ErrorMessage="Pole Data urodzenia nie może być puste" ValidationGroup="Edytuj"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("data_urodzenia", "{0:dd-MM-yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="PESEL" SortExpression="pesel">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("pesel") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" Display="None" ErrorMessage="Pole PESEL nie może być puste" ValidationGroup="Edytuj"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("pesel") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Miasto" SortExpression="miasto">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("miasto") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox5" Display="None" ErrorMessage="Pole Miasto nie może być puste" ValidationGroup="Edytuj"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("miasto") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ulica" HeaderText="Ulica" SortExpression="ulica" />
<asp:TemplateField HeaderText="Numer domu" SortExpression="numer_domu">
    <EditItemTemplate>
        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("numer_domu") %>'></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox6" Display="None" ErrorMessage="Pole Numer domu nie może być puste" ValidationGroup="Edytuj"></asp:RequiredFieldValidator>
    </EditItemTemplate>
<ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("numer_domu") %>'></asp:Label>
                
</ItemTemplate>
</asp:TemplateField>
            <asp:TemplateField HeaderText="E-mail" SortExpression="email">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBox7" Display="None" ErrorMessage="Pole E-mail nie może być puste" ValidationGroup="Edytuj"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox7" Display="None" ErrorMessage="Podaj poprawny E-mail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="Edytuj"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CheckBoxField DataField="aktywowany" HeaderText="Aktywowany" SortExpression="aktywowany" />
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="uczniowieLinkButton2" runat="server" CausesValidation="True" CommandName="Update" Text="Aktualizuj" ValidationGroup="Edytuj"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="uczniowieLinkButton3" runat="server" CausesValidation="False" CommandName="Cancel" Text="Anuluj"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="uczniowieLinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edytuj"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="uczniowieLinkButton4" runat="server" CausesValidation="False" CommandName="Delete" Text="Usuń"></asp:LinkButton>
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
    <h3>
        Dodaj ucznia:</h3>
    <br />
    <table class="auto-style1">
        <tr>
            <td class="auto-style2">&nbsp;Login:&nbsp;&nbsp; </td>
            <td>
                <asp:TextBox ID="TextBoxLogin" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxLogin" Display="None" ErrorMessage="Pole Login nie może być puste" ValidationGroup="Dodaj"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;Imię: </td>
            <td>
                <asp:TextBox ID="TextBoxImie" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxImie" Display="None" ErrorMessage="Pole Imię nie może być puste" ValidationGroup="Dodaj"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Nazwisko: </td>
            <td class="auto-style4">
                <asp:TextBox ID="TextBoxNazwisko" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBoxNazwisko" Display="None" ErrorMessage="Pole Nazwisko nie może być puste" ValidationGroup="Dodaj"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Data urodzenia: </td>
            <td>
                <asp:TextBox ID="TextBoxDataUrodzenia" runat="server" TextMode="Date"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextBoxDataUrodzenia" Display="None" ErrorMessage="Pole Data urodzenia nie może być puste" ValidationGroup="Dodaj"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">PESEL: </td>
            <td>
                <asp:TextBox ID="TextBoxPesel" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBoxPesel" Display="None" ErrorMessage="Pole PESEL nie może być puste" ValidationGroup="Dodaj"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Miasto: </td>
            <td>
                <asp:TextBox ID="TextBoxMiasto" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBoxMiasto" Display="None" ErrorMessage="Pole Miasto nie może być puste" ValidationGroup="Dodaj"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Ulica: </td>
            <td>
                <asp:TextBox ID="TextBoxUlica" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Numer domu: </td>
            <td>
                <asp:TextBox ID="TextBoxNumerDomu" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBoxNumerDomu" Display="None" ErrorMessage="Pole Numer domu nie może być puste" ValidationGroup="Dodaj"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">E-mail: </td>
            <td>
                <asp:TextBox ID="TextBoxEmail" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBoxEmail" Display="None" ErrorMessage="Pole E-mail nie może być puste" ValidationGroup="Dodaj"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBoxEmail" Display="None" ErrorMessage="Podaj poprawny E-mail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="Dodaj"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td>
                <asp:Button ID="ButtonDodaj" runat="server" OnClick="ButtonDodaj_Click" Text="Dodaj" ValidationGroup="Dodaj" />
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="#FF3300" ValidationGroup="Dodaj" />
    <h3>
        Przedmioty:</h3>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_przedmiot,login" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:TemplateField HeaderText="Przedmiot" SortExpression="nazwa">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("nazwa") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="TextBox1" Display="None" ErrorMessage="Pole Nazwa przedmiotu nie może być puste" ValidationGroup="EdytujPrzedmiot"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("nazwa") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nauczyciel" SortExpression="nauczyciel_login">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource3" DataTextField="login" DataValueField="login" SelectedValue='<%# Bind("nauczyciel_login") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("nauczyciel_login") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Imię" SortExpression="imie">
                <EditItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nazwisko" SortExpression="nazwisko">
                <EditItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("nazwisko") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("nazwisko") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="przedmiotyButton2" runat="server" CausesValidation="True" CommandName="Update" ForeColor="Black" Text="Aktualizuj" ValidationGroup="EdytujPrzedmiot"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="przedmiotyLinkButton3" runat="server" CausesValidation="False" CommandName="Cancel" ForeColor="Black" Text="Anuluj"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="przedmiotyLinkButton1" runat="server" CausesValidation="False" CommandName="Edit" ForeColor="Black" Text="Edytuj"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="przedmiotyLinkButton4" runat="server" CausesValidation="False" CommandName="Delete" ForeColor="Black" Text="Usuń"></asp:LinkButton>
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
    <asp:ValidationSummary ID="ValidationSummary4" runat="server" ForeColor="#FF3300" ValidationGroup="EdytujPrzedmiot" />
    <h3>
        Dodaj przedmiot:</h3>
    <table class="auto-style1">
        <tr>
            <td class="auto-style2">Nazwa przedmiotu: </td>
            <td>
                <asp:TextBox ID="TextBoxNazwaPrzedmiotu" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="TextBoxNazwaPrzedmiotu" Display="None" ErrorMessage="Pole Nazwa przedmiotu nie może być puste" ValidationGroup="Przedmiot"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Nauczyciel: </td>
            <td>
                <asp:DropDownList ID="DropDownListNauczyciel" runat="server" DataSourceID="SqlDataSource3" DataTextField="login" DataValueField="login">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td>
                <asp:Button ID="ButtonDodajPrzedmiot" runat="server" OnClick="ButtonDodajPrzedmiot_Click" Text="Dodaj" ValidationGroup="Przedmiot" />
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary3" runat="server" ForeColor="#FF3300" ValidationGroup="Przedmiot" />
    <br />
</asp:Content>

