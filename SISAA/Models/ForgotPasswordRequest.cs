using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SISAA.Models
{
    public class ForgotPasswordRequest
    {
        public Header header { get; set; }
        public ForgotPasswordRequestBody Body { get; set; }
    }
}