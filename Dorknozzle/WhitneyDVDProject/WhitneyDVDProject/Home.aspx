<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" Inherits="Home" CodeBehind="Home.aspx.cs" %>

<asp:Content ID="body" ContentPlaceHolderID="MainContent" runat="Server">
    <h1>Welcome to Bee Movies!</h1>
    <div class="blurb">Your source for B-movies and cult classics... we're always adding more!</div>
    <div class="homecontent">
        <img class="divider" src="Images/beedivider-right.png" runat="server" />
        <br />
        <asp:DataList CssClass="dvdRepeater" id="dvdRepeater" runat="server" OnItemCommand="dvdRepeater_ItemCommand">
            <ItemTemplate>
                <strong>
                    <div id="title"><%#Eval("DVDtitle")%></div>
                </strong>
                <br />
                <div id="artist"><strong>Movie Star: </strong><%#Eval("DVDartist")%></div>
                &nbsp;| 
            <div id="rating"><strong>Rating: </strong><%#Eval("DVDrating")%></div>
                &nbsp;| 
            <strong id="pricelabel">Price: </strong>
                <div id="price"><%#Eval("DVDprice", "${0:0.00}")%></div>
            <br />
            <asp:LinkButton CssClass="dvdlinkButton" ID="DetailsButton" runat="server"
                Text="Details"
                CommandName="details"
                CommandArgument='<%# Eval("DVDID")%>' />
                &nbsp;|
            <asp:LinkButton CssClass="dvdlinkButton" ID="buttonBuyDVD" runat="server"
                Text="Buy It!" CommandName="buy"
                CommandArgument='<%# Eval("DVDID")%>' />
            </ItemTemplate>
            <SeparatorTemplate>
                <div>
                    <hr />
                </div>
            </SeparatorTemplate>
        </asp:DataList>
        <br />
        <img class="divider" src="Images/beedivider-left.png" runat="server" />
        <br />
    </div>
</asp:Content>



