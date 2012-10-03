<%@ Page Language="C#" inherits="Microsoft.SharePoint.WebPartPages.WebPartPage, Microsoft.SharePoint, Version=12.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register tagprefix="WebPartPages" namespace="Microsoft.SharePoint.WebPartPages" assembly="Microsoft.SharePoint, Version=12.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register tagprefix="SharePoint" namespace="Microsoft.SharePoint.WebControls" assembly="Microsoft.SharePoint, Version=12.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<html dir="ltr">

<head runat="server">
<META name="WebPartPageExpansion" content="full">
<meta name="ProgId" content="SharePoint.WebPartPage.Document">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Correspondances 2</title>

<script language="javascript" type="text/javascript" src="../../jquery-1.4.2.js"></script>
<script type="text/javascript">

var attachFor = '';


$(function(){
	$('input[value=OK]').click(
		function(){
			window.external.AutoCompleteSaveForm(form1);
	});

	$('input[title=Letter NO]').keyup(function(){makeTitle();});
	$('input[title=Subject]').keyup(function(){makeTitle();});
	$('input[title=Subject]').attr('dir', 'rtl');
	$('#trTitle').hide();
	$('input[title=Key Words]').css('width', '85px');
	$('input[title=Key Words 2]').css('width', '85px');
	$('input[title=Key Words 3]').css('width', '85px');
	$('input[title=Key Words 4]').css('width', '85px');
	$('input[title=Key Words 5]').css('width', '85px');
	
	if($('input[title=Reference NO2]').val() == "")
		$('input[title=Reference NO2]').parent().parent().parent().hide();
	if($('input[title=Reference NO3]').val() == "")
		$('input[title=Reference NO3]').parent().parent().parent().hide();
	if($('input[title=Reference NO4]').val() == "")
		$('input[title=Reference NO4]').parent().parent().parent().hide();
	if($('input[title=Reference NO5]').val() == "")
		$('input[title=Reference NO5]').parent().parent().parent().hide();			
});


function makeTitle()
{

	var ln = $('input[title=Letter NO]').attr('value');
	var subject = $('input[title=Subject]').attr('value');
	$('input[title=Title]').attr('value', subject + '-' + ln);
}
function DistributionAddClick(sender)
{
	var sname = sender.name.substring(6, sender.name.length);
	var user = $('select[title='+sname+']').attr('value');
	if(user != '-')
	{
		user = user.substring(0, user.length - 1) + "@hedcoint.com";
		var allUsers = $('textarea[title=All Users]').attr('value');
		if(allUsers.indexOf(user) == -1)
			if(allUsers != "")
				$('textarea[title=All Users]').attr({value: allUsers + ';' + user});
			else
				$('textarea[title=All Users]').attr({value: user});
	}
}

function AllUsersClearClicked()
{
	$('textarea[title=All Users]').attr({value: ''});
}

function AllUsersBackClicked()
{
	var allUsers = $('textarea[title=All Users]').attr('value');
	lastIndex = allUsers.substr(0, allUsers.length-1).lastIndexOf(';');
	$('textarea[title=All Users]').attr({value: allUsers.substr(0, lastIndex+1)});
}

var RefNum = 1;
function ShowRef()
{
	if(RefNum == 1)	
		$('input[title=Reference NO2]').parent().parent().parent().show();
	if(RefNum == 2)	
		$('input[title=Reference NO3]').parent().parent().parent().show();
	if(RefNum == 3)	
		$('input[title=Reference NO4]').parent().parent().parent().show();
	if(RefNum == 4)	
		$('input[title=Reference NO5]').parent().parent().parent().show();

	if(RefNum < 5)	
		RefNum++;
		
}
</script>

	<link rel="stylesheet" type="text/css" href="../../myStyle.css">
	<link rel="stylesheet" type="text/css" href="../Correspondances%2020/_layouts/1033/Styles/core.css">

<script type="text/javascript" language="javascript">

function okAttachAndClose()
{
	setAttachmentFileNames();
	
	OkAttach();
	generalPartShow();
}
function setAttachmentFileNames() //By Bijan
{
	var fullFileName = $('input[name=fileupload0]').attr('value');
	if(fullFileName != '')
	{
		var lastBackslashIndex = fullFileName.lastIndexOf('\\');
		var fileName = fullFileName.substring(lastBackslashIndex+1, fullFileName.length);
		if(attachFor == 'Letter')
			$('input[title=LetterFileName]').attr({value: fileName});
		else if(attachFor == 'Reply')
		{
			var currentFileNames = $('input[title=RepliedFileNames]').attr('value');
			$('input[title=RepliedFileNames]').attr({value: currentFileNames + fileName + ';'});
		}
	}
}

function cancelAttachAndClose()
{
	CancelAttach();
	generalPartShow();
}

function uploadFilesLetter()
{
	attachmentPartShow();
	attachFor = 'Letter';
	
}
function uploadFilesReply()
{
	attachmentPartShow();
	attachFor = 'Reply';
}


function showToolbars()
{
        mytoolbar.className 	= "show";
        mybottomtoolbar.className 	= "show";
}
function hideToolbars()
{
        mytoolbar.className 	= "hide";
        mybottomtoolbar.className 	= "hide";
}
function attachmentPartShow()
{
        if (imgObj.partname != "attachmentPart") {
        	hideToolbars();
	        imgObj.filters[0].apply();
	        
            generalPart.className 	= "hide";
            repliedPart.className 	= "hide";
            attachmentPart.className 	= "show";

	        imgObj.filters[0].play();
        }
}

function generalPartShow()
{
        if (imgObj.partname != "generalPart") {
	        imgObj.filters[0].apply();
	        
            attachmentPart.className 	= "hide";
            repliedPart.className 		= "hide";
            distributionPart.className 	= "hide";
            generalPart.className 	= "show";
            showToolbars();

	        imgObj.filters[0].play();
        }
}
function distributionPartShow()
{
        if (imgObj.partname != "distributionPart") {
	        imgObj.filters[0].apply();
	        
            generalPart.className 	= "hide";
            distributionPart.className 	= "show";
            showToolbars();

	        imgObj.filters[0].play();
        }
}
function repliedPartShow()
{
        if (imgObj.partname != "repliedPart") {
	        imgObj.filters[0].apply();
	        
            hideToolbars();
            generalPart.className 	= "hide";
            repliedPart.className 	= "show";

	        imgObj.filters[0].play();
        }
}

//	_spBodyOnLoadFunctionNames.push("fillDefaultValues");


var vals = new Object();

function fillDefaultValues() {

	$('textarea[title=All Users]').css('width', '100%');

  var qs = location.search.substring(1, location.search.length);
  var args = qs.split("&");

  for (var i=0; i < args.length; i++) {
    var nameVal = args[i].split("=");
    var temp = unescape(nameVal[1]).split('+');
    nameVal[1] = temp.join(' ');
    vals[nameVal[0]] = nameVal[1];
  }

	distributionPart.className 	= "hide";
	repliedPart.className 		= "hide";
    


//Attachment Part
	attachmentPart.className 	= "hide";
    aok = document.getElementById("attachOKbutton");
	aok.setAttribute("onclick","okAttachAndClose();" ); 

    acancel = document.getElementById("attachCancelButton")
	acancel.setAttribute("onclick","cancelAttachAndClose();" ); 
    copyOfPartAttachment.innerHTML = partAttachment.innerHTML;

}


    function getTagFromIdentifierAndTitle(tagName, identifier, title) {
        var len = identifier.length;
        var tags = document.getElementsByTagName(tagName);

        for (var i=0; i < tags.length; i++) {
            var tempString = tags[i].id;
            if (tags[i].title == title) {
                return tags[i];
            }
        }
        return null;
    }

</script>

<style type="text/css">
.ms-standardheader
{
	font-family:Verdana;
	font-size:10px;
}
.ms-long
{
	width: 280px;
}
.ms-RadioText
{
	width: 70px;
}
.ms-standardheader2
{
	font-family:Verdana;
	color:#444444;
	font-size:10px;
}
.ms-standardheader3
{
	font-family:Verdana;
	color:#444444;
	font-size:12px;
}

.myTitle
{
	font-family:Verdana;
	color:#444444;
	font-size:15px;
}


.show
{
	display:block;
}
.hide
{
	display:none;
}

.border
{
	border:thin #336699 solid;
}
.border-without-top
{
	border-bottom:thin #336699 solid;
	border-left:thin #336699 solid;
	border-right:thin #336699 solid;
}
.border-top
{
	border-top:thin #336699 solid;
}
.border-left
{
	border-left:thin #336699 solid;
}
.border-left-top
{
	border-left:thin #336699 solid;
	border-top:thin #336699 solid;
}
.border-left-bottom
{
	border-left:thin #336699 solid;
	border-bottom:thin #336699 solid;
}
.border-bottom
{
	border-bottom:thin #336699 solid;
}

.ms-toolbar{
font-family:georgia, verdana;
font-size:8pt;
text-decoration:none;
color:#003399;
}
.ms-ButtonHeightWidth
{
width:7.5em;
font:8pt tahoma;
height:2.1em;
padding-top:0.1em;
padding-bottom:0.4em;
}
.ms-separator
{
color:#83b0ec;
font-size:10pt;
}
table.ms-toolbar{
border:1px solid #83b0ec;
border-collapse:collapse;
}
table.ms-toolbar{
background-image:url("/_layouts/images/toolgrad.gif");
background-repeat:repeat-x;
background-color:#d6e8ff;
}
.ms-descriptiontext{
color:#4c4c4c;
font-family:tahoma;
font-size:8pt;
text-align:left;
}
.ms-formvalidation{
color:#ff0000;
font-family:georgia, verdana;
font-size:8pt;
}
.ms-formlabel{
text-align:left;
font-family:georgia, verdana;
font-size:.7em;
border-top:1px solid #d8d8d8;
padding-top:3px;
padding-right:8px;
padding-bottom:6px;
color:#525252;
font-weight:bold;
}
.ms-formbody{
font-family:georgia, verdana;
font-size:.7em;
vertical-align:top;
background:#ebf3ff;
border-top:1px solid #d8d8d8;
padding:3px 6px 4px 6px;
}
.ms-formfieldlabelcontainer
{
margin:4px 4px 0px 4px;
}
div.ms-formfieldlabelcontainer span.ms-formfieldlabel
{
font-family:tahoma;
font-size:8pt;
font-weight:normal;
text-align:left;
color:#777777;
padding:1px 4px 1px 4px;
border-top:1px solid #cccccc;
border-left:1px solid #cccccc;
border-right:1px solid #cccccc;
background-image:url("/_layouts/images/globgrad.gif");
background-repeat:repeat-x;
background-color:#efebef;
height:18px;
}
.ms-formfieldvaluecontainer
{
border:1px solid #cccccc;
margin-left:4px;
margin-right:4px;
margin-bottom:4px;
padding:5px;
}
select{
font-size:8pt;
font-family:georgia, verdana,sans-serif;
}
.ms-input{
font-size:8pt;
font-family:georgia, verdana,sans-serif;
}
.ms-dtinput{
vertical-align:middle;
padding-top:0px;
padding-bottom:0px;
padding-right:4px;
padding-left:0px;
font-size:0px;
}
.ms-vb
{
vertical-align:top;
}
.ms-vb{
font-size:8pt;
font-family:tahoma,sans-serif;
}
.ms-vb{
color:#000000;
}
hr{
color:#003399;
height:2px;
}
.ms-usereditor{
width:386px;
}
.ms-fileinput{
font-size:8pt;
font-family:georgia, verdana,sans-serif;
}
.ms-formline{
border-top:1px solid #c4c4c4;
padding-right:8px;
padding-left:8px;
}
.ms-attachUploadButtons
{
text-align:right;
}
.ms-SpaceBetButtons
{
width:6px;
}

.style1 {
	font-family: georgia, verdana;
	font-size: .7em;
	vertical-align: top;
	text-align: center;
	border-top: 1px solid #d8d8d8;
	padding-left: 6px;
	padding-right: 6px;
	padding-top: 3px;
	padding-bottom: 4px;
	background: #ebf3ff;
}


</style>





</head>

<body>

<form id="form1" runat="server">

<span partname="" style="FILTER: progid:DXImageTransform.Microsoft.Fade(Overlap=0.50); BACKGROUND-COLOR: white; PADDING-LEFT: 13px; WIDTH: 100%; PADDING-RIGHT: 10px; FONT: 9pt/1.3 verdana;  COLOR: black" id="imgObj">


<WebPartPages:DataFormWebPart runat="server" IsIncluded="True" FrameType="None" NoDefaultStyle="TRUE" ViewFlag="0" Title="Correspondances 2.0" __markuptype="vsattributemarkup" __WebPartId="{E6BAFCF8-13EB-46BA-9A7F-DCEDAD33B098}" id="g_4ef71959_f39e_4a12_9ad7_49e5723e5ebb" __AllowXSLTEditing="true" WebPart="true" Height="" Width="">
	<DataSources>
		<SharePoint:SPDataSource runat="server" DataSourceMode="ListItem" UseInternalName="true" selectcommand="&lt;View&gt;&lt;Query&gt;&lt;Where&gt;&lt;Eq&gt;&lt;FieldRef Name=&quot;ContentType&quot;/&gt;&lt;Value Type=&quot;Text&quot;&gt;Item&lt;/Value&gt;&lt;/Eq&gt;&lt;/Where&gt;&lt;/Query&gt;&lt;/View&gt;" id="Correspondances_x0020_2_x002e_3"><SelectParameters><WebPartPages:DataFormParameter Name="ListItemId" ParameterKey="ListItemId" PropertyName="ParameterValues" DefaultValue="0"/><WebPartPages:DataFormParameter Name="ListID" ParameterKey="ListID" PropertyName="ParameterValues" DefaultValue="{$CorrepondencesList}"/>
			</SelectParameters><DeleteParameters><WebPartPages:DataFormParameter Name="ListItemId" ParameterKey="ListItemId" PropertyName="ParameterValues" DefaultValue="0"/><WebPartPages:DataFormParameter Name="ListID" ParameterKey="ListID" PropertyName="ParameterValues" DefaultValue="{$CorrepondencesList}"/>
			</DeleteParameters><InsertParameters><WebPartPages:DataFormParameter Name="ListItemId" ParameterKey="ListItemId" PropertyName="ParameterValues" DefaultValue="0"/><WebPartPages:DataFormParameter Name="ListID" ParameterKey="ListID" PropertyName="ParameterValues" DefaultValue="{$CorrepondencesList}"/>
			</InsertParameters><UpdateParameters><WebPartPages:DataFormParameter Name="ListItemId" ParameterKey="ListItemId" PropertyName="ParameterValues" DefaultValue="0"/><WebPartPages:DataFormParameter Name="ListID" ParameterKey="ListID" PropertyName="ParameterValues" DefaultValue="{$CorrepondencesList}"/>
			</UpdateParameters>
		</SharePoint:SPDataSource>
	</DataSources>
	<ParameterBindings>
	<ParameterBinding Name="ListItemId" Location="QueryString(ID)" DefaultValue="0"/>
	<ParameterBinding Name="ListID" Location="None" DefaultValue="{$CorrepondencesList}"/>
	<ParameterBinding Name="dvt_apos" Location="Postback;Connection"/>
	<ParameterBinding Name="UserID" Location="CAMLVariable" DefaultValue="CurrentUserName"/>
	<ParameterBinding Name="Today" Location="CAMLVariable" DefaultValue="CurrentDate"/>
</ParameterBindings>
	<datafields>@Title,Title;@All_x0020_Users,All Users;@CC_x003a_to,CC:to;@DC,DC;@Department_x0020_Finder,Department Finder;@DPD,DPD;@ED,ED;@EL,EL;@Expediting_x0020_Duration_x0020_,Expediting Duration (Day);@Expediting_x0020_is_x0020_Requir,Expediting is Required;@Expediting_x0020_Status,Expediting Status;@From_x0020_Company,From Company;@From_x0020_Name,From Name;@Hamesh_x0020_Date,Hamesh Date;@Hamesh_x0020_from,Hamesh from;@Hamesh_x0020_to,Hamesh to;@Hard_x0020_Copy_x0020_Filing_x00,Hard Copy Filing No;@HSE,HSE;@Importance,Importance;@IN,IN;@Key_x0020_Words,Key Words;@Key_x0020_Words_x0020_2,Key Words 2;@Key_x0020_Words_x0020_3,Key Words 3;@Key_x0020_Words_x0020_4,Key Words 4;@Key_x0020_Words_x0020_5,Key Words 5;@Letter_x0020_Date,Letter Date;@Letter_x0020_NO,Letter NO;@Letter_x0020_Status,Letter Status;@Letter_x0020_Type,Letter Type;@LetterFileName,LetterFileName;@MD,MD;@PC,PC;@PD,PD;@PEG,PEG;@PEL,PEL;@PEZ,PEZ;@PI,PI;@PMG,PMG;@PML,PML;@PMZ,PMZ;@PN,PN;@PQ,PQ;@PR,PR;@QC,QC;@RE,RE;@ST,ST;@VDC,VDC;@Project,Project;@Reference_x0020_Date,Reference Date;@Reference_x0020_Date2,Reference Date2;@Reference_x0020_Date3,Reference Date3;@Reference_x0020_Date4,Reference Date4;@Reference_x0020_Date5,Reference Date5;@Reference_x0020_NO,Reference NO;@Reference_x0020_NO2,Reference NO2;@Reference_x0020_NO3,Reference NO3;@Reference_x0020_NO4,Reference NO4;@Reference_x0020_NO5,Reference NO5;@Reference_x0020_Type,Reference Type;@Reference_x0020_Type2,Reference Type2;@Reference_x0020_Type3,Reference Type3;@Reference_x0020_Type4,Reference Type4;@Reference_x0020_Type5,Reference Type5;@Remark,Remark;@Replied_x0020_Letter_x0020_Date,Replied Letter Date;@Replied_x0020_Letter_x0020_NO,Replied Letter NO;@RepliedFileNames,RepliedFileNames;@Reply_x0020_Duration_x0020__x002,Reply Duration (Day);@Reply_x0020_Hard_x0020_Copy_x002,Reply Hard Copy Filing NO;@Reply_x0020_Importance,Reply Importance;@Reply_x0020_is_x0020_Required,Reply is Required;@REQ_x0020_NO,REQ NO;@Responsible,Responsible;@SkipFirstEdit,SkipFirstEdit;@Subject,Subject;@To_x0020_Company,To Company;@To_x0020_Name,To Name;@UniqeNO,UniqeNO;@Unit_x002f_Grouping,Unit/Grouping;@Expediting_x0020_Date,Expediting Date;@Replay_x0020_Date,Replay Date;@TitleWithLink,TitleWithLink;@ID,ID;@ContentType,Content Type;@Modified,Modified;@Created,Created;@Author,Created By;@Editor,Modified By;@_UIVersionString,Version;@Attachments,Attachments;@File_x0020_Type,File Type;@FileLeafRef,Name (for use in forms);@FileDirRef,Path;@FSObjType,Item Type;@_HasCopyDestinations,Has Copy Destinations;@_CopySource,Copy Source;@ContentTypeId,Content Type ID;@_ModerationStatus,Approval Status;@_UIVersion,UI Version;@Created_x0020_Date,Created;@FileRef,URL Path;</datafields>
	<XSL>
<xsl:stylesheet xmlns:x="http://www.w3.org/2001/XMLSchema" xmlns:dsp="http://schemas.microsoft.com/sharepoint/dsp" version="1.0" exclude-result-prefixes="xsl msxsl ddwrt" xmlns:ddwrt="http://schemas.microsoft.com/WebParts/v2/DataView/runtime" xmlns:asp="http://schemas.microsoft.com/ASPNET/20" xmlns:__designer="http://schemas.microsoft.com/WebParts/v2/DataView/designer" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:SharePoint="Microsoft.SharePoint.WebControls" xmlns:ddwrt2="urn:frontpage:internal">
	<xsl:output method="html" indent="no"/>
	<xsl:decimal-format NaN=""/>
				<xsl:param name="dvt_apos">'</xsl:param>
				<xsl:variable name="dvt_1_automode">0</xsl:variable>
				<xsl:template match="/" xmlns:x="http://www.w3.org/2001/XMLSchema" xmlns:dsp="http://schemas.microsoft.com/sharepoint/dsp" xmlns:asp="http://schemas.microsoft.com/ASPNET/20" xmlns:__designer="http://schemas.microsoft.com/WebParts/v2/DataView/designer" xmlns:SharePoint="Microsoft.SharePoint.WebControls">
								<xsl:call-template name="dvt_1"/>
	</xsl:template>
				
				<xsl:template name="dvt_1">
								<xsl:variable name="dvt_StyleName">ListForm</xsl:variable>
								<xsl:variable name="Rows" select="/dsQueryResponse/Rows/Row"/>
		<div>
			<span id="part1">
				<table border="0" width="100%">
								<xsl:call-template name="dvt_1.body">
												<xsl:with-param name="Rows" select="$Rows"/>
								</xsl:call-template>
				</table>
			</span>
			<SharePoint:AttachmentUpload runat="server" ControlMode="New" id="AttachmentUpload1"/>
			<SharePoint:ItemHiddenVersion runat="server" ControlMode="New" id="ItemHiddenVersion1"/>
		</div>
	</xsl:template>
				<xsl:template name="dvt_1.body">
								<xsl:param name="Rows"/>
								
<tr><td>
	<span id="mytoolbar">
		<table width="100%">
		<tr>
			<td class="ms-toolbar" nowrap="">
				<table>
					<tr>
						<td width="99%" class="ms-toolbar" nowrap=""><IMG SRC="/_layouts/images/blank.gif" width="1" height="18"/></td>
						<td class="ms-toolbar" nowrap="">
							<SharePoint:SaveButton runat="server" ControlMode="Edit" id="savebutton1"/>
						</td>
						<td class="ms-separator"> </td>
						<td class="ms-toolbar" nowrap="" align="right">
							<SharePoint:GoBackButton runat="server" ControlMode="Edit" id="gobackbutton1"/>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		</table>
	</span>
</td></tr>
		
		
								<xsl:call-template name="dvt_1.rowedit">
												<xsl:with-param name="Pos" select="concat('_', position())" />
								</xsl:call-template>
								
<tr><td>
	<span id="mybottomtoolbar">
		<table width="100%">
		<tr>
			<td class="ms-toolbar" nowrap="">
				<table>
					<tr>
						<td width="99%" class="ms-toolbar" nowrap=""><IMG SRC="/_layouts/images/blank.gif" width="1" height="18"/></td>
						<td class="ms-toolbar" nowrap="">
							<SharePoint:SaveButton runat="server" ControlMode="Edit" id="savebutton2"/>
						</td>
						<td class="ms-separator"> </td>
						<td class="ms-toolbar" nowrap="" align="right">
							<SharePoint:GoBackButton runat="server" ControlMode="Edit" id="gobackbutton2"/>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		</table>
	</span>
</td></tr>

	</xsl:template>



	<xsl:template name="dvt_1.rowedit">
								<xsl:param name="Pos" />
								
								





<tr><td>
<div class="show" id="attachmentPart" title="attachmentPart"  >
<table class="border"  cellspacing="0" width="100%">
	<tr>
		<td style="text-align:center; " >
			<img src="../../images/box-upload.jpg" />
		</td>
	</tr>
	<tr>
		<td class="border-top">
			<span id="copyOfPartAttachment" ></span>
			<br/>
		</td>
	</tr>

</table>
</div>
</td></tr>









<tr><td>

<div class="show" id="generalPart" title="General"  >
			
<table class="border"  cellspacing="0" width="100%">


<tr><td style="text-align:center;" colspan="2" >
			<img src="../../images/crspndncsfnlb.jpg" width="1220" height="92" />
	</td>
</tr>
<tr><td class="border-top" style="text-align:center" colspan="2"><H1 class="myTitle">Correspondence Registration</H1></td></tr>
<tr><td class="border-top" style="text-align:center" colspan="2"><H2 class="ms-standardheader3">General</H2></td></tr>
<tr><td valign="top" class="border-top" width="50%">
				<table border="0" cellspacing="0" width="100%">
					<tr id="trTitle">
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Title<span class="ms-formvalidation"> *</span>
								</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff66{$Pos}" ControlMode="Edit" FieldName="Title" __designer:bind="{ddwrt:DataBind('i',concat('ff66',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Title')}"/>
						</td>
					</tr>


					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Unique NO<span class="ms-formvalidation"> *</span>
								</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff1{$Pos}" ControlMode="Edit" FieldName="UniqeNO" __designer:bind="{ddwrt:DataBind('i',concat('ff1',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@UniqeNO')}"/>
						</td>
					</tr>
					
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Project<span class="ms-formvalidation"> *</span>
								</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff2{$Pos}" ControlMode="Edit" FieldName="Project" __designer:bind="{ddwrt:DataBind('i',concat('ff2',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Project')}"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Unit/Grouping</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff3{$Pos}" ControlMode="Edit" FieldName="Unit_x002f_Grouping" __designer:bind="{ddwrt:DataBind('i',concat('ff3',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Unit_x002f_Grouping')}"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>REQ NO</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff4{$Pos}" ControlMode="Edit" FieldName="REQ_x0020_NO" __designer:bind="{ddwrt:DataBind('i',concat('ff4',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@REQ_x0020_NO')}"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Letter NO<span class="ms-formvalidation"> *</span>
								</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff5{$Pos}" ControlMode="Edit" FieldName="Letter_x0020_NO" __designer:bind="{ddwrt:DataBind('i',concat('ff5',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Letter_x0020_NO')}"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Letter Date<span class="ms-formvalidation"> *</span>
								</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff6{$Pos}" ControlMode="Edit" FieldName="Letter_x0020_Date" __designer:bind="{ddwrt:DataBind('i',concat('ff6',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Letter_x0020_Date')}"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Subject<span class="ms-formvalidation"> *</span>
								</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff7{$Pos}" ControlMode="Edit" FieldName="Subject" __designer:bind="{ddwrt:DataBind('i',concat('ff7',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Subject')}"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Letter Type</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff8{$Pos}" ControlMode="Edit" FieldName="Letter_x0020_Type" __designer:bind="{ddwrt:DataBind('i',concat('ff8',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Letter_x0020_Type')}"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>From Name</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff9{$Pos}" ControlMode="Edit" FieldName="From_x0020_Name" __designer:bind="{ddwrt:DataBind('i',concat('ff9',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@From_x0020_Name')}"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>To Name</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff10{$Pos}" ControlMode="Edit" FieldName="To_x0020_Name" __designer:bind="{ddwrt:DataBind('i',concat('ff10',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@To_x0020_Name')}"/>
						</td>
					</tr>
				</table>					
</td>
<td valign="top"  class="border-left-top" height="100%" width="50%">
				<table  cellspacing="0" height="100%">
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>CC:to</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff11{$Pos}" ControlMode="Edit" FieldName="CC_x003a_to" __designer:bind="{ddwrt:DataBind('i',concat('ff11',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@CC_x003a_to')}"/>
						</td>
					</tr>
					
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Hamesh from</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff12{$Pos}" ControlMode="Edit" FieldName="Hamesh_x0020_from" __designer:bind="{ddwrt:DataBind('i',concat('ff12',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Hamesh_x0020_from')}"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Hamesh to</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff13{$Pos}" ControlMode="Edit" FieldName="Hamesh_x0020_to" __designer:bind="{ddwrt:DataBind('i',concat('ff13',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Hamesh_x0020_to')}"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Hamesh Date</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff14{$Pos}" ControlMode="Edit" FieldName="Hamesh_x0020_Date" __designer:bind="{ddwrt:DataBind('i',concat('ff14',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Hamesh_x0020_Date')}"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Importance</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff15{$Pos}" ControlMode="Edit" FieldName="Importance" __designer:bind="{ddwrt:DataBind('i',concat('ff15',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Importance')}"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Hard Copy Filing No</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff16{$Pos}" ControlMode="Edit" FieldName="Hard_x0020_Copy_x0020_Filing_x00" __designer:bind="{ddwrt:DataBind('i',concat('ff16',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Hard_x0020_Copy_x0020_Filing_x00')}"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Key Words</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
						<table>
						<tr>
							<td><SharePoint:FormField runat="server" id="ff17{$Pos}" ControlMode="Edit" FieldName="Key_x0020_Words" __designer:bind="{ddwrt:DataBind('i',concat('ff17',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Key_x0020_Words')}"/></td>
							<td><SharePoint:FormField runat="server" id="ff69{$Pos}" ControlMode="Edit" FieldName="Key_x0020_Words_x0020_2" __designer:bind="{ddwrt:DataBind('i',concat('ff69',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Key_x0020_Words_x0020_2')}"/></td>
							<td><SharePoint:FormField runat="server" id="ff70{$Pos}" ControlMode="Edit" FieldName="Key_x0020_Words_x0020_3" __designer:bind="{ddwrt:DataBind('i',concat('ff70',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Key_x0020_Words_x0020_3')}"/></td>
							<td><SharePoint:FormField runat="server" id="ff71{$Pos}" ControlMode="Edit" FieldName="Key_x0020_Words_x0020_4" __designer:bind="{ddwrt:DataBind('i',concat('ff71',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Key_x0020_Words_x0020_4')}"/></td>
							<td><SharePoint:FormField runat="server" id="ff72{$Pos}" ControlMode="Edit" FieldName="Key_x0020_Words_x0020_5" __designer:bind="{ddwrt:DataBind('i',concat('ff72',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Key_x0020_Words_x0020_5')}"/></td>
						</tr>
						</table>
						</td>
					</tr>
					
					<tr>
						<td width="18%" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Remark</nobr>
							</H3>
						</td>
						<td width="90%" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff39{$Pos}" ControlMode="Edit" FieldName="Remark" __designer:bind="{ddwrt:DataBind('i',concat('ff39',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Remark')}"/>
						</td>
					</tr>
					<tr>
						<td class="border-top" colspan="2">
						<img src="../../images/LettersSmall.jpg" width="500" />
							<input class="ms-vb" style="width:20%; height:30px ; vertical-align:middle" type="button" value="Upload Letter" onclick="uploadFilesLetter()" />
						</td>
					</tr>
		<tr id="idAttachmentsRow">
						<td nowrap="true" valign="top" class="ms-formlabel" width="20%">
							<SharePoint:FieldLabel ControlMode="Edit" FieldName="Attachments" runat="server" id="FieldLabel1"/>
						</td>
						<td valign="top" class="ms-formbody" width="80%">
							<SharePoint:FormField runat="server" id="AttachmentsField" ControlMode="Edit" FieldName="Attachments" __designer:bind="{ddwrt:DataBind('i','AttachmentsField','Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Attachments')}"/>
							<script>
          var elm = document.getElementById(&quot;idAttachmentsTable&quot;);
          if (elm == null || elm.rows.length == 0)
          document.getElementById(&quot;idAttachmentsRow&quot;).style.display=&apos;none&apos;;
        					</script> </td>
		</tr>
		<xsl:if test="$dvt_1_automode = '1'" ddwrt:cf_ignore="1">
			<tr>
							<td colspan="99" class="ms-vb">
								<span ddwrt:amkeyfield="ID" ddwrt:amkeyvalue="ddwrt:EscapeDelims(string(@ID))" ddwrt:ammode="view"></span>
							</td>
			</tr>
		</xsl:if>
					
				</table>
</td>
</tr>

					<tr>
<!--=================================== References ===================================-->
	<td class="border-top" colspan="2" ><table id="Reference"  cellspacing="0"><tr>
						<td width="10%" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Reference Type1</nobr>
							</H3>
						</td>
						<td width="20%" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff18{$Pos}" ControlMode="Edit" FieldName="Reference_x0020_Type" __designer:bind="{ddwrt:DataBind('i',concat('ff18',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Reference_x0020_Type')}"/>
						</td>
						<td width="10%" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Reference NO1</nobr>
							</H3>
						</td>
						<td width="30%" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff19{$Pos}" ControlMode="Edit" FieldName="Reference_x0020_NO" __designer:bind="{ddwrt:DataBind('i',concat('ff19',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Reference_x0020_NO')}"  />
						</td>
						<td width="10%" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Reference Date1</nobr>
							</H3>
						</td>
						<td width="20%" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff20{$Pos}" ControlMode="Edit" FieldName="Reference_x0020_Date" __designer:bind="{ddwrt:DataBind('i',concat('ff20',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Reference_x0020_Date')}"/>
						</td>
	</tr></table></td>

					</tr>
					<!--<xsl:if test="boolean(@Reference_x0020_NO2)">-->
					<tr>

	<td colspan="2"><table  id="Reference2" cellspacing="0">
						<tr>
						<td width="10%" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Reference Type2</nobr>
							</H3>
						</td>
						<td width="20%" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff21{$Pos}" ControlMode="Edit" FieldName="Reference_x0020_Type2" __designer:bind="{ddwrt:DataBind('i',concat('ff21',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Reference_x0020_Type2')}"/>
						</td>
						<td width="10%" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Reference NO2</nobr>
							</H3>
						</td>
						<td width="30%" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff22{$Pos}" ControlMode="Edit" FieldName="Reference_x0020_NO2" __designer:bind="{ddwrt:DataBind('i',concat('ff22',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Reference_x0020_NO2')}"/>
						</td>
						<td width="10%" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Reference Date2</nobr>
							</H3>
						</td>
						<td width="20%" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff23{$Pos}" ControlMode="Edit" FieldName="Reference_x0020_Date2" __designer:bind="{ddwrt:DataBind('i',concat('ff23',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Reference_x0020_Date2')}"/>
						</td>
	</tr></table ></td>

					</tr>
					<!--<xsl:if test="boolean(@Reference_x0020_NO3)">--><tr>

	<td colspan="2"><table id="Reference3" cellspacing="0"><tr>
						<td width="10%" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Reference Type3</nobr>
							</H3>
						</td>
						<td width="20%" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff24{$Pos}" ControlMode="Edit" FieldName="Reference_x0020_Type3" __designer:bind="{ddwrt:DataBind('i',concat('ff24',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Reference_x0020_Type3')}"/>
						</td>
						<td width="10%" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Reference NO3</nobr>
							</H3>
						</td>
						<td width="30%" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff25{$Pos}" ControlMode="Edit" FieldName="Reference_x0020_NO3" __designer:bind="{ddwrt:DataBind('i',concat('ff25',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Reference_x0020_NO3')}"/>
						</td>
						<td width="10%" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Reference Date3</nobr>
							</H3>
						</td>
						<td width="20%" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff26{$Pos}" ControlMode="Edit" FieldName="Reference_x0020_Date3" __designer:bind="{ddwrt:DataBind('i',concat('ff26',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Reference_x0020_Date3')}"/>
						</td>
	</tr></table></td>

					</tr><!--</xsl:if>-->
					<!--<xsl:if test="boolean(@Reference_x0020_NO4)">--><tr>

	<td colspan="2"><table id="Reference4"  cellspacing="0"><tr>
						<td width="10%" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Reference Type4</nobr>
							</H3>
						</td>
						<td width="20%" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff27{$Pos}" ControlMode="Edit" FieldName="Reference_x0020_Type4" __designer:bind="{ddwrt:DataBind('i',concat('ff27',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Reference_x0020_Type4')}"/>
						</td>
						<td width="10%" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Reference NO4</nobr>
							</H3>
						</td>
						<td width="30%" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff28{$Pos}" ControlMode="Edit" FieldName="Reference_x0020_NO4" __designer:bind="{ddwrt:DataBind('i',concat('ff28',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Reference_x0020_NO4')}"/>
						</td>
						<td width="10%" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Reference Date4</nobr>
							</H3>
						</td>
						<td width="20%" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff29{$Pos}" ControlMode="Edit" FieldName="Reference_x0020_Date4" __designer:bind="{ddwrt:DataBind('i',concat('ff29',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Reference_x0020_Date4')}"/>
						</td>
	</tr></table></td>

					</tr><!--</xsl:if>-->
					<!--<xsl:if test="boolean(@Reference_x0020_NO5)">--><tr>

	<td colspan="2"><table id="Reference5" cellspacing="0"><tr>
						<td width="10%" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Reference Type5</nobr>
							</H3>
						</td>
						<td width="20%" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff30{$Pos}" ControlMode="Edit" FieldName="Reference_x0020_Type5" __designer:bind="{ddwrt:DataBind('i',concat('ff30',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Reference_x0020_Type5')}"/>
						</td>
						<td width="10%" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Reference NO5</nobr>
							</H3>
						</td>
						<td width="30%" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff31{$Pos}" ControlMode="Edit" FieldName="Reference_x0020_NO5" __designer:bind="{ddwrt:DataBind('i',concat('ff31',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Reference_x0020_NO5')}"/>
						</td>
						<td width="10%" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Reference Date5</nobr>
							</H3>
						</td>
						<td width="20%" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff32{$Pos}" ControlMode="Edit" FieldName="Reference_x0020_Date5" __designer:bind="{ddwrt:DataBind('i',concat('ff32',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Reference_x0020_Date5')}"/>
						</td>
	</tr></table></td>
	
<!--=================================== References ===================================-->

					</tr><!--</xsl:if>-->
					<tr>
						<td width="5%" valign="top" class="ms-formlabel">
							
							<SPAN style="BACKGROUND-IMAGE: url(/_layouts/inc/MergedImage2.png?rev=MgwMZrsJcX2hRvGHEYkZlQ%3D%3D); WIDTH: 10px; BACKGROUND-POSITION: -20px -7px; HEIGHT: 10px; VERTICAL-ALIGN: middle; OVERFLOW: hidden" onclick="ShowRef();" alt="">
								<IMG style="WIDTH: 10px; HEIGHT: 10px" alt="" src="http://www.hedcoint.com/_layouts/inc/blank.gif?rev=MgI7szz7KhmQpO8thbasFg%3D%3D" />
							</SPAN>
						</td>
					</tr>					

<tr>
	<td colspan="2" width="100%">

<table cellspacing="0" width="100%">	
	<tr>
		<td class="border-top" align="center" width="50%">				<span class="ms-standardheader2"><b>Received Fields</b></span></td>
		<td class="border-left-top" align="center" width="50%">		<span class="ms-standardheader2"><b>Sent Fields</b></span> </td>

	</tr>
	<tr>
		<td valign="top">

				<table cellspacing="0">
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Reply is Required</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff33{$Pos}" ControlMode="Edit" FieldName="Reply_x0020_is_x0020_Required" __designer:bind="{ddwrt:DataBind('i',concat('ff33',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Reply_x0020_is_x0020_Required')}"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Reply Duration (Day)</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody" nowrap="">
							<SharePoint:FormField runat="server" id="ff34{$Pos}" ControlMode="Edit" FieldName="Reply_x0020_Duration_x0020__x002" __designer:bind="{ddwrt:DataBind('i',concat('ff34',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Reply_x0020_Duration_x0020__x002')}"/>
							<SharePoint:FormField runat="server" id="ff342{$Pos}" ControlMode="Display" FieldName="Replay_x0020_Date" __designer:bind="{ddwrt:DataBind('i',concat('ff342',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Replay_x0020_Date')}"/>
						</td>
					</tr>
					<tr>
						<td class="border-top" colspan="2">
						</td>
					</tr>
				</table>
		</td>
		<td valign="top" class="border-left" width="100%">

				<table cellspacing="0">
					
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Expediting is Required</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff35{$Pos}" ControlMode="Edit" FieldName="Expediting_x0020_is_x0020_Requir" __designer:bind="{ddwrt:DataBind('i',concat('ff35',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Expediting_x0020_is_x0020_Requir')}"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Expediting Duration (Day)</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff36{$Pos}" ControlMode="Edit" FieldName="Expediting_x0020_Duration_x0020_" __designer:bind="{ddwrt:DataBind('i',concat('ff36',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Expediting_x0020_Duration_x0020_')}"/>
							<SharePoint:FormField runat="server" id="ff362{$Pos}" ControlMode="Display" FieldName="Expediting_x0020_Date" __designer:bind="{ddwrt:DataBind('i',concat('ff362',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Expediting_x0020_Date')}"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Letter Status</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff37{$Pos}" ControlMode="Edit" FieldName="Letter_x0020_Status" __designer:bind="{ddwrt:DataBind('i',concat('ff37',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Letter_x0020_Status')}"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Expediting Status</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff38{$Pos}" ControlMode="Edit" FieldName="Expediting_x0020_Status" __designer:bind="{ddwrt:DataBind('i',concat('ff38',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Expediting_x0020_Status')}"/>
						</td>
					</tr>
				</table>					
		</td>
	</tr>

	<tr>
		<td align="center"  class="border-top" colspan="2">
			<input class="ms-ButtonHeightWidth" style="width:200px; height:30px; vertical-align:middle" type="button" value="Replied Informatiion" onclick="repliedPartShow()" />
			<span class="ms-separator" style="color:white">_</span>
			<input class="ms-ButtonHeightWidth" style="width:200px; height:30px; vertical-align:middle" type="button" value="Distribution" onclick="distributionPartShow()" />
		</td>
	</tr>
</table>



	</td>
</tr>
					
</table>
<!--table width="100%">
	<tr>
		<td align="center"  class="border" colspan="2">
			<input class="ms-vb" style="width:200px ; height:36px; vertical-align:middle" type="button" value="Distribution" onclick="distributionPartShow()" />
		</td>
	</tr>
</table-->

</div>













<div class="show" id="distributionPart" title="Distribution">


<table class="border" cellspacing="0" width="100%">				
	<tr>
		<td class="border-bottom" style="text-align:center;" align="center" colspan="2">
			<img src="../../images/crspndncsfnlb.jpg" width="1050" height="92"/>
		</td>
	</tr>
	<tr>
		<td class="ms-standardheader2"  style="text-align:center; height: 84px" valign="top"><b>Projects Group</b></td>
	
		<td class="border-left" style="height: 84px">
			<table cellspacing="0" width="100%">				
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader" style="text-align:center">
								<nobr>PD</nobr>
							</H3>
						</td>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader" style="text-align:center">
								<nobr>ED</nobr>
							</H3>
						</td>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader" style="text-align:center">
								<nobr>DPD</nobr>
							</H3>
						</td>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader" style="text-align:center">
								<nobr>PM</nobr>
							</H3>
						</td>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader" style="text-align:center">
								<nobr>PE</nobr>
							</H3>
						</td>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader" style="text-align:center">
								<nobr>PC</nobr>
							</H3>
						</td>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader" style="text-align:center">
								<nobr>DC</nobr>
							</H3>
						</td>
						
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader" style="text-align:center">
								<nobr>HSE</nobr>
							</H3>
						</td>
						
						
						
												
					</tr>
					<tr>
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff40{$Pos}" ControlMode="Edit" FieldName="PD" __designer:bind="{ddwrt:DataBind('i',concat('ff40',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@PD')}"/>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff41{$Pos}" ControlMode="Edit" FieldName="ED" __designer:bind="{ddwrt:DataBind('i',concat('ff41',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@ED')}"/>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff42{$Pos}" ControlMode="Edit" FieldName="DPD" __designer:bind="{ddwrt:DataBind('i',concat('ff42',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@DPD')}"/>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff43{$Pos}" ControlMode="Edit" FieldName="PMG" __designer:bind="{ddwrt:DataBind('i',concat('ff43',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@PMG')}"/>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff46{$Pos}" ControlMode="Edit" FieldName="PEG" __designer:bind="{ddwrt:DataBind('i',concat('ff46',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@PEG')}"/>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff49{$Pos}" ControlMode="Edit" FieldName="PC" __designer:bind="{ddwrt:DataBind('i',concat('ff49',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@PC')}"/>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff67{$Pos}" ControlMode="Edit" FieldName="DC" __designer:bind="{ddwrt:DataBind('i',concat('ff67',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@DC')}"/><SharePoint:FieldDescription runat="server" id="ff67description{$Pos}" FieldName="DC" ControlMode="Edit" />
						</td>
						
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff167{$Pos}" ControlMode="Edit" FieldName="HSE" __designer:bind="{ddwrt:DataBind('i',concat('ff167',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@HSE')}"/>
							<SharePoint:FieldDescription runat="server" id="ff167description{$Pos}" FieldName="HSE" ControlMode="Edit" />
						</td>
						
						
						
												
					</tr>
					<tr>
						<td width="400px" valign="top" class="style1"><input name="btnAddPD" type="button" value="Add" style="font-size: 10px;" onclick="DistributionAddClick(this);" /></td>
						<td width="400px" valign="top" class="style1"><input name="btnAddED" type="button" value="Add" style="font-size: 10px;" onclick="DistributionAddClick(this);" /></td>
						<td width="400px" valign="top" class="style1"><input name="btnAddDPD" type="button" value="Add" style="font-size: 10px;" onclick="DistributionAddClick(this);" /></td>
						<td width="400px" valign="top" class="style1"><input name="btnAddPMG" type="button" value="Add" style="font-size: 10px;" onclick="DistributionAddClick(this);" /></td>
						<td width="400px" valign="top" class="style1"><input name="btnAddPEG" type="button" value="Add" style="font-size: 10px;" onclick="DistributionAddClick(this);" /></td>
						<td width="400px" valign="top" class="style1"><input name="btnAddPC" type="button" value="Add" style="font-size: 10px;" onclick="DistributionAddClick(this);" /></td>
						<td width="400px" valign="top" class="style1"><input name="btnAddDC" type="button" value="Add" style="font-size: 10px;" onclick="DistributionAddClick(this);" /></td>
						<td width="400px" valign="top" class="style1"><input name="btnAddHSE" type="button" value="Add" style="font-size: 10px;" onclick="DistributionAddClick(this);" /></td>
						
						
						
						
					</tr>
			</table>					
		</td>
	</tr>
	<tr>
		<td ><hr/></td>
		<td class="border-left"><hr/></td>
	</tr>
	<tr>
		<td class="border-bottom" style="text-align:center" valign="top"><span class="ms-standardheader2"><b>Disciplines</b></span></td>
		<td class="border-left-bottom">

			<table cellspacing="0" width="100%">
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader" style="text-align:center">
								<nobr>PR</nobr>
							</H3>
						</td>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader" style="text-align:center">
								<nobr>EL</nobr>
							</H3>
						</td>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader" style="text-align:center">
								<nobr>IN</nobr>
							</H3>
						</td>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader" style="text-align:center">
								<nobr>MD</nobr>
							</H3>
						</td>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader" style="text-align:center">
								<nobr>RE</nobr>
							</H3>
						</td>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader" style="text-align:center">
								<nobr>ST</nobr>
							</H3>
						</td>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader" style="text-align:center">
								<nobr>PI</nobr>
							</H3>
						</td>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader" style="text-align:center">
								<nobr>PQ</nobr>
							</H3>
						</td>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader" style="text-align:center">
								<nobr>PN</nobr>
							</H3>
						</td>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader" style="text-align:center">
								<nobr>QC</nobr>
							</H3>
						</td>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader" style="text-align:center">
								<nobr>VDC</nobr>
							</H3>
						</td>												
					</tr>
					<tr>
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff50{$Pos}" ControlMode="Edit" FieldName="PR" __designer:bind="{ddwrt:DataBind('i',concat('ff50',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@PR')}"/>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff51{$Pos}" ControlMode="Edit" FieldName="EL" __designer:bind="{ddwrt:DataBind('i',concat('ff51',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@EL')}"/>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff52{$Pos}" ControlMode="Edit" FieldName="IN" __designer:bind="{ddwrt:DataBind('i',concat('ff52',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@IN')}"/>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff53{$Pos}" ControlMode="Edit" FieldName="MD" __designer:bind="{ddwrt:DataBind('i',concat('ff53',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@MD')}"/>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff54{$Pos}" ControlMode="Edit" FieldName="RE" __designer:bind="{ddwrt:DataBind('i',concat('ff54',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@RE')}"/>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff55{$Pos}" ControlMode="Edit" FieldName="ST" __designer:bind="{ddwrt:DataBind('i',concat('ff55',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@ST')}"/>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff56{$Pos}" ControlMode="Edit" FieldName="PI" __designer:bind="{ddwrt:DataBind('i',concat('ff56',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@PI')}"/>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff57{$Pos}" ControlMode="Edit" FieldName="PQ" __designer:bind="{ddwrt:DataBind('i',concat('ff57',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@PQ')}"/>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff58{$Pos}" ControlMode="Edit" FieldName="PN" __designer:bind="{ddwrt:DataBind('i',concat('ff58',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@PN')}"/>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff59{$Pos}" ControlMode="Edit" FieldName="QC" __designer:bind="{ddwrt:DataBind('i',concat('ff59',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@QC')}"/>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff68{$Pos}" ControlMode="Edit" FieldName="VDC" __designer:bind="{ddwrt:DataBind('i',concat('ff68',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@VDC')}"/>
							<SharePoint:FieldDescription runat="server" id="ff68description{$Pos}" FieldName="VDC" ControlMode="Edit"/>
						</td>												
					</tr>
					<tr>
						<td width="400px" valign="top" class="style1"><input name="btnAddPR" type="button" value="Add" style="font-size: 10px;" onclick="DistributionAddClick(this);" /></td>
						<td width="400px" valign="top" class="style1"><input name="btnAddEL" type="button" value="Add" style="font-size: 10px;" onclick="DistributionAddClick(this);" /></td>
						<td width="400px" valign="top" class="style1"><input name="btnAddIN" type="button" value="Add" style="font-size: 10px;" onclick="DistributionAddClick(this);" /></td>
						<td width="400px" valign="top" class="style1"><input name="btnAddMD" type="button" value="Add" style="font-size: 10px;" onclick="DistributionAddClick(this);" /></td>
						<td width="400px" valign="top" class="style1"><input name="btnAddRE" type="button" value="Add" style="font-size: 10px;" onclick="DistributionAddClick(this);" /></td>
						<td width="400px" valign="top" class="style1"><input name="btnAddST" type="button" value="Add" style="font-size: 10px;" onclick="DistributionAddClick(this);" /></td>
						<td width="400px" valign="top" class="style1"><input name="btnAddPI" type="button" value="Add" style="font-size: 10px;" onclick="DistributionAddClick(this);" /></td>
						<td width="400px" valign="top" class="style1"><input name="btnAddPQ" type="button" value="Add" style="font-size: 10px;" onclick="DistributionAddClick(this);" /></td>
						<td width="400px" valign="top" class="style1"><input name="btnAddPN" type="button" value="Add" style="font-size: 10px;" onclick="DistributionAddClick(this);" /></td>
						<td width="400px" valign="top" class="style1"><input name="btnAddQC" type="button" value="Add" style="font-size: 10px;" onclick="DistributionAddClick(this);" /></td>
						<td width="400px" valign="top" class="style1"><input name="btnAddVDC" type="button" value="Add" style="font-size: 10px;" onclick="DistributionAddClick(this);" /></td>
					</tr>
			</table>
		</td>
	</tr>

					<tr>
						<td width="100px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Selected Names</nobr>
							</H3>
						</td>
						<td width="99%" valign="top" class="ms-formbody">
								<SharePoint:FormField runat="server" id="ff60{$Pos}" ControlMode="Edit" FieldName="All_x0020_Users" __designer:bind="{ddwrt:DataBind('i',concat('ff60',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@All_x0020_Users')}"/>
								<input type="button" name="btnAllUsersBack" value="Remove" onclick="AllUsersBackClicked()"/>
								<input type="button" name="btnAllUsersClear" value="Clear" onclick="AllUsersClearClicked()"/>
						</td>
					</tr>

					<tr>
						<td width="100px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Responsible for Replying</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
								<SharePoint:FormField runat="server" id="ff61{$Pos}" ControlMode="Edit" FieldName="Responsible" __designer:bind="{ddwrt:DataBind('i',concat('ff61',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Responsible')}"/>
						</td>
					</tr>
	<tr>
		<td align="center"  class="border-top" colspan="2">
			<input class="ms-vb" style="width:200px ; height:36px; vertical-align:middle" type="button" value="Back" onclick="generalPartShow()" />
		</td>
	</tr>
					
</table>
</div>







<div class="hide" id="repliedPart" title="Replied">

<table class="border" cellspacing="0" width="100%">
	<tr>
		<td class="border-bottom" style="text-align:center; " colspan="2">
			<img src="../../images/crspndncsfnlb.jpg" width="1210" height="92" />
		</td>
	</tr>
					<tr >
						<td width="18%" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Replied Letter NO</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody" nowrap="">
							<SharePoint:FormField runat="server" id="ff62{$Pos}" ControlMode="Edit" FieldName="Replied_x0020_Letter_x0020_NO" __designer:bind="{ddwrt:DataBind('i',concat('ff62',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Replied_x0020_Letter_x0020_NO')}"/>
						</td>
					</tr>
					<tr>
						<td width="18%" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Replied Letter Date</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff63{$Pos}" ControlMode="Edit" FieldName="Replied_x0020_Letter_x0020_Date" __designer:bind="{ddwrt:DataBind('i',concat('ff63',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Replied_x0020_Letter_x0020_Date')}"/>
						</td>
					</tr>
					<tr>
						<td width="18%" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Reply Priority</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff64{$Pos}" ControlMode="Edit" FieldName="Reply_x0020_Importance" __designer:bind="{ddwrt:DataBind('i',concat('ff64',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Reply_x0020_Importance')}"/>
						</td>
					</tr>
					<tr>
						<td width="18%" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Reply Hard Copy Filing NO</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff65{$Pos}" ControlMode="Edit" FieldName="Reply_x0020_Hard_x0020_Copy_x002" __designer:bind="{ddwrt:DataBind('i',concat('ff65',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Reply_x0020_Hard_x0020_Copy_x002')}"/>
						</td>
					</tr>
					<tr>
						<td width="18%" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Attach Replied Letter</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<input class="ms-ButtonHeightWidth" style="vertical-align:middle" type="button" value="Upload Replied Letter" onclick="uploadFilesReply()" />
						</td>
					</tr>
					
					<tr>
						<td align="center"  class="border-top" colspan="2">
							<input class="ms-vb" style="width:200px ; height:36px; vertical-align:middle" type="button" value="Back" onclick="generalPartShow()" />
						</td>
					</tr>
	</table>
</div>				
				
				
				
</td></tr>
<tr><td>
			<table width="100%" class="hide">
				<tr>
					<td width="18%" valign="top" class="ms-formlabel">
						<H3 class="ms-standardheader">
							<nobr>Letter File Name</nobr>
						</H3>
					</td>
					<td width="400px" valign="top" class="ms-formbody">
						<SharePoint:FormField runat="server" id="ff1A{$Pos}" ControlMode="Edit" FieldName="LetterFileName" __designer:bind="{ddwrt:DataBind('i',concat('ff1A',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@LetterFileName')}"/>
					</td>
				</tr>
				<tr>
					<td width="18%" valign="top" class="ms-formlabel">
						<H3 class="ms-standardheader">
							<nobr>Replied File Names</nobr>
						</H3>
					</td>
					<td width="400px" valign="top" class="ms-formbody">
						<SharePoint:FormField runat="server" id="ff1A2{$Pos}" ControlMode="Edit" FieldName="RepliedFileNames" __designer:bind="{ddwrt:DataBind('i',concat('ff1A2',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@RepliedFileNames')}"/>
					</td>
				</tr>
			</table>
</td></tr>


								
	</xsl:template>
</xsl:stylesheet>	</XSL>
</WebPartPages:DataFormWebPart>

</span>

</form>
<script type="text/javascript" language="javascript">
	fillDefaultValues();
</script>
</body>

</html>
