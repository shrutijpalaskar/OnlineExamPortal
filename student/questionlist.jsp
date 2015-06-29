<!DOCTYPE html>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.util.*" %>

<%
String studn=request.getParameter("sname");
String sno=request.getParameter("index"); 
String rlno=request.getParameter("rno");
String rollno=request.getParameter("rno");
String lastqno=request.getParameter("maxqs");
%>

<html>
<head>
<title> EXAM </title>
</head>

<link rel = "stylesheet" type = "text/css" href = "stud.css" />
<body>

	<div id="color">
	<table >
		<tr>
			<td width='400px'><img src = "logo.png"/></td>
			<td><img src = "puch.png"/></td>
		</tr>
	</table>
	<br>
	</div>
	<br>
	<%out.print("<b id='pos4'>ROLL NO:" +rlno+"</b>");%>
	<%out.print("<b id='pos5'>NAME:" +studn+"</b>");%>
	<b id='pos6'>TIME:</b>
	<br>
<%
	int sn,i=0;
	String op;
	rollno=rollno+"se";
	Class.forName("com.mysql.jdbc.Driver"); 
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/answers","root","root123"); 
	Statement st= con.createStatement();
	

	ResultSet rs=st.executeQuery("select srno,opt from "+rollno+"");
	while(rs.next())
	{
		i++;
		sn=rs.getInt("srno");
		op=rs.getString("opt");
		out.print("Q"+sn+")"+" "+op);%>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		<%if(i%5==0)
		{%>
			<br>
		<%}
	}	




%>
	<center>
	<div id='border'>
	<div id="pos"><hr width="1100px"/></div>	
	</dev>
	</center>					    	

		

	
	<form action='questions.jsp' method='post'>
	<%
	out.print("<input type='hidden' name='index' value='"+sno+"'>");
	out.print("<input type='hidden' name='rno' value='"+rlno+"'>");
	out.print("<input type='hidden' name='sname' value='"+studn+"'>");
	out.print("<input type='hidden' name='maxqs' value='"+lastqno+"'>");
	%>
	<p id="pos2">
		<input type='submit' name='submit' value='BACK'>
	</p>
	</form>
	</p>

	
</body>

</html>
