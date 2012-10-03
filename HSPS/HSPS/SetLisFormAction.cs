using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.SharePoint;

namespace HSPS
{
    public class SetLisFormAction : IAction
    {
        public string DisplayFormUrl { get; set; }
        public string NewFormUrl { get; set; }
        public string EditFormUrl { get; set; }
        public string ListId { get; set; }

        public void Do()
        {
            SPList list = Services.Web.Lists[new Guid(Services.Evaluate(ListId).ToString())];
            Console.WriteLine("Updaing List Forms for {0}", list.Title);
            SPContentType ct = list.ContentTypes["Item"];
            Services.Web.AllowUnsafeUpdates = true;

            if (!String.IsNullOrEmpty(DisplayFormUrl))
            {
                ct.DisplayFormUrl = DisplayFormUrl;
                ct.Update();
            }
            if (!String.IsNullOrEmpty(NewFormUrl))
            {
                ct.NewFormUrl = NewFormUrl;
                ct.Update();
            }
            if (!String.IsNullOrEmpty(EditFormUrl))
            {
                ct.EditFormUrl = EditFormUrl;
                ct.Update();
            }

            Services.Web.AllowUnsafeUpdates = false;
        }
    }
}
