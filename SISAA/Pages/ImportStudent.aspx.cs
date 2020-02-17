using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SISAA.Models;

namespace SISAA.Pages
{
    public partial class ImportStudent : System.Web.UI.Page
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
            if (!body.Body.Nivel.ToLower().Equals("default"))
            {
                this.Response.Redirect("Default", false);
                return;
            }
        }
    }
}