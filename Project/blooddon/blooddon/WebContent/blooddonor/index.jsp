<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />






<title>Welcome</title>
<style type="text/css">
<!--
.menutable {
	color: #FFF;
	font-size: 14px;
	font-family: Arial, Helvetica, sans-serif;
	font-weight: bold;
}
.menut {
	color: #FFF;
}
.eventmenu {
	color: #FFF;
}
.welcome {
	color: #FFF;
}
.events {
	color: #FFF;
}
-->
</style>
<link href="dropdown-menu.css" media="screen" rel="stylesheet" type="text/css" />

<script type="text/javascript">

/***********************************************
* IFrame SSI script II- � Dynamic Drive DHTML code library (http://www.dynamicdrive.com)
* Visit DynamicDrive.com for hundreds of original DHTML scripts
* This notice must stay intact for legal use
***********************************************/

//Input the IDs of the IFRAMES you wish to dynamically resize to match its content height:
//Separate each ID with a comma. Examples: ["myframe1", "myframe2"] or ["myframe"] or [] for none:
var iframeids=["sec"]

//Should script hide iframe from browsers that don't support this script (non IE5+/NS6+ browsers. Recommended):
var iframehide="yes"

var getFFVersion=navigator.userAgent.substring(navigator.userAgent.indexOf("Firefox")).split("/")[1]
var FFextraHeight=parseFloat(getFFVersion)>=0.1? 16 : 0 //extra height in px to add to iframe in FireFox 1.0+ browsers

function resizeCaller() {
var dyniframe=new Array()
for (i=0; i<iframeids.length; i++){
if (document.getElementById)
resizeIframe(iframeids[i])
//reveal iframe for lower end browsers? (see var above):
if ((document.all || document.getElementById) && iframehide=="no"){
var tempobj=document.all? document.all[iframeids[i]] : document.getElementById(iframeids[i])
tempobj.style.display="block"
}
}
}

function resizeIframe(frameid){
var currentfr=document.getElementById(frameid)
if (currentfr && !window.opera){
currentfr.style.display="block"
if (currentfr.contentDocument && currentfr.contentDocument.body.offsetHeight) //ns6 syntax
currentfr.height = currentfr.contentDocument.body.offsetHeight+FFextraHeight; 
else if (currentfr.Document && currentfr.Document.body.scrollHeight) //ie5+ syntax
currentfr.height = currentfr.Document.body.scrollHeight;
if (currentfr.addEventListener)
currentfr.addEventListener("load", readjustIframe, false)
else if (currentfr.attachEvent){
currentfr.detachEvent("onload", readjustIframe) // Bug fix line
currentfr.attachEvent("onload", readjustIframe)
}
}
}

function readjustIframe(loadevt) {
var crossevt=(window.event)? event : loadevt
var iframeroot=(crossevt.currentTarget)? crossevt.currentTarget : crossevt.srcElement
if (iframeroot)
resizeIframe(iframeroot.id);
}

function loadintoIframe(iframeid, url){
if (document.getElementById)
document.getElementById(iframeid).src=url
}

if (window.addEventListener)
window.addEventListener("load", resizeCaller, false)
else if (window.attachEvent)
window.attachEvent("onload", resizeCaller)
else
window.onload=resizeCaller

</script>

</head>

<body>
<table width="1044" height="1334" border="0" align="center">
  <tr>
    <td height="177">
    
    <div align="center"><img src="images/BAN.jpg" alt="banner" width="1156" height="145" align="middle" /></div>
<div align="center">
  <table width="1130" height="154" border="0" align="center">
    <tr>
      <td width="868" height="150" align="center">
        <ul id="navigation" class="nav-main">
          <li>
            <div align="center"><a href="welcome.jsp" target="sec">Home</a>            </div>
          </li>
          <li><a href="eventreg.jsp" target="sec">Events</a></li>
          <li><a href="bankreg.jsp" target="sec">Blood bank registration</a></li>
          <li><a href="../photo_galary/index.html" target="sec">Photo galary</a></li>
           <li><a href="feedback.jsp" target="sec">Feedback</a></li>
          <li><a href="aboutus.html" target="sec">About us</a></li>
        </ul>
       <a href="logoutdonor.jsp">Sign out</a>
          _________________________________________________________________________________________________________________________________________
        </form></tr>
  </table>
</div>
    
   </td>
  </tr>
  <tr >
  
    <td height="200" align="top" valign="top" bgcolor="#FFFFFF" ><a href="welcome.html">
      <iframe align="top" id="sec" name="sec" src="welcome.jsp"  scrolling="no" height="200" width="1200" marginwidth="0" marginheight="0" frameborder="0" vspace="0" hspace="0" style="overflow:visible; width:100%; display:none">  </iframe>
    </a>
    
    
    </td>
  </tr>
  
</table>

</body>
</html>
