using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.SharePoint;
using System.IO;

namespace HSPS
{
    public class Services
    {
        public static SPWeb Web { get; set; }
        public static HSPSSolution CurrentInstallation { get; set; }
        public static DirectoryInfo LocalDirectory { get; set; }

        public static void SetVariable(string variableName, object value)
        {
            CurrentInstallation.Variables[variableName].Value = value;
        }

        public static object Evaluate(object rValue)
        {
            object ret;
            if (rValue is string)
            {
                if (((string)rValue).StartsWith("$"))
                    ret = CurrentInstallation.Variables[(string)rValue].Value;
                else
                    ret = rValue;
            }
            else
                ret = rValue;
            return ret;
        }
    }
}
