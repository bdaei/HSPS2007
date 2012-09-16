using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.SharePoint;

namespace HSPS
{
    public class Column
    {
        public SPFieldType FieldType { get; set; }
        public bool IsRequired { get; set; }
        public bool AddToDefaultView { get; set; }
        
        private List<Property> _properties;
        public IList<Property> Properties
        {
            get
            {
                if (_properties == null)
                    _properties = new List<Property>();
                return _properties;
            }
        }
    }
}
