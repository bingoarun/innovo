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

int etype=0;
//Check whether a session variable is already present
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
alert("You must login to view this page. Redirecting to login page..");
document.location="loginfrm.jsp"; //Redirect to login page
</script>
<%
}

String q="select * from arun.urgent where delete='0'   " ;
//
java.sql.ResultSet rs = st.executeQuery(q);
//Now row pointer of rs points to unreadable row
%>
<html>
<head><link rel="stylesheet" href="tabledesign.css" /> 
<link href="pagedesign.css" rel="stylesheet" type="text/css">
</head>
<body>


<table border="1" align="left" class="hovertable">

<tr>
<th>Requirement ID</th>
<th> Name  </th>
<th> Blood group </th>
<th> Phone number </th>
<th> District </th>
<th> State  </th>

<th></th>
</tr>
<%

while( rs.next() ) //if next row exists, point to it and execute the loop
{
	
%>
<tr onMouseOver="this.style.backgroundColor='#66c9ff';" onMouseOut="this.style.backgroundColor='#d4e3e5';">
<td> <%= rs.getString("req_id") %> </td>
<td> <%= rs.getString("name") %> </td>
<td><%= rs.getString("bld_grp") %> </td>
<td><%= rs.getString("phnum") %> </td>
<td><%= rs.getString("district") %> </td>
<td><%= rs.getString("state") %></td>
<td><form id ="deletereq" name="deletereq" method="post" action="deletereq.jsp"><input type="hidden" name="req_id" id="req_id" value="<%= rs.getString("req_id") %>"><input type ="submit" value="Delete"></form></td>
</tr>
<%
}
%>
</table>

</body>
</html>


