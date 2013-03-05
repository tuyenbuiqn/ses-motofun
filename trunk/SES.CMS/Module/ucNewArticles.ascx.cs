using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SES.CMS.BL;
using SES.CMS.DO;
using System.Data;

namespace SES.CMS.Module
{
    public partial class ucNewArticles : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Request.QueryString["ArticleID"]))
            {
                int articleID = int.Parse(Request.QueryString["ArticleID"]);
                if (!IsPostBack)
                    rptNewArticleDataSource(articleID);
            }
        }
        protected void rptNewArticleDataSource(int articleID)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["CategoryID"]))
            {
                int categoryID = int.Parse(Request.QueryString["CategoryID"]);
                DataTable dtNewArt = new cmsArticleBL().SelectByCategoryIDMobile(categoryID, 6);
                rptNewArticle.DataSource = new DataView(dtNewArt, "ArticleID <> " + articleID, "", DataViewRowState.CurrentRows);
                rptNewArticle.DataBind();
            }
        }
        public string FriendlyUrl(string s)
        {
            return Ultility.Change_AVCate(s);
        }
    }
}