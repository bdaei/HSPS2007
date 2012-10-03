using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections.Specialized;

namespace HSPS
{
    public class ChoiceColumn : Column
    {
        public StringCollection Choices{ get; set; }
        public string DefaultValue { get; set; }

        public ChoiceColumn()
        {
            Choices = new StringCollection();
        }
    }
}
