using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using log4net;

namespace SISAA.Class
{
    public class Log4NetFactory
    {
        private static ILog logger = null;

        public static ILog buildLogger()
        {
            if(logger == null)
            {
                logger = log4net.LogManager.GetLogger("SISAAWEB");
            }
            return logger;
        }
    }
}