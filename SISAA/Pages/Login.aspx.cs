using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
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
            String username = txtUsername.Text;
            String password = txtUsername.Text;


            var data = new RequestBody
            {
                header = new HeaderRequest
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

            String rs = PostRequest(url: "http://192.168.88.166/SISAAWS/api/User/Login", json: jsonData);

            JObject jObject = JObject.Parse(rs);

            var obj = jObject["body"]["name"];

            var aaa=1;
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

    public class HeaderRequest
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

    public class RequestBody
    {
        public HeaderRequest header { get; set; }
        public LoginRequest Body { get; set; }
    }
}