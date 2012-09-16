using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Markup;

namespace HSPS
{
    public class Step
    {
        public string Title { get; set; }
        
        private List<IAction> _actions;
        public IList<IAction> Actions
        {
            get
            {
                if (_actions == null)
                    _actions = new List<IAction>();
                return _actions;
            }
        }

    }
}
