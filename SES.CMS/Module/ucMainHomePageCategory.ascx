<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucMainHomePageCategory.ascx.cs"
    Inherits="SES.CMS.Module.ucMainHomePageCategory" %>
<asp:Repeater runat="server" ID="rptCategoryParent" OnItemDataBound="rptCategoryParent_ItemDataBound">
    <ItemTemplate>
        <div class="m-home-page">
            <h2 class="m-home-page-title">
                <a href='/<%#FriendlyUrl(Eval("Title").ToString())%>-<%#Eval("CategoryID")%>.aspx'
                    class="title_block_tin" title='<%#Eval("Title") %>'><span class="pLinkObj">
                        <%#Eval("Title") %></span></a> <span class="arrow">»</span></a>
            </h2>
            <div class="m-highlight-box">
                <asp:Repeater runat="server" ID="rptTopHighLight">
                    <ItemTemplate>
                        <a href='/<%#FriendlyUrl(Eval("CategoryTitle").ToString())%>-<%#Eval("CategoryID") %>/<%#FriendlyUrl(Eval("Title").ToString())%>-<%#Eval("ArticleID") %>.aspx'>
                            <span class="top-hight-light">
                                <%#Eval("Title") %></span>
                            <div class="top-hight-light-contentbox">
                                <span class="tophighlight-imgbox">
                                    <img class="tophighlight-img" alt='<%#Eval("Title") %>' src='/Media/<%#Eval("ImageUrl") %>' />
                                </span><span class="tophighlight-des">
                                    <%#WordCut(Eval("Description").ToString())%></span>
                            </div>
                        </a>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <ul class="m-otherhighlight-box">
                <asp:Repeater runat="server" ID="rptTopOtherHighLight">
                    <ItemTemplate>
                        <li>
                            <h3 class="h3Title">
                                <a class="other-title" href='/<%#FriendlyUrl(Eval("CategoryTitle").ToString())%>-<%#Eval("CategoryID") %>/<%#FriendlyUrl(Eval("Title").ToString())%>-<%#Eval("ArticleID") %>.aspx'
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
