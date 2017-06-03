<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="pagedesign.css" rel="stylesheet" type="text/css">
<script language="javaScript" type="text/javascript" src="calendar.js"></script>
   <link href="calendar.css" rel="stylesheet" type="text/css">
</head>
<body>
<script language="JavaScript">
function validate()
{
	var flag=0;
	var event_name=document.form1.event_name.value;
	var datum1=document.form1.datum1.value;
	var datum2=document.form1.datum2.value;
	var str_time=document.form1.str_time.value;
	var end_time=document.form1.end_time.value;
	var description=document.form1.description.value;
	var venue=document.form1.venue.value;
	if(event_name=="")
		{
		window.alert("Enter a program name");
		}
	else if (datum1=="")
		{
		window.alert("Select the starting date");
		}
	else if(datum2=="")
		{
		window.alert("Select the ending date");
		}
	else if(str_time=="")
		{
		window.alert("Enter  the starting time in the required format");
		}
	else if (end_time=="")
		{
		window.alert("Enter the ending time in required format");
		}
	else if(description=="")
		{
		window.alert("Enter the description");
		}
	else if(venue=="")
		{
		window.alert("Enter the venue");
		}
	else
		flag=1;
	if (flag==1)
		return true;
	else
		return false;
}
</script>
<form name="form1" id ="form1" action="insert_org_camp.jsp" method="post" onsubmit="return validate()">
<table width="460" height="401" border="0" cellpadding="2" cellspacing="2">
  <tr>
    <td colspan="2" align="left" class="formhead"><span class="headingv"><span class="tableelements"><span class="pagemenu">Create event:</span></span></span></td>
  </tr>
  <td width="159"><tr>
    <td width="207" align="right">Camp name:</td>
    <td width="233"><label>
    
      <input type="text" name="event_name" id="event_name">
    </label></td>
  </tr>
  <tr>
    <td align="right">Start date:</td>
    <td width="287">
    
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
    <td align="right">End date:</td>
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
    <td align="right">Start time:</td>
    <td><label>
      <input type="text" name="str_time" id="str_time">
    (HH:MM-AM/PM)</label></td>
  </tr>
  <tr>
    <td align="right">End time:</td>
    <td><label>
      <input type="text" name="end_time" id="end_time">
    (HH:MM-AM/PM)</label></td>
  </tr>
  <tr>
    <td align="right">Description:</td>
    <td><label>
      <textarea name="description" id="description" cols="45" rows="5"></textarea>
    </label></td>
  </tr>
  <tr>
    <td align="right">Venue:</td>
    <td><label>
      <textarea name="venue" id="venue" cols="45" rows="5"></textarea>
    </label></td>
  </tr>
  <tr>
    <td align="right"><label>
      <input type="reset" name="reset" id="reset" value="Reset">
    </label></td>
    <td><label>
      <input type="submit" name="submit" id="submit" value="Create">
    </label></td>
  </tr>
</table>
</form>
</body>
</html>