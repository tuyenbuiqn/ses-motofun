<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucTags.ascx.cs" Inherits="SES.CMS.Module.ucTags" %>
<div class="tag-box">
    <ul class="tag-ul">
        <asp:Repeater runat="server" ID="rptTag" Visible="false">
            <HeaderTemplate>
                <li>Tags: </li>
            </HeaderTemplate>
            <ItemTemplate>
                <li class="litag"><a href='/tag/otofun-<%#Eval("Tag") %>.ofn' title='<%#Eval("Tag") %>'>
                    <%#Eval("Tag") %></a> </li>
            </ItemTemplate>
        </asp:Repeater>
    </ul>
    <div class="social-content-tag">
        <iframe runat="server" id="abc" scrolling="no" frameborder="0" style="margin-top: 12px;
            border: none; width: 75px; height: 20px;" allowtransparency="true"></iframe>
        <asp:HyperLink runat="server" Target="_blank" ID="hplFacebook" NavigateUrl="http://www.facebook.com/sharer.php?u="><img class="social-icon" alt="Chia sẻ thông tin này lên Facebook" width="20px" height="20px" src="/images/facebook.png" /></asp:HyperLink>
        <asp:HyperLink runat="server" Target="_blank" ID="hplGoogle" NavigateUrl="https://plusone.google.com/_/+1/confirm?hl=en&url="><img class="social-icon" alt="Chia sẻ lên Google Plus" width="20px" height="20px" src="/images/google.png" /></asp:HyperLink>
        <asp:HyperLink runat="server" Target="_blank" ID="hplTwitter" NavigateUrl="http://twitter.com/home/?status="><img class="social-icon" alt="Chia sẻ thông tin này lên Twitter" width="20px" height="20px" src="/images/twitter.png" /></asp:HyperLink>
    </div>
</div>
