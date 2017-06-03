<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% 
javax.naming.InitialContext ctx= new javax.naming.InitialContext();
javax.sql.DataSource ds =(javax.sql.DataSource)ctx.lookup("java:comp/env/jdbc/blooddon");
java.sql.Connection con = ds.getConnection(); //Assume pool name as jdbc/mydbpool
java.sql.Statement st = con.createStatement(); 
%>
<html>
<head>
<script type="text/javascript">
function check(value){ 
xmlHttp=GetXmlHttpObject()
var url="checkajax.jsp";
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
<script language="javaScript" type="text/javascript" src="calendar.js"></script>
   <link href="calendar.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"><style type="text/css">
<!--
h1 {
	font-size: 24px;
	color: #069;
}
h1,h2,h3,h4,h5,h6 {
	font-family: Georgia, Times New Roman, Times, serif;
	font-style: italic;
}
-->
</style></head>
<body>


<script language="JavaScript">
function validate()
{
	
	var flag=0;
	var name=document.form1.name.value.length;
	var fname=document.form1.fname.value.length;
	var password=document.form1.password.value;
	var cpassword=document.form1.cpassword.value;
	var datum1=document.form1.datum1.value;
	var mail_id=document.form1.mail_id.value;
	var datum2=document.form1.datum2.value;
	var bld_grp=document.form1.bld_grp.value;
	var phnum=document.form1.phnum.value;
	var ophnum=document.form1.ophnum.value;
	var street=document.form1.street.value;
	var state=document.form1.state.value;
	var district=document.form1.district.value;
	var city=document.form1.city.value;
	var pincode=document.form1.pincode.value;
	
	if(name == 0) //checks whether name is left blank
	{
		window.alert("Enter a username");
	}
	
	
	else if(fname == 0) //checks whether name is left blank
	{
		window.alert("First Name cannot be left blank");
	}
	else if(password== "") //checks whether name is left blank
	{
		window.alert(" Enter a password");
	}
	else if(cpassword== "") //checks whether name is left blank
	{
		window.alert("Enter confirmation password");
	}
	else if(password!=cpassword)
		{
		 window.alert("Passwords does not match")
		}
	else if(mail_id== "") //checks whether name is left blank
	{
		window.alert("Enter a mail ID");
	}
	else if(phnum= "") //checks whether name is left blank
	{
		window.alert("Enter a Phone number");
	}
	else if(street= "") //checks whether name is left blank
	{
		window.alert("Enter a Street name");
	}
	else if(district= "") //checks whether name is left blank
	{
		window.alert("Enter a District");
	}
	else if(city= "") //checks whether name is left blank
	{
		window.alert("Enter a city");
	}
	else if(state= "") //checks whether name is left blank
	{
		window.alert("Enter a State");
	}
	else if(pincode= "") //checks whether name is left blank
	{
		window.alert("Enter a valid pincode");
	}
	else 
		{
		flag=1;
		
		}
	
	if(flag == 0)
		{
		return false;
		
		}
	else
		{
		return true;
	
		}
	
}

</script>


</br>
<h1>New user registration:</h1>
 

<p>&nbsp;</p>
<form name="form1" id="form1" action="insert_donor_reg.jsp" method="post" onSubmit="return validate()">
<table width="538" height="724" border="0" align="center" cellpadding="2" cellspacing="2">

  <tr>
    <td width="181" align="right">Username:</td>
    <td width="337"><input  type="text" name="name" id="name" onKeyUp="check(this.value);"><font color="red"><div id="mydiv"></div></font></td>
  </tr>
  <tr>
    <td align="right">First name:</td>
    <td><label>
      <input type="text" name="fname" id="fname">
    </label></td>
  </tr>
  <tr>
    <td align="right">Last name:</td>
    <td><label>
      <input type="text" name="lname" id="lname">
    </label></td>
  </tr>
  <tr>
    <td align="right">Password:</td>
    <td><label>
      <input type="password" name="password" id="password">
    </label></td>
  </tr>
  <tr>
    <td align="right">Confirm password:</td>
    <td><label>
      <input type="password" name="cpassword" id="cpassword">
    </label></td>
  </tr>
  <tr>
    <td align="right">Date of birth:</td>
    <td>
     
      <input name="datum1" type="text" readonly="readonly"><a href="#" onClick="setYears(1947, 2008);
       showCalender(this, 'datum1');">
      <img src="calender.png"></a>

   
	
     

    <table id="calenderTable">
        <tbody id="calenderTableHead">
          <tr>
            <td colspan="4" align="center">
	          <select onChange="showCalenderBody(createCalender(document.getElementById('selectYear').value,
	           this.selectedIndex, false));" id="selectMonth">
	              <option value="0">Jan</option>
	              <option value="1">Feb</option>
	              <option value="2">Mar</option>
	              <option value="3">Apr</option>
	              <option value="4">May</option>
	              <option value="5">Jun</option>
	              <option value="6">Jul</option>
	              <option value="7">Aug</option>
	              <option value="8">Sep</option>
	              <option value="9">Oct</option>
	              <option value="10">Nov</option>
	              <option value="11">Dec</option>
	          </select>
            </td>
            <td colspan="2" align="center">
			    <select onChange="showCalenderBody(createCalender(this.value, 
				document.getElementById('selectMonth').selectedIndex, false));" id="selectYear">
				</select>
			</td>
            <td align="center">
			    <a href="#" onClick="closeCalender();"><font color="#003333" size="+1">X</font></a>
			</td>
		  </tr>
       </tbody>
       <tbody id="calenderTableDays">
         <tr style="">
           <td>Sun</td><td>Mon</td><td>Tue</td><td>Wed</td><td>Thu</td><td>Fri</td><td>Sat</td>
         </tr>
       </tbody>
       <tbody id="calender"></tbody>
    </table>


    
    </td>
  </tr>
  <tr>
    <td align="right">Mail ID:</td>
    <td><input name="mail_id" type="text"></td>
  </tr>
  <tr>
    <td align="right">Previous blood donation on:</td>
    <td>
    
   
      <input name="datum2" type="text" readonly="readonly"><a href="#" onClick="setYears(1947, 2008);
       showCalender(this, 'datum2');">
      <img src="calender.png"></a>

    
	
    <!-- Calender Script  --> 

    <table id="calenderTable">
        <tbody id="calenderTableHead">
          <tr>
            <td colspan="4" align="center">
	          <select onChange="showCalenderBody(createCalender(document.getElementById('selectYear').value,
	           this.selectedIndex, false));" id="selectMonth">
	              <option value="0">Jan</option>
	              <option value="1">Feb</option>
	              <option value="2">Mar</option>
	              <option value="3">Apr</option>
	              <option value="4">May</option>
	              <option value="5">Jun</option>
	              <option value="6">Jul</option>
	              <option value="7">Aug</option>
	              <option value="8">Sep</option>
	              <option value="9">Oct</option>
	              <option value="10">Nov</option>
	              <option value="11">Dec</option>
	          </select>
            </td>
            <td colspan="2" align="center">
			    <select onChange="showCalenderBody(createCalender(this.value, 
				document.getElementById('selectMonth').selectedIndex, false));" id="selectYear">
				</select>
			</td>
            <td align="center">
			    <a href="#" onClick="closeCalender();"><font color="#003333" size="+1">X</font></a>
			</td>
		  </tr>
       </tbody>
       <tbody id="calenderTableDays">
         <tr style="">
           <td>Sun</td><td>Mon</td><td>Tue</td><td>Wed</td><td>Thu</td><td>Fri</td><td>Sat</td>
         </tr>
       </tbody>
       <tbody id="calender"></tbody>
    </table>
    
    </td>
  </tr>
  <tr>
    <td align="right">Blood group:</td>
    <td><label>
        <select name="bld_grp" id="bld_grp">
          <option value="A+" >A+</option>
          <option value="A-">A-</option>
          <option value="B+">B+</option>
          <option value="B-">B-</option>
          <option value="O+">O+</option>
          <option value="O-">O-</option>
          <option value="AB+">AB+</option>
          <option value="AB-">AB-</option>
        </select>
      </label></td>
  </tr>
  <tr>
    <td align="right">Mobile number:</td>
    <td><label>
      <input type="text" name="phnum" id="phnum">
    </label></td>
  </tr>
  <tr>
    <td align="right">Office phone number:</td>
    <td><label>
      <input type="text" name="ophnum" id="ophnum">
    </label></td>
  </tr>
  <tr>
    <td align="right">Street name:</td>
    <td><label>
      <input type="text" name="street" id="street">
    </label></td>
  </tr>
  <tr>
    <td align="right">State:</td>
    <td><label>
      <input type="text" name="state" id="state">
    </label></td>
  </tr>
  <tr>
    <td align="right">District:</td>
    <td><label>
      <input type="text" name="district" id="district">
    </label></td>
  </tr>
  <tr>
    <td align="right">City:</td>
    <td><label>
      <input type="text" name="city" id="city">
    </label></td>
  </tr>
  <tr>
    <td align="right">Pincode:</td>
    <td><input type="text" name="pincode" id="pincode"></td>
  </tr>
  <tr>
    <td colspan="2" align="center" valign="middle"><label>
      <input type="reset" name="reset" id="reset" value="Reset">
      </label>      <label>
        <input type="submit" name="submit" id="submit" value="Submit" > 
      </label></td>
    </td>
   
  </tr>
</table>
</form>
</body>
</html>