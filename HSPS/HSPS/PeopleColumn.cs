using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.SharePoint;

namespace HSPS
{
    public class PeopleColumn : Column
    {
        public SPFieldUserSelectionMode SelectionMode { get; set; }
        public bool AllowMultipleValues { get; set; }
    }
}
