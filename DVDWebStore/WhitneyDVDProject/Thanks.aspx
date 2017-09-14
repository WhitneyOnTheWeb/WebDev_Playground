<%@ Page Title="Thanks" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="True" Inherits="Thanks" CodeBehind="Thanks.aspx.cs" %>

<asp:Content ID="body" ContentPlaceHolderID="MainContent" runat="Server">
    <h1>Thanks for your purchase!</h1>
    <div class="blurb">We'll start working on processing and shipping your order ASAP!</div>
    <img class="divider" src="Images/beedivider-right.png" runat="server" />
    <br />
    <br />
     <span class="widelabel" style="width: 140px;">Customer Number:</span>
     &nbsp;&nbsp;
     <asp:Label ID="custNum" runat="server" Text=""></asp:Label>
     <br />
     <span class="widelabel" style="width: 140px;">Order Number:</span>
     &nbsp;&nbsp;
     <asp:Label ID="orderNum" runat="server" Text=""></asp:Label>
     <br />
     <br />
     <img class="divider" src="Images/beedivider-left.png" runat="server" />
</asp:Content>
