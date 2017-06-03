

<%
javax.naming.InitialContext ctx= new javax.naming.InitialContext();
javax.sql.DataSource ds =(javax.sql.DataSource)ctx.lookup("java:comp/env/jdbc/blooddon");
java.sql.Connection con = ds.getConnection(); //Assume pool name as jdbc/mydbpool
java.sql.Statement st = con.createStatement();
String q="select * from arun.bloodbank left join arun.location on bloodbank.pincode=location.pincode where status=0";
java.sql.ResultSet rs = st.executeQuery(q);
//Now row pointer of rs points to unreadable row

//for second query

%>
<html>
<head><link rel="stylesheet" href="tabledesign.css" /> </head>
<body>
Blood bank details :<br>

<br>


<table border="1" class="hovertable">
<tr>
<th> Bank ID </th>
<th> Bank name </th>
<th> Manager name </th>
<th> Mail ID</th>
<th> Phone number</th>
<th> Area</th>
<th>City/Town</th>
<th> District</th>
<th> State</th>
<th>Pincode</th>
</tr>
<%
while( rs.next() ) //if next row exists, point to it and execute the loop
{
	
%>
<tr onmouseover="this.style.backgroundColor='#66c9ff';" onmouseout="this.style.backgroundColor='#d4e3e5';">
<td> <%= rs.getString("bank_id") %> </td>
<td> <%= rs.getString("name") %> </td>
<td><%= rs.getString("manager_name") %> </td>
<td><%= rs.getString("mail_id") %> </td>
<td><%= rs.getString("phnum") %> </td>
<td><%= rs.getString("area") %> </td>
<td><%= rs.getString("area") %> </td>
<td><%= rs.getString("district") %> </td>
<td><%= rs.getString("state") %> </td>
<td><%= rs.getString("pincode") %> </td>
</tr>
<%
}

%>
</table>

</body>
</html>


