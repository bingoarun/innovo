<%@ page import="java.sql.*" %> 
<%
String name = request.getParameter("name").toString();
System.out.println(name);
String data ="";
try{
	javax.naming.InitialContext ctx= new javax.naming.InitialContext();
	javax.sql.DataSource ds =(javax.sql.DataSource)ctx.lookup("java:comp/env/jdbc/blooddon");
	java.sql.Connection con = ds.getConnection(); //Assume pool name as jdbc/mydbpool
	java.sql.Statement st = con.createStatement();
	String q="select * from arun.bloodbank where name='"+name+"'";
	java.sql.ResultSet rs = st.executeQuery(q);
          
int count=0;
          while(rs.next())
          {

                   count++;
          }

                    if(count>0)
          {
             data="Not Available";
          }
          else
          {
                      data="Available";
          }
out.println(data);
System.out.println(data);
}
catch (Exception e) {
System.out.println(e);
}
%>