<%
String bld_grp=request.getParameter("bld_grp");//Get the value of name from form
bld_grp=bld_grp.toUpperCase();
String loc=request.getParameter("loc");
loc=loc.toUpperCase();
%>
<%
javax.naming.InitialContext ctx= new javax.naming.InitialContext();
javax.sql.DataSource ds =(javax.sql.DataSource)ctx.lookup("java:comp/env/jdbc/blooddon");
java.sql.Connection con = ds.getConnection(); //Assume pool name as jdbc/mydbpool
java.sql.Statement st = con.createStatement();
String q="select * from arun.blooddonor where delete=0 and (days(current date)-days(prev_bld_date) >=90 or prev_bld_date is NULL)   and UPPER(blood_grp)='"+bld_grp+"' and pincode=(Select pincode from arun.location where UPPER(district)='"+(loc)+"')" ;
java.sql.ResultSet rs = st.executeQuery(q);
//Now row pointer of rs points to unreadable row
%>
<html>
<head><link rel="stylesheet" href="tabledesign.css" /> </head>
<body>
Blood grp <%= bld_grp %><br>
Location <%= loc %>
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


