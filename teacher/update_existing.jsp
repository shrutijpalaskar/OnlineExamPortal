<%
try{
if(session.getAttribute("teacher")==null)
{%>
<jsp:forward page="teacher.html"/>

<%
}}
catch(Exception e)
{

}



%>
<html>
<head>
<title>PICT ONLINE EXAM PORTAL</title>
</head>
<style type = "text/css">

body {background-color: #8EFDE0; 
 	  background:url(books2.jpg); 
	  background-size:1366px 875px; 
	  background-repeat:no-repeat;
	  color:white;
	  font-size:16;}
	  
.tab {background-color:#C0DAF3; 
	  color:red;}

		a:link{color:black; text-decoration:none;}
		
		a:hover{background-color:#0C0959;
				text-decoration:underline;
				color:white;
				font-weight:bold;}
		
#x{width:200px;}

#s2 {width:50px}

.col {width : 350px;}

</style>

<body>

<center>
<img src="pict.png" />
</center>
<br>
<table border='4%' width='100%' class="tab" cellpadding="6">
<tr>
<td><a href="tea_home.jsp">HOME</a></td>
<td><a href="specifications.html">SPECIFICATIONS</a></td>
<td><a href="update_existing.jsp">INSERT QUESTIONS</a></td>
<td><a href="select_class.html">QUESTION PAPERS</a></td>
<td><a href="copytest_select_class.html">COPY TEST</a></td>
<td><a href="select_class_result.html">RESULTS</a></td>
<td><a href="/onlineexam/main_page.html">SIGN OUT</a></td>
</tr>
</table>
<br />
<form action="add_que_update.jsp" method ='post' >
<input type="hidden" name="teacher_id" value="xyz">
<input type="hidden" name="queno" value="0">
<table width= "100%" cellpadding="6" >
<tr>
	<td width="350"><b>UNIT TEST</b></td>
	<td >
		<select name = "utno">
		<option value='ut1'>UT1</option>
		<option value='ut2'>UT2</option>
	</td>
</tr>
<tr>
	<td width="350"><b>CLASS</b></td>
	<td >
		
		<select name = "class">
		<option value='se1'>SE-&#8544</option>
		<option value='se2'>SE-&#8545</option>
		<option value='se3'>SE-&#8546</option>
		<option value='se4'>SE-&#8547</option>
		
	</td>
</tr>
<tr>
	<td><b>SUBJECT</b></td>
	<td>
		
		<select name = "subject">
		<option value='DS'> Discrete Structures (D.S.) </option>
		<option value='DSPS'> Data Structures and Problem Solving (D.S.P.S.) </option>
		<option value='DELD'> Digital Electronics and Logic Design (D.E.L.D.) </option>
		<option value='OSA'> Operating System Architecture (O.S.A.) </option>
		<option value='MPA'> Microprocessor Architecture (M.A.) </option>
		
	</td>
</tr>
</table><input type='submit' value='ENTER'></form>
</html>


<%@page import="com.mongodb.*" %>
<%

/*String queno_a=request.getParameter("queno");
out.println("got queno "+queno_a);

		String utno_a=request.getParameter("utno");
out.println("got utno" + utno_a);
String subject_a=request.getParameter("subject");
String division_a=request.getParameter("class");

session.setAttribute("queno",queno_a);
session.setAttribute("utno",utno_a);
session.setAttribute("division",division_a);
session.setAttribute("subject",subject_a);*/		
%>			
