<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" Inherits="Login" CodeBehind="Login.aspx.cs" %>

<asp:Content ID="body" ContentPlaceHolderID="MainContent" runat="Server">
    <h1>Please Login</h1>
    <div class="blurb">You must be an administrator to proceed to this portion of the website!</div>
    <div class="logincontent">
        <img class="divider" src="Images/beedivider-right.png" runat="server" />
        <br />
        <br />
        <span class="widelabel" style="width: 90px;">Username:</span>
        <asp:TextBox CssClass="textbox" ID="usernameTextBox" runat="server" Style="width: 100px;" />
        <br />
        <span class="widelabel" style="width: 90px;">Password:</span>
        <asp:TextBox CssClass="textbox" ID="passwordTextBox" runat="server" TextMode="Password" Style="width: 100px;" />
        <br />
        <br />
        <asp:Button CssClass="Button" ID="submitButton" runat="server" Text="Login" OnClick="submitButton_Click" />
        <br />
        <asp:RequiredFieldValidator ID="usernameReq" runat="server"
            ControlToValidate="usernameTextBox" SetFocusOnError="true"
            ErrorMessage="Username is required!" />
        &nbsp;<asp:RequiredFieldValidator ID="passwordReq" runat="server"
            ControlToValidate="passwordTextBox" SetFocusOnError="true"
            ErrorMessage="Password is required!" />
        <img class="divider" src="Images/beedivider-left.png" runat="server" />
    </div>
</asp:Content>
