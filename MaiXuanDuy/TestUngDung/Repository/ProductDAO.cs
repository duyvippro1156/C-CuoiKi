using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TestUngDung.Repository
{
    public class ProductDAO
    {
        public string formatNumber(Decimal strNum)
        {
            string newNum = String.Format("{0:0,0}", (strNum));
            return newNum;
        }
    }
}