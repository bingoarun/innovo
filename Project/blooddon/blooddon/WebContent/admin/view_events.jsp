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

String q="select * from arun.event where delete=0 and (days(current date)-days(end_date) >=0 )   " ;
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
<th> Program ID </th>
<th> Program name  </th>
<th> Program type  </th>
<th> Start date </th>
<th> End date  </th>
<th> Start time  </th>
<th> End time  </th>
<th> Venue</th>
<th></th>
</tr>
<%
String bdc_event=null;
String str_tim=null;
String end_tim=null;
while( rs.next() ) //if next row exists, point to it and execute the loop
{
	etype=Integer.parseInt(rs.getString("bdc_event"));
	if(etype==1)
	{
		bdc_event="Blood donation camp";
		str_tim="-";
		end_tim="-";
		
	}
	else
	{
		bdc_event="Event";
		str_tim=rs.getString("str_time");
		end_tim=rs.getString("end_time");
	}
%>
<tr onMouseOver="this.style.backgroundColor='#66c9ff';" onMouseOut="this.style.backgroundColor='#d4e3e5';">
<td> <%= rs.getString("event_id") %> </td>
<td> <%= rs.getString("pgm_name") %> </td>
<td><%= bdc_event %> </td>
<td><%= rs.getString("str_date") %> </td>
<td><%= rs.getString("end_date") %> </td>
<td><%= str_tim %> </td>
<td><%= end_tim %> </td>
<td><%= rs.getString("venue") %> </td>
<td><form id ="deleteevent" name="deleteevent" method="post" action="deleteevent.jsp"><input type="hidden" name="event_id" id="event_id" value="<%= rs.getString("event_id") %>"><input type ="submit" value="Delete"></form></td>
</tr>
<%
}
%>
</table>

</body>
</html>


