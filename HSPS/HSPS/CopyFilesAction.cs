using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.SharePoint;
using System.IO;

namespace HSPS
{
    public class CopyFilesAction : IAction
    {
        public void Do()
        {
            Services.Web.AllowUnsafeUpdates = true;
            CopyFolderContents(Services.LocalDirectory, Services.Web.RootFolder);
            Services.Web.AllowUnsafeUpdates = false;
        }

        private void CopyFolderContents(DirectoryInfo localFolder, SPFolder destinationFolder)
        {
            Console.WriteLine("Copying folder contents: {0}", localFolder.Name);

            var localFiles = localFolder.GetFiles().Where(f => f.Name.ToLower() != "main.xaml");
            foreach (var localFile in localFiles)
            {
                byte[] content = null;
                SPFile remoteFile = null;
                if (localFile.Name.EndsWith(".aspx") || localFile.Name.ToLower().Contains("xoml"))
                {
                    using (StreamReader reader = new StreamReader(localFile.FullName))
                    {
                        string stringContent = reader.ReadToEnd();
                        foreach (var variable in Services.CurrentInstallation.Variables)
                            stringContent = stringContent.Replace(variable.Key, variable.Value.Value.ToString());
                        if (stringContent.Contains("$$Workflows"))
                            stringContent = stringContent.Replace("$$Workflows", Services.Web.Lists["Workflows"].ID.ToString());
                        if (stringContent.Contains("$$TaskList"))
                        {
                            string taskListId = "";
                            try
                            {
                                taskListId = Services.Web.Lists["Tasks"].ID.ToString();
                            }
                            catch (ArgumentException ex)
                            {
                                Services.Web.Lists.Add("Tasks", "", SPListTemplateType.Tasks);
                                taskListId = Services.Web.Lists["Tasks"].ID.ToString();
                            }
                            stringContent = stringContent.Replace("$$TaskList", taskListId);
                        }

                        remoteFile = destinationFolder.Files.Add(destinationFolder.Url + (destinationFolder.Url == "" ? localFile.Name : "/" + localFile.Name), reader.CurrentEncoding.GetBytes(stringContent), true);
                    }
                }
                else
                {
                    using (FileStream filestream = new FileStream(localFile.FullName, System.IO.FileMode.Open))
                    {
                        content = new byte[(int)filestream.Length];
                        filestream.Read(content, 0, (int)filestream.Length);
                        filestream.Close();
                    }
                    remoteFile = destinationFolder.Files.Add(destinationFolder.Url + (destinationFolder.Url == "" ? localFile.Name : "/" + localFile.Name), content, true);
                }
                remoteFile.Update();
            }
            foreach (var subfolder in localFolder.GetDirectories())
            {
                SPFolder newFolder = destinationFolder.ParentWeb.GetFolder(destinationFolder.Url + (destinationFolder.Url == "" ? subfolder.Name : "/" + subfolder.Name) );
                if (!newFolder.Exists)
                {
                    if (subfolder.Name.ToLower() == "workflows")
                    {
                        Services.Web.Lists.Add("Workflows", "", SPListTemplateType.NoCodeWorkflows);
                        newFolder = Services.Web.Folders["Workflows"];
                    }
                    else
                        newFolder = destinationFolder.SubFolders.Add(subfolder.Name);
                }
                CopyFolderContents(subfolder, newFolder);
            }
        }
    }
}
