using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace HSPS
{
    public class LookupColumn : Column
    {
        public string LookupList { get; set; }
        public string LookupField { get; set; }
        public bool IsListName { get; set; }

        public LookupColumn()
        {
            LookupField = "Title";
        }
    }
}
