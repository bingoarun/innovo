

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script>
		!window.jQuery && document.write('<script src="jquery-1.4.3.min.js"><\/script>');
	</script>
	<script type="text/javascript" src="./fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
	<script type="text/javascript" src="./fancybox/jquery.fancybox-1.3.4.pack.js"></script>
	<link rel="stylesheet" type="text/css" href="./fancybox/jquery.fancybox-1.3.4.css" media="screen" />
 	<link rel="stylesheet" href="style.css" />
	<script type="text/javascript">
		$(document).ready(function() {
			/*
			*   Examples - images
			*/

			$("a#example1").fancybox();

			$("a#example2").fancybox({
				'overlayShow'	: false,
				'transitionIn'	: 'elastic',
				'transitionOut'	: 'elastic'
			});

			$("a#example3").fancybox({
				'transitionIn'	: 'none',
				'transitionOut'	: 'none'	
			});

			$("a#example4").fancybox({
				'opacity'		: true,
				'overlayShow'	: false,
				'transitionIn'	: 'elastic',
				'transitionOut'	: 'none'
			});

			$("a#example5").fancybox();

			$("a#example6").fancybox({
				'titlePosition'		: 'outside',
				'overlayColor'		: '#000',
				'overlayOpacity'	: 0.9
			});

			$("a#example7").fancybox({
				'titlePosition'	: 'inside'
			});

			$("a#example8").fancybox({
				'titlePosition'	: 'over'
			});

			$("a[rel=example_group]").fancybox({
				'transitionIn'		: 'none',
				'transitionOut'		: 'none',
				'titlePosition' 	: 'over',
				'titleFormat'		: function(title, currentArray, currentIndex, currentOpts) {
					return '<span id="fancybox-title-over">Image ' + (currentIndex + 1) + ' / ' + currentArray.length + (title.length ? ' &nbsp; ' + title : '') + '</span>';
				}
			});

			/*
			*   Examples - various
			*/

			$("#various1").fancybox({
				'titlePosition'		: 'inside',
				'transitionIn'		: 'none',
				'transitionOut'		: 'none'
			});

			$("#various2").fancybox();

			$("a.various3").fancybox({
				'width'				: '90%',
				'height'			: '90%',
				'autoScale'			: false,
				'transitionIn'		: 'none',
				'transitionOut'		: 'none',
				'type'				: 'iframe'
			});


			$("#various4").fancybox({
				'padding'			: 0,
				'autoScale'			: false,
				'transitionIn'		: 'none',
				'transitionOut'		: 'none'
			});
		});
	</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <%
//Create DB pool connection
javax.naming.InitialContext ctx= new javax.naming.InitialContext();
javax.sql.DataSource ds = (javax.sql.DataSource) ctx.lookup
("java:comp/env/jdbc/blooddon");
java.sql.Connection con = ds.getConnection();
java.sql.Statement st = con.createStatement();
//Get read-only access to session by passing false to getSession()
javax.servlet.http.HttpSession ses=request.getSession(false);
String uname=null,mailid=null,pass=null,manager_name=null,address=null,phnum=null;

String newadd="";
//Check whether a session variable is already present
if((ses.getValue("uname")!=null) )
{
//Retrieve the values of session variables
uname=(String)ses.getValue("uname");
pass=(String)ses.getValue("pass");
java.sql.ResultSet rs=st.executeQuery("select * from arun.bloodbank where name like '"+uname+"'and password like '"+pass+"'");
if(rs.next()) // if valid user
{
mailid=rs.getString("mail_id");
manager_name=rs.getString("manager_name");
address=rs.getString("area");
phnum=rs.getString("phnum");
}
}
%>




<title>frontmenu</title>
<style type="text/css">

/* just for the example */
body {padding:0; margin:20px;}
#links {border:1px solid #ccc; padding:10px;}
* {padding:0; margin:0; list-style-type:none; font-family:tahoma, arial, sans-serif; color:#ffffff; font-size:11px; font-weight:bold; text-decoration:none;  }
h1 {font-size:12px; color:#333; padding-bottom:20px;}
h2 { font-size:14px; font-weight:bold; margin:20px 0 10px 0; color:#ccc;}
li {margin:10px;}
hr {background:transparent; margin:20px 0; height:1px; border:0; border-top:1px dotted #ccc;}


/* rounded buttons */
.round {
	cursor:pointer; 
	cursor:hand; 
	line-height:27px;
	height:27px;
	background:url(images/button.jpg) no-repeat right top; 
	padding-right:30px; 
	display:inline-block;
}

.round ins { 
	background:url(images/button.jpg) no-repeat left top; 
	height:27px;
	line-height:27px;
	display:inline-block;
	padding-left:30px;
}
.profiledetails {
	color: #000;
}

	a.round:hover {background-position:right -155px;}
	a.round:hover ins {background-position:left -155px;}
	

/* end rounded buttons */

</style>
<style type="text/css">
<!--
body {
	background-image: url(images/back.jpg);
	background-repeat: no-repeat;
}
a:link {
COLOR: #8A0829;
}
a:visited {
COLOR: #800080;
}
a:hover {
COLOR: #FE2E64;
}
a:active {
COLOR: #7a112f;
}
-->
</style></head>

<body>
<table width="1299" height="493" border="0" cellpadding="1" cellspacing="2">
  <tr>
    <td width="213" height="169" bgcolor="#FFFFFF" class="profiledetails" align="center">Logged in as:
    <%= uname   %></br>
    Manager:<%=  manager_name %></br>
    <%=  mailid %></br>
    <%=  address %></br>
    <%=  phnum %></br>
    
    
    
    </td>
    <td width="284" align="right"><p><img src="images/search.jpg" width="145" height="146" alt="search" /></p>
    </td>
    <td width="175"><ol>
      <li><a class="various3" href="search_grp.jsp">Search for blood group </a></li>
      <li><a class="various3" href="search_donor.html">Search for particular donor</a></li>
      <li><a class="various3" href="view_bb.jsp">View all blood banks</a></li>
    </ol></td>
    <td width="204" align="right"><img src="images/organize.jpg" width="123" height="134" alt="organize" /></td>
    <td width="183"><ol>
      <li><a class ="various3" href="org_event.jsp">Organize event</a></li>
      <li><a class="various3" href="view_event_reg.jsp">View event registrations</a></li>
      <li><a class = " various3" href="event_history.jsp">view event history</a></li>
    </ol></td>
    <td width="214" colspan="2" rowspan="4" align="right">
      <ol>
        <li></li>
    </ol></td>
  </tr>
  <tr>
    <td width="213" height="48" align="center" valign="top">
    <li><a href="mail_box.jsp" class="round various3" ><ins>______Mails______</ins></a></li>
    
    
    
    </td>
    <td rowspan="3" align="right"><img src="images/contact1.jpg" width="153" height="149" alt="contact" /></td>
    <td rowspan="3">
    <ol>
      <li><a class="various3" href="sendmail.jsp">Contact another blood bank</a></li>
      <li><a class="various3" href="inbox.jsp">Check mails</a></li>
      <li><a class="various3" href="mail_admin.jsp">Contact admin</a></li>
    </ol>
    </td>
    <td rowspan="3" align="right"><img src="images/blood.jpg" width="168" height="161" alt="blooddon" /></td>
    <td rowspan="3">
      <ol>
        <li></li>
        <li><a class="various3" href="org_camp.jsp">Organize camp</a></li>
        <li><a class="various3" href="view_camp_reg.jsp">View camp registrations</a></li>
        <li><a class="various3" href="viewfeed.jsp">View feedbacks</a></li>
    </ol></td>
  </tr>
  <tr>
    <td height="57" align="center" valign="top"><li><a href="viewfeed.jsp" class="round various3"><ins>____View feedback____</ins></a></li>
    </td>
  </tr>
  <tr>
    <td height="48" align="center" valign="top"><li><a href="mail_admin.jsp" class="round various3"><ins>___Contact admin___</ins></a></li></td>
  </tr>
  <tr>
    <td width="213" height="48" align="center" valign="top"><li><a href="urgent_req.jsp" class="round various3"><ins>Post urgent requirement</ins></a></li></td>
    <td colspan="6" rowspan="3" align="center" class="endtitle">Innnovo 1.0 (C) Arun , 2012 . All rights reserved</td>
  </tr>
  <tr>
    <td height="48" align="center" valign="top"><li><a href="stocks_table.jsp" class="round various3"><ins>_____Stocks______</ins></a></li></td>
  </tr>
  <tr>
    <td height="57" align="center" valign="middle"><a href="logoutbank.jsp"><img src="images/logout.jpg" border="0" width="80" height="75" alt="logout" /></a></td>
  </tr>
</table>
</body>
</html>
