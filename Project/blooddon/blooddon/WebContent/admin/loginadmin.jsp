<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
//Check whether a session variable is already present
if((ses.getValue("uname")!=null) )
{
//Retrieve the values of session variables
uname=(String)ses.getValue("uname");

//Update database to record the log in status of user
st.executeUpdate("update arun.administrator set login_status=1 where username like '"+uname+"'");
%>
<script language="javascript">
document.location="admin_home.jsp";
</script>
<%
}
else //Session variables not present
{
%>
<script language="JavaScript">
alert("You must login to view this page. Redirecting to login page..");
document.location="loginfrm.html"; //Redirect to login page
</script>
<%
}
%>

<title>Insert title here</title>
</head>
<body>

</body>
</html>