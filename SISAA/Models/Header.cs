using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SISAA.Models
{
    public class Header
    {
        public Guid UserID { get; set; }
        public Guid AccountID { get; set; }
        public String System { get; set; }
        public String Token { get; set; }
    }
}