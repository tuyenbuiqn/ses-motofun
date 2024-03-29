/*
  Copyright 2009 Smart Enterprise Solution Corp.
  Email: contact@ses.vn - Website: http://www.ses.vn
  KimNgan Project.
*/
using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Linq;
using SES.CMS.DAL;
using SES.CMS.DO;
using System.Collections.Generic;
using System.Reflection;
/// <summary>
/// Summary description for cmsArticleBL
/// </summary>
namespace SES.CMS.BL
{
    public class cmsArticleBL
    {
        #region Private Variables
        cmsArticleDAL objcmsArticleDAL;
        #endregion

        #region Public Constructors
        public cmsArticleBL()
        {
            //
            // TODO: Add constructor logic here
            //
            objcmsArticleDAL = new cmsArticleDAL();
        }
        #endregion

        #region Public Methods
        public int Insert(cmsArticleDO objcmsArticleDO)
        {
            return objcmsArticleDAL.Insert(objcmsArticleDO);
        }

        public int Update(cmsArticleDO objcmsArticleDO)
        {
            return objcmsArticleDAL.Update(objcmsArticleDO);

        }

        public int Delete(cmsArticleDO objcmsArticleDO)
        {
            return objcmsArticleDAL.Delete(objcmsArticleDO);

        }

        public int DeleteAll()
        {
            return objcmsArticleDAL.DeleteAll();
        }

        public cmsArticleDO Select(cmsArticleDO objcmsArticleDO)
        {
            return objcmsArticleDAL.Select(objcmsArticleDO);
        }

        public ArrayList SelectAll1()
        {
            return objcmsArticleDAL.SelectAll1();
        }

        public DataTable SelectAll()
        {
            return objcmsArticleDAL.SelectAll();
        }



        #endregion


        public DataTable SelectByCategoryID(int CategoryID)
        {
            return objcmsArticleDAL.SelectByCategoryID(CategoryID);
        }
        public DataTable SelectByCategoryID1(int categoryID)
        {
            return objcmsArticleDAL.SelectByCategoryID1(categoryID);
        }
        public DataTable SelectByCategoryID2(int categoryID)
        {
            return objcmsArticleDAL.SelectByCategoryID2(categoryID);
        }
        public DataTable SelectBySameCategory(int top, int categoryID)
        {
            return objcmsArticleDAL.SelectBySameCategory(top, categoryID);
        }
        public DataTable SelectByCatNum(int CategoryID, int Recordnumber)
        {
            return objcmsArticleDAL.SelectByCatNum(CategoryID, Recordnumber);
        }

        public DataTable SelectOne(cmsArticleDO objArt)
        {
            return objcmsArticleDAL.SelectOne(objArt);
        }
        public DataTable LastestNews()
        {
            return objcmsArticleDAL.LastestNews();
        }
        public DataTable MostRead()
        {
            return objcmsArticleDAL.MostRead();
        }
        public DataTable MostReadOfCategory(int categoryID)
        {
            return objcmsArticleDAL.MostReadOfCategory(categoryID);
        }
        public DataTable SelectToMainHomepageCate(int top, int categoryID, bool type)
        {
            return objcmsArticleDAL.SelectToMainHomepageCate(top, categoryID, type);
        }
        public DataTable SelectByPK(int articleID)
        {
            return objcmsArticleDAL.SelectByPK(articleID);
        }
        public DataTable SelectDanhMucNoiBat(int type)
        {
            return objcmsArticleDAL.SelectDanhMucNoiBat(type);
        }
        public DataTable HotEvents(int categoryID)
        {
            return objcmsArticleDAL.HotEvents(categoryID);
        }
        public DataTable Events()
        { return objcmsArticleDAL.Events(); }
        public DataTable NewArticles()
        { return objcmsArticleDAL.NewArticles(); }
        public DataTable SelectAllEventArticle(int eventID)
        {
            return objcmsArticleDAL.SelectAllEventArticle(eventID);
        }
        public void XetDuyetNhieuBaiViet(string articleIDList, bool isAccepted, int userXetDuyet)
        {
            objcmsArticleDAL.XetDuyetNhieuBaiViet(articleIDList, isAccepted, userXetDuyet);
        }
        public DataTable ArticleXetDuyet_Filter(int categoryID, int isAccepted, int userID)
        {
            return objcmsArticleDAL.ArticleXetDuyet_Filter(categoryID, isAccepted, userID);
        }
        public DataTable SelectByTag(string tag)
        {
            return objcmsArticleDAL.SelectByTag(tag);
        }
        public DataTable HotArticle_UnderSlideHomepage()
        {
            return objcmsArticleDAL.HotArticle_UnderSlideHomepage();
        }

        public DataTable SelectByCatType(int type)
        {
            return objcmsArticleDAL.SelectByCatType(type);
        }

        public DataTable SelectHomeNews(int CategoryID)
        {
            return objcmsArticleDAL.SelectHomeNews(CategoryID);
        }
        public DataTable SelectTopHomeNews(int CategoryID, int top)
        {
            return objcmsArticleDAL.SelectTopHomeNews(CategoryID, top);
        }
        public DataTable GetTinLienQuan1(int articleID)
        {
            return objcmsArticleDAL.GetTinLienQuan1(articleID);

        }
        public DataTable GetTinLienQuan2(int articleID)
        {
            return objcmsArticleDAL.GetTinLienQuan2(articleID);
        }
        public DataTable SelectTop20NewArticles(DateTime today)
        {
            return objcmsArticleDAL.SelectTop20NewArticles(today);
        }
        public DataTable SelectTop20NewArticlesAndCate(DateTime today, int categoryID)
        {
            return objcmsArticleDAL.SelectTop20NewArticlesAndCate(today, categoryID);
        }
        public DataTable Article_Search(string lstCategoryID, DateTime ArticleSearchDateStart, DateTime ArticleSearchDateEnd, string Keyw)
        {
            return objcmsArticleDAL.Article_Search(lstCategoryID, ArticleSearchDateStart, ArticleSearchDateEnd, Keyw);
        }

        public DataTable Article_SearchAdvanced(string lstCategoryID, DateTime ArticleSearchDateStart, DateTime ArticleSearchDateEnd, string Keyw, string ListStatus, string PvCreate, string BtvEdit, string TkApproved)
        {
            return objcmsArticleDAL.Article_SearchAdvanced(lstCategoryID, ArticleSearchDateStart, ArticleSearchDateEnd, Keyw, ListStatus, PvCreate, BtvEdit, TkApproved);
        }

        public DataTable GetMultiID(string StrArticleID)
        {
            return objcmsArticleDAL.GetMultiID(StrArticleID);
        }

        public List<cmsArticleDO> GetListMultiID(string StrArticleID)
        {
            return ConvertTo<cmsArticleDO>(GetMultiID(StrArticleID));
        }

        public List<T> ConvertTo<T>(DataTable datatable) where T : new()
        {
            List<T> Temp = new List<T>();
            try
            {
                List<string> columnsNames = new List<string>();
                foreach (DataColumn DataColumn in datatable.Columns)
                    columnsNames.Add(DataColumn.ColumnName);
                Temp = datatable.AsEnumerable().ToList().ConvertAll<T>(row => getObject<T>(row, columnsNames));
                return Temp;
            }
            catch
            {
                return Temp;
            }

        }
        public T getObject<T>(DataRow row, List<string> columnsName) where T : new()
        {
            T obj = new T();
            try
            {
                string columnname = "";
                string value = "";
                PropertyInfo[] Properties;
                Properties = typeof(T).GetProperties();
                foreach (PropertyInfo objProperty in Properties)
                {
                    columnname = columnsName.Find(name => name.ToLower() == objProperty.Name.ToLower());
                    if (!string.IsNullOrEmpty(columnname))
                    {
                        value = row[columnname].ToString();
                        if (!string.IsNullOrEmpty(value))
                        {
                            if (Nullable.GetUnderlyingType(objProperty.PropertyType) != null)
                            {
                                value = row[columnname].ToString().Replace("$", "").Replace(",", "");
                                objProperty.SetValue(obj, Convert.ChangeType(value, Type.GetType(Nullable.GetUnderlyingType(objProperty.PropertyType).ToString())), null);
                            }
                            else
                            {
                                value = row[columnname].ToString().Replace("%", "");
                                objProperty.SetValue(obj, Convert.ChangeType(value, Type.GetType(objProperty.PropertyType.ToString())), null);
                            }
                        }
                    }
                }
                return obj;
            }
            catch
            {
                return obj;
            }
        }
        public DataTable SelectByTrangThaiAndUserCreate(int trangThai, int userCreate,int cate)
        {
            return objcmsArticleDAL.SelectByTrangThaiAndUserCreate(trangThai, userCreate,cate);
        }
        public DataTable SelectByTrangThaiAndUserCreateBTV(int trangThai, int userCreate, int cate, int btvID)
        {
            return objcmsArticleDAL.SelectByTrangThaiAndUserCreateBTV(trangThai, userCreate, cate, btvID);
        }
        public void ChuyenTrangThai_ThuKy(int type, string articleIDList, int trangThai, int thuKyID, int thuKyEdit, DateTime thoiGianXuatBan,bool isPublish)
        {
            objcmsArticleDAL.ChuyenTrangThai_ThuKy(type, articleIDList, trangThai, thuKyID, thuKyEdit, thoiGianXuatBan,isPublish);
        }
        public void ChuyenTrangThai_BienTapVien(string articleIDList, int trangThai, int bienTapVienID, DateTime thoiGianGuiXuatBan)
        {
            objcmsArticleDAL.ChuyenTrangThai_BienTapVien(articleIDList, trangThai, bienTapVienID, thoiGianGuiXuatBan);
        }
        
        public void ChuyenTrangThai_PhongVien(string articleIDList, int trangThai, DateTime thoiGianGuiBienTap)
        {
            objcmsArticleDAL.ChuyenTrangThai_PhongVien(articleIDList, trangThai, thoiGianGuiBienTap);
        }

        public void MultiDelete(string articleIDList)
        {
            objcmsArticleDAL.MultiDelete(articleIDList);
        }
        public void DangKyChiuTrachNhiemBaiViet(int type, string articleIDList, int userID)
        {
            objcmsArticleDAL.DangKyChiuTrachNhiemBaiViet(type, articleIDList, userID);
        }


        public int SelectSumCat(int categoryID)
        {
            return objcmsArticleDAL.SelectSumCat(categoryID);
        }

        public DataTable SelectPaging(int categoryID, int PageID, int PageSize)
        {
            return objcmsArticleDAL.SelectPaging(categoryID,PageID,PageSize);
        }
        public DataTable SelectPagingTagOrSearch(string tagOrSearchKey, int PageID, int PageSize)
        {
            return objcmsArticleDAL.SelectPagingTagOrSearch(tagOrSearchKey, PageID, PageSize);
        }
        public void AutoPublish()
        {
            objcmsArticleDAL.AutoPublish();
        }
        public int SelectSumTag(string tag)
        {
            return objcmsArticleDAL.SelectSumTag(tag);
        }

        public DataTable selectURLArt(int p)
        {
            return objcmsArticleDAL.selectURLArt(p);
        }
        public DataTable SelectByCategoryIDMobile(int categoryID, int top)
        {
            return objcmsArticleDAL.SelectByCategoryIDMobile(categoryID, top);
                
        }
    }

}
