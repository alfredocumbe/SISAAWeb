using SISAA.Models;
using SISAA.Pages;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SISAA.Pages
{
    public partial class ListGroups : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var body = (LoginResponse)Session["ResponseBody"];
            if (body == null)
            {
                this.Response.Redirect("Login", false);
                return;
            }
            if (body.Body == null)
            {
                this.Response.Redirect("Login", false);
                return;
            }
            if (body.Body.Nivel == null)
            {
                this.Response.Redirect("Login", false);
                return;
            }

            if (!body.Body.Nivel.ToLower().Equals("admin"))
            {
                this.Response.Redirect("Default", false);
                return;
            }
        }
    }
}