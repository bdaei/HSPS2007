using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.SharePoint;
using System.Reflection;
using Microsoft.SharePoint.Workflow;

namespace HSPS
{
    public class BuildListAction : IAction
    {
        public string ListTitle { get; set; }
        public bool DisplayInQuickLaunch { get; set; }
        public string Description { get; set; }
        public bool SkipIfExists { get; set; }

        public string Output { get; set; }

        private List<Column> _columns;
        public IList<Column> Columns
        {
            get
            {
                if (_columns == null)
                    _columns = new List<Column>();
                return _columns;
            }
        }



        #region IAction Members

        public void Do()
        {
            Console.WriteLine("Building List {0}", (string)Services.Evaluate(this.ListTitle));
            SPList currentList = null;
            bool exists = false;
            try
            {
                currentList = Services.Web.Lists[(string)Services.Evaluate(this.ListTitle)];
                exists = true;

            }
            catch (ArgumentException)
            {
            }

            if (exists)
            {
                if (SkipIfExists)
                {
                    Console.WriteLine("List {0} already exists. Skipping", (string)Services.Evaluate(this.ListTitle));
                    Services.SetVariable(this.Output, currentList.ID);
                    return;
                }
                else
                    currentList.Delete();
            }
                
            Guid listGuid = Services.Web.Lists.Add((string)Services.Evaluate(this.ListTitle), (string)Services.Evaluate(this.Description), SPListTemplateType.GenericList);
            Services.SetVariable(this.Output, listGuid);
            SPList newList = Services.Web.Lists[listGuid];
            newList.OnQuickLaunch = this.DisplayInQuickLaunch;
            foreach (Column col in this.Columns)
            {
                string newFieldName = col.Title;
                SPField field = null;
                if (col is SingleLineOfTextColumn)
                {
                    newList.Fields.Add(newFieldName, SPFieldType.Text, col.IsRequired);
                    SPFieldText newField = newList.Fields[newFieldName] as SPFieldText;
                    newField.Description = col.Description;
                    newField.DefaultValue = col.DefaultValue;
                    field = newField;
                }
                else if (col is MultipleLinesOfTextColumn)
                {
                    newList.Fields.Add(newFieldName, SPFieldType.Note, col.IsRequired);
                    SPFieldMultiLineText newField = newList.Fields[newFieldName] as SPFieldMultiLineText;
                    newField.Description = col.Description;
                    newField.RichText = ((MultipleLinesOfTextColumn)col).IsRichText;
                    field = newField;
                }
                else if (col is ChoiceColumn)
                {
                    newList.Fields.Add(newFieldName, SPFieldType.Choice, col.IsRequired);
                    SPFieldChoice newField = newList.Fields[newFieldName] as SPFieldChoice;
                    newField.Description = col.Description;
                    foreach (var choice in ((ChoiceColumn)col).Choices)
                        newField.Choices.Add(choice);
                    if (((ChoiceColumn)col).DefaultValue == null)
                        newField.DefaultValue = newField.Choices[0];
                    else
                        newField.DefaultValue = ((ChoiceColumn)col).DefaultValue;
                    field = newField;
                }
                else if (col is LookupColumn)
                {
                    Guid lookupListGuid = Guid.Empty;
                    string lookupFieldInternalName = "";
                    if (((LookupColumn)col).IsListName == true)
                    {
                        SPList lookupList = Services.Web.Lists[((LookupColumn)col).LookupList];
                        lookupListGuid = lookupList.ID;
                    }
                    else
                        lookupListGuid = Guid.Parse(Services.Evaluate(((LookupColumn)col).LookupList).ToString());

                    lookupFieldInternalName = Services.Web.Lists[lookupListGuid].Fields[((LookupColumn)col).LookupField].InternalName;

                    newList.Fields.AddLookup(newFieldName, lookupListGuid, col.IsRequired);
                    SPFieldLookup newField = newList.Fields[newFieldName] as SPFieldLookup;
                    newField.Description = col.Description;
                    newField.LookupField = lookupFieldInternalName;
                    field = newField;
                }
                else if (col is DateTimeColumn)
                {
                    newList.Fields.Add(newFieldName, SPFieldType.DateTime, col.IsRequired);
                    SPFieldDateTime newField = newList.Fields[newFieldName] as SPFieldDateTime;
                    newField.Description = col.Description;
                    field = newField;
                }
                else if (col is CalculatedColumn)
                {
                    newList.Fields.Add(newFieldName, SPFieldType.Calculated, col.IsRequired);
                    SPFieldCalculated newField = newList.Fields[newFieldName] as SPFieldCalculated;
                    newField.Description = col.Description;
                    newField.Formula = ((CalculatedColumn)col).Formula;
                    field = newField;
                }
                else if (col is YesNoColumn)
                {
                    newList.Fields.Add(newFieldName, SPFieldType.Boolean, col.IsRequired);
                    SPFieldBoolean newField = newList.Fields[newFieldName] as SPFieldBoolean;
                    newField.Description = col.Description;
                    newField.DefaultValue = col.DefaultValue;
                    field = newField;
                }
                else if (col is NumberColumn)
                {
                    newList.Fields.Add(newFieldName, SPFieldType.Number, col.IsRequired);
                    SPFieldNumber newField = newList.Fields[newFieldName] as SPFieldNumber;
                    newField.Description = col.Description;
                    newField.DefaultValue = col.DefaultValue;
                    field = newField;
                }
                else if (col is PeopleColumn)
                {
                    newList.Fields.Add(newFieldName, SPFieldType.User, col.IsRequired);
                    SPFieldUser newField = newList.Fields[newFieldName] as SPFieldUser;
                    newField.Description = col.Description;
                    newField.SelectionMode = ((PeopleColumn)col).SelectionMode;
                    newField.AllowMultipleValues = ((PeopleColumn)col).AllowMultipleValues;
                    field = newField;
                }


                field.Update();

                if (col.AddToDefaultView)
                {
                    newList.DefaultView.ViewFields.Add(field);
                    newList.DefaultView.Update();
                }
            }
            newList.Update();
        }

        #endregion
    }
}
