<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<link href="pagedesign.css" rel="stylesheet" type="text/css" />
</head>

<body>
<script language="JavaScript">
function validate()
{
	var name=document.form1.name.value;
	var bld_grp=document.form1.bld_grp.value;
	var phnum=document.form1.phnum.value;
	var district=document.form1.district.value;
	var state=document.form1.state.value;
	var flag=0;
	if(name=="")
		{
		window.alert("Enter a name");
		}
	else if (bld_grp=="")
		{
		window.alert("Select a blood group");
		}
	else if (phnum=="")
		{
		window.alert("Enter a phone number");
		}
	else if(district=="")
		{
		window.alert("Enter a district");
		}
	else if(state=="")
		{
		window.alert("Enter a state");
		}
	else
		 flag=1;
	if (flag==0)
		return false;
	else
		return true;
}

</script>
<form name="form1" id="form1" method="post" action="insert_urgent_requirement.jsp" onsubmit="return validate()">
<table width="362" height="443" border="0" cellpadding="2" cellspacing="2">
  <tr>
    <td colspan="2" class="tabletitle">Urgent requirement form:</td>
  </tr>
  <tr>
    <td width="178" align="right">Name:</td>
    <td width="164"><label>
      <input type="text" name="name" id="name" />
    </label></td>
  </tr>
  <tr>
    <td align="right">Blood group needed::</td>
    <td><label>
      <select name="bld_grp" id="bld_grp">
        <option value="A+">A+</option>
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
    <td align="right">Contact number:</td>
    <td><label>
      <input type="text" name="phnum" id="phnum" />
    </label></td>
  </tr>
  <tr>
    <td align="right">District:</td>
    <td><label>
      <input type="text" name="district" id="district" />
    </label></td>
  </tr>
  <tr>
    <td align="right">State:</td>
    <td><label>
      <input type="text" name="state" id="state" />
    </label></td>
  </tr>
  <tr>
    <td align="right"><label>
      <input type="reset" name="reset" id="reset" value="Reset" />
    </label></td>
    <td><label>
      <input type="submit" name="submit" id="submit" value="Submit" />
    </label></td>
  </tr>
</table>
</form>
</body>
</html>
