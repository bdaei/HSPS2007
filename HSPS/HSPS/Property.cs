using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections.Specialized;

namespace HSPS
{
    public class Property
    {
        public string Name { get; set; }
        public object Value { get; set; }
    }

    //public class ChoicesProperty : Property
    //{
    //    public ChoicesProperty()
    //    {
    //        Choices = new StringCollection();
    //    }
    //    public StringCollection Choices { get; set; }
    //}
}
