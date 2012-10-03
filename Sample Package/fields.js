
var vals = new Object();
var navBarHelpOverrideKey = "wssmain";

// setLookupFromFieldName: Set a form field value using its //    fieldname to find it in the page
// Arguments:
//        fieldName:    The name of the list column
//        value:        Set the fieldName to this value
//
    function setLookupFromFieldName(tagName, fieldName, value, name) {
        if (value == undefined) return;
        var theInput = getTagFromIdentifierAndTitle(tagName,"",fieldName);
        if(theInput != null) {
            theInput.value = value;
        }
        else if(tagName=="select"){
	        theInput = getTagFromIdentifierAndTitle("input","",fieldName);
	        theInput.value = name;
	        document.getElementById(theInput.optHid).value = value;
       	
        }
        if(theInput != null) {
//        	theInput.parentElement.disabled = 'disabled';
		}        
    }
    
// getTagFromIdentifierAndTitle: Find a form field object using its tagName,//     identifier, and title to find it in the page
// Arguments:
//        tagName:    The type of input field (input, select, etc.)
//        identifier:    The identifier for the instance of the fieldName//                       (ff1, ff2, etc.)
//        title:        The title of the list column
//
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
    
    function GetQueryStringInVals()
    {
	  var qs = location.search.substring(1, location.search.length);
	  var args = qs.split("&");
	  for (var i=0; i < args.length; i++) {
	    var nameVal = args[i].split("=");
	    var temp = unescape(nameVal[1]).split('+');
	    nameVal[1] = temp.join(' ');
	    vals[nameVal[0]] = nameVal[1];
	  }  
    }

    function GetQueryString(name)
    {
	  var qs = location.search.substring(1, location.search.length);
	  var args = qs.split("&");
	  for (var i=0; i < args.length; i++) {
	    var nameVal = args[i].split("=");
	    var temp = unescape(nameVal[1]).split('+');
	    nameVal[1] = temp.join(' ');
	    vals[nameVal[0]] = nameVal[1];
	  }
	  return vals[name];
	  
    }


    function getTagFromValue(tagName, val) {
        var tags = document.getElementsByTagName(tagName);

        for (var i=0; i < tags.length; i++) {
            if (tags[i].value == val) {
                return tags[i];
            }
        }
        return null;
    }
    
    
// setCheckboxFromFieldName: 
// Arguments:
//        fieldName:    The name of the list column
//        value:        checked/ 
//
    function setCheckboxFromFieldName(fieldName, value) {
        if (value == undefined) return;
        var theInput = getTagFromIdentifierAndTitle("input","",fieldName);
        if(theInput != null) {
            theInput.checked = value;
        }
       
    }

// Not used
function getTagFromInnertext(parentTag, innertextval, find)
{
        alert('aaa');
	alert( parentTag.tagName+' / ' +parentTag.innerText );
	var childs = parentTag.children;
	for (var i=0; i < childs.length; i++) {
		if(childs[i].tagName=="TD" && childs[i].innerText == innertextval){
			find = childs[i];
			return;
		}
		getTagFromInnertext(childs[i], innertextval, find);
		if(find != undefined) return;
	}
	return;
}


// use for change td tag`s text
function getTDTagFromInnertext(innertextval)
{
	var tags = document.getElementsByTagName("TD");
	for (var i=tags.length-1; i >= 0 ; i--) {
		if(tags[i].innerText == innertextval) return tags[i];
	}
	return;
}


var Utf8 = {
 
	// public method for url encoding
	encode : function (string) {
		string = string.replace(/\r\n/g,"\n");
		var utftext = "";
 
		for (var n = 0; n < string.length; n++) {
 
			var c = string.charCodeAt(n);
 
			if (c < 128) {
				utftext += String.fromCharCode(c);
			}
			else if((c > 127) && (c < 2048)) {
				utftext += String.fromCharCode((c >> 6) | 192);
				utftext += String.fromCharCode((c & 63) | 128);
			}
			else {
				utftext += String.fromCharCode((c >> 12) | 224);
				utftext += String.fromCharCode(((c >> 6) & 63) | 128);
				utftext += String.fromCharCode((c & 63) | 128);
			}
 
		}
 
		return utftext;
	},
 
	// public method for url decoding
	decode : function (utftext) {
		var string = "";
		var i = 0;
		var c = c1 = c2 = 0;
 
		while ( i < utftext.length ) {
 
			c = utftext.charCodeAt(i);
 
			if (c < 128) {
				string += String.fromCharCode(c);
				i++;
			}
			else if((c > 191) && (c < 224)) {
				c2 = utftext.charCodeAt(i+1);
				string += String.fromCharCode(((c & 31) << 6) | (c2 & 63));
				i += 2;
			}
			else {
				c2 = utftext.charCodeAt(i+1);
				c3 = utftext.charCodeAt(i+2);
				string += String.fromCharCode(((c & 15) << 12) | ((c2 & 63) << 6) | (c3 & 63));
				i += 3;
			}
 
		}
 
		return string;
	}
 
}

