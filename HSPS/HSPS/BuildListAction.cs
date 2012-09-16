using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.SharePoint;
using System.Reflection;

namespace HSPS
{
    public class BuildListAction : IAction
    {
        public string ListTitle { get; set; }
        public bool DisplayInQuickLaunch { get; set; }
        public string Description { get; set; }

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
            Guid listGuid = Services.Web.Lists.Add((string)Services.Evaluate(this.ListTitle), (string)Services.Evaluate(this.Description), SPListTemplateType.GenericList);
            Services.SetVariable(this.Output, listGuid);
            SPList newList = Services.Web.Lists[listGuid];
            newList.OnQuickLaunch = this.DisplayInQuickLaunch;
            foreach (Column col in this.Columns)
            {
                string newFieldName = Guid.NewGuid().ToString();
                if (col.FieldType == SPFieldType.Lookup)
                    newList.Fields.AddLookup(newFieldName, Guid.Parse(Services.Evaluate(col.Properties.Where(p => p.Name == "LookupList").Single().Value).ToString()), col.IsRequired);
                else
                    newList.Fields.Add(newFieldName, col.FieldType, col.IsRequired);
                SPField field = newList.Fields[newFieldName];
                
                foreach(Property p in col.Properties)
                {
                    PropertyInfo prop = field.GetType().GetProperty(p.Name);
                    if(prop.Name != "LookupList")
                        prop.SetValue(field, Services.Evaluate(p.Value).ToString(), null);
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
