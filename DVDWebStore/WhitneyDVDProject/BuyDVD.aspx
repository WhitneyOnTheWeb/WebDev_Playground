<%@ Page Title="BuyDVD" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="True" Inherits="BuyDVD" CodeBehind="BuyDVD.aspx.cs" %>

<asp:Content ID="body" ContentPlaceHolderID="MainContent" runat="Server">
    <h1>Buy Movie</h1>
    <asp:Panel runat="server" CssClass="blurb">Here you can purchase the title you're interested in buying!</asp:Panel>
    <div class="buycontent" runat="server">
        <img class="divider" src="Images/beedivider-right.png" runat="server" />
        <br />
        <asp:Label CssClass="movielabel" ID="TitleLabel" runat="server" Text=""></asp:Label>
        <br />
        <span class="widelabel" style="width: 50px; font-size: 20px;">Price:</span>
        <asp:Label CssClass="price" ID="PriceLabel" runat="server" Text=""></asp:Label>
        <img class="divider" src="Images/beedivider-left.png" runat="server" />
        <br />
        <br />
        <span class="widelabel" style="width: 200px;">Enter your customer number:</span>
        <asp:TextBox CssClass="custnumtextbox" ID="InputCustNumberTextBox" runat="server"></asp:TextBox>
        <br />
        <br />
        <hr />
        <span class="custnum">If you don’t have a customer number, please enter your information to create one:</span>
        <br />
        <br />
        <span class="widelabel" style="width: 80px;">First Name:</span>
        <asp:TextBox CssClass="nametextbox" ID="FirstNameTextBox" runat="server"></asp:TextBox>
        <br />
        <span class="widelabel" style="width: 80px;">Last Name:</span>
        <asp:TextBox CssClass="nametextbox" ID="LastNameTextBox" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button CssClass="Button" ID="PurchaseButton" runat="server" Text="Purchase"
            OnClick="PurchaseButton_Click" />
        <br />
        <br />
        <asp:Label ID="dbErrorLabel" runat="server" ForeColor="Red" Visible="false"></asp:Label>
        <asp:Label ID="DVDIDlabel" runat="server" Text="" Visible="False"></asp:Label>
        <asp:Label ID="UserID" runat="server" Text="" Visible="false"></asp:Label>
        <asp:Label ID="OrderID" runat="server" Text="" Visible="false"></asp:Label>
        <asp:Label ID="labelDVDID" runat="server" Text="" Visible="false"></asp:Label>
        <img class="divider" src="Images/beedivider-right.png" runat="server" />
    </div>
</asp:Content>


