

<%
javax.naming.InitialContext ctx= new javax.naming.InitialContext();
javax.sql.DataSource ds =(javax.sql.DataSource)ctx.lookup("java:comp/env/jdbc/blooddon");
java.sql.Connection con = ds.getConnection(); //Assume pool name as jdbc/mydbpool
java.sql.Statement st = con.createStatement();
String q="select * from arun.blooddonor left join arun.location on blooddonor.pincode=location.pincode where delete=0";
java.sql.ResultSet rs = st.executeQuery(q);
//Now row pointer of rs points to unreadable row

//for second query

%>
<html>
<head><link rel="stylesheet" href="tabledesign.css" /> </head>
<body>
Blood donor details :<br>

<br>


<table border="1" class="hovertable">
<tr>
<th> Donor ID </th>
<th> First name </th>
<th> Last name </th>
<th> Mail ID</th>
<th> Blood Group</th>
<th> DOB</th>
<th> Mobile number</th>
<th> Office number</th>
<th> Address</th>
<th>City/Town</th>
<th> District</th>
<th> State</th>
<th>Pincode</th>
<th></th>
</tr>
<%
while( rs.next() ) //if next row exists, point to it and execute the loop
{
	
%>
<tr onmouseover="this.style.backgroundColor='#66c9ff';" onmouseout="this.style.backgroundColor='#d4e3e5';">
<td> <%= rs.getString("donor_id") %> </td>
<td> <%= rs.getString("fname") %> </td>
<td><%= rs.getString("lname") %> </td>
<td><%= rs.getString("mail_id") %> </td>
<td><%= rs.getString("blood_grp") %> </td>
<td><%= rs.getString("dob") %> </td>
<td><%= rs.getString("ph_num") %> </td>
<td><%= rs.getString("office_phnum") %> </td>
<td><%= rs.getString("address") %> </td>
<td><%= rs.getString("area") %> </td>
<td><%= rs.getString("district") %> </td>
<td><%= rs.getString("state") %> </td>
<td><%= rs.getString("pincode") %> </td>
<td><form id ="deletedonor" name="deletedonor" method="post" action="deletedonor.jsp"><input type="hidden" name="donor_id" id="donor_id" value="<%= rs.getString("donor_id") %>"><input type ="submit" value="Delete"></form></td>
</tr>
<%
}

%>
</table>

</body>
</html>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>