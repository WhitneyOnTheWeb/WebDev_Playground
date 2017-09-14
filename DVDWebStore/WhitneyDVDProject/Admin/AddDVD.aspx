<%@ Page Title="Add DVD" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" Inherits="AddDVD" Codebehind="AddDVD.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <h1>Admin:  Add New Movies</h1>
    <div class="blurb">Secure Admin area for adding new movies to the listings on this site.</div>
    <div class="addcontent" runat="server">
        <div>
            <img class="divider" src="~/Images/beedivider-right.png" runat="server" />
            <br />
            <br />
            <span class="widelabel">Movie Title:</span>
            <asp:TextBox CssClass="textbox" ID="titleTextBox" runat="server" />
            <br />
            <span class="widelabel">Movie Star:</span>
            <asp:TextBox CssClass="textbox" ID="starTextBox" runat="server" />
            <br />
            <span class="widelabel">Rating:</span>
            <asp:TextBox CssClass="textbox" ID="ratingTextBox" runat="server" />
            <br />
            <span class="widelabel">Price:</span>
            <asp:TextBox CssClass="textbox" ID="priceTextBox" runat="server" />
            <br />
            <span class="widelabel">Image URL:</span>
            <asp:TextBox CssClass="textbox" ID="pictureTextbox" runat="server" />
            <br />
            <span class="widelabel">Description:</span>
            <asp:TextBox CssClass="descriptionTextbox" ID="descriptionTextbox" TextMode="MultiLine" runat="server" />
            <br />
        </div>
        <div>
            <br />
            <asp:Label CssClass="dbErrorLabel" ID="dbErrorLabel" runat="server"></asp:Label>
            <br />
            <br />
            <asp:Button CssClass="Button" ID="addmovieButton" runat="server" Text="Add Movie" OnClick="addmovieButton_Click" />
            <asp:Label ID="DVDIDLabel" runat="server" Text="" visible="false"/>
            <br />
            <br />
            <img class="divider" src="~/Images/beedivider-left.png" runat="server" />
        </div>
    </div>
</asp:Content>

