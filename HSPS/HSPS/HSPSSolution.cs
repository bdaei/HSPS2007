using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Xml;
using System.Xml.Linq;
using System.Text.RegularExpressions;
using System.Reflection;
using System.Xaml;

namespace HSPS
{
    /// <summary>
    /// Root Class for a HSPS Solution
    /// </summary>
    public class HSPSSolution
    {
        private Dictionary<string, Type> _actionDefinitions;
        public Dictionary<string, Type> ActionDefinitions
        {
            get
            {
                if (this._actionDefinitions == null)
                    _actionDefinitions = new Dictionary<string, Type>();
                return _actionDefinitions;
            }
        }

        /// <summary>
        /// Name of the solution
        /// </summary>
        public string Title { get; set; }
        /// <summary>
        /// Solution Version
        /// </summary>
        public string Version { get; set; }

        private Dictionary<string, Variable> _variables;
        /// <summary>
        /// A Collection of Solution Variables
        /// </summary>
        public Dictionary<string, Variable> Variables
        {
            get
            {
                if (_variables == null)
                    _variables = new Dictionary<string, Variable>();
                return _variables;
            }
        }

        private List<Step> _steps;
        /// <summary>
        /// Stpes of the solution procedure
        /// </summary>
        public IList<Step> Steps
        {
            get
            {
                if (_steps == null)
                    _steps = new List<Step>();
                return _steps;
            }
        }

        public void Initialize()
        {
            Services.CurrentInstallation = this;
        }


        /// <summary>
        /// Starts the deployement process
        /// </summary>
        public void StartDeploy()
        {
            foreach (Step step in this.Steps)
                foreach (IAction action in step.Actions)
                    action.Do();
        }
    }
}
