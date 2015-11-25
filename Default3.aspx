<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Default3.aspx.vb" Inherits="Default3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        
        
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
        
        <asp:Label ID="Label1" runat="server" ForeColor="Yellow" Text="Step 3. Add Allergens - Raw Materials only"></asp:Label>
</p>
    <p>
        
        
        Step 3. Check which Allergen the Raw Material contains.</p>
    <p>
        
        
        &nbsp;<asp:DropDownList ID="DDLRawMaterialID" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Description" DataValueField="Part_Number">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testingConnectionString %>" SelectCommand="SELECT * FROM [Part_Details]"></asp:SqlDataSource>
</p>
    <p>
        
        
        Allergen:</p>
    <p>
        
        
        &nbsp;
        <asp:DropDownList ID="DDLFinishedParts" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="Allergen_Description" DataValueField="Allergen_Code">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:testingConnectionString %>" SelectCommand="SELECT * FROM [Allergen]"></asp:SqlDataSource>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</p>
    <p>
        
        
        <span style="font-weight: normal">
        <asp:Label ID="Label3" runat="server" ForeColor="Yellow" Text="Check the database?"></asp:Label>
        </span>
</p>
    <p>
        
        
        <span style="font-weight: normal">
        <asp:Button ID="btnCheck3" runat="server" Text="Check" ForeColor="#660066" />
        &nbsp;&nbsp;
        </span>
        
        
        <asp:Label ID="lblDoIExist3" runat="server" ForeColor="Red"></asp:Label>
</p>
<p>
        
        
        Insert:</p>
<p>
        
        
        <asp:Button ID="btnAdd3" runat="server" Text="Add" />
</p>
    <p>
        
        
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" EnableModelValidation="True">
            <Columns>
                <asp:BoundField DataField="Part_Number" HeaderText="Part_Number" SortExpression="Part_Number" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="Shelf_Life" HeaderText="Shelf_Life" SortExpression="Shelf_Life" />
                <asp:BoundField DataField="Units_Per_Case" HeaderText="Units_Per_Case" SortExpression="Units_Per_Case" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
</p>
    <p>
        
        
        &nbsp;</p>
</asp:Content>




<%--<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    Cust ID:<br />
    <br />
    <asp:DropDownList ID="DropDownListCustID" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Cust_ID" DataValueField="Cust_ID">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testingConnectionString %>" SelectCommand="SELECT * FROM [Customer] ORDER BY [Cust_ID]"></asp:SqlDataSource>
    <br />
    Update Customer Name:<br />
    <asp:TextBox ID="txtCustName" runat="server" Width="174px"></asp:TextBox>
    &nbsp;<br />
    Tel:<br />
    <asp:TextBox ID="txtTel" runat="server"></asp:TextBox>
    <br />
    Email:<br />
    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
    <br />
    Address:<br />
    <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
    <br />
    PostCode:<br />
    <asp:TextBox ID="txtPostcode" runat="server"></asp:TextBox>
    <br />
    <br />
    <br />
    <asp:Button ID="BtnSubmit" runat="server" Text="OK" />
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EnableModelValidation="True">
        <Columns>
            <asp:BoundField DataField="Cust_ID" HeaderText="Cust_ID" InsertVisible="False" ReadOnly="True" SortExpression="Cust_ID" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Tel" HeaderText="Tel" SortExpression="Tel" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
            <asp:BoundField DataField="Post_Code" HeaderText="Post_Code" SortExpression="Post_Code" />
        </Columns>
    </asp:GridView>
    <br />
    <br />
</asp:Content>--%>

