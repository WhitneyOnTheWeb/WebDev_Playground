<%@ Page Language="C#" MasterPageFile="~/Dorknozzle.master" AutoEventWireup="true" Inherits="Login" Title="Welcome to Dorknozzle!" CodeBehind="Login.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h1>Please Login Here</h1>
    <p>
        Username:<br />
        <asp:TextBox ID="usernameTextBox" runat="server" />
        <asp:RequiredFieldValidator ID="usernameReq" runat="server"
            ControlToValidate="usernameTextBox" SetFocusOnError="true"
            ErrorMessage="Username is required!" />
    </p>

    <p>
        Password:<br />
        <asp:TextBox ID="passwordTextBox" runat="server" TextMode="Password" />
        <asp:RequiredFieldValidator ID="passwordReq" runat="server"
            ControlToValidate="passwordTextBox" SetFocusOnError="true"
            ErrorMessage="Password is required!" />
    </p>
    <p>
        <asp:Button ID="submitButton" runat="server" Text="Login" OnClick="submitButton_Click" style="height: 26px" />
    </p>

</asp:Content>


