<%@ Page Title="" Language="C#" MasterPageFile="~/Otofun.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="SES.CMS.Default" %>

<%@ Register Src="/Module/ucLastestNews.ascx" TagName="ucLastestNews" TagPrefix="uc2" %>
<%@ Register Src="/Module/ucMainHomePageCategory.ascx" TagName="ucMainHomePageCategory"
    TagPrefix="uc6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="m-body-top">
        <div class="body-out" style="display:none;">
            <p>
                <asp:Literal runat="server" ID="ltrNgay"></asp:Literal></p>
        </div>

        <uc2:ucLastestNews runat="server" ID="uc2Lastestnews" />
        <uc6:ucMainHomePageCategory runat="server" ID="uc6Main" />
    </div>
</asp:Content>
