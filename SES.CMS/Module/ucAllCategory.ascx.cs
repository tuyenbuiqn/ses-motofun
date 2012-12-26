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
    public partial class ucAllCategory : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            rptAllCateDataSource();
        }

        protected void rptAllCateDataSource()
        {
            DataTable dtCate = new cmsCategoryBL().SelectAll();
            rptAllCate.DataSource = new DataView(dtCate, " ParentID = 0", "", DataViewRowState.CurrentRows);
            rptAllCate.DataBind();
        }
        public string FriendlyUrl(string s)
        {
            return Ultility.Change_AVCate(s);
        }
    }
}