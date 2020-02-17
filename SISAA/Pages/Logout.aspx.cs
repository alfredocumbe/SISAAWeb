using Newtonsoft.Json.Linq;
using SISAA.Class;
using System;
using System.IO;
using System.Net;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI.WebControls;

namespace SISAA.Pages
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnRegist();
        }

        private void UnRegist()
        {
            Session["GlobalData"] = null;
            Session["BaseURL"] = null;

            Response.Redirect("Login", false);
        }

    }

   

}