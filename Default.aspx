<%@ Page Title="Raw Materials" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <div style="font-weight: 700">
        <asp:Label ID="Label2" runat="server" ForeColor="Yellow" Text="Raw Materials page"></asp:Label>
        <span style="font-weight: normal">
        <br />
        <br />
        <asp:Label ID="lblErrorMes" runat="server" ForeColor="Red"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" ForeColor="Yellow" Text="RM"></asp:Label>
&nbsp;
        <asp:TextBox ID="txtBoxNumbers" runat="server"></asp:TextBox>
&nbsp;
        <asp:DropDownList ID="DDLLK" runat="server" AutoPostBack="True">
            <asp:ListItem>-L</asp:ListItem>
            <asp:ListItem>-K</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" ForeColor="Yellow" Text="Check the database?"></asp:Label>
        <br />
        <br />
&nbsp;
        <asp:Button ID="btnCheck" runat="server" Text="Check" ForeColor="#660066" />
        &nbsp;
        <asp:Button ID="btnOK1" runat="server" Text="OK" />
&nbsp;
        <asp:TextBox ID="txtBoxResult" runat="server" ReadOnly="True"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="lblDoIExist" runat="server" ForeColor="Red"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        Part Number:<br />
        <asp:TextBox ID="txtBoxPartNumber" runat="server" ReadOnly="True"></asp:TextBox>
        <br />
        Description:<br />
        <asp:TextBox ID="txtBoxDescription" runat="server"></asp:TextBox>
&nbsp;<br />
        Shelf Life:<br />
        <asp:TextBox ID="txtBoxShelfLife" runat="server"></asp:TextBox>
        <br />
        Units Per Case:<br />
        <asp:TextBox ID="txtBoxUnitsPerCase" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="btnAddToDB" runat="server" ForeColor="#660066" Text="Add " Width="52px" Height="30px" />
        &nbsp;
        <asp:Button ID="btnClear1" runat="server" Height="30px" Text="Clear" Width="51px" />
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
        <br />
        </span>
        <br />
    
    </div>
    
</asp:Content>

