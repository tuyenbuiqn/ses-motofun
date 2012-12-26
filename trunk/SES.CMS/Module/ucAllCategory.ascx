<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucAllCategory.ascx.cs"
    Inherits="SES.CMS.Module.ucAllCategory" %>
<div class="m-home-page">
    <h2 class="m-home-page-title">
        <a href="#danh-muc" id="danh-muc" class="title_block_tin"><span class="pLinkObj">Danh
            mục</span></a><span class="arrow">»</span>
    </h2>
    <ul class="ul-allcate">
        <asp:Repeater runat="server" ID="rptAllCate">
            <ItemTemplate>
                <li><a href='/<%#FriendlyUrl(Eval("Title").ToString())%>-<%#Eval("CategoryID")%>.aspx'
                    class="allcate-a" title='<%#Eval("Title") %>'><span>
                        <%#Eval("Title") %></span></a> </li>
            </ItemTemplate>
        </asp:Repeater>
    </ul>
</div>
