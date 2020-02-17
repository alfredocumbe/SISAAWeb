using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SISAA.Models
{
    public class ChangePasswordRequest
    {
        public Header header { get; set; }
        public ChangePasswordRequestBody Body { get; set; }
    }
}