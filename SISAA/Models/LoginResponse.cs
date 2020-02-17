using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SISAA.Models
{
    public class LoginResponse
    {
        public Header header { get; set; }
        public LoginResponseBody Body { get; set; }
    }
}