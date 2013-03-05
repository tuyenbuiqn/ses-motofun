<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucLastestNews.ascx.cs"
    Inherits="SES.CMS.Module.ucLastestNews" %>
    <h3 class="hmp-cate-maintitle">
        <span>Nổi bật</span>
    </h3>
<div class="m-highlight-box">
    <asp:Repeater runat="server" ID="rptLastestNews">
        <ItemTemplate>
        <div style="float:left; width:100%; border-bottom:1px dotted #ccc;">
            <a href='/<%#FriendlyUrl(Eval("CategoryTitle").ToString())%>-<%#Eval("CategoryID") %>/<%#FriendlyUrl(Eval("Title").ToString())%>-<%#Eval("ArticleID") %>.aspx'>
                <span class="top-hight-light">
                    <%#Eval("Title") %></span>
                <div class="top-hight-light-contentbox">
                    <span class="tophighlight-imgbox">
                        <img class="tophighlight-img" alt='<%#Eval("Title") %>' src='http://news.otofun.net/Media/<%#Eval("ImageUrl") %>' />
                    </span><span class="tophighlight-des">
                     <div class="art-auth">
                                        <img src="/images/news-icon-d.png" style="margin-right: 3px;">
                                          <%#CheckAuth(Eval("Author").ToString())%></div>
                        <%#WordCut(Eval("Description").ToString())%></span>
                </div>
            </a>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>
