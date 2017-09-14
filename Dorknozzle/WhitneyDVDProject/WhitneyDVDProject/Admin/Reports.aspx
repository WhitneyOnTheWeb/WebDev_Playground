<%@ Page Title="Reports" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="True" Inherits="Reports" CodeBehind="Reports.aspx.cs" %>

<asp:Content ID="body" ContentPlaceHolderID="MainContent" runat="Server">
    <h1>Reports</h1>
    <div class="blurb">Page to display various informational reports we're interested in.</div>
    <div class="reportscontent" runat="server">
        <img class="divider" src="~/Images/beedivider-right.png" runat="server" />
        <br />
        <br />
        <asp:Button ID="ListCustButton" CssClass="Button" runat="server" Text="List Customers" OnClick="ListCustButton_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="GetOrdersButton" CssClass="Button" runat="server" Text="Get Orders" OnClick="GetOrdersButton_Click" />
        &nbsp;
        <span class="widelabel">&nbsp;&nbsp;&nbsp;For Customer #:</span>
        <asp:TextBox ID="CustNumTextbox" CssClass="custnumtextbox" runat="server" Width="50px"></asp:TextBox>
        <br />
        <hr />
        <br />
        <asp:Button ID="LogoffButton" CssClass="Button" runat="server" Text="Logoff" OnClick="LogoffButton_Click" />
        <img class="divider" src="~/Images/beedivider-left.png" runat="server" />
        <br />
        <asp:DataList CssClass="customersRepeater" ID="customersRepeater" runat="server">
            <HeaderTemplate>
                <h3>Customers Report</h3>
                <br />
                <hr />
            </HeaderTemplate>
            <HeaderStyle CssClass="datalistheader"></HeaderStyle>
            <ItemTemplate>
            <asp:Panel CssClass="custname" runat="server">           
            <strong>Customer ID: </strong><%#Eval("CustomerID")%>
                <br />
                <strong>Customer Name: </strong><%#Eval("FirstName")%>&nbsp;<%#Eval("LastName")%>
             </asp:Panel> 
            </ItemTemplate>
            <SeparatorTemplate>
                <div>
                    <hr />
                </div>
            </SeparatorTemplate>
            <FooterTemplate>
                <hr />
            </FooterTemplate>
        </asp:DataList>
        <img class="divider" id="custbee" visible="false" src="~/Images/beedivider-right.png" runat="server" />
        <br />
        <asp:Label ID="OrdersCustNum" runat="server" Text=""></asp:Label>
        <asp:DataList CssClass="ordersRepeater" ID="ordersRepeater" runat="server">
            <HeaderTemplate>
                <h3>Orders Report</h3>
                <br />
                <hr />
            </HeaderTemplate>
            <HeaderStyle CssClass="datalistheader"></HeaderStyle>
            <ItemTemplate>
                <strong>Order ID: </strong><%#Eval("OrderID")%>
                &nbsp|&nbsp
                <strong>Customer ID: </strong><%#Eval("CustomerID")%>
                &nbsp|&nbsp
                <strong>Movie ID: </strong><%#Eval("DVDID")%>
                &nbsp|&nbsp
                <strong>Movie Title: </strong><%#Eval("DVDtitle")%>
            </ItemTemplate>
            <SeparatorTemplate>
                <div>
                    <hr />
                </div>
            </SeparatorTemplate>
            <FooterTemplate>
                <hr />
            </FooterTemplate>
        </asp:DataList>
        </div>
           <img class="divider" id="orderbee" Visible="false" src="~/Images/beedivider-left.png" runat="server" />
        <br />
</asp:Content>
