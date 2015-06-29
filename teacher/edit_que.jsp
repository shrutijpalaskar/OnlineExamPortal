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
<table>
<tr><form action="add_que.jsp" method="post">
<%@ page import ="com.mongodb.*" %>
<%@ page import ="java.util.*" %>
<%
String teacher="";
int a=0;
String newcollection="";
MongoClient mongoClient=new MongoClient( "localhost" , 27017 );
DB db = mongoClient.getDB( "DB1" );
DBCollection collection;
int queno=Integer.parseInt(request.getParameter("queno"));
int Qno=0;
Qno=Integer.parseInt(request.getParameter("Qno"));

newcollection=request.getParameter("colname");

if(Qno<queno && a==0){
DBCollection coll=db.getCollection(newcollection);
BasicDBObject findq=new BasicDBObject("Q_no",(Qno+1));
DBCursor cursor=coll.find(findq);

//int qs=((Number) dbobject.get("Q_no")).intValue();
if(cursor.hasNext())
{
BasicDBObject dbobject=(BasicDBObject)cursor.next();
			String q=dbobject.get("Question").toString();
			String op1=dbobject.get("Option1").toString();
			String op2=dbobject.get("Option2").toString();
			String op3=dbobject.get("Option3").toString();
			String op4=dbobject.get("Option4").toString();
			String m=dbobject.get("Mark").toString();
			String c=dbobject.get("Correct_ans").toString();



out.println("<input type='hidden' name='colname' value='"+newcollection+"'>");

out.println("<input type='hidden' name='Qno' value='"+(Qno+1)+"'>");
out.println("<input type='hidden' name='teacher_id' value='"+teacher+"'>");
out.println("<input type='hidden' name='queno' value='"+queno+"'>");

out.println("<td width=300px><b>QUESTION NO:"+(Qno+1)+"</b></td>");



out.println("<td width=150px>.</td>");
out.println("<td>MARKS</td>");
out.println("</tr>");

out.println("<tr>");
out.println("<td>");
out.println("<textarea placeholder='Paste Question here' rows=4 cols=50 name='ques'>"+q+"</textarea></td>");
out.println("<td><input type='file' name='img'/></td>");
out.println("<td><input type='text' name='mark' value='"+m+"' placeholder='marks'/></td>");

out.println("</tr>");
out.println("</table>");
out.println("<br><b>OPTIONS:<b><br>");
out.println("<input type='text' name='o1' value='"+op1+"' placeholder='A)' /> <input type='text' name='o2' value='"+op2+"' placeholder='B)'/><br><br>");
out.println("<input type='text' name='o3' value='"+op3+"' placeholder='C)' /> <input type='text' name='o4' value='"+op4+"' placeholder='D)' /> <br><br>");
out.println("<input type='text' name='correct' value='"+c+"' placeholder='Correct Answer (Capital letter)'>");
out.println("<center>");
	out.println("<input type='submit' value = 'UPDATE' name='submit'>");
out.println("</center>");


}
// if entry  present


else{
out.println("<input type='hidden' name='colname' value='"+newcollection+"'>");

out.println("<input type='hidden' name='Qno' value='"+(Qno+1)+"'>");
out.println("<input type='hidden' name='teacher_id' value='"+teacher+"'>");
out.println("<input type='hidden' name='queno' value='"+queno+"'>");

out.println("<td width=300px><b>QUESTION NO:"+(Qno+1)+"</b></td>");



out.println("<td width=150px>.</td>");
out.println("<td>MARKS</td>");
out.println("</tr>");

out.println("<tr>");
out.println("<td>");
out.println("<textarea placeholder='Paste Question here' rows=4 cols=50 name='ques'></textarea></td>");
out.println("<td><input type='file' name='img'/></td>");
out.println("<td><input type='text' name='mark' placeholder='marks'/></td>");

out.println("</tr>");
out.println("</table>");
out.println("<br><b>OPTIONS:<b><br>");
out.println("<input type='text' name='o1' placeholder='A)' /> <input type='text' name='o2' placeholder='B)'/><br><br>");
out.println("<input type='text' name='o3' placeholder='C)' /> <input type='text' name='o4' placeholder='D)' /> <br><br>");
out.println("<input type='text' name='correct' placeholder='Correct Answer (Capital letter)'>");
out.println("<center>");
	out.println("<input type='submit' value = 'INSERT' name='submit'>");
out.println("</center>");
}

}
%>
</form>
</body>
</html>
