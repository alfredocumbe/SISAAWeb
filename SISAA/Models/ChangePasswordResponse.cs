﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SISAA.Models
{
    public class ChangePasswordResponse
    {
        public Header header { get; set; }
        public ChangePasswordResponseBody Body { get; set; }
    }
}