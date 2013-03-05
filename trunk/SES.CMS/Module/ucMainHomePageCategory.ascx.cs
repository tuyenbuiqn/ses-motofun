using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SES.CMS.DO;
using SES.CMS.BL;
using System.Data;
using System.Web.Caching;

namespace SES.CMS.Module
{
    public partial class ucMainHomePageCategory : System.Web.UI.UserControl
    {
        private Cache cache = HttpContext.Current.Cache;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                rptCategoryParentDataSource();
        }
        protected void rptCategoryParentDataSource()
        {
            //  DataTable dtCateParent = new cmsCategoryBL().SelectAll();

            if (cache["DataTables"] == null)
            {
                DataTable dtCache = new DataView(new cmsCategoryBL().SelectAll(), " IsHomPage = 1 and IsPublish = 1 and ParentID = 0", " OrderID ASC", DataViewRowState.CurrentRows).ToTable();
                cache.Insert("DataTables", dtCache, null, DateTime.Now.AddSeconds(150), TimeSpan.Zero);
            }
            rptCategoryParent.DataSource = (DataTable)cache["DataTables"];
            rptCategoryParent.DataBind();

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
        protected void rptCategoryParent_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            cmsCategoryBL cateBL = new cmsCategoryBL();
            cmsArticleBL artBL = new cmsArticleBL();
            RepeaterItem item = e.Item;
            if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView drv = (DataRowView)item.DataItem;

                int categoryID = int.Parse(drv["CategoryID"].ToString());

                //cache top hightlight
                string keyCacheTopHightLight = "TopHightLightM=" + categoryID;
                if (cache[keyCacheTopHightLight] == null)
                {
                    DataTable dtTopHighLight = artBL.SelectByCategoryIDMobile(categoryID,1);
                        //artBL.SelectHomeNews(categoryID);
                    cache.Insert(keyCacheTopHightLight, dtTopHighLight, null, DateTime.Now.AddSeconds(150), TimeSpan.Zero);
                }
                DataTable dtCacheTopHight = (DataTable)cache[keyCacheTopHightLight];
                Repeater rptTopHighLight = (Repeater)item.FindControl("rptTopHighLight");
                rptTopHighLight.DataSource = dtCacheTopHight;
                rptTopHighLight.DataBind();
                //DataTable dtCacheTopHight = (DataTable)cache[keyCacheTopHightLight];
                //int topArtID = 0;
                //if (dtCacheTopHight.Rows.Count > 0)
                //    topArtID = int.Parse(dtCacheTopHight.Rows[0]["ArticleID"].ToString());
                //Repeater rptTopHighLight = (Repeater)item.FindControl("rptTopHighLight");
                //rptTopHighLight.DataSource = new DataView(dtCacheTopHight, "ArticleID=" + topArtID.ToString(), "", DataViewRowState.CurrentRows).ToTable();
                //rptTopHighLight.DataBind();

                //string keyCacheOther = "Other=" + categoryID;
                //if (cache[keyCacheOther] == null)
                //{
                //    DataTable dtTopOtherHighLight = new DataView(dtCacheTopHight, "ArticleID <> " + topArtID.ToString(), "", DataViewRowState.CurrentRows).ToTable();
                //    cache.Insert(keyCacheOther, dtTopOtherHighLight, null, DateTime.Now.AddSeconds(150), TimeSpan.Zero);
                //}
                //Repeater rptTopOtherHighLight = (Repeater)item.FindControl("rptTopOtherHighLight");
                //rptTopOtherHighLight.DataSource = (DataTable)cache[keyCacheOther];
                //rptTopOtherHighLight.DataBind();
            }
        }

        public string WordCut(string text)
        {
            return Ultility.WordCut(text, 250, new char[] { ' ', '.', ',', ';' }) + "...";

        }
        public string WordCutArticle(string text)
        {
            return Ultility.WordCut(text, 35, new char[] { ' ', '.', ',', ';' }) + "...";

        }
    }
}