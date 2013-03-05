<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucMainHomePageCategory.ascx.cs"
    Inherits="SES.CMS.Module.ucMainHomePageCategory" %>
<asp:Repeater runat="server" ID="rptCategoryParent" OnItemDataBound="rptCategoryParent_ItemDataBound">
    <ItemTemplate>
        <div class="m-home-page">
            <h3 class="hmp-cate-maintitle">
                <span><a href='/<%#FriendlyUrl(Eval("Title").ToString())%>-<%#Eval("CategoryID")%>.ofn'
                    class="title_block_tin" title='<%#Eval("Title") %>'>
                    <%#Eval("Title") %></a> </span>
            </h3>
            <div class="m-highlight-box">
                <asp:Repeater runat="server" ID="rptTopHighLight">
                    <ItemTemplate>
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
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <ul class="m-otherhighlight-box" style="display: none;">
                <asp:Repeater runat="server" ID="rptTopOtherHighLight" Visible="false">
                    <ItemTemplate>
                        <li>
                            <h3 class="h3Title">
                                <a class="other-title" href='/<%#FriendlyUrl(Eval("CategoryTitle").ToString())%>-<%#Eval("CategoryID") %>/<%#FriendlyUrl(Eval("Title").ToString())%>-<%#Eval("ArticleID") %>.ofn'
                                    title='<%#Eval("Title") %>' onfocus="this.blur()"><span>
                                        <%#Eval("Title") %></span></a>
                            </h3>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </div>
    </ItemTemplate>
</asp:Repeater>
