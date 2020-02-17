using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SISAA.Models
{
    public class ForgotPasswordRequestBody
    {
        public String Username { get; set; }
        public String CellPhone { get; set; }
    }
}