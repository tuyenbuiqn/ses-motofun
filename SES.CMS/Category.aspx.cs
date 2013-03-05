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
            //string keycat = "CatID=" + categoryID.ToString();
            //if (cache[keycat] == null)
            //{
            //    DataTable dtCategory = new cmsArticleBL().SelectByCategoryIDMobile(categoryID,0);
            //    cache.Insert(keycat, dtCategory, null, DateTime.Now.AddSeconds(150), TimeSpan.Zero);
            //}
            //DataTable dtCacheCategory = (DataTable)cache[keycat];
            //rptCategory.DataSource = dtCacheCategory;
            //rptCategory.DataBind();
            int PageID = 0;
            if (!string.IsNullOrEmpty(Request.QueryString["Page"]))
                PageID = int.Parse(Request.QueryString["Page"]);

            int PageSize = 10;

            hplNextPage.NavigateUrl = "/" + Ultility.Change_AVCate(new cmsCategoryBL().Select(new cmsCategoryDO { CategoryID = categoryID }).Title) + "-" + categoryID.ToString() + "-Trang-" + (PageID + 1).ToString() + ".ofn";
            if (PageID > 0)
            {
                if (PageID > 1)
                    hplPrevPage.NavigateUrl = "/" + Ultility.Change_AVCate(new cmsCategoryBL().Select(new cmsCategoryDO { CategoryID = categoryID }).Title) + "-" + categoryID.ToString() + "-Trang-" + (PageID - 1).ToString() + ".ofn";
                else
                    hplPrevPage.NavigateUrl = "/" + Ultility.Change_AVCate(new cmsCategoryBL().Select(new cmsCategoryDO { CategoryID = categoryID }).Title) + "-" + categoryID.ToString() + ".ofn";

            }
            else
                hplPrevPage.Visible = false;
            int PageID2 = PageID;
            PageID = PageSize * PageID;


            string keycatpage = categoryID.ToString() + "-" + PageID.ToString();
            int SumcountCat = new cmsArticleBL().SelectSumCat(categoryID);

            if ((PageID + PageSize) >= SumcountCat) hplNextPage.Visible = false;
            if (SumcountCat == 0) return;
            string keycount = categoryID.ToString() + "-" + SumcountCat.ToString();
            if (cache[keycount] == null) //Nếu null thì thêm
            {

                cache.Insert(keycount, keycount, null, DateTime.Now.AddSeconds(150), TimeSpan.Zero);

            }

            if (cache[keycount].ToString() != keycount) //Nếu không null thì kiểm tra xem có trùng tổng không. nếu không trùng thì xóa + ghi bản ghi mới
            {
                cache.Remove(keycount);
                cache.Insert(keycount, keycount, null, DateTime.Now.AddSeconds(150), TimeSpan.Zero);

                cache.Remove(keycatpage);
                DataTable dtPage = new cmsArticleBL().SelectPaging(categoryID, PageID, PageSize);
                cache.Insert(keycatpage, dtPage, null, DateTime.Now.AddSeconds(150), TimeSpan.Zero);

            }
            else
            {

                if (cache[keycatpage] == null)
                {
                    DataTable dtPage = new cmsArticleBL().SelectPaging(categoryID, PageID, PageSize);
                    cache.Insert(keycatpage, dtPage, null, DateTime.Now.AddSeconds(150), TimeSpan.Zero);
                }
            }
            //Nếu trùng tổng kiểm tra xem có cache trang chưa


            rptCategory.DataSource = (DataTable)cache[keycatpage];

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