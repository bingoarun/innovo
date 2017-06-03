<%
javax.naming.InitialContext ctx= new javax.naming.InitialContext();
javax.sql.DataSource ds =(javax.sql.DataSource)ctx.lookup("java:comp/env/jdbc/blooddon");
java.sql.Connection con = ds.getConnection(); //Assume pool name as jdbc/mydbpool
java.sql.Statement st = con.createStatement();

javax.servlet.http.HttpSession ses=request.getSession(false);

String uname=null;


//Check whether a session variable is already present
if((ses.getValue("uname")!=null) )
{
//Retrieve the values of session variables
uname=(String)ses.getValue("uname");



}
else //Session variables not present
{
%>
<script language="JavaScript">
alert("You must login to view this page. Redirecting to login page..");
document.location="temp_loginfrm.html"; //Redirect to login page
</script>
<%
}



String q="select * from arun.event where delete=0 and bdc_event=0 and  bank_id=(select bank_id from bloodbank where   name='"+ uname +"' and days(current date)-days(end_date) >=0)";
java.sql.ResultSet rs = st.executeQuery(q);
//Now row pointer of rs points to unreadable row
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View event registrations</title>
<link rel="stylesheet" href="formdesign.css" /> 
<link rel="stylesheet" href="tabledesign.css" />
</head>
<body >
<script language="JavaScript">
function validate()
{

if( document.form1.event_id.value.length == 0)
	{
	window.alert("Enter a valid Event ID");	
	return false;
		
	}
else
	{
	return true;
	
	}
}
</script>

<span class="formhead">View Blood donation camp registrations:</span>
<form name="form1" method="post" action="view_camp_reg_table.jsp" onSubmit="return validate()">
  <p class="formheadtext">Event ID:
    <label>
      <input type="text" name="event_id" id="event_id">
    </label>
    <label>
      <input type="submit" name="submit" id="submit" value="Show registrations" >
    </label>
  </p>
</form>
</br></br>

<table border="1" class="hovertable">
<tr>
<th> Camp ID </th>
<th> Camp Name </th>
<th> Description </th>
<th> Start date </th>
<th> End date</th>
<th> Venue</th>
</tr>
<%
while( rs.next() ) //if next row exists, point to it and execute the loop
{
%>
<tr onmouseover="this.style.backgroundColor='#66c9ff';" onmouseout="this.style.backgroundColor='#d4e3e5';">
<td> <%= rs.getString("event_id") %> </td>
<td> <%= rs.getString("pgm_name") %> </td>
<td> <%= rs.getString("description") %> </td>
<td><%= rs.getString("str_date") %> </td>
<td><%= rs.getString("end_date") %> </td>
<td><%= rs.getString("venue") %> </td>

</tr>
<%
}
%>
</table>

</body>
</html>