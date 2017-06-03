<%@page language="java" import="java.io.*, javax.swing.*, java.awt.*,java.sql.*, java.util.*, net.sf.jasperreports.engine.*,net.sf.jasperreports.view.*;" %>

<html>
<style type="text/css">
<!--
.success {
	color: #09C;
}
.success {
	font-size: 24px;
	color: #069;
	font-weight: bold;
}
-->
</style>

<body>
<p>
  <%
//Get connection using DB pool
javax.naming.InitialContext ctx= new javax.naming.InitialContext();
javax.sql.DataSource ds = (javax.sql.DataSource) ctx.lookup("java:comp/env/jdbc/blooddon");
java.sql.Connection con = ds.getConnection();
JasperReport jasperReport;
JasperPrint jasperPrint;
// Get the real path (like c:\..\) of http home directory of site
String path=application.getRealPath("/");
//Compile report of firstreport.jrxml
jasperReport = JasperCompileManager.compileReport (path +"/admin/all_bloodbank.jrxml");
//Fill the report with the data obtained from database
jasperPrint = JasperFillManager.fillReport(jasperReport, new HashMap(),con);
/* code for PDF report creation */
JasperExportManager.exportReportToPdfFile(jasperPrint,path+"/admin/pdfreport.pdf");
%>
<span class="headingv"><span class="headingv"><span class="success">PDF Report Created Successfully.</span></span></span></p>
<p>You can View/Download your report <a
href="pdfreport.pdf">HERE</a>.</p>
<p>
  <%
//======================================
/* Code for HTML Report */
JasperExportManager.
exportReportToHtmlFile(jasperPrint,path+"/admin/htmreport.htm");
%>
<span class="success">HTML Report Created Successfully. </span></p>
<p>You can View/Download your report <a
href="htmreport.htm">HERE</a>.
  <%
//============================================
/* Code for XLS report */
/*JRSingleSheetXlsSaveContributor excelobj = new JRSingleSheetXlsSaveContributor(null,null) ;
File f1 = new File(path+"/admin/xlsreport.xls");
excelobj.save(jasperPrint,f1);*/
%>
</p>
<!--  XLS Report Created Successfully. You can View/Download your report <a href="xlsreport.xls">HERE</a>. -->
</body>
</html>