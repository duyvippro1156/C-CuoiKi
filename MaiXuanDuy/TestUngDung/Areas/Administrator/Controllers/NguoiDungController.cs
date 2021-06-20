using ModelEF.DAO;
using ModelEF.Model;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TestUngDung.Areas.Administrator.Controllers
{
    public class NguoiDungController : Controller
    {
        // GET: Administrator/NguoiDung
        MaiXuanDuyContext dbua = new MaiXuanDuyContext();
        AdminDAO aDB = new AdminDAO();
        //
        [HandleError]
        public ActionResult Index(string error, string name, int page = 1, int pagesize = 5)
        {
            if (Session["accname"] == null)
            {
                Session["accname"] = null;
                return RedirectToAction("Login", "Account");
            }
            else
            {
                ViewBag.ProError = error;
                var model = aDB.LayUserAccount();
                if (!string.IsNullOrEmpty(name))
                {
                    model = aDB.TimUserAccount(name);
                }
                return View(model.ToPagedList(page, pagesize));
            }
        }

        [HandleError]
        [HttpGet]
        public ActionResult Edit(int id)
        {
            if (Session["accname"] == null)
            {
                Session["accname"] = null;
                return RedirectToAction("Login", "Account");
            }
            else
            {
                var model = dbua.UserAccounts.SingleOrDefault(c => c.Id.Equals(id));
                return View(model);
            }
        }
       
        [HandleError]
        [HttpPost]
        public ActionResult Edit(UserAccount editUA)
        {
            if (Session["accname"] == null)
            {
                Session["accname"] = null;
                return RedirectToAction("Login", "Account");
            }
            else
            {
                ViewBag.cateListEdit = new SelectList(dbua.UserAccounts, "Id", "Status");
                try
                {
                    if (ModelState.IsValid)
                    {
                        //dbType.Entry(editType).State = System.Data.Entity.EntityState.Modified;
                        //dbType.SaveChanges();
                        aDB.SuaUserAccount(editUA);
                        ViewBag.EditTypeError = "Cập nhật UserAccount thành công.";
                    }
                }
                catch (Exception)
                {
                    ViewBag.EditTypeError = "Không thể cập nhật UserAccount.";
                }
                return View();
            }
        }

        [HandleError]
        public ActionResult Delete(int id, string status)
        {
            if (Session["accname"] == null)
            {
                Session["accname"] = null;
                return RedirectToAction("Login", "Account");
            }
            else
            {
                var model = dbua.UserAccounts.SingleOrDefault(h => h.Id.Equals(id));
                try
                {
                    if (model != null)
                    {                   
                        aDB.XoaUserAccount(id);
                        return RedirectToAction("Index", "NguoiDung", new { error = "Xoá UserAccounts thành công." });                            
                    }
                    else
                    {
                        return RedirectToAction("Index", "NguoiDung", new { error = "UserAccounts không tồn tại." });
                    }
                }
                catch (Exception)
                {
                    return RedirectToAction("Index", "NguoiDung", new { error = "Không thể xoá UserAccounts." });
                }

            }
        }
    }
}