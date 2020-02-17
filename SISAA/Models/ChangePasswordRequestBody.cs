using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SISAA.Models
{
    public class ChangePasswordRequestBody
    {
        public String Username { get; set; }
        public String OldPassword { get; set; }
        public String newPassword { get; set; }
        public String ConfirmPassword { get; set; }
    }
}