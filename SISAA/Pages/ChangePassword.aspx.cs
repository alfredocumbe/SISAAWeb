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
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.IsPostBack)
            {

            }
        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            try
            {
                this.passwordHelpDanger.InnerText = "";
                this.passwordHelpSucess.InnerText = "";

                String oldPassword = this.txtOldPassword.Value;
                String newPassword = this.txtNewPassword.Value;
                String confirmPassword = this.txtConfirmPassword.Value;

                String validation = validPassword(oldPassword: oldPassword, newPassword: newPassword, confirmPassword: confirmPassword);

                if (String.IsNullOrEmpty(validation))
                {
                    JObject json = requestChangePassword(oldPassword: oldPassword, newPassword: newPassword, confirmPassword: confirmPassword);

                    bool isChaged = (bool)json["body"];

                    if (isChaged)
                    {
                        this.passwordHelpSucess.InnerText = "A sua senha foi alterada com sucesso";
                        this.txtOldPassword.Disabled = true;
                        this.txtNewPassword.Disabled = true;
                        this.txtConfirmPassword.Disabled = true;
                        this.btnChangePassword.Enabled = false;
                    }
                    else
                    {
                        this.passwordHelpDanger.InnerText = "Erro: O seu pedido foi recusado";
                    }
                }
                else
                {
                    this.passwordHelpDanger.InnerText = validation;
                }
            }
            catch (Exception ex)
            {
                this.passwordHelpDanger.InnerText = ex.ToString();
            }
        }

        private String validPassword(String oldPassword, String newPassword, String confirmPassword)
        {

            if (!newPassword.Equals(confirmPassword))
            {
                return "Password not Match";
            }

            if (oldPassword.Equals(newPassword))
            {
                return "Can not change password to an old password";
            }

            if (newPassword.Length < 8)
            {
                return "Your password must be between 8 and 30 characters";
            }

            if (newPassword.Length > 30)
            {
                return "Your password must be between 8 and 30 characters";
            }

            return "";
        }

        private JObject requestChangePassword(String oldPassword, String newPassword, String confirmPassword)
        {
            try
            {

                LoginResponse loginResponse = (LoginResponse)Session["ResponseBody"];

                var data = new ChangePasswordRequest
                {
                    header = new Header
                    {
                        System = "WEB",
                        Token = ""
                    },
                    Body = new ChangePasswordRequestBody
                    {
                        OldPassword = oldPassword,
                        newPassword = newPassword,
                        ConfirmPassword = confirmPassword,
                        Username = loginResponse.Body.UserName
                    }
                };
                var jsonData = new JavaScriptSerializer().Serialize(data);
                String rs = Common.PostRequest(url: Properties.Settings.Default.BaseURL + "api/User/ChangeUserPassword", json: jsonData);
                return JObject.Parse(rs);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }

}