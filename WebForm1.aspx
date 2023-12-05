<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Practical4.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>Sales Order Information By Staff.</div>
        <table style="width: 100%;">
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Please select staff name :"></asp:Label></td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Please select year :"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    <asp:DropDownList ID="ddlName" runat="server" DataSourceID="sdsName" DataTextField="Name" DataValueField="EmployeeID"></asp:DropDownList></td>
                <td>
                    <asp:RadioButtonList ID="radiobtnYear" runat="server" DataSourceID="sdsYear" DataTextField="Years" DataValueField="Years" RepeatDirection="Horizontal">
                        <asp:ListItem>1998</asp:ListItem>
                        <asp:ListItem>1996</asp:ListItem>
                        <asp:ListItem>1997</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" /></td>
            </tr>
        </table>
        <asp:SqlDataSource ID="sdsYear" runat="server" ConnectionString="<%$ ConnectionStrings:NORTHWNDConnectionString %>" SelectCommand="SELECT DISTINCT YEAR(OrderDate) As Years FROM Orders"></asp:SqlDataSource>
    
        <asp:SqlDataSource ID="sdsOrders" runat="server" ConnectionString="<%$ ConnectionStrings:NORTHWNDConnectionString %>" SelectCommand="SELECT OrderID, OrderDate FROM Orders WHERE (EmployeeID = @EmployeeID) AND (YEAR(OrderDate) = @Year)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlName" Name="EmployeeID" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="radiobtnYear" Name="Year" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sdsOrderDetails" runat="server" ConnectionString="<%$ ConnectionStrings:NORTHWNDConnectionString %>" SelectCommand="SELECT Products.ProductName, [Order Details].OrderID, [Order Details].ProductID, [Order Details].UnitPrice, [Order Details].Quantity, [Order Details].Discount, ([Order Details].UnitPrice * [Order Details].Quantity) * (1 - [Order Details].Discount) AS Expr1 FROM [Order Details] INNER JOIN Products ON [Order Details].ProductID = Products.ProductID WHERE ([Order Details].OrderID = @OrderID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="OrderID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
    
    <asp:Label ID="Label3" runat="server" Text="[lblTitleGridView]"></asp:Label>

    <table style="width: 100%;">
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="OrderID" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="OrderID" HeaderText="OrderID" InsertVisible="False" ReadOnly="True" SortExpression="OrderID" />
                        <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" SortExpression="OrderDate" />
                    </Columns>
                </asp:GridView>
            </td>
            <td>
                <asp:Label ID="lblOldSales" runat="server" Text="[lblOldSales]"></asp:Label>
                <asp:SqlDataSource ID="sdsName" runat="server" ConnectionString="<%$ ConnectionStrings:NORTHWNDConnectionString %>" SelectCommand="SELECT CONCAT(FirstName, CONCAT(' ', LastName)) As Name, EmployeeID
FROM Employees"></asp:SqlDataSource>
                <asp:DataList ID="DataList1" runat="server" DataKeyField="OrderID" DataSourceID="sdsOrderDetails">
                    <ItemTemplate>
                        ProductName:
                        <asp:Label ID="ProductNameLabel" runat="server" Text='<%# Eval("ProductName") %>' />
                        <br />
                        OrderID:
                        <asp:Label ID="OrderIDLabel" runat="server" Text='<%# Eval("OrderID") %>' />
                        <br />
                        ProductID:
                        <asp:Label ID="ProductIDLabel" runat="server" Text='<%# Eval("ProductID") %>' />
                        <br />
                        UnitPrice:
                        <asp:Label ID="UnitPriceLabel" runat="server" Text='<%# Eval("UnitPrice") %>' />
                        <br />
                        Quantity:
                        <asp:Label ID="QuantityLabel" runat="server" Text='<%# Eval("Quantity") %>' />
                        <br />
                        Discount:
                        <asp:Label ID="DiscountLabel" runat="server" Text='<%# Eval("Discount") %>' />
                        <br />
                        Expr1:
                        <asp:Label ID="Expr1Label" runat="server" Text='<%# Eval("Expr1") %>' />
                        <br />
<br />
                    </ItemTemplate>
                </asp:DataList>
            </td>
        </tr>

    </table>
        </form>
</body>
</html>
