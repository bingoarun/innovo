

<%
javax.naming.InitialContext ctx= new javax.naming.InitialContext();
javax.sql.DataSource ds =(javax.sql.DataSource)ctx.lookup("java:comp/env/jdbc/blooddon");
java.sql.Connection con = ds.getConnection(); //Assume pool name as jdbc/mydbpool
java.sql.Statement st = con.createStatement();
javax.servlet.http.HttpSession ses=request.getSession(false);
String uname=null;
uname=(String)ses.getValue("uname");

String q="select * from arun.mail left join arun.bloodbank on bloodbank.bank_id=mail.from_id where arun.mail.delete=0 and arun.mail.to_id=(select bank_id from arun.bloodbank where name='"+uname+"')";
java.sql.ResultSet rs = st.executeQuery(q);
//Now row pointer of rs points to unreadable row
System.out.println(q);
//for second query

%>
<html>
<head><link rel="stylesheet" href="tabledesign.css" /> 
<link href="pagedesign.css" rel="stylesheet" type="text/css">
</head>
<body>
<span class="tabletitle">Inbox:</span><br>

<br>


<table border="1" class="hovertable">
<tr>
<th> Bank ID </th>
<th> Bank name </th>
<th> Subject</th>
<th> </th>
<th> </th>
</tr>
<%
while( rs.next() ) //if next row exists, point to it and execute the loop
{
	String sender_id=rs.getString("bank_id");
	String sender_name=rs.getString("name");
	if(sender_id==null)
		{ 
		sender_id="admin";
		sender_name="Admin";
		}
%>
<tr onMouseOver="this.style.backgroundColor='#66c9ff';" onMouseOut="this.style.backgroundColor='#d4e3e5';">
<td> <%=sender_id %> </td>
<td> <%= sender_name %> </td>
<td><%= rs.getString("subject") %> </td>
<td><form id ="readmail" name="readmail" method="post" action="readmail.jsp">
<input type="hidden" name="m_id" id="m_id" value="<%= rs.getString("m_id") %>">
<input type="hidden" name="name" id="name" value="<%= sender_name %>">
<input type ="submit" value="Read">
</form> </td>
<td><form id ="deletemail" name="deletemail" method="post" action="deletemail.jsp"><input type="hidden" name="m_id" id="m_id" value="<%= rs.getString("m_id") %>"><input type ="submit" value="Delete"></form>  </td>

</tr>
<%
}

%>
</table>

</body>
</html>


