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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
               
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                if (sigin())
                {
                    Response.Redirect("Default", false);
                    return;
                }
                else
                {
                    this.passwordHelp.InnerText = "Os dados de autenticação estão incorretos!";
                }
            }catch(Exception ex)
            {
                this.passwordHelp.InnerText = "O Sistema não conseguiu autenticar suas credencias, por favor contacte a Equipa técnica!";
                Log4NetFactory.buildLogger().Error("Login:", ex);
            }
        }
        private bool sigin()
        {
            try
            {
                String username = txtUsername.Text;
                String password = txtPassword.Text;

                var data = new RequestBody
                {
                    header = new Header
                    {
                        System = "WEB",
                        Token = ""
                    },
                    Body = new LoginRequest
                    {
                        Username = username,
                        Password = password
                    }
                };

                var jsonData = new JavaScriptSerializer().Serialize(data);

                String BaseURL = "http://localhost/SISAAWS/";

                String rs = PostRequest(url: BaseURL + "api/User/Login", json: jsonData);

                JObject jObject = JObject.Parse(rs);

                if (jObject == null) return false;
                if (jObject["header"]["code"] == null) return false;
                if (!jObject["header"]["code"].ToString().Equals("200")) return false;

                var responseBody = toResponseBody(jObj: jObject);

                Regist(rsBody: responseBody, BaseURL: BaseURL);

                return true;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void Regist(ResponseBody rsBody, String BaseURL)
        {
            String rs = new JavaScriptSerializer().Serialize(rsBody);
            Session["GlobalData"] = rs;
            Session["BaseURL"] = BaseURL;
        }

        private ResponseBody toResponseBody(JObject jObj)
        {
            return new ResponseBody()
            {
                header = new Header
                {
                     AccountID = new Guid(jObj["body"]["accountID"].ToString()),
                     System = "WEB",
                     Token = HttpContext.Current.Session.SessionID,
                     UserID = new Guid(jObj["body"]["userID"].ToString())
                },
                Body = new LoginResponse() 
                {  
                    Name = jObj["body"]["name"].ToString(),
                    UserName = jObj["body"]["userName"].ToString()
                }
            };
        }

        private static string PostRequest(string url, String json)
        {
            var result = "";
            HttpWebRequest httpWebRequest = (HttpWebRequest)WebRequest.Create(url);
            httpWebRequest.ContentType = "application/json; charset=utf-8";
            httpWebRequest.Method = "POST";

            using (var streamWriter = new StreamWriter(httpWebRequest.GetRequestStream()))
            {
                streamWriter.Write(json);
                streamWriter.Flush();
                streamWriter.Close();
            }
            try
            {
                using (var response = httpWebRequest.GetResponse() as HttpWebResponse)
                {
                    if (httpWebRequest.HaveResponse && response != null)
                    {
                        using (var reader = new StreamReader(response.GetResponseStream()))
                        {
                            result = reader.ReadToEnd();
                        }
                    }
                }
            }
            catch (WebException e)
            {
                if (e.Response != null)
                {
                    using (var errorResponse = (HttpWebResponse)e.Response)
                    {
                        using (var reader = new StreamReader(errorResponse.GetResponseStream()))
                        {
                            string error = reader.ReadToEnd();
                            result = error;
                        }
                    }

                }
            }

            return result;

        }
    }

    public class Header
    {
        public Guid UserID { get; set; }
        public Guid AccountID { get; set; }
        public String System { get; set; }
        public String Token { get; set; }

    }

    public class LoginRequest
    {
        public String Username { get; set; }
        public String Password { get; set; }
    }

    public class LoginResponse
    {
        public String Name { get; set; }
        public String UserName { get; set; }
    }

    public class RequestBody
    {
        public Header header { get; set; }
        public LoginRequest Body { get; set; }
    }

    public class ResponseBody
    {
        public Header header { get; set; }
        public LoginResponse Body { get; set; }

    }
}