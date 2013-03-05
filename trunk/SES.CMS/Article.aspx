<%@ Page Title="" Language="C#" MasterPageFile="~/Otofun.Master" AutoEventWireup="true"
    CodeBehind="Article.aspx.cs" Inherits="SES.CMS.Article" %>

<%@ Register Src="Module/ucNewArticles.ascx" TagName="ucNewArticles" TagPrefix="uc4" %>
<%@ Register Src="Module/ucTags.ascx" TagName="ucTags" TagPrefix="uc7" %>
<%@ Register Src="Module/ucSameCateArticles.ascx" TagName="ucSameCateArticles" TagPrefix="u8" %>
<%@ Register Src="Module/ucComment.ascx" TagName="ucComment" TagPrefix="uc8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="m-body-top">
        <div class="body-out">
          
            <h3 class="hmp-cate-maintitle">
                <span>
                     <asp:Label runat="server" ID="lblBreadcrumb"></asp:Label>
                </span>
            </h3>
            <div class="article-box">
                <div class="social-content">
                    <iframe runat="server" id="abc" scrolling="no" frameborder="0" style="margin-top: 12px;
                        border: none; width: 75px; height: 20px;" allowtransparency="true"></iframe>
                    <asp:HyperLink runat="server" Target="_blank" ID="hplFacebook" NavigateUrl="http://www.facebook.com/sharer.php?u="><img alt="Chia sẻ thông tin này lên Facebook" width="20px" height="20px" class="social-icon" src="/images/facebook.png" /></asp:HyperLink>
                    <asp:HyperLink runat="server" Target="_blank" ID="hplGoogle" NavigateUrl="https://plusone.google.com/_/+1/confirm?hl=en&url="><img alt="Chia sẻ lên Google Plus" width="20px" height="20px" class="social-icon" src="/images/google.png" /></asp:HyperLink>
                    <asp:HyperLink runat="server" Target="_blank" ID="hplTwitter" NavigateUrl="http://twitter.com/home/?status="><img alt="Chia sẻ thông tin này lên Twitter" width="20px" height="20px" class="social-icon" src="/images/twitter.png" /></asp:HyperLink>
                </div>
                <asp:Repeater runat="server" ID="rptArticleDetail" OnItemDataBound="rptArticleDetail_ItemDataBound">
                    <ItemTemplate>
                        <div class="breadcrumb-box">
                            <h1 class="article-title">
                                <%#Eval("Title") %>
                            </h1>
                        </div>
                        <div class="art-authx">
                            <img src="/images/news-icon-d.png" style="margin-right: 3px;" alt="">
                            <%#CheckAuth(Eval("Author").ToString())%></div>
                        <div class="social-wrap">
                            <span class="createdate-article">
                                <%#Eval("CreateDate","{0:dd/MM/yyyy - hh:mm}") %></span>
                        </div>
                        <span class="article-desciption">
                            <%#Eval("ArticleSP") %></span>
                        <asp:Repeater runat="server" ID="rptTinLienQuan2">
                            <HeaderTemplate>
                                <div class="tin-lien-quan-2">
                            </HeaderTemplate>
                            <ItemTemplate>
                                <a class="tin-lien-quan-2a" href='/<%#FriendlyUrl(Eval("CategoryTitle").ToString())%>-<%#Eval("CategoryID") %>/<%#FriendlyUrl(Eval("Title").ToString())%>-<%#Eval("ArticleID") %>.ofn'
                                    title='<%#Eval("Title") %>'>
                                    <img class="art-authx-dot" src="/images/news-icon-d.png" style="margin-right: 5px;" /><%#Eval("Title")%></a>
                            </ItemTemplate>
                            <FooterTemplate>
                                </div></FooterTemplate>
                        </asp:Repeater>
                        <div class="article-detail">
                            <%#Eval("ArticleDetail") %>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <uc7:ucTags runat="server" ID="uc7ucTag" />
            
            <uc4:ucNewArticles  ID="ucNewArticles1" runat="server" />
            <uc8:ucComment ID="ucComment1" runat="server" />
        </div>
    </div>
</asp:Content>
