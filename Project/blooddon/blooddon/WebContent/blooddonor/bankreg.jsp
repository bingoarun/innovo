<% 
javax.naming.InitialContext ctx= new javax.naming.InitialContext();
javax.sql.DataSource ds =(javax.sql.DataSource)ctx.lookup("java:comp/env/jdbc/blooddon");
java.sql.Connection con = ds.getConnection(); //Assume pool name as jdbc/mydbpool
java.sql.Statement st = con.createStatement(); 
%>



<%@ page language="java" contentType="text/html; charset=iso-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
function check(value){ 
xmlHttp=GetXmlHttpObject()
var url="check_bank_exist.jsp";
url=url+"?name="+value;
xmlHttp.onreadystatechange=stateChanged 
xmlHttp.open("GET",url,true)
xmlHttp.send(null)
}
function stateChanged(){ 
if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){ 
    var showdata = xmlHttp.responseText; 
    document.getElementById("mydiv").innerHTML= showdata;
    } 
}
function GetXmlHttpObject(){
var xmlHttp=null;
try{
  xmlHttp=new XMLHttpRequest();
 }
catch (e) {
 try {
  xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
  }
 catch (e){
  xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
 }
return xmlHttp;
}
</script>

   
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Insert title here</title>
<style type="text/css">
<!--
h1,h2,h3,h4,h5,h6 {
	font-family: Tahoma, Geneva, sans-serif;
	font-weight: bold;
	font-style: italic;
}
h1 {
	font-size: 18px;
	color: #069;
}
-->
</style></head>
<body>
<script language="JavaScript">
function validate()
{
	var names=document.form1.names.value;
	var manager_name=document.form1.manager_name.value;
	var name=document.form1.name.value;
	var password=document.form1.password.value;
	var cpassword=document.form1.cpassword.value;
	var mail_id=document.form1.mail_id.value;
	var phnum=document.form1.phnum.value;
	var landline_num=document.form1.landline_num.value;
	var address=document.form1.address.value;
	var state=document.form1.state.value;
	var district=document.form1.district.value;
	var city=document.form1.city.value;
	var pincode=document.form1.pincode.value;
	var flag=0;
	if (names=="")
		{
		window.alert("Enter a bank name");
		}
	else if (manager_name=="")
		{
		window.alert("Enter a manager name");
		}
	else if(name=="")
		{
		window.alert("Enter a username");
		}
	else if (password=="")
		{
		window.alert("Enter a password");
		}
	else if (cpassword=="")
		{
		window.alert("Enter a confirmation password");
		}
	else if(password!=cpassword)
		{
		window.alert("Password does not match");
		}
	else if(mail_id=="")
		{
		window.alert("Enter a Mail-ID");
		}
	else if (ph_num=="")
		{
		window.alert("Enter a phone number");
		}
	else if (address=="")
		{
		window.alert("Enter a Address");
		}
	else if(state=="")
		{
		window.alert("Enter the state");
		}
	else if (district="")
		{
		window.alert("Enter the district");
		}
	else if (city=="")
		{
		window.alert("Enter the district");
		}
	else if (pincode=="")
		{
		window.alert("Enter the pincode");
		}
	else 
		flag=1;
	if(flag==0)
		return false;
	else
		return true;
		
	
}

</script>
<table width="950" height="661" border="0" cellpadding="2" cellspacing="2">
  <tr>
    <td height="51" colspan="3"><h1>Blood bank registration:</h1></td>
  </tr>
  <tr>
    <td width="248" height="37" align="right">Name of the Blood bank:</td>
    <td width="202"><form name="form1" method="post" action="insertbankreg.jsp" onsubmit="return validate()">
      <label>
        <input type="text" name="names" id="names">
      </label>
    </td>
    <td width="472">&nbsp;</td>
  </tr>
  <tr>
    <td align="right">Manager name :</td>
    <td><label>
      <input type="text" name="manager_name" id="manager_name">
    </label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="right">Username:</td>
    <td><label>
      <input  type="text" name="name" id="name" onKeyUp="check(this.value);"><font color="red"><div id="mydiv">
    </label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="right">Password:</td>
    <td><label>
      <input type="text" name="password" id="password">
    </label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="right">Confirm password:</td>
    <td><label>
      <input type="text" name="cpassword" id="cpassword">
    </label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="right">Mail ID:</td>
    <td><label>
      <input type="text" name="mail_id" id="mail_id">
    </label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="right">Phone number:</td>
    <td><label>
      <input type="text" name="phnum" id="phnum">
    </label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="right">Landline number:</td>
    <td><label>
      <input type="text" name="landline_num" id="landline_num">
    </label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="right">Address:</td>
    <td><label>
      <input type="text" name="address" id="address">
    </label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="right">State:</td>
    <td><label>
      <input type="text" name="state" id="state">
    </label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="right">District:</td>
    <td><label>
      <input type="text" name="district" id="district">
    </label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="right">City:</td>
    <td><label>
      <input type="text" name="city" id="city">
    </label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="right">Pincode:</td>
    <td><label>
      <input type="text" name="pincode" id="pincode">
    </label>      
  <tr>
    <td align="right"><label>
      <input type="reset" name="reset" id="reset" value="Reset">
    </label></td>
    <td>
      <label>
        <input type="submit" name="submit" id="submit" value="Submit">
      </label>
    </form></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</body>
</html>