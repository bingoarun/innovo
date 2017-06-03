<%


//Create DB pool connection
javax.naming.InitialContext ctx= new javax.naming.InitialContext();
javax.sql.DataSource ds = (javax.sql.DataSource) ctx.lookup
("java:comp/env/jdbc/blooddon");
java.sql.Connection con = ds.getConnection();
java.sql.Statement st = con.createStatement();
//Get read-only access to session by passing false to getSession()
javax.servlet.http.HttpSession ses=request.getSession(false);
String uname=null;

String newadd="";
if((ses.getValue("uname")!=null) )
{
//Retrieve the values of session variables
uname=(String)ses.getValue("uname");

//Update database to record the log in status of user
//st.executeUpdate("update arun.blooddonor set login_status=1 where username like '"+uname+"'");
%>
<script language="javascript">

</script>
<%
}
else //Session variables not present
{
%>
<script language="JavaScript">

document.location="search_without_login.jsp"; //Redirect to login page
</script>
<%
}

String q="select * from arun.event where (days(current date)-days(end_date) >=0 )   " ;
//
java.sql.ResultSet rs = st.executeQuery(q);
//Now row pointer of rs points to unreadable row
%>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Search for particular blood group</title>
<link href="formdesign.css" rel="stylesheet" type="text/css" />
</head>

<body class="formhead">
<script language="JavaScript">
function validate()
{
	var flag=0;
	var loc=document.form1.loc.value;
	if(loc=="")
		{
		window.alert("Please enter a location");
		}
	else
		flag=1;
	if(flag==1)
		{
		return true;
		}
	else
		return false;
}
</script>
<p>	Search for particular blood group
</p>
<form id="form1" name="form1" method="post" action="search_grp_table.jsp" onSubmit="return validate()";>
<table width="797" height="273" border="0" cellpadding="2" cellspacing="2">
  <tr>
    <td width="323" align="right">Blood group:</td>
    <td width="454">
      <label>
        <select name="bld_grp" id="bld_grp">
          <option value="A+" >A+</option>
          <option value="A-">A-</option>
          <option value="B+">B+</option>
          <option value="B-">B-</option>
          <option value="O+">O+</option>
          <option value="O-">O-</option>
          <option value="AB+">AB+</option>
          <option value="AB-">AB-</option>
        </select>
      </label>
  </td>
  </tr>
  <tr>
    <td align="right">Enter a location(district):</td>
    <td><label>
      <input type="text" name="loc" id="loc" />
    </label></td>
  </tr>
  <tr>
    <td align="right"><label>
      <input name="search" type="submit" id="search" value="Search" />
    </label></td>
    <td><label>
      <input type="reset" name="reset" id="reset" value="Reset" /> 
    </label></td>
  </tr>
</table> </form>
<p>&nbsp;</p>
</body>
</html>
