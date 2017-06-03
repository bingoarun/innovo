<%
String to_id=request.getParameter("to_id");
String subject=request.getParameter("subject");
String message=request.getParameter("message");





//Create DB pool connection
javax.naming.InitialContext ctx= new javax.naming.InitialContext();
javax.sql.DataSource ds = (javax.sql.DataSource) ctx.lookup
("java:comp/env/jdbc/blooddon");
java.sql.Connection con = ds.getConnection();
java.sql.Statement st = con.createStatement();
//Get read-only access to session by passing false to getSession()
javax.servlet.http.HttpSession ses=request.getSession(false);
String uname=null;
uname=(String)ses.getValue("uname");

//Check whether a session variable is already present
 if((ses.getValue("uname")!=null) )
{
//Retrieve the values of session variables
uname=(String)ses.getValue("uname");

String q="insert into arun.mail (from_id,to_id,subject,message,read,delete) values (9999, "+to_id+",'"+subject+"','"+message+"','"+0+"','"+0+"')";
System.out.println(q);
st.executeUpdate(q);
%>
<script language="javascript">


</script>
<%
}
else //Session variables not present
{
%>
<script language="JavaScript">
alert("Your access is restricted to view this page..");
document.location="bloodbank_index.jsp"; //Redirect to login page
</script>
<%
}

%>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="blooddonor/successmsg.css" rel="stylesheet" type="text/css">
</head>
<body class="successmsg">
Mail sent successfully !!!
</body>
</html>