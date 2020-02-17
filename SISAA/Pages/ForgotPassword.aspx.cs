using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json.Linq;
using SISAA.Class;
using SISAA.Models;

namespace SISAA.Pages
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnForgotPassword_Click(object sender, EventArgs e)
        {
            try
            {
                try
                {
                    this.passwordHelpDanger.InnerText = "";
                    this.passwordHelpSucess.InnerText = "";

                    String userName = this.txtUsername.Text;
                    String cellphone = this.txtCellPhone.Text.Replace(" ", "").Replace("(", "").Replace(")", "").Replace("-", "").Trim();
                    JObject json = requestForgotPassword(userName: userName, cellphone: cellphone);

                    bool isChaged = (bool)json["body"];

                    if (isChaged)
                    {
                        this.passwordHelpSucess.InnerText = "O seu pedido foi submetido. Senha será enviada por SMS";
                        this.txtUsername.Enabled = false;
                        this.txtCellPhone.Enabled = false;
                        this.btnForgotPassword.Enabled = false;
                    }
                    else
                    {
                        this.passwordHelpDanger.InnerText = "Erro: O seu pedido foi recusado!";
                    }
                }
                catch (Exception ex)
                {
                    this.passwordHelpDanger.InnerText = ex.ToString();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private JObject requestForgotPassword(String userName, String cellphone)
        {
            try
            {
                var data = new ForgotPasswordRequest
                {
                    header = new Header
                    {
                        System = "WEB",
                        Token = ""
                    },
                    Body = new ForgotPasswordRequestBody
                    {
                        Username = userName,
                        CellPhone = cellphone
                    }
                };
                var jsonData = new JavaScriptSerializer().Serialize(data);
                String rs = Common.PostRequest(url: Properties.Settings.Default.BaseURL + "api/User/ForgotPassword", json: jsonData);
                return JObject.Parse(rs);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}