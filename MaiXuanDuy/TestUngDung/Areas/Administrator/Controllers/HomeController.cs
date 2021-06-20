using ModelEF.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
namespace TestUngDung.Areas.Administrator.Controllers
{
    public class HomeController : Controller
    {
        MaiXuanDuyContext dbLog = new MaiXuanDuyContext();
        Repository.ShopDAO dao = new Repository.ShopDAO();
        [HandleError]
        public ActionResult Index()
        {
            if (Session["accname"]==null)
            {
                Session["accname"] = null;
                return RedirectToAction("Login", "Account");
            }
            else
            {              
                return View();
            }
        }
	}
}