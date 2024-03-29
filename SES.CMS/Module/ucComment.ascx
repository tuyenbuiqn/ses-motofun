﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucComment.ascx.cs" Inherits="SES.CMS.Module.ucComment" %>
<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="Captcha" %>
<script type="text/javascript">
    $(document).ready(function () {
        $("a#aViewComment").click(function () {
            $("#divListComment").slideToggle("slow");
        });
        $("a#aSendComment").click(function () {
            $(".div-comment").slideToggle("slow");
        });
    });
</script>
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <div class="comment-box1" runat="server" id="comment">
            <h3>
                <span>BÌNH LUẬN</span></h3>
            <a href="#aViewComment" id="aViewComment">Xem</a> <span class="border-comment"></span>
            <a href="#divxs" id="aSendComment">Gửi</a>
            <div id="divListComment">
                <asp:Repeater ID="rptComment" runat="server" OnItemCommand="rptComment_ItemCommand"
                    OnItemDataBound="rptComment_ItemDataBound">
                    <ItemTemplate>
                        <div class="comment-info1">
                            <div class="comment-info2">
                                <div class="comment-name1">
                                    <span>
                                        <%#Eval("Name") %></span> &nbsp;&nbsp;-&nbsp;
                                    <%#DateTime.Parse(Eval("CreateDate").ToString()).ToString("HH:mm dd/MM/yyyy ")%>
                                </div>
                                <div class="comment-vote1a">
                                    <span class="social-boxa">
                                        <asp:ImageButton runat="server" ID="imgbtnLike" CssClass="like-icon" ImageUrl="/images/thumb_up.png"
                                            CommandArgument='<%#Eval("CommentID")%>' CausesValidation="false" CommandName="LikeR" />
                                        <span class="total-like">
                                            <%#Eval("VoteUp") %></span> </span><span class="social-boxa">
                                                <asp:ImageButton runat="server" ID="imgbtnDisLike" CssClass="dislike-icon" ImageUrl="/images/thumb_down.png"
                                                    CommandName="DislikeR" CommandArgument='<%#Eval("CommentID")%>' CausesValidation="false" />
                                                <span>
                                                    <%#Eval("VoteDown") %></span> </span><span class="social-boxa"></span>
                                </div>
                            </div>
                            <div class="comment-content1">
                                <span class="contentcm">
                                    <%#Eval("Contents") %>
                                </span>
                            </div>
                            <div class="comment-reply-box">
                                <span class="comment-r"><span class="comment-r-b">Bình luận có <span class="bold-red">
                                    <%#Eval("totalComment") %></span> phản hồi </span>
                                    <asp:Button runat="server" ID="btnReply" CssClass="comment-reply" Text="Trả lời"
                                        CausesValidation="false" CommandName="Reply" CommandArgument='<%#Eval("CommentID")%>' />
                                    <asp:HyperLink runat="server" ID="hplX"></asp:HyperLink>
                                </span>
                            </div>
                        </div>
                        <asp:Repeater runat="server" ID="rptReplyComment" OnItemCommand="rptReplyComment_ItemCommand">
                            <ItemTemplate>
                                <div class="comment-info-reply">
                                    <div class="comment-info2">
                                        <div class="comment-name1">
                                            <span>
                                                <%#Eval("Name") %></span> &nbsp;&nbsp;-&nbsp;
                                            <%#DateTime.Parse(Eval("CreateDate").ToString()).ToString("HH:mm dd/MM/yyyy ")%>
                                        </div>
                                        <div class="comment-vote1a">
                                            <span class="social-boxr">
                                                <asp:ImageButton runat="server" ID="imgbtnLike" ImageUrl="/images/thumb_up.png" CssClass="like-icon"
                                                    Style="border-width: 0px;" CommandArgument='<%#Eval("CommentID")%>' CommandName="Like"
                                                    CausesValidation="false" />
                                                <span class="total-like">
                                                    <%#Eval("VoteUp") %></span> </span><span class="social-boxr">
                                                        <asp:ImageButton runat="server" ID="imgbtnDisLike" CssClass="dislike-icon" ImageUrl="/images/thumb_down.png"
                                                            Style="border-width: 0px;" CommandName="Dislike" CommandArgument='<%#Eval("CommentID")%>'
                                                            CausesValidation="false" />
                                                        <span>
                                                            <%#Eval("VoteDown") %></span> </span>
                                        </div>
                                    </div>
                                    <div class="comment-content1">
                                        <span class="contentcm">
                                            <%#Eval("Contents") %>
                                        </span>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
        <div class="div-comment">
            <h3>
                <span>Gửi phản hồi</span></h3>
            <div class="comment-box-out">
                <div class="comment-box">
                    <div runat="server" id="divx">
                    </div>
                    <div class="comment-row" id="divxs">
                        <span class="span-ht">
                            <asp:TextBox runat="server" ID="txtHoTen" CssClass="comment-name" placeholder="Họ tên"></asp:TextBox>
                            <span class="span-email">
                                <asp:TextBox runat="server" ID="txtEmail" CssClass="comment-email" placeholder="Email"></asp:TextBox>
                            </span>
                    </div>
                    <div class="comment-row">
                        <asp:TextBox TextMode="MultiLine" CssClass="comment-content" runat="server" Height="70px"
                            ID="txtContent"></asp:TextBox>
                    </div>
                    <div class="comment-row">
                        <div style="float: left; width: 200px; display: none;">
                            <span class="span-secure">
                                <asp:TextBox runat="server" ID="txtSecCode" Width="80px" CssClass="comment-email"
                                    placeholder="Mã bảo mật"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                                    ForeColor="Red" ControlToValidate="txtSecCode" ValidationGroup="comment"></asp:RequiredFieldValidator></span>
                            </span>
                            <div style="width: 100px; float: left; margin: -5px 0 0 0;">
                                <Captcha:CaptchaControl class="CapCha" ID="ccJoin" runat="server" validateIntegratedModeConfiguration="false"
                                    CaptchaHeight="31" CaptchaWidth="100" CaptchaBackgroundNoise="None" CaptchaLineNoise="None"
                                    BackColor="#ecd9b8" CaptchaLength="5" Width="100px" ForeColor="Red" Font-Size="Medium" />
                            </div>
                        </div>
                        <div style="float: right; width: 198px;">
                            <asp:Button runat="server" Text="Gửi đi" ID="btnSend" CssClass="comment-button" ValidationGroup="comment"
                                OnClick="btnSend_Click" />
                            <asp:Button runat="server" Text="Nhập lại" ID="btnReset" CausesValidation="false"
                                CssClass="comment-button" OnClick="btnReset_Click" />
                        </div>
                    </div>
                    <%--  <div class="comment-row">
                       
                    </div>
                    <div id="xxx">
                    </div>--%>
                </div>
            </div>
        </div>
        <%--  <div class="newarticle-box">
            <h2>
                Gửi phản hồi</h2>
            <div class="line-article">
              
            </div>
        </div>--%>
    </ContentTemplate>
</asp:UpdatePanel>
