<%@ Page Title="" Language="C#" MasterPageFile="~/Dorknozzle.master" AutoEventWireup="true" Inherits="EmpDir2" Codebehind="EmployeeDirectory2.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <h1>Employee Directory</h1>
    <asp:DataList ID="employeesList" runat="server" OnItemCommand="employeesList_ItemCommand">
        <ItemTemplate>
            Name: <strong><%#Eval("Name")%></strong><br />
            Username: <strong><%#Eval("Username")%></strong>
            <asp:Literal ID="extraDetailsLiteral" runat="server" EnableViewState="false" />
            <br />
            <asp:LinkButton ID="detailsButton" runat="server"
                Text='<%#"View more details about " +  Eval("Name")%>'
                CommandName="MoreDetailsPlease"
                CommandArgument='<%# Eval("EmployeeID")%>' />
            <br />
            <asp:LinkButton ID="editButton" runat="server"
                Text='<%#"Edit employee " + Eval("Name")%>'
                CommandName="EditItem"
                CommandArgument='<%#Eval("EmployeeID")%>' />
        </ItemTemplate>
        <SeparatorTemplate>
            <hr />
        </SeparatorTemplate>
        <EditItemTemplate>
            Name:
            <asp:TextBox ID="nameTextBox" runat="server"
                Text='<%# Eval("Name")%>' />
            <br />
            Username:
            <asp:TextBox ID="usernameTextBox" runat="server"
                Text='<%# Eval("Username")%>' />
            <br />
            <asp:LinkButton ID="updateButton" runat="server"
                Text="Update Item" CommandName="UpdateItem"
                CommandArgument='<%# Eval("EmployeeID")%>' />
            or 
            <asp:LinkButton ID="cancelButton" runat="server"
                Text="Cancel Editing" CommandName="CancelEditing"
                CommandArgument='<%# Eval("EmployeeID")%>' />
        </EditItemTemplate>
    </asp:DataList>
</asp:Content>
