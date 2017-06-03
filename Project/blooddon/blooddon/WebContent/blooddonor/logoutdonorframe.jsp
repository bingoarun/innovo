<%
//Disable caching of this page
response.setHeader("Cache-Control","no-store"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy
//Create a DB pool connection
javax.naming.InitialContext ctx= new javax.naming.InitialContext();
javax.sql.DataSource ds = (javax.sql.DataSource) ctx.lookup
("java:comp/env/jdbc/blooddon");
java.sql.Connection con = ds.getConnection();
java.sql.Statement st = con.createStatement();
//Get the session object
javax.servlet.http.HttpSession ses=request.getSession(false);
String uname=null;

//Check whether session variables are present
if((ses.getValue("uname")!=null) )
{
//update status in database
st.executeUpdate("update arun.blooddonor set login_status=0 where username like '"+ses.getValue("uname")+"'");
//Disable the current session variables
ses.invalidate();
%>
<html>
<head>
<title> Log out </title>
</head>
<body onLoad="saybye();">
<script language="JavaScript">
function saybye()
{
alert('Logged out successfully');
document.location="welcome.jsp";
}
</script>
</body>
</html>
<%
}
else //Session variables not present
{
%>
<script language="JavaScript">
alert("You have not logged in at all.");
document.location="welcome.jsp";
</script>
<%
}
%>