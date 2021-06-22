using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ModelEF.Model;

namespace TestUngDung.Areas.Administrator.Controllers
{
    public class AccountController : Controller
    {
        MaiXuanDuyContext dbLog = new MaiXuanDuyContext();
        Repository.ShopDAO dao = new Repository.ShopDAO();
        // GET: Administrator/Account
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken()]
        public ActionResult Login(UserAccount adLogin)
        {
            try
            {
                var model = dbLog.UserAccounts.SingleOrDefault(a => a.TaiKhoan.Equals(adLogin.TaiKhoan));
                if (model != null)
                {
                    if (!model.Status.Equals("Blocked"))
                    {
                        if (model.MatKhau.Equals(dao.Encrypt(adLogin.MatKhau)))
                        {
                            Session["accname"] = model.TaiKhoan;
                            return RedirectToAction("Index", "Home");
                        }
                        else
                        {
                            Session["accname"] = null;
                            ViewBag.LoginError = "Sai tài khoản hoặc mật khẩu.";
                        }
                    }
                    else
                    {
                        Session["accname"] = null;
                        ViewBag.LoginError = "Tài khoản Blocked";
                    }
                }
                else
                {
                    Session["accname"] = null;
                    ViewBag.LoginError="Sai tài khoản hoặc mật khẩu.";
                }
            }
            catch (Exception)
            {
                Session["accname"] = null;
                ViewBag.LoginError = "Sai tài khoản hoặc mật khẩu.";
            }
            return View();
        }

        public ActionResult Logout()
        {
            System.Web.Security.FormsAuthentication.SignOut();
            Session["accname"] = null;
            return RedirectToAction("Login", "Account");
        }
    }
}