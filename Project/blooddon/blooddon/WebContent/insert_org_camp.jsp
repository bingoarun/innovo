<%
String pgm_name=request.getParameter("event_name");
String datum1=request.getParameter("datum1");
String datum2=request.getParameter("datum2");
String str_time=request.getParameter("str_time");
String end_time=request.getParameter("end_time");
String description=request.getParameter("description");
String venue=request.getParameter("venue");

String date1=datum1.substring(6,10)+"-"+datum1.charAt(3)+datum1.charAt(4)+"-"+datum1.charAt(0)+datum1.charAt(1);
String date2=datum2.substring(6,10)+"-"+datum2.charAt(3)+datum2.charAt(4)+"-"+datum2.charAt(0)+datum2.charAt(1);



//Create DB pool connection
javax.naming.InitialContext ctx= new javax.naming.InitialContext();
javax.sql.DataSource ds = (javax.sql.DataSource) ctx.lookup
("java:comp/env/jdbc/blooddon");
java.sql.Connection con = ds.getConnection();
java.sql.Statement st = con.createStatement();
//Get read-only access to session by passing false to getSession()
javax.servlet.http.HttpSession ses=request.getSession(false);
String uname=null;


//Check whether a session variable is already present
if((ses.getValue("uname")!=null) )
{
//Retrieve the values of session variables
uname=(String)ses.getValue("uname");

String q="insert into arun.event (bank_id,description,str_date,end_date,str_time,end_time,pgm_name,event_status,delete,venue,bdc_event) values ((select bank_id from arun.bloodbank where name='"+uname+"'),' "+description+"','"+date1+"','"+date2+"','"+str_time+"','"+end_time+"','"+pgm_name+"','"+1+"',"+0+",'"+venue+"',"+0+")";
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
<title>Blood donation Camp creation</title>
<link href="blooddonor/successmsg.css" rel="stylesheet" type="text/css">
</head>
<body class="successmsg">
Operation completed successfully !!!
</body>
</html>