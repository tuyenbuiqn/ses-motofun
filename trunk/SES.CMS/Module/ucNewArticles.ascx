<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucNewArticles.ascx.cs"
    Inherits="SES.CMS.Module.ucNewArticles" %>
<div class="newarticle-box">
      <h3 class="h3-title-cate">
                <span>Bài viết cùng chuyên mục</span></h3>
    <div class="line-article">
    </div>
    <ul class="ul-new-article">
        <asp:Repeater runat="server" ID="rptNewArticle">
            <ItemTemplate>
                <li><a href='/<%#FriendlyUrl(Eval("CategoryTitle").ToString())%>-<%#Eval("CategoryID") %>/<%#FriendlyUrl(Eval("Title").ToString())%>-<%#Eval("ArticleID") %>.aspx'
                    title='<%#Eval("Title") %>' class="new-article">
                    <%#Eval("Title") %></a></li>
            </ItemTemplate>
        </asp:Repeater>
    </ul>
</div>
