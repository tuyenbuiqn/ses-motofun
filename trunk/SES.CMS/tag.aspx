<%@ Page Title="" Language="C#" MasterPageFile="~/Otofun.Master" AutoEventWireup="true"
    CodeBehind="tag.aspx.cs" Inherits="SES.CMS.tag" %>

<%@ Register TagPrefix="cp" Namespace="SiteUtils" Assembly="CollectionPager" %>
<%@ Register Src="Module/ucLeftAdv.ascx" TagName="ucLeftAdv" TagPrefix="uc1" %>
<%@ Register Src="Module/ucRightAdv.ascx" TagName="ucRightAdv" TagPrefix="uc2" %>
<%@ Register Src="Module/ucTieuDiem.ascx" TagName="ucTieuDiem" TagPrefix="uc5" %>
<%@ Register Src="Module/ucTopAdvertisment.ascx" TagName="ucTopAdvertisment" TagPrefix="uc6" %>
<%@ Register Src="/Module/ucTopContactInfo.ascx" TagName="ucTopContactInfo" TagPrefix="uc13" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="m-body-top">
        <div class="body-out">
                <h3 class="hmp-cate-maintitle">
                        <span><a class="rootcat">Từ khóa</a> » <asp:Literal ID="ltrKey" runat="server"></asp:Literal></span>
                </h3>
            <asp:Repeater runat="server" ID="rptTag" OnItemDataBound="rptTag_ItemDataBound">
                <ItemTemplate>
                    <div style="float: left; width: 99%; border-bottom: 1px dotted #f2f2f2;">
                        <a href='/<%#FriendlyUrl(Eval("CategoryTitle").ToString())%>-<%#Eval("CategoryID") %>/<%#FriendlyUrl(Eval("Title").ToString())%>-<%#Eval("ArticleID") %>.ofn'>
                            <div class="top-hight-light-contentbox">
                                <span class="tophighlight-imgbox">
                                    <img class="tophighlight-img" alt='<%#Eval("Title") %>' src='http://news.otofun.net/Media/<%#Eval("ImageUrl") %>' />
                                </span><span class="top-hight-light">
                                    <%#Eval("Title") %></span> <span class="tophighlight-des">
                                        <div class="art-auth">
                                            <img src="/images/news-icon-d.png" style="margin-right: 3px;">
                                            <%#CheckAuth(Eval("Author").ToString())%></div>
                                        <%#WordCut(Eval("Description").ToString())%></span>
                            </div>
                        </a>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <div style="width: 100%; margin: 0 0 5px 0; float: right;">
                <div class="collection">
                    <asp:HyperLink ID="hplPrevPage" runat="server">[Trang trước]</asp:HyperLink>
                    &nbsp;
                    <asp:HyperLink ID="hplNextPage" runat="server">[Trang sau]</asp:HyperLink>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
