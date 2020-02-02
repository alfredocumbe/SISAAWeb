using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SISAA
{
    public partial class SiteMaster : MasterPage
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
                String script = "var GlobalUser = " + Session["GlobalData"].ToString() + "; ";
                script = script + "var GlobalBaseURL = '" + Session["BaseURL"].ToString() + "';";
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "script", script + ";", true);
            }
        }
    }
}