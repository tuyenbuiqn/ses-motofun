<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucComment.ascx.cs" Inherits="SES.CMS.Module.ucComment" %>
<style type="text/css">
    
</style>
<div class="comment-box1" runat="server" id="comment">
    <h2 class="h2-com">
        Các phản hồi</h2>
    <div class="line-article">
    </div>
    <asp:Repeater ID="rptComment" runat="server" OnItemCommand="rptComment_ItemCommand">
        <ItemTemplate>
            <div class="commment-info1">
                <div class="comment-content1">
                    <span class="contentcm">
                        <%#Eval("Contents") %>
                    </span>
                </div>
                <div class="comment-info2">
                    <div class="comment-name1">
                        <span class="namecm"><b>
                            <%#Eval("Name") %></b> &nbsp;&nbsp;-&nbsp;&nbsp;
                            <%#DateTime.Parse(Eval("CreateDate").ToString()).ToString("dd/MM/yyyy") %>
                        </span>
                    </div>
                    <div class="comment-vote1">
                        <span class="social-box">
                        <span style="float:right;">
                        <span class="social-button"></span>
                            <asp:LinkButton runat="server" ID="lbtnLike" CommandArgument='<%#Eval("CommentID")%>'
                                CommandName="Like"><span class="like-icon"></span> </asp:LinkButton>
                            <span class="total-like">
                                <%#Eval("VoteUp") %></span>
                            <asp:LinkButton runat="server" ID="lntnDislike" CommandName="Dislike" CommandArgument='<%#Eval("CommentID")%>'
                                Text="| Không Thích"><span class="dislike-icon"></span> </asp:LinkButton>
                            <span class="total-dislike">
                                <%#Eval("VoteDown") %></span>
                                </span>
                                </span>
                    </div>
                </div>
                <div class="dotted">
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>
