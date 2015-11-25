<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Step2.aspx.vb" Inherits="Step2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        
        
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
        
        <asp:Label ID="lblTitle" runat="server" ForeColor="Yellow" Text="Step 2. Add &amp; Remove Allergens "></asp:Label>
    </p>
    <p>
        1. Does the Allergen and Raw Material exist together?</p>
    <p>
        Check the Raw Material &quot;Part Number&quot; in the Part_Details table and the &quot;Allergen Code&quot; in the Allergen table exists:</p>
    <p>
        <span style="font-weight: normal">
        <asp:Label ID="lblPartNumber" runat="server" ForeColor="Yellow" Text="Part Number:"></asp:Label>
        </span>
    </p>
    <p>
        <asp:DropDownList ID="DDLAllergenPartNumber" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Description" DataValueField="Part_Number">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testingConnectionString %>" SelectCommand="SELECT Part_Number, Description, Shelf_Life, Units_Per_Case FROM Part_Details WHERE (Part_Number LIKE 'RM%') ORDER BY Description"></asp:SqlDataSource>
    </p>
    <p>
        <span style="font-weight: normal">
        <asp:Label ID="lblAllergenCode" runat="server" ForeColor="Yellow" Text="Allergen Code:"></asp:Label>
        </span>
    </p>
    <p>
        <asp:DropDownList ID="DDLAllergen_Code" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="Allergen_Description" DataValueField="Allergen_Code">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:testingConnectionString %>" SelectCommand="SELECT * FROM [Allergen] ORDER BY [Allergen_Description]"></asp:SqlDataSource>
    </p>
    <p>
        <span style="font-weight: normal">
        <asp:Label ID="Label3" runat="server" ForeColor="Yellow" Text="Does the Finished Part have an Allergen?"></asp:Label>
&nbsp;(coffee has milk?)</span></p>
    <p>
        <span style="font-weight: normal">
        <asp:Button ID="btnCheckStep2" runat="server" Text="Check" ForeColor="#660066" />
        &nbsp;&nbsp;
        </span>
        <asp:Label ID="lblDoIExistStep2" runat="server" ForeColor="Red"></asp:Label>
    </p>
    <p>
        <span style="font-weight: normal">
        <asp:Label ID="Label4" runat="server" ForeColor="Yellow" Text="Add the Allergen to the Finished Part Allergen table?"></asp:Label>
        </span>
    </p>
    <p>
        <asp:Button ID="btnAddAllergen" runat="server" Text="Add" />
    </p>
    <p>
        &nbsp;</p>
    <p>
        
        
        &nbsp;</p>
</asp:Content>

