using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SISAA.Pages
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Headers["X-Requested-With"] == "XMLHttpRequest")
            {
                Response.Clear(); // dont want <html>.... etc stuff
                Response.Write("Hi from AJAX!");
            }
            else
            {
                // normal page stuff
            }

            string[] keys = Request.Form.AllKeys;
            for (int i = 0; i < keys.Length; i++)
            {
                Response.Write(keys[i] + ": " + Request.Form[keys[i]] + "<br>");
            }

        }



        [WebMethod]
        public static string doSomething(int id)
        {
            return "Teste";
        }
    }
}