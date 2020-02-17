using SISAA.Models;
using SISAA.Pages;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SISAA.Pages
{
    public partial class Site_Mobile : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String page = Path.GetFileName(Request.Url.AbsolutePath);

            var obj = Session["GlobalData"];

            if (!page.ToLower().Equals("login"))
            {
                if (obj == null)
                {
                    Response.Redirect("Login.aspx", false);
                    return;
                }
                if (String.IsNullOrEmpty(obj.ToString()))
                {
                    Response.Redirect("Login.aspx", false);
                    return;
                }

                //Define user nivel menu
                var body = (LoginResponse)Session["ResponseBody"];

                if (!body.Body.Nivel.ToLower().Equals("admin"))
                {
                    this.adminMenu.Visible = false;
                }
                else
                {
                    this.userMenu.Visible = false;
                }

                String script = "var GlobalUser = " + Session["GlobalData"].ToString() + "; ";
                script = script + "var GlobalBaseURL = '" + Session["BaseURL"].ToString() + "';";
                script = script + "var ID = '" + getID() + "';";
                script = script + "var CODE = '" + getCode() + "';";
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "script", script + ";", true);
            }
        }

        private String getID()
        {
            var ID = Request.QueryString["ID"];
            if (ID == null) return "";
            return ID.ToString();
        }

        private String getCode()
        {
            var CODE = Request.QueryString["CODE"];
            if (CODE == null) return "";
            return CODE.ToString();
        }
    }
}