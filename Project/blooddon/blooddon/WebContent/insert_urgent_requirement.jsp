<%
String name=request.getParameter("name");
String bld_grp=request.getParameter("bld_grp");
String phnum=request.getParameter("phnum");
String district=request.getParameter("district");
String state=request.getParameter("state");





//Create DB pool connection
javax.naming.InitialContext ctx= new javax.naming.InitialContext();
javax.sql.DataSource ds = (javax.sql.DataSource) ctx.lookup
("java:comp/env/jdbc/blooddon");
java.sql.Connection con = ds.getConnection();
java.sql.Statement st = con.createStatement();
//Get read-only access to session by passing false to getSession()



//Check whether a session variable is already present


String q="insert into arun.urgent (name,bld_grp,phnum,district,state,delete) values ('"+name+"',' "+bld_grp+"','"+phnum+"','"+district+"','"+state+"','"+0+"')";
System.out.println(q);
st.executeUpdate(q);
%>
<script language="javascript">


</script>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Urgent requirements </title>
<link href="blooddonor/successmsg.css" rel="stylesheet" type="text/css">
</head>
<body class="successmsg">
<p>Operation completed successfully !!! </p>
<p>&nbsp;</p>
</body>
</html>