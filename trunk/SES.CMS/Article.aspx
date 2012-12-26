<%@ Page Title="" Language="C#" MasterPageFile="~/Otofun.Master" AutoEventWireup="true"
    CodeBehind="Article.aspx.cs" Inherits="SES.CMS.Article" %>

<%@ Register Src="Module/ucLeftAdv.ascx" TagName="ucLeftAdv" TagPrefix="uc1" %>
<%@ Register Src="Module/ucRightAdv.ascx" TagName="ucRightAdv" TagPrefix="uc2" %>
<%@ Register Src="Module/ucArticleAdv.ascx" TagName="ucArticleAdv" TagPrefix="uc3" %>
<%@ Register Src="Module/ucNewArticles.ascx" TagName="ucNewArticles" TagPrefix="uc4" %>
<%@ Register Src="Module/ucTopAdvertisment.ascx" TagName="ucTopAdvertisment" TagPrefix="uc6" %>
<%@ Register Src="Module/ucTags.ascx" TagName="ucTags" TagPrefix="uc7" %>
<%@ Register Src="Module/ucSameCateArticles.ascx" TagName="ucSameCateArticles" TagPrefix="u8" %>
<%@ Register Src="Module/ucComment.ascx" TagName="ucComment" TagPrefix="uc8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="m-body-top">
        <div class="body-out">
            <div class="category-title-box">
                <h2 class="category-title">
                    <asp:Label runat="server" ID="lblBreadcrumb"></asp:Label></h2>
            </div>
            <div class="article-box">
                <asp:Repeater runat="server" ID="rptArticleDetail" OnItemDataBound="rptArticleDetail_ItemDataBound">
                    <ItemTemplate>
                    <h2 class="artile-title-h2"><%#Eval("Title") %></h2>
                        <span class="article-desciption">
                            <%#Eval("Description") %></span>
                        <div class="tin-lien-quan-2">
                            <span class="tin-lien-quan2-span">Tin liên quan</span>
                            <asp:Repeater runat="server" ID="rptTinLienQuan2">
                                <ItemTemplate>
                                    <a class="tin-lien-quan-2a" href='/<%#FriendlyUrl(Eval("CategoryTitle").ToString())%>-<%#Eval("CategoryID") %>/<%#FriendlyUrl(Eval("Title").ToString())%>-<%#Eval("ArticleID") %>.aspx'
                                        title='<%#Eval("Title") %>'>»
                                        <%#Eval("Title")%></a>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                        <div class="article-detail">
                            <%#Eval("ArticleDetail") %>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
          
            <uc7:ucTags runat="server" ID="uc7ucTag" />
            <uc8:ucComment ID="ucComment1" runat="server" />
           
            <uc4:ucNewArticles Visible="false" ID="ucNewArticles1" runat="server" />
            <div class="newarticle-box">
                <h2>
                    Gửi phản hồi</h2>
                <div class="line-article">
                    <div class="comment-box">
                        <div class="comment-row">
                            <asp:TextBox runat="server"  ID="txtHoTen" CssClass="comment-name" placeholder="Họ tên"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                                ForeColor="Red" ControlToValidate="txtHoTen" ValidationGroup="comment"></asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" ID="txtEmail" CssClass="comment-email" placeholder="Email"
                               ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                                ForeColor="Red" ControlToValidate="txtEmail" ValidationGroup="comment"></asp:RequiredFieldValidator>
                        </div>
                        <div class="comment-row">
                            <asp:TextBox TextMode="MultiLine" CssClass="comment-content" runat="server" ID="txtContent"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*"
                                ForeColor="Red" ControlToValidate="txtContent" ValidationGroup="comment"></asp:RequiredFieldValidator>
                        </div>
                        <div class="comment-row">
                            <asp:Button runat="server" Text="Gửi thông tin" ID="btnSend" CssClass="comment-button"
                                ValidationGroup="comment" OnClick="btnSend_Click" />
                            <asp:Button runat="server" Text="Làm lại" ID="btnReset" CssClass="comment-button"
                                OnClick="btnReset_Click" />
                        </div>
                    </div>
                </div>
            </div>
            <u8:ucSameCateArticles runat="server" ID="uc9UcSameCate" />
        </div>
    </div>
</asp:Content>
