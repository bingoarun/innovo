

<%
javax.naming.InitialContext ctx= new javax.naming.InitialContext();
javax.sql.DataSource ds =(javax.sql.DataSource)ctx.lookup("java:comp/env/jdbc/blooddon");
java.sql.Connection con = ds.getConnection(); //Assume pool name as jdbc/mydbpool
java.sql.Statement st = con.createStatement();
javax.servlet.http.HttpSession ses=request.getSession(false);
String uname=null;

String name=request.getParameter("name");
String subject=null;
String message=null;
String m_id=request.getParameter("m_id");

//Check whether a session variable is already present
//uname=(String)ses.getValue("uname");
	uname=(String)ses.getValue("uname");
	
	
String q="select * from arun.mail where delete='1' and m_id="+m_id;
java.sql.ResultSet rs = st.executeQuery(q);
//Now row pointer of rs points to unreadable row
%>
<html>
<head><link rel="stylesheet" href="tabledesign.css" /> 
<link href="pagedesign.css" rel="stylesheet" type="text/css">
</head>
<body>
<p>
  <%
while( rs.next() ) //if next row exists, point to it and execute the loop
{
	subject=rs.getString("subject");
	message=rs.getString("message");
	
%>
</p>
<table width="490" height="238" border="0" cellpadding="2" cellspacing="2">
  <tr>
    <td width="165" height="43" align="right" class="title1">Sender:</td>
    <td width="311"><b><%= name %></b></td>
  </tr>
  <tr>
    <td height="39" align="right" class="title1">Subject:</td>
    <td><b><i><%= subject %></i></b></td>
  </tr>
  <tr>
    <td height="114" align="right" valign="top" class="title1">Message:</td>
    <td valign="top"><%= message %></td>
  </tr>
  
</table>
  <%
}
%>
</p>
</body>
</html>


