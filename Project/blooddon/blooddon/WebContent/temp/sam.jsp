<%String Username=request.getParameter("uname");
String password=request.getParameter("pwd");
String cpassword=request.getParameter("cpwd");
String gender=request.getParameter("sex");
String profession=request.getParameter("pro");
String num=request.getParameter("num");
String addr=request.getParameter("cont");
String zip=request.getParameter("zip");
javax.naming.InitialContext ctx= new javax.naming.InitialContext();
javax.sql.DataSource ds = (javax.sql.DataSource) ctx.lookup
("java:comp/env/jdbc/blooddon");
java.sql.Connection con = ds.getConnection();
java.sql.Statement st = con.createStatement();
String str="insert into arun.TEMP (username,password,gender,profession,mobile_number,address,zipcode) values('"+Username+"','"+password+"','"+gender+"','"+profession+"','"+num+"','"+addr+"','"+zip+"')";
st.executeUpdate(str);
%>
