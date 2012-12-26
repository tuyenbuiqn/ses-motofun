<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucTags.ascx.cs" Inherits="SES.CMS.Module.ucTags" %>
<div class="tag-box">
    <span class="tag-background">
        <img  src="/images/tag.png" alt="tag" />
    </span>
    <ul class="tag-ul">
        <asp:Repeater runat="server" ID="rptTag">
            <ItemTemplate>
                <li><a href='/tag/otofun-<%#Eval("Tag") %>.aspx' title='<%#Eval("Tag") %>'>
                    <%#Eval("Tag") %></a>, </li>
            </ItemTemplate>
        </asp:Repeater>
    </ul>
</div>
