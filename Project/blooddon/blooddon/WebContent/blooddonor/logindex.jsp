<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<style type="text/css">
<!--
.profile {
	color: #036;
	font-weight: bold;
	font-size: 18px;
	font-style: italic;
}
.tabhead {
	color: #069;
	font-weight: bold;
	font-size: 18px;
}
.tabele {
	color: #063;
	font-style: italic;
	font-weight: bold;
}
-->
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%
//Create DB pool connection
javax.naming.InitialContext ctx= new javax.naming.InitialContext();
javax.sql.DataSource ds = (javax.sql.DataSource) ctx.lookup
("java:comp/env/jdbc/blooddon");
java.sql.Connection con = ds.getConnection();
java.sql.Statement st = con.createStatement();
java.sql.Statement st1 = con.createStatement();
java.sql.Statement st2 = con.createStatement();
//Get read-only access to session by passing false to getSession()
javax.servlet.http.HttpSession ses=request.getSession(false);
String uname=null;
uname=(String)ses.getValue("uname");
if(uname=="admin")
{
	%>
	<script language="javascript">
	window.alert("hai");
	document.location="welcome.jsp"
	</script>
	<% 
}
String eve="select * from arun.event";
String evecomplete=null;
String single_event=null;
String pgmname=null;
String description=null;
String str_date=null;
String urg="select * from arun.urgent";
String fname=null;
String lname=null;
String mail_id=null;
String ph_num=null;
String blood_grp=null;
String dob=null;

java.sql.ResultSet rs = st.executeQuery(eve);
java.sql.ResultSet rs1 = st1.executeQuery(urg);
String newline = System.getProperty("line.separator");
uname=(String)ses.getValue("uname");
String pro="select * from arun.blooddonor where username like '"+uname+"'";
java.sql.ResultSet rs2 = st2.executeQuery(pro);
while(rs2.next())
{
	 fname=rs2.getString("fname");
	 lname=rs2.getString("lname");
	 mail_id=rs2.getString("mail_id");
	 ph_num=rs2.getString("ph_num");
	 blood_grp=rs2.getString("blood_grp");
	 dob=rs2.getString("dob");
}

//Check whether a session variable is already present
if((ses.getValue("uname")!=null) )
{
//Retrieve the values of session variables
uname=(String)ses.getValue("uname");

//Update database to record the log in status of user

}
String userin=null;
if(uname==null)
{
	userin="Guest";
	System.out.println("guest");
	
}
else
	{
	userin=uname;
	System.out.println("user");
	}
%>
<title>Welcome </title>
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
.social {
	color: #069;
	font-size: 20px;
}
#jb table tr td p {
	color: #900;
}
.bodyy {
	color: #069;
}
.bodyy {
	text-align: left;
}
.bodyy {
	font-size: 18px;
	text-align: justify;
}
#jb #form1 label center #sessionname {
	color: #069;
	font-weight: bold;
	font-style: italic;
}
-->
</style>
</head>

<body id="jb" >
<script language="JavaScript">

function validate()
{
	var uname=document.login.uname.value;
	var pass=document.login.pass.value;
	var flag=0;
if(uname=="")
	{
	window.alert("Enter a username");
	}
else if (pass=="")
	{
	window.alert("Enter a password");
	}
else
	flag=1;
	if(flag==0)
		return false;
	else
		return true;
	

}
</script>
 <form id="form1" name="form1" method="post" action="submit_donor_reg.jsp">
          <label>
            <center><input name="sessionname" type="text" id="sessionname" value="Welcome <%= userin %> !!!" readonly="readonly" /></center>
          </label>
 </form>
 </br>
<p align="center"></p>
<div align="center">
  <table width="1138" height="871" border="1" cellpadding="5" cellspacing="10">
    <tr>
      <td width="244" height="435"><table width="244" height="423" border="0" cellspacing="5">
        <tr>
          <td width="234" height="34" bgcolor="#000000" ><div align="center" class="eventmenu"><em><strong>Urgent requirements</strong></em></div></td>
        </tr>
        <tr>
          <td height="374">
          
        
         <marquee direction="up"> <table width="200"  border="0 cellpadding="2" cellspacing="2">
          <%while(rs1.next())
          {
        		String name=rs1.getString("name");
        		String phnum=rs1.getString("phnum");
        		String bld_grp=rs1.getString("bld_grp");
        		String district=rs1.getString("district");
        		String state=rs1.getString("state");
        		String single_req=name+"-"+phnum+"-"+bld_grp+"-"+district+"-"+state; %>
        		<tr>
    			<td><%= single_req %></td>
    			</tr>
   			<%
    			
          }
    			%>
    			</table>
    			</marquee>
        			
        	
        	
          
          </td>
        </tr>
      </table></td>
      <td width="466" rowspan="3"><div align="center">
        <table width="466" height="649" border="0">
          <tr>
            <td height="38" bgcolor="#000000" class="welcome"><div align="center"><strong><em>Welcome</em></strong></div></td>
            </tr>
          <tr>
            <td height="605" valign="top" class="bodyy">
            <br>
            <br>
            
            Everyday, hundreds of people in India require blood for a transfusion, a surgery or some medical procedure. In many cases, especially open heart surgery, there is need for fresh blood and therefore a need for donors.

If you are a healthy donor, and do not mind taking a little time out of your daily schedule to donate blood when someone is in an emergency, please REGISTER . You might be able to save a life or help ease the trauma for the kin of a patient. What's more, this very service might help you when in time of need. 

Indian Blood Donors tries to help victims/patients/those in need of blood. It is an attempt to reach out to these individuals in need of blood and connect them to those willing to donate.

The approach is multi-pronged... Indian Blood Donors will serve as a public directory of voluntary donors The service allows those in need of blood to mention their needs which are then made visible to a wide audience A comprehensive database will help individuals locate the nearest Blood Bank It is also a myth dispeller / an informative resource on blood and blood donation 

You can go to the nearest government approved blood centre, which is based on voluntary non/remunerated blood donation and make your significant contribution to saving life of a patient by donating blood. Your contribution is extremely valuable to us.

            </td>
            </tr>
        </table>
      </div></td>
    <td width="350"><table width="347" height="299" border="0" cellpadding="2" cellspacing="2">
  <tr>
    <td height="48" colspan="2" align="center" class="tabhead"><span class="profile">Profile</span></td>
  </tr>
  <tr>
    <td width="161" align="right" class="tabhead">First name:</td>
    <td width="208" class="tabele"><%= fname %></td>
  </tr>
  <tr>
    <td align="right" class="tabhead">Last name:</td>
    <td class="tabele"><%= lname %></td>
  </tr>
  <tr>
    <td align="right" class="tabhead">DOB:</td>
    <td class="tabele"><%= dob %></td>
  </tr>
  <tr>
    <td align="right" class="tabhead">Blood group</td>
    <td class="tabele"><%= blood_grp %></td>
  </tr>
  <tr>
    <td align="right" class="tabhead">Phone number:</td>
    <td class="tabele"><%= ph_num %></td>
  </tr>
  <tr>
    <td align="right" class="tabhead">Mail-ID:</td>
    <td class="tabele"><%= mail_id %></td>
  </tr>
  <tr>
    <td colspan="2" align="center" class="tabhead"><a href="logoutdonorframe.jsp">Logout</a></td>
  </tr>
</table>
      <div align="justify"></div></td>
    </tr>
    <tr>
      <td height="159" rowspan="2"><table width="249" height="171" border="0">
        <tr>
          <td height="29" bgcolor="#000000" class="events"><div align="center"><strong><em>Events</em></strong></div></td>
        </tr>
        <tr>
          <td height="115">
         <marquee direction="up"> <table width="200"  border="0 cellpadding="2" cellspacing="2">
          <%while(rs.next())
          {
        		pgmname=rs.getString("pgm_name");
        		description=rs.getString("description");
        		str_date=rs.getString("str_date");
        		single_event=pgmname+"-"+description+"-"+str_date; %>
        		<tr>
    			<td><%= single_event %></td>
    			</tr>
   			  <%
    			
          }
    			%>
    			</table>
    			</marquee>
        			
        	
        	</td>
        </tr>
      </table></td>
      <td height="101"><div align="center"><a href="../search_grp.jsp"><img src="images/findblooddonor.gif" width="360" height="85" alt="findblooddonor" /></a></div></td>
    </tr>
    <tr>
      <td height="89"><div align="center"><a href="../urgent_req.jsp"><img src="images/bloodrequest.gif" width="335" height="89" alt="bloodrequest" /></a></div></td>
    </tr>
    <tr>
      <td height="156"><div align="center"><a href="../photo_galary/index.html"><img src="images/photogalary.jpg" width="188" height="182" alt="photo galary" /></a></div></td>
      <td align="center" valign="middle">
      <span class="social">Like us on facebook :</span>
      <iframe src="https://www.facebook.com/plugins/like.php?href=https://www.facebook.com/BloodDonorCentralWebPortal"
        scrolling="no" frameborder="0"
        style="border:none; width:450px; height:80px"></iframe>
      <p>(c) Copyright Arun , 2012.  All rights reserved.</p></td>
      <td><div align="center">
        <table width="316" border="0">
          <tr>
            <td width="142" height="156"><div align="center"><a href="../bloodbank_index.html" target="mainframe" ><img src="images/bbank.jpg" width="103" height="133" alt="bloodbank" /></a></div></td>
            <td width="158"><div align="center"><a href="../admin/admin_index.jsp" target="mainFrame"><img src="images/admin.jpg" width="113" height="141" alt="admin" /></a></div></td>
          </tr>
        </table>
      </div></td>
    </tr>
  </table>
</div>
<p align="center">&nbsp;</p>
<p>&nbsp;</p>
</body>
</html>
