<%@ Page Title="Details" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="True" Inherits="Details" CodeBehind="Details.aspx.cs" %>

<asp:Content ID="body" ContentPlaceHolderID="MainContent" runat="Server">
    <h1>Movie Details</h1>
    <div class="blurb">Detailed information about the movie you're interested in!</div>
    <div class="detailscontent" runat="server">
        <img class="divider" src="Images/beedivider-left.png" runat="server" />
        <br />
        <br />
        <asp:Panel CssClass="moviedetails" ID="moviedetails" runat="server">
            <asp:Label CssClass="movielabel" ID="titleLabel" runat="server" />
            <asp:Image CssClass="image" ID="Pic" runat="server" Width="150" Height="200" BackColor="Black" />
            <br />
            <br />
            <span class="widelabel">Movie Star:</span>
            <asp:Label ID="starLabel" runat="server" />
            <br />
            <span class="widelabel">Movie Rating:</span>
            <asp:Label ID="ratingLabel" runat="server" />
        </asp:Panel>
        <br />
        <br />
        <asp:Label CssClass="descriptionLabel" ID="descriptionLabel" runat="server" />
        <br />
        <br />
        <asp:Button ID="DoneButton" CssClass="DoneButton" runat="server" Text="Done" OnClick="DoneButton_Click" />
        <asp:Label ID="labelDVDID" runat="server" Text="" Visible="false"></asp:Label>
    </div>
</asp:Content>
