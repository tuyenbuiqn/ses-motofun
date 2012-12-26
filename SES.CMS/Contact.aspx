<%@ Page Title="" Language="C#" MasterPageFile="~/Otofun.Master" AutoEventWireup="true"
    CodeBehind="Contact.aspx.cs" Inherits="SES.CMS.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="m-body-top">
        <div class="body-out">
            <div class="contact-box">
            <div class="hotline-box">
                <h2 class="contact-title">
                    Liên hệ tòa soạn</h2>
                <p class="p-hotline">
                    Đường dây nóng:<span class="hotline"> 091 559 9988</span></p>
                <p class="p-address">
                    Địa chỉ: P 2504, TÒA 25T1, TRUNG HÒA NHÂN CHÍNH - CẦU GIẤY - HÀ NỘI
                </p>
                </div>
                <div class="contact-row">
                    <span class="text-span">Họ tên(*)</span> <span class="input-span">
                        <asp:TextBox runat="server" CssClass="input-name"  ID="txtName" ></asp:TextBox>
                    </span>
                </div>
                  <div class="contact-row">
                    <span class="text-span">Email(*)</span> <span class="input-span">
                        <asp:TextBox runat="server" CssClass="input-name"  ID="txtEmail" ></asp:TextBox>
                    </span>
                </div>
                 <div class="contact-row">
                    <span class="text-span">Điện thoại(*)</span> <span class="input-span">
                        <asp:TextBox runat="server" CssClass="input-name"  ID="txtDienThoai" ></asp:TextBox>
                    </span>
                </div>
                 <div class="contact-row">
                    <span class="text-span">Tiêu đề(*)</span> <span class="input-span">
                        <asp:TextBox runat="server" CssClass="input-name"  ID="txtTitle" ></asp:TextBox>
                    </span>
                </div>
                 <div class="contact-row">
                  <span class="text-span">Nội dung(*)</span> 
                 </div>
                  <div class="contact-row">
                  <asp:TextBox runat="server" CssClass="input-textarea" TextMode="MultiLine"  ID="txtContent" ></asp:TextBox>
                  </div>
                <div class="contact-send">
                    <asp:Button runat="server" ID="btnSend" Text="Gửi tòa soạn" 
                        CssClass="contact-button" onclick="btnSend_Click" />
                </div>
            </div>
        </div>
</div>
</asp:Content>
