using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SES.CMS.BL;
using SES.CMS.DO;
using System.Data;
using System.Web.Caching;
namespace SES.CMS
{
    public partial class Category : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["CategoryID"]))
            {
                int categoryID = int.Parse(Request.QueryString["CategoryID"]);
                rptCategoryDataSoucre(categoryID);
                lblCate.Text = new cmsCategoryBL().Select(new cmsCategoryDO { CategoryID = categoryID }).Title;
                Page.Title = lblCate.Text + " - " + (new sysConfigBL().Select(new sysConfigDO { ConfigID = 1 }).ConfigValue);
            }
        }
        protected void loadTime()
        {
            DateTime dateTime = DateTime.Now;
            // ltrDatetime.Text = Ultility.vietNameseDay(dateTime.DayOfWeek) + ", ngày " + dateTime.Date.Day + " tháng " + dateTime.Month + " năm " + dateTime.Year;
        }
        //protected void loadBreadcrumb(int categoryID)
        //{
        //    cmsCategoryDO objCate = new cmsCategoryDO();
        //    objCate.CategoryID = categoryID;
        //    objCate = new cmsCategoryBL().Select(objCate);
        //    string rootUrl = "<a href='/" + Ultility.Change_AV(objCate.Title) + "-" + objCate.CategoryID + ".aspx' title='" + objCate.Title + "'>" + objCate.Title + "</a>";
        //    if (objCate.ParentID == 0)
        //    {
        //        lblBreadcrumb.Text = rootUrl;
        //    }
        //    else
        //    {
        //        lblBreadcrumb.Text = rootUrl;
        //        objCate.CategoryID = objCate.ParentID;
        //        objCate = new cmsCategoryBL().Select(objCate);

        //        lblBreadcrumb.Text = "<a href='/" + Ultility.Change_AV(objCate.Title) + "-" + objCate.CategoryID + ".aspx' title='" + objCate.Title + "'>" + objCate.Title + "</a>" + " » " + rootUrl;
        //    }
        //}
        private Cache cache = HttpContext.Current.Cache;
        protected void rptCategoryDataSoucre(int categoryID)
        {
            //DataTable dtCategory = new cmsArticleBL().SelectByCategoryID2(categoryID);
            string keycat = "CatID=" + categoryID.ToString();
            if (cache[keycat] == null)
            {
                DataTable dtCategory = new cmsArticleBL().SelectByCategoryIDMobile(categoryID,0);
                cache.Insert(keycat, dtCategory, null, DateTime.Now.AddSeconds(150), TimeSpan.Zero);
            }
            DataTable dtCacheCategory = (DataTable)cache[keycat];
            rptCategory.DataSource = dtCacheCategory;
            rptCategory.DataBind();

        }

        public string CheckAuth(string s)
        {
            if (string.IsNullOrEmpty(s)) return "Otofun";
            else return s;
        }
        public string FriendlyUrl(string s)
        {
            return Ultility.Change_AVCate(s);
        }
        public string WordCut(string text)
        {
            return Ultility.WordCut(text, 260, new char[] { ' ', '.', ',', ';' }) + "...";
        }
    }
}