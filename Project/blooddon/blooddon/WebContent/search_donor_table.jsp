<%
String name=request.getParameter("name");//Get the value of name from form
name=name.toUpperCase();

%>
<%
javax.naming.InitialContext ctx= new javax.naming.InitialContext();
javax.sql.DataSource ds =(javax.sql.DataSource)ctx.lookup("java:comp/env/jdbc/blooddon");
java.sql.Connection con = ds.getConnection(); //Assume pool name as jdbc/mydbpool
java.sql.Statement st = con.createStatement();
String q="select * from arun.blooddonor where delete= 0 and UPPER(fname)='"+name+"' or UPPER(lname)='"+name+"' " ;
java.sql.ResultSet rs = st.executeQuery(q);
//Now row pointer of rs points to unreadable row
%>
<html>
<head><link rel="stylesheet" href="tabledesign.css" /> </head>
<body>
Name: <%= name %><br>

<br>


<table border="1" class="hovertable">
<tr>
<th> First name </th>
<th> Last name </th>
<th> mobile num </th>
<th> area</th>
</tr>
<%
while( rs.next() ) //if next row exists, point to it and execute the loop
{
%>
<tr onmouseover="this.style.backgroundColor='#66c9ff';" onmouseout="this.style.backgroundColor='#d4e3e5';">
<td> <%= rs.getString("fname") %> </td>
<td> <%= rs.getString("lname") %> </td>
<td><%= rs.getString("ph_num") %> </td>
<td><%= rs.getString("address") %> </td>
</tr>
<%
}
%>
</table>

</body>
</html>


