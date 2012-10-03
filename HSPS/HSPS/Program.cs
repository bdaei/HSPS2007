using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.SharePoint;
using System.Xml.Serialization;
using System.IO;
using System.Xaml;
using Microsoft.SharePoint.Workflow;
using System.Text.RegularExpressions;

namespace HSPS
{
    class Program
    {
        static void Main(string[] args)
        {
            string weburl = "";
            if (args.Length == 0)
            {
                Console.WriteLine("usage: hsps -p [Package Folder Path] -w [Web URL]");
                return;
            }

            for (int i = 0; i < args.Length; i++)
            {
                if (args[i] == "-p")
                {
                    Services.LocalDirectory = new DirectoryInfo(args[++i]);
                    if (!Services.LocalDirectory.Exists)
                    {
                        Console.WriteLine("Error: There is no path as {0}", args[i]);
                        return;
                    }
                }
                else if (args[i] == "-w")
                {
                    weburl = args[++i];
                }
                else
                {
                    Console.WriteLine("Error: Unknown argument: {0})", args[i]);
                    return;
                }
            }

            using (StreamReader reader = new StreamReader(string.Format("{0}\\main.xaml", Services.LocalDirectory.FullName)))
            {
                HSPSSolution mySolution = (HSPSSolution)XamlServices.Load(reader.BaseStream);

                using (SPSite site = new SPSite(weburl))
                {
                    using (SPWeb web = site.OpenWeb())
                    {
                        Services.Web = web;
                        mySolution.Initialize();
                        mySolution.StartDeploy();
                    }

                }
            }
        }
    }
}
