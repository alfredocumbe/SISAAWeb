using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SISAA.Models
{
    public class LoginRequest
    {
        public Header header { get; set; }
        public LoginRequestBody Body { get; set; }
    }
}