<%@ Page Title="Edit DVD" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" Inherits="EditDVD" CodeBehind="EditDVD.aspx.cs" %>

<asp:Content ID="header" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="MainContent" runat="Server">
    <h1>Admin:  Edit Movies</h1>
    <div class="blurb">Secure Admin area for editing movies already in the listings on this site.</div>
    <div class="editcontent" runat="server">
        <div>
            <asp:Button CssClass="Button" ID="logoutButton" runat="server" Text="Logout" OnClick="logoutButton_Click" />
            <img class="divider" src="~/Images/beedivider-right.png" runat="server" />
            <div class="selectsection">
                <br />
                <asp:Label CssClass="selectmovieLabel" runat="server" Text="Select a Movie:  " />
                <asp:DropDownList CssClass="moviesList" ID="moviesList" runat="server" 
                                  style="text-align: center" />
                <asp:Button CssClass="Button" ID="selectmovieButton" Text="Select Movie" 
                            runat="server" OnClick="selectmovieButton_Click" 
                            style="float:right; margin-right: 50px;"/>
                <br />
                <br />
            </div>
            <img class="divider" src="~/Images/beedivider-left.png" runat="server" />
            <br />
            <br />
            <span class="widelabel">Movie Title:</span>
            <asp:TextBox CssClass="textbox" ID="titleTextBox" runat="server" />
            <br />
            <span class="widelabel">Movie Star:</span>
            <asp:TextBox CssClass="textbox" ID="starTextBox" runat="server" />
            <br />
            <span class="widelabel">Movie Rating:</span>
            <asp:TextBox CssClass="textbox" ID="ratingTextBox" runat="server" />
            <br />
            <span class="widelabel">Price:</span>
            <asp:TextBox CssClass="textbox" ID="priceTextBox" runat="server" />
            <br />
            <span class="widelabel">Image URL:</span>
            <asp:TextBox CssClass="textbox" ID="imageTextbox" runat="server" />
            <br />
            <span class="widelabel">Description:</span>
            <asp:TextBox ID="descriptionTextbox" TextMode="MultiLine" CssClass="descriptionTextbox"  runat="server" />
            <br />
            <br />
            <asp:Label ID="dbErrorLabel" ForeColor="Red" runat="server" />
            <br />
            <br />
            <asp:Button CssClass="Button" ID="updatemovieButton" Text="Update Movie"
                Enabled="False" runat="server" OnClick="updatemovieButton_Click" style="margin-right: 5px;"/>
            <asp:Button CssClass="Button" ID="deletemovieButton" Enabled="false" runat="server"
                OnClick="deletemovieButton_Click" Text="Delete Movie" />
            <img class="divider" src="~/Images/beedivider-right.png" runat="server" />
        </div>
    </div>
</asp:Content>

