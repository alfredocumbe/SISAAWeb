using Newtonsoft.Json.Linq;
using SISAA.Class;
using SISAA.Models;
using System;
using System.IO;
using System.Net;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI.WebControls;

namespace SISAA.Pages
{

    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                JObject json = sigin();

                if (json == null)
                {
                    this.passwordHelp.InnerText = "Os dados de autenticação estão incorretos!";
                    return;
                }

                if (json["header"]["code"] == null)
                {
                    this.passwordHelp.InnerText = "Os dados de autenticação estão incorretos!";
                    return;
                }

                if (json["header"]["code"].ToString().Equals("200"))
                {
                    //Regist user data in logn session variables
                    var response = toResponseBody(jObj: json);
                    Regist(rsBody: response, BaseURL: Properties.Settings.Default.BaseURL);

                    if (response.Body.isFirstLogin)
                    {
                        Response.Redirect("ChangePassword", false);
                        return;
                    }
                    else
                    {
                        if (response.Body.Nivel.ToLower().Equals("admin"))
                        {
                            Response.Redirect("Home", false);
                            return;
                        }
                        else
                        {
                            Response.Redirect("Default", false);
                            return;
                        }
                    }
                }
                else
                {
                    this.passwordHelp.InnerText = "Os dados de autenticação estão incorretos!";
                }
            }
            catch (Exception ex)
            {
                this.passwordHelp.InnerText = "O Sistema não conseguiu autenticar suas credencias, por favor contacte a Equipa técnica!" + ex.ToString();
                Log4NetFactory.buildLogger().Error("Login:", ex);
            }
        }

        private JObject sigin()
        {
            try
            {
                String username = txtUsername.Text;
                String password = txtPassword.Text;

                var data = new LoginRequest
                {
                    header = new Header
                    {
                        System = "WEB",
                        Token = ""
                    },
                    Body = new LoginRequestBody
                    {
                        Username = username,
                        Password = password
                    }
                };

                var jsonData = new JavaScriptSerializer().Serialize(data);

                String rs = Common.PostRequest(url: Properties.Settings.Default.BaseURL + "api/User/Login", json: jsonData);

                return JObject.Parse(rs);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void Regist(LoginResponse rsBody, String BaseURL)
        {
            Session["ResponseBody"] = rsBody;
            String rs = new JavaScriptSerializer().Serialize(rsBody);
            Session["GlobalData"] = rs;
            Session["BaseURL"] = BaseURL;
        }

        private LoginResponse toResponseBody(JObject jObj)
        {
            return new LoginResponse()
            {
                header = new Header
                {
                    AccountID = new Guid(jObj["body"]["accountID"].ToString()),
                    System = "WEB",
                    Token = HttpContext.Current.Session.SessionID,
                    UserID = new Guid(jObj["body"]["userID"].ToString())
                },
                Body = new LoginResponseBody()
                {
                    Name = jObj["body"]["name"].ToString(),
                    UserName = jObj["body"]["userName"].ToString(),
                    Nivel = jObj["body"]["nivel"].ToString(),
                    isFirstLogin = (bool)jObj["body"]["isFirstLogin"]
                }
            };
        }
    }

}