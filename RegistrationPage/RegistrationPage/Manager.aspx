<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Manager.aspx.cs" Inherits="RegistrationPage.Manager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 330px; width: 1085px">
    
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="Idx" DataSourceID="SqlDataSourceRegistration" ForeColor="Black" GridLines="Vertical" Height="197px" Width="269px">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="Idx" HeaderText="Idx" ReadOnly="True" SortExpression="Idx" InsertVisible="False" />
                <asp:BoundField DataField="UserNamex" HeaderText="UserNamex" SortExpression="UserNamex" />
                <asp:BoundField DataField="Emailx" HeaderText="Emailx" SortExpression="Emailx" />
                <asp:BoundField DataField="Passwordx" HeaderText="Passwordx" SortExpression="Passwordx" />
                <asp:BoundField DataField="Countryx" HeaderText="Countryx" SortExpression="Countryx" />
                <asp:BoundField DataField="GUID" HeaderText="GUID" SortExpression="GUID" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceRegistration" runat="server"  SelectCommand="SELECT * FROM [Table_1]" ConnectionString="<%$ ConnectionStrings:RegistrationConnectionString %>"></asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
