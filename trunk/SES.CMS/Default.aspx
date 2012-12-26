<%@ Page Title="" Language="C#" MasterPageFile="~/Otofun.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="SES.CMS.Default" %>

<%@ Register Src="/Module/ucLastestNews.ascx" TagName="ucLastestNews" TagPrefix="uc2" %>
<%@ Register Src="/Module/ucThamKhaoGiaXe.ascx" TagName="ucThamKhaoGiaXe" TagPrefix="uc3" %>
<%@ Register Src="/Module/ucMiddleAdv.ascx" TagName="ucMiddleAdv" TagPrefix="uc5" %>
<%@ Register Src="/Module/ucMainHomePageCategory.ascx" TagName="ucMainHomePageCategory"
    TagPrefix="uc6" %>
<%@ Register Src="/Module/ucMostRead.ascx" TagName="ucMostRead" TagPrefix="uc7" %>
<%@ Register Src="/Module/ucHomeSlide.ascx" TagName="ucHomeSlide" TagPrefix="uc8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="m-body-top">
        <div class="body-out">
            <p>
                <asp:Literal runat="server" ID="ltrNgay"></asp:Literal></p>
        </div>
        <uc6:ucMainHomePageCategory runat="server" ID="uc6Main" />
    </div>
</asp:Content>
