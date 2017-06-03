
<%
javax.naming.InitialContext ctx= new javax.naming.InitialContext();
javax.sql.DataSource ds = (javax.sql.DataSource) ctx.lookup
("java:comp/env/jdbc/blooddon");
java.sql.Connection con = ds.getConnection();
java.sql.Statement st = con.createStatement();
//Get read-only access to session by passing false to getSession()
javax.servlet.http.HttpSession ses=request.getSession(false);
String name=(String)ses.getValue("uname");//Get the value of name from form
name=name.toUpperCase();
String ap="0";
String am="0";
String bp="0";
String bm="0";
String op="0";
String om="0";
String abp="0";
String abm="0";
String nam="";


String q="select * from arun.stock_history where bank_id = (select bank_id from arun.bloodbank where UPPER(name)='"+name+"')"; 
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
<th> A+ </th>
<th> A- </th>
<th> B+</th>
<th> B-</th>
<th>O+</th>
<th>O-</th>
<th>AB+</th>
<th>AB-</th>
</tr>
<%
while( rs.next() ) //if next row exists, point to it and execute the loop
{
	 nam=rs.getString("bank_id");
	ap=rs.getString("A+");
	 am=rs.getString("A-");
	bp=rs.getString("B+");
	bm=rs.getString("B-");
	op=rs.getString("O+");
	om=rs.getString("O-");
	 abp=rs.getString("AB+");
	abm=rs.getString("AB-");

%>
<tr onmouseover="this.style.backgroundColor='#66c9ff';" onmouseout="this.style.backgroundColor='#d4e3e5';">
<td> <%= rs.getString("A+") %> </td>
<td> <%= rs.getString("A-") %> </td>
<td><%= rs.getString("B+") %> </td>
<td><%= rs.getString("B-") %> </td>
<td><%= rs.getString("O+") %> </td>
<td><%= rs.getString("O-") %> </td>
<td><%= rs.getString("AB+") %> </td>
<td><%= rs.getString("AB-") %> </td>


</tr>


<%
}
%>

</table>
<br>
</br>
<form action="updatestock.jsp" method="post" id="form1">
<input type="hidden" name="names" id="names" value="<%= nam %>">
<input type="hidden" name="a+" id="a+" value="<%= ap %>">
<input type="hidden" name="a-" id="a-" value="<%= am%>">
<input type="hidden" name="b+" id="b+" value="<%= bp%>">
<input type="hidden" name="b-" id="b-" value="<%= bm%>">
<input type="hidden" name="ab+" id="ab+" value="<%= abp%>">
<input type="hidden" name="ab-" id="ab-" value="<%= abm%>">
<input type="hidden" name="o+" id="o+" value="<%= op%>">
<input type="hidden" name="o-" id="o-" value="<%= om%>">
<input type="submit" value="Update stock">
</form>

</body>
</html>


