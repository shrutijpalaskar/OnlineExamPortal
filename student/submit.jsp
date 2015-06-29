<!DOCTYPE html>

<%
String studn=request.getParameter("sname");
String sno=request.getParameter("index"); 
String rlno=request.getParameter("rno");
String lastqno=request.getParameter("maxqs");

%>

<html>
<body>

Do you really want to exit?
	<form action='questions.jsp' method='post'>
	<%
	out.print("<input type='hidden' name='index' value='"+sno+"'>");
	out.print("<input type='hidden' name='rno' value='"+rlno+"'>");
	out.print("<input type='hidden' name='sname' value='"+studn+"'>");
	out.print("<input type='hidden' name='maxqs' value='"+lastqno+"'>");
	%>
	<input type='submit' name='submit' value='No'>
	</form>
	<form action='calculate.jsp' method='post'>
	<%
	out.print("<input type='hidden' name='rno' value='"+rlno+"'>");	
	%>
	<input type='submit' name='submit' value='Yes'>
	</form>

</body>
</html>
