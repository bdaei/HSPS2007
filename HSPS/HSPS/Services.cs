using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.SharePoint;

namespace HSPS
{
    public class Services
    {
        public static SPWeb Web { get; set; }
        public static HSPSSolution CurrentInstallation { get; set; }
        public static void SetVariable(string variableName, object value)
        {
            CurrentInstallation.Variables[variableName].Value = value;
        }

        public static object Evaluate(string rValue)
        {
            object ret;
            if (rValue.StartsWith("$"))
                ret = CurrentInstallation.Variables[rValue].Value;
            else
                ret = rValue;
            return ret;
        }
    }
}
