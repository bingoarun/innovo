<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<link href="formdesign.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
h1,h2,h3,h4,h5,h6 {
	font-family: Arial, Helvetica, sans-serif;
	font-weight: bold;
	font-style: italic;
}
h1 {
	font-size: 36px;
	color: #033;
	text-align: center;
}
-->
</style></head>

<body class="formhead">
<p><h1>Administrator login</h1> 
</p>
<form id="form1" name="form1" method="post" action="createsession.jsp">
<table width="246" height="150" border="0" align="center" cellpadding="2" cellspacing="2">
    <tr>
      <td align="right"><p>User ID:</p></td>
      <td><input type="text" name="uname" id="uname" /></td>
    </tr>
    <tr>
      <td height="37" align="right"><p>Password:</p></td>
      <td><input type="password" name="pass" id="pass" /></td>
    </tr>
    <tr>
      <td align="right"><label>
        <input type="reset" name="reset" id="reset" value="Reset" />
      </label></td>
      <td><input type="submit" name="submit" id="submit" value="Submit" /></td>
    </tr>
  </table>
  </p>
</form>

</body>
</html>
