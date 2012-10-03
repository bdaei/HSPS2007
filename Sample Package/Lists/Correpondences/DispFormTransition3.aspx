<%@ Page Language="C#" inherits="Microsoft.SharePoint.WebPartPages.WebPartPage, Microsoft.SharePoint, Version=12.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register tagprefix="WebPartPages" namespace="Microsoft.SharePoint.WebPartPages" assembly="Microsoft.SharePoint, Version=12.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register tagprefix="SharePoint" namespace="Microsoft.SharePoint.WebControls" assembly="Microsoft.SharePoint, Version=12.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register tagprefix="CorrespondancesRelatedLetters" namespace="HEDCO.SharePoint.WebParts.CorrespondancesRelatedLetters" assembly="HEDCO.SharePoint.WebParts.CorrespondancesRelatedLetters, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9f4da00116c38ec5" %>
<html dir="ltr">

<head runat="server">
<meta name="ProgId" content="SharePoint.WebPartPage.Document">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Correspondances 2</title>


<link rel="stylesheet" type="text/css" href="../../myStyle.css">
<link rel="stylesheet" type="text/css" href="../Correspondances%2020/_layouts/1033/Styles/core.css">

<script type="text/javascript" language="javascript">

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

function generalPartShow()
{
        if (imgObj.partname != "generalPart") {
	        imgObj.filters[0].apply();
	        
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
	        
//            hideToolbars();
            generalPart.className 	= "hide";
            repliedPart.className 	= "show";
            showToolbars();

	        imgObj.filters[0].play();
        }
}

//	_spBodyOnLoadFunctionNames.push("fillDefaultValues");
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

	var generalPart;
	var distributionPart;
	var repliedPart;

function fillDefaultValues() {

	generalPart = getTagFromIdentifierAndTitle('div','','General');
	distributionPart = getTagFromIdentifierAndTitle('div','','Distribution');
	repliedPart = getTagFromIdentifierAndTitle('div','','Replied');
	
	distributionPart.className 	= "hide";
	repliedPart.className 		= "hide";
}



</script>

<style type="text/css">
.ms-standardheader
{
	font-family:Verdana;
	font-size:10px;
}
.ms-standardheader-rtl
{
	font-family:Verdana;
	font-size:10px;
	direction:rtl
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
.ms-formbody-rtl{
font-family:georgia, verdana;
font-size:.7em;
vertical-align:top;
background:#ebf3ff;
border-top:1px solid #d8d8d8;
padding:3px 6px 4px 6px;
direction:rtl;
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


</style>

</head>

<body>

<form id="form1" runat="server">

<span partname="" style="FILTER: progid:DXImageTransform.Microsoft.Fade(Overlap=0.50); BACKGROUND-COLOR: white; PADDING-LEFT: 13px; WIDTH: 100%; PADDING-RIGHT: 10px; FONT: 9pt/1.3 verdana;  COLOR: black" id="imgObj">


<WebPartPages:DataFormWebPart runat="server" IsIncluded="True" FrameType="None" NoDefaultStyle="TRUE" ViewFlag="0" Title="Correspondances 2.0" __markuptype="vsattributemarkup" __WebPartId="{A01AEE05-ACA0-467F-BB38-EE3DCAFC371E}" id="g_78a31f66_8d46_4896_a0a6_263ff21bbf5a" __AllowXSLTEditing="true" WebPart="true" Height="" Width="">
	<DataSources>
		<SharePoint:SPDataSource runat="server" DataSourceMode="ListItem" UseInternalName="true" selectcommand="&lt;View&gt;&lt;Query&gt;&lt;Where&gt;&lt;Eq&gt;&lt;FieldRef Name=&quot;ContentType&quot;/&gt;&lt;Value Type=&quot;Text&quot;&gt;Item&lt;/Value&gt;&lt;/Eq&gt;&lt;/Where&gt;&lt;/Query&gt;&lt;/View&gt;" id="Correspondances_x0020_2_x002e_1"><SelectParameters><WebPartPages:DataFormParameter Name="ListItemId" ParameterKey="ListItemId" PropertyName="ParameterValues" DefaultValue="0"/><WebPartPages:DataFormParameter Name="ListID" ParameterKey="ListID" PropertyName="ParameterValues" DefaultValue="{$CorrepondencesList}"/>
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
	<datafields>@Title,Title;@Project,Project;@Unit_x002f_Grouping,Unit/Grouping;@Letter_x0020_NO,Letter NO;@Letter_x0020_Date,Letter Date;@Subject,Subject;@From_x0020_Name,From Name;@Letter_x0020_Type,Letter Type;@To_x0020_Name,To Name;@CC_x003a_to,CC:to;@Hamesh_x0020_from,Hamesh from;@Hamesh_x0020_to,Hamesh to;@Hamesh_x0020_Date,Hamesh Date;@Importance,Importance;@Hard_x0020_Copy_x0020_Filing_x00,Hard Copy Filing No;@Key_x0020_Words,Key Words;@REQ_x0020_NO,REQ NO;@Reference_x0020_Type,Reference Type;@Reference_x0020_NO,Reference NO;@Reference_x0020_Date,Reference Date;@Reference_x0020_Type3,Reference Type3;@Reference_x0020_Type2,Reference Type2;@Reference_x0020_Type4,Reference Type4;@Reference_x0020_Type5,Reference Type5;@Reference_x0020_NO2,Reference NO2;@Reference_x0020_NO3,Reference NO3;@Reference_x0020_NO4,Reference NO4;@Reference_x0020_NO5,Reference NO5;@Reference_x0020_Date2,Reference Date2;@Reference_x0020_Date3,Reference Date3;@Reference_x0020_Date4,Reference Date4;@Reference_x0020_Date5,Reference Date5;@Reply_x0020_is_x0020_Required,Reply is Required;@Reply_x0020_Duration_x0020__x002,Reply Duration (Day);@Replay_x0020_Date,Replay Date;@Expediting_x0020_is_x0020_Requir,Expediting is Required;@Expediting_x0020_Duration_x0020_,Expediting Duration (Day);@Expediting_x0020_Date,Expediting Date;@Letter_x0020_Status,Letter Status;@Expediting_x0020_Status,Expediting Status;@Remark,Remark;@PD,PD;@ED,ED;@DPD,DPD;@PMG,PMG;@PML,PML;@PMZ,PMZ;@PEG,PEG;@PEL,PEL;@PEZ,PEZ;@PC,PC;@PR,PR;@EL,EL;@IN,IN;@MD,MD;@RE,RE;@ST,ST;@PI,PI;@PQ,PQ;@PN,PN;@QC,QC;@All_x0020_Users,All Users;@Responsible,Responsible;@Replied_x0020_Letter_x0020_NO,Replied Letter NO;@Replied_x0020_Letter_x0020_Date,Replied Letter Date;@Reply_x0020_Importance,Reply Importance;@Reply_x0020_Hard_x0020_Copy_x002,Reply Hard Copy Filing NO;@Department_x0020_Finder,Department Finder;@LetterFileName,LetterFileName;@RepliedFileNames,RepliedFileNames;@DEPARTME,DEPARTMENT ver2;@NewLette,New-Letter;@NewLette0,New-Letter for Reply_modified;@To_x0020_Company,To Company;@From_x0020_Company,From Company;@DC,DC;@VDC,VDC;@UniqeNO,UniqeNO;@Modified0,Modified-Letter;@alertfor,alert for-reply;@TitleWithLink,TitleWithLink;@Workflow,New Letter for-Reply;@NewLette1,New-Letter for Reply_modified (2);@Key_x0020_Words_x0020_2,Key Words 2;@Key_x0020_Words_x0020_3,Key Words 3;@Key_x0020_Words_x0020_4,Key Words 4;@Key_x0020_Words_x0020_5,Key Words 5;@DEPARTME0,DEPARTMENT ver2 (2);@Modified1,Modified-Letter (2);@Modified2,Modified-Letter (3);@DEPARTME1,DEPARTMENT ver2 (1);@Modified3,Modified-Letter (4);@NewLette2,New-Letter for Reply;@ContentType,Content Type;@SkipFirstEdit,SkipFirstEdit;@HSE,HSE;@ID,ID;@Modified,Modified;@Created,Created;@Author,Created By;@Editor,Modified By;@_UIVersionString,Version;@Attachments,Attachments;@File_x0020_Type,File Type;@FileLeafRef,Name (for use in forms);@FileDirRef,Path;@FSObjType,Item Type;@_HasCopyDestinations,Has Copy Destinations;@_CopySource,Copy Source;@ContentTypeId,Content Type ID;@_ModerationStatus,Approval Status;@_UIVersion,UI Version;@Created_x0020_Date,Created;@FileRef,URL Path;</datafields>
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
		<table border="0" width="100%">
			<xsl:call-template name="dvt_1.body">
				<xsl:with-param name="Rows" select="$Rows"/>
			</xsl:call-template>
		</table>
	</xsl:template>
	<xsl:template name="dvt_1.body">
		<xsl:param name="Rows"/>
<tr><td><span id="mytoolbar"><table width="100%" cellspacing="0" cellpadding="0">
		<tr>
			<td class="ms-toolbar" nowrap="">
				<table>
					<tr>
						<td width="99%" class="ms-toolbar" nowrap=""><IMG SRC="/_layouts/images/blank.gif" width="1" height="18"/></td>
						<td class="ms-toolbar" nowrap="" align="right">
							<SharePoint:GoBackButton runat="server" ControlMode="Display" id="gobackbutton1"/>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td class="ms-toolbar" nowrap="">
				<SharePoint:FormToolBar runat="server" ControlMode="Display"/>
			</td>
		</tr>
</table></span></td></tr>		
		<xsl:for-each select="$Rows">
			<xsl:call-template name="dvt_1.rowview" >
												<xsl:with-param name="Pos" select="concat('_', position())" />
			</xsl:call-template>
		</xsl:for-each>
		<tr>
			<td class="ms-toolbar" nowrap="">
<span id="mybottomtoolbar">			
				<table>
					<tr>
						<td class="ms-descriptiontext" nowrap="">
							<SharePoint:CreatedModifiedInfo ControlMode="Display" runat="server"/>
						</td>
						<td width="99%" class="ms-toolbar" nowrap=""><IMG SRC="/_layouts/images/blank.gif" width="1" height="18"/></td>
						<td class="ms-toolbar" nowrap="" align="right">
							<SharePoint:GoBackButton runat="server" ControlMode="Display" id="gobackbutton2"/>
						</td>
					</tr>
				</table>
</span>				
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="dvt_1.rowview">
								<xsl:param name="Pos" />





		<tr>
			<td>
<div class="show" id="generalPart{generate-id()}" title="General"  >
			
<table class="border"  cellspacing="0" width="100%">


<tr><td style="text-align:center;" colspan="2" >
			<img src="../../images/crspndncsfnlb.jpg" width="1220" height="92" />
	</td>
</tr>
<tr><td class="border-top" style="text-align:center" colspan="2"><H1 class="myTitle">Correspondence Registration</H1></td></tr>
<tr><td class="border-top" style="text-align:center" colspan="2"><H2 class="ms-standardheader3">General</H2></td></tr>
<tr><td valign="top" class="border-top" width="50%">
			
				<table border="0" cellspacing="0" width="100%">
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Uniqe NO</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@UniqeNO"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Project</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@Project"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Unit/Grouping</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@Unit_x002f_Grouping"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>REQ NO</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@REQ_x0020_NO"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Letter NO</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@Letter_x0020_NO"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Letter Date</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="ddwrt:FormatDate(string(@Letter_x0020_Date), 1033, 5)"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Subject</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody-rtl">
							<xsl:value-of select="@Subject"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Letter Type</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@Letter_x0020_Type"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>From Name</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@From_x0020_Name"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>To Name</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@To_x0020_Name"/>
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
							<xsl:value-of select="@CC_x003a_to"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Hamesh from</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@Hamesh_x0020_from"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Hamesh to</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@Hamesh_x0020_to"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Hamesh Date</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="ddwrt:FormatDate(string(@Hamesh_x0020_Date), 1033, 5)"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Importance</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@Importance"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Hard Copy Filing No</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@Hard_x0020_Copy_x0020_Filing_x00"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Key Words</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<table cellpadding="0" cellspacing="1" style="font-size:10px;">
							<tr><td style="padding-right:5px;"><xsl:value-of select="@Key_x0020_Words"/></td><td style="padding-left:5px;"><xsl:value-of select="@Key_x0020_Words_x0020_2"/></td></tr>
							<tr><td style="padding-right:5px;"><xsl:value-of select="@Key_x0020_Words_x0020_3"/></td><td style="padding-left:5px;"><xsl:value-of select="@Key_x0020_Words_x0020_4"/></td></tr>
							<tr><td><xsl:value-of select="@Key_x0020_Words_x0020_5"/></td></tr>
							</table>					
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Remark</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@Remark" disable-output-escaping="yes"/>
						</td>
					</tr>
		<tr id="idAttachmentsRow{generate-id()}">
						<td nowrap="true" valign="top" class="ms-formlabel" width="20%">
							<SharePoint:FieldLabel ControlMode="Display" FieldName="Attachments" runat="server" id="FieldLabel1{generate-id()}"/>
						</td>
						<td valign="top" class="ms-formbody" width="80%">
							<SharePoint:FormField runat="server" id="AttachmentsField{$Pos}" ControlMode="Display" FieldName="Attachments" __designer:bind="{ddwrt:DataBind('i',concat('AttachmentsField',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Attachments')}"/>
							<script>
          var elm = document.getElementById(&quot;idAttachmentsTable&quot;);
          if (elm == null || elm.rows.length == 0)
          document.getElementById(&quot;idAttachmentsRow&quot;).style.display=&apos;none&apos;;
        					</script> </td>
		</tr>

				</table>
</td>
</tr>


<!--=================================== References ===================================-->
					<tr>
	<td class="border-top" colspan="2" ><table id="Reference{generate-id()}"  cellspacing="0"><tr>
						<td width="10%" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Reference Type</nobr>
							</H3>
						</td>
						<td width="20%" valign="top" class="ms-formbody">
							<xsl:value-of select="@Reference_x0020_Type"/>
						</td>
						<td width="10%" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Reference NO</nobr>
							</H3>
						</td>
						<td width="30%" valign="top" class="ms-formbody">
							<xsl:value-of select="@Reference_x0020_NO"/>
						</td>
						<td width="10%" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Reference Date</nobr>
							</H3>
						</td>
						<td width="20%" valign="top" class="ms-formbody">
							<xsl:value-of select="@Reference_x0020_Date"/>
						</td>
	</tr></table></td>

					</tr>
<!--=================================== References ===================================-->



<!--=================================== Reply | Send ===================================-->
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
							<xsl:choose>
								<xsl:when test="@Reply_x0020_is_x0020_Required='1' or msxsl:string-compare(string(@Reply_x0020_is_x0020_Required),'Yes','','i')=0 or msxsl:string-compare(string(@Reply_x0020_is_x0020_Required),'True','','i')=0">Yes</xsl:when>
								<xsl:otherwise>No</xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Reply Duration (Day)</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="format-number(@Reply_x0020_Duration_x0020__x002, '#,##0.00;-#,##0.00')"/>
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
							<xsl:choose>
								<xsl:when test="@Expediting_x0020_is_x0020_Requir='1' or msxsl:string-compare(string(@Expediting_x0020_is_x0020_Requir),'Yes','','i')=0 or msxsl:string-compare(string(@Expediting_x0020_is_x0020_Requir),'True','','i')=0">Yes</xsl:when>
								<xsl:otherwise>No</xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Expediting Duration (Day)</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="format-number(@Expediting_x0020_Duration_x0020_, '#,##0.00;-#,##0.00')"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Letter Status</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@Letter_x0020_Status"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Expediting Status</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@Expediting_x0020_Status"/>
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
</div>












<div class="show" id="distributionPart{generate-id()}" title="Distribution">


<table class="border" cellspacing="0" width="100%">				
	<tr>
		<td class="border-bottom" style="text-align:center;" align="center" colspan="2">
			<img src="../../images/crspndncsfnlb.jpg" width="1150" height="92" />
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
							<xsl:value-of select="@PD"/>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@ED"/>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@DPD"/>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@PMG"/>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@PEG"/>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@PC"/>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@DC"/>
						</td>
						
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@HSE"/>
						</td>
						
						
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
							<xsl:value-of select="@PR"/>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@EL"/>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@IN"/>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@MD"/>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@RE"/>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@ST"/>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@PI"/>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@PQ"/>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@PN"/>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@QC"/>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@VDC"/>
						</td>
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
							<xsl:value-of select="@All_x0020_Users"/>
						</td>
					</tr>

					<tr>
						<td width="100px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Responsible for Replying</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of disable-output-escaping="yes" select="@Responsible"/>
						</td>
					</tr>
	<tr>
		<td align="center"  class="border-top" colspan="2">
			<input class="ms-vb" style="width:200px ; height:36px; vertical-align:middle" type="button" value="Back" onclick="generalPartShow()" />
		</td>
	</tr>
					
</table>
</div>








<div class="show" id="repliedPart{generate-id()}" title="Replied">

<table class="border" cellspacing="0" width="100%">
	<tr>
		<td class="border-bottom" style="text-align:center; " colspan="2">
			<img src="../../images/crspndncsfnlb.jpg" width="1050" height="92"/>
		</td>
	</tr>







					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Replied Letter NO</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@Replied_x0020_Letter_x0020_NO"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Replied Letter Date</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="ddwrt:FormatDate(string(@Replied_x0020_Letter_x0020_Date), 1033, 5)"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Reply Priority</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@Reply_x0020_Importance"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Reply Hard Copy Filing NO</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@Reply_x0020_Hard_x0020_Copy_x002"/>
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



	</xsl:template>
</xsl:stylesheet>	</XSL>
</WebPartPages:DataFormWebPart>

</span>   

<script type="text/javascript" language="javascript">
	fillDefaultValues();
</script>
  


  

</form>

</body>

</html>
