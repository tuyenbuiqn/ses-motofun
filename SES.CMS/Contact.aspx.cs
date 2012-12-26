using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SES.CMS
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private string mailbody()
        {
            string body = "";

            body += "<h2>Thông tin liên hệ từ bạn đọc: " + txtName.Text + "</h2>";
            body += "<h4>Thông tin bạn đọc</h4>";
            body += "<table>";

            body += "<tr><td style='width:150px;'>Tiêu đề:</td><td style='font-weight:bold;padding-left:5px;'>" + txtTitle.Text + " " + "</td></tr>";
            body += "<tr><td style='width:150px;'>Người gửi: </td><td style='font-weight:bold;padding-left:5px;'>" + txtName.Text + " " + "</td></tr>";
            body += "<tr><td style='width:150px;'>Email:</td><td style='font-weight:bold;padding-left:5px;'>" + txtEmail.Text + " " + "</td></tr>";
            body += "<tr><td style='width:150px;'>Số điện thoại:</td><td style='font-weight:bold;padding-left:5px;'>" + txtDienThoai.Text + "</td></tr>";
            body += "</table>";

            body += "<h4>Nội dung </h4>";
            body += "<p style='font-style:italic; color: #a43a42;'>" + txtContent.Text + "</p>";
            body += "<p> Ngày gửi:" + DateTime.Now + "</p>";

            return body;
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            if(txtName.Text.Equals(""))
                Ultility.Alert("Vui lòng nhập họ tên");
            if (txtEmail.Text.Equals(""))
                Ultility.Alert("Vui lòng nhập email");
            if (txtTitle.Text.Equals(""))
                Ultility.Alert("Vui lòng nhập tiêu đề");
            if (txtContent.Text.Length<20)
                Ultility.Alert("Nội dung phải lớn hơn 20 ký tự");
            Ultility.sendsMail(txtName.Text, mailbody(), txtTitle.Text);
            Ultility.Alert("Chúng tôi đã nhận được phản hồi của bạn. Xin cảm ơn!", "/Default.aspx");
        }
    }
}