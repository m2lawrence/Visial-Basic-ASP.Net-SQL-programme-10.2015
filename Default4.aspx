<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Default4.aspx.vb" Inherits="Default4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        
        
        <asp:Label ID="Label1" runat="server" ForeColor="Yellow" Text="Remove Allergens - Raw Materials only"></asp:Label>
    </p>
    <p>
        
        
    <br />
        
        
        Part Description:</p>
<p>
        
        
        <asp:DropDownList ID="DropDownListPartDescription" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Description" DataValueField="Part_Number">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testingConnectionString %>" SelectCommand="SELECT * FROM [Part_Details]"></asp:SqlDataSource>
</p>
<p>
    Allergen Description:</p>
<p>
        
        
        &nbsp;</p>
<p>
        
        
        Delete:</p>
    <p>
        
        
        <asp:Button ID="btnRemove4" runat="server" Text="Remove" />
    </p>
        
        
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EnableModelValidation="True">
            <Columns>
                <asp:BoundField DataField="Part_Number" HeaderText="Part_Number" SortExpression="Part_Number" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="Shelf_Life" HeaderText="Shelf_Life" SortExpression="Shelf_Life" />
                <asp:BoundField DataField="Units_Per_Case" HeaderText="Units_Per_Case" SortExpression="Units_Per_Case" />
            </Columns>
        </asp:GridView>
    <p>
        &nbsp;</p>
</asp:Content>

