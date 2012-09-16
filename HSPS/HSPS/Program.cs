using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.SharePoint;
using System.Xml.Serialization;
using System.IO;
using System.Xaml;

namespace HSPS
{
    class Program
    {
        static void Main(string[] args)
        {

            HSPSSolution mySolution = new HSPSSolution();

            mySolution.ActionDefinitions.Add("BuildListAction", typeof(BuildListAction));
            mySolution.Title = "HEDCo Correspondence System";
            mySolution.Variables.Add("$CompanyDatabaseList", new Variable() { Name = "$CompanyDatabaseList", Type = typeof(System.Guid) });
            mySolution.Variables.Add("$ToCCList", new Variable() { Name = "$ToCCList", Type = typeof(System.Guid) });
            mySolution.Variables.Add("$FromNameDatabaseList", new Variable() { Name = "$FromNameDatabaseList", Type = typeof(System.Guid) });
            mySolution.Version = "1.0";

            Step step1 = new Step();
            step1.Title = "Step 1";
            BuildListAction action11 = new BuildListAction()
            {
                Description = "Correpondence System",
                DisplayInQuickLaunch = false,
                ListTitle = "CC:To",
                Output = "$ToCCList",
            };
            step1.Actions.Add(action11);
            mySolution.Steps.Add(step1);

            Step step2 = new Step();
            step2.Title = "Step 2";
            BuildListAction action21 = new BuildListAction()
            {
                Description = "Correpondence System",
                DisplayInQuickLaunch = false,
                ListTitle = "Company Database",
                Output = "$CompanyDatabaseList",
            };
            step2.Actions.Add(action21);
            BuildListAction action22 = new BuildListAction()
            {
                Description = "Correpondence System",
                DisplayInQuickLaunch = false,
                ListTitle = "From Name DataBase",
                Output = "$FromNameDatabaseList",
            };
            Column col1 = new Column() { IsRequired = false, FieldType = SPFieldType.Lookup, AddToDefaultView = true };
            col1.Properties.Add(new Property() { Name = "Title", Value = "Company" });
            col1.Properties.Add(new Property() { Name = "LookupList", Value = "$CompanyDatabaseList" });
            col1.Properties.Add(new Property() { Name = "LookupField", Value = "Title" });
            action22.Columns.Add(col1);

            Column col2 = new Column() { IsRequired = false, FieldType = SPFieldType.Text, AddToDefaultView = true };
            col2.Properties.Add(new Property() { Name = "Title", Value = "Company Text" });
            col2.Properties.Add(new Property() { Name = "Description", Value = "Set by wf." });
            action22.Columns.Add(col2);

            Column col3 = new Column() { IsRequired = false, FieldType = SPFieldType.Calculated, AddToDefaultView = true };
            col3.Properties.Add(new Property() { Name = "Title", Value = "Full Title" });
            col3.Properties.Add(new Property() { Name = "Formula", Value = "=Title&\"; \"&[Company Text]" });
            action22.Columns.Add(col3);

            step2.Actions.Add(action22);

            mySolution.Steps.Add(step2);

            using (StreamWriter writer = new StreamWriter(@"D:\Daei\HSPS\HSPS\test.xaml"))
            {
                XamlServices.Save(writer.BaseStream, mySolution);
            }

            //using (StreamReader reader = new StreamReader(@"D:\Daei\HSPS\HSPS\test.xaml"))
            //{
            //    HSPSSolution mySolution = (HSPSSolution)XamlServices.Load(reader.BaseStream);
            //    using (SPSite site = new SPSite("http://www.hedcoint.com/Projects/td/"))
            //    {
            //        using (SPWeb web = site.OpenWeb())
            //        {
            //            Services.Web = web;
            //            mySolution.Initialize();

            //            mySolution.StartDeploy();
            //        }

            //    }
            //}
            

        }
    }
}
