<%
//Create DB pool connection
javax.naming.InitialContext ctx= new javax.naming.InitialContext();
javax.sql.DataSource ds = (javax.sql.DataSource) ctx.lookup
("java:comp/env/jdbc/blooddon");
java.sql.Connection con = ds.getConnection();
java.sql.Statement st = con.createStatement();
//Get read-only access to session by passing false to getSession()
javax.servlet.http.HttpSession ses=request.getSession(false);
String uname=null;

int etype=0;
//Check whether a session variable is already present
if((ses.getValue("uname")!=null) )
{
//Retrieve the values of session variables
uname=(String)ses.getValue("uname");

//Update database to record the log in status of user
//st.executeUpdate("update arun.blooddonor set login_status=1 where username like '"+uname+"'");
%>
<script language="javascript">

</script>
<%
}
else //Session variables not present
{
%>
<script language="JavaScript">

document.location="search_without_login.jsp"; //Redirect to login page
</script>
<%
}
%>
<html>
<head>
<script language="JavaScript">
function validate()
{
	var bank_id=document.form1.bank_id.value;
	var datum3=document.form1.datum3.value;
	var feedback=document.form1.feedback.value;
	var flag=0;
	if(bank_id=="")
		{
			window.alert("Enter a valid Bank-ID");
		}
	else if (datum3=="")
		{
		window.alert("Select a date");
		}
	else if(feedback=="")
		{
		window.alert("Enter the feedback");
		}
	else
		flag=1;
	if(flag==1)
		{
		return true;
		}
	else
		return false;
}

</script>


<script language="javaScript" type="text/javascript" src="calendar.js"></script>
   <link href="calendar.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Insert title here</title>
<style type="text/css">
<!--
.notes {
	color: #009;
	font-style: italic;
	font-weight: bold;
}
h1,h2,h3,h4,h5,h6 {
	font-family: Tahoma, Geneva, sans-serif;
}
h1 {
	font-size: 18px;
	color: #069;
}
-->
</style>

</head>
<body>
<form name="form1" method="post" action="insert_feedback.jsp" onsubmit="return validate();">
<table width="1027" height="471" border="0" cellpadding="2" cellspacing="2">
  <tr>
    <td height="87" colspan="3"><h1>Donated blood ??? We need you feed back.</h1></td>
  </tr>
  <tr>
    <td width="126" height="63" align="right">Blood bank ID:</td>
    <td width="538">
      <label>
        <input type="text" name="bank_id" id="bank_id">
      </label>
    </td>
    <td width="343"><a href="../view_bb.jsp">Click here to see the Blood bank ID's</a></td>
  </tr>
  <tr>
    <td height="49" align="right">Blood donated on:</td>
    <td>
      
      <input name="datum3" type="text" readonly="readonly"><a href="#" onClick="setYears(1947, 2008);showCalender(this, 'datum3');">
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
    <td rowspan="4" valign="top"><p class="notes">Feedback tips:</p>
    <p>Please provide details about our hospitality and management. Also provide details of any health risks after your blood donation. We feel glad to hear your suggestions also.</p></td>
  </tr>
  <tr>
    <td height="134" align="right">Feed back:</td>
    <td><label>
      <textarea name="feedback" id="feedback" cols="80" rows="7"></textarea>
    </label></td>
  </tr>
  <tr>
    <td height="58" colspan="2" align="center"><label>
      <input type="reset" name="reset" id="reset" value="Reset">
    </label>
      
        <label>
          <input type="submit" name="submit" id="submit" value="Submit">
        </label>
    
    <label>      </label></td>
  </tr>
  <tr>
    <td height="66" align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
  </form>
</body>
</html>