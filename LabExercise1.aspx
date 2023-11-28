<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LabExercise1.aspx.cs" Inherits="Practical4.LabExercise1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Searcch Product Infformation Based On Category Name<br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Select a category name :"></asp:Label>
&nbsp;<asp:DropDownList ID="ddlCategory" runat="server" DataSourceID="SqlDataSource1" DataTextField="CategoryName" DataValueField="CategoryName">
            </asp:DropDownList>
            <asp:Button ID="Button1" runat="server" Text="Find" />
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Your search return :"></asp:Label>
&nbsp;<asp:Label ID="lblResult" runat="server" BorderWidth="1px" Text="lblResult"></asp:Label>
&nbsp;record.<br />
            <br />
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2">
            </asp:Repeater>
            <br />
            <br />
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NORTHWNDConnectionString %>" SelectCommand="SELECT [CategoryID], [CategoryName] FROM [Categories]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:NORTHWNDConnectionString %>" SelectCommand="SELECT Products.ProductName, Products.UnitPrice WHERE Products.CategoryID = Categories.CategoryID FROM Categories INNER JOIN Products ON Products.CategoryID = @CategoryID">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlCategory" Name="CategoryID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
    </form>
</body>
</html>
