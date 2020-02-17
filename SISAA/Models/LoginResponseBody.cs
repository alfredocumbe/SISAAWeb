using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SISAA.Models
{
    public class LoginResponseBody
    {
        public String Name { get; set; }
        public String UserName { get; set; }
        public String Nivel { get; set; }
        public bool isFirstLogin { get; set; }
    }
}