<%@ Page Title="Finished Products" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Default2.aspx.vb" Inherits="Default2" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <div style="font-weight: 700">
        <asp:Label ID="Label1" runat="server" ForeColor="Yellow" Text="Finished Products page"></asp:Label>
        <span style="font-weight: normal">
        <br />
        <br />
        <asp:Label ID="lblErrorMes" runat="server" ForeColor="Red"></asp:Label>
        <br />
        <br />
        <asp:TextBox ID="txtBoxNumbers2" runat="server"></asp:TextBox>
&nbsp;
        <asp:DropDownList ID="DDLFinPrtNos" runat="server" AutoPostBack="True">
            <asp:ListItem>-1</asp:ListItem>
            <asp:ListItem>-12</asp:ListItem>
            <asp:ListItem>-71</asp:ListItem>
            <asp:ListItem>-91</asp:ListItem>
            <asp:ListItem>-105</asp:ListItem>
            <asp:ListItem>-154</asp:ListItem>
            <asp:ListItem>-169</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" ForeColor="Yellow" Text="Check the database?"></asp:Label>
        <br />
        <br />
&nbsp;
        <asp:Button ID="btnCheck2" runat="server" Text="Check" ForeColor="#660066" />
        &nbsp;
        <asp:Button ID="btnOK2" runat="server" Text="OK" />
&nbsp;
        <asp:TextBox ID="txtBoxResult2" runat="server" ReadOnly="True"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="lblDoIExist" runat="server" ForeColor="Red"></asp:Label>
        <br />
        <br />
        Part Number:<br />
        <asp:TextBox ID="txtBoxPartNumber2" runat="server" ReadOnly="True"></asp:TextBox>
        <br />
        Description:<br />
        <asp:TextBox ID="txtBoxDescription2" runat="server"></asp:TextBox>
&nbsp;<br />
        Shelf Life:<br />
        <asp:TextBox ID="txtBoxShelfLife2" runat="server"></asp:TextBox>
        <br />
        Units Per Case:<br />
        <asp:TextBox ID="txtBoxUnitsPerCase2" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="btnAdd2" runat="server" ForeColor="#660066" Text="Add " Height="30px" Width="51px" />
        &nbsp;
        <asp:Button ID="btnClear2" runat="server" Height="30px" Text="Clear" Width="53px" />
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EnableModelValidation="True">
            <Columns>
                <asp:BoundField DataField="Part_Number" HeaderText="Part_Number" SortExpression="Part_Number" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="Shelf_Life" HeaderText="Shelf_Life" SortExpression="Shelf_Life" />
                <asp:BoundField DataField="Units_Per_Case" HeaderText="Units_Per_Case" SortExpression="Units_Per_Case" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testingConnectionString %>" SelectCommand="SELECT * FROM [Part_Details] ORDER BY [Shelf_Life], [Description], [Part_Number]"></asp:SqlDataSource>
        <br />
        </span>
        <br />
    
    </div>
    
</asp:Content>
