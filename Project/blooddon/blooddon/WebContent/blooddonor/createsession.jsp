<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%
//Create DB Pool connection
javax.naming.InitialContext ctx= new javax.naming.InitialContext();
javax.sql.DataSource ds = (javax.sql.DataSource) ctx.lookup
("java:comp/env/jdbc/blooddon");
java.sql.Connection con = ds.getConnection();
java.sql.Statement st = con.createStatement();
//Get the username and password entered in login page
String uname=request.getParameter("uname");
String pass=request.getParameter("pass");
//Declare an object ses to hold the session from browser
javax.servlet.http.HttpSession ses=null;
//Query from the database whether valid user or not
java.sql.ResultSet rs=st.executeQuery("select fname from arun.blooddonor where username like '"+uname+"'and password like '"+pass+"'");
if(rs.next()) // if valid user
{
//Get the browser session with write permission
ses=request.getSession(true);
//Create 2 session variables
ses.putValue("pass",pass);
ses.putValue("uname",uname);
%>
<script language="JavaScript">
document.location="logindonor.jsp";//redirect to home page decider
</script>
<%
}
else //if not a valid user
{
%>
<script language="JavaScript">
window.alert("Invalid Username and password. Redirecting to login page.");
document.location="welcome.jsp"; //redirect to login page.
</script>
<%
}
%>

<title>Untitled Document</title>
<link href="formdesign.css" rel="stylesheet" type="text/css" />
</head>

<body>
</body>
</html>