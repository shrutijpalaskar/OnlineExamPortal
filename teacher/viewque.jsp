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
<!doctype html>
<html>

<head>
<meta charset="utf-8" />
<title>PICT ONLINE EXAM PORTAL</title>
<link rel="stylesheet" href="viewall.css">

</head>

<body id="body1">
   
     <div id="div1">
	
<center>
	   <img src="pict.png"/>   
</center>



<!--<input type="hidden" name="queno" value="0">-->
</div>
<div id="div2">
<table border="1" id="table2">
<%@page import="com.mongodb.*" %>
<%
int queno=Integer.parseInt(request.getParameter("queno"));
MongoClient mongoClient = new MongoClient();
DB db = mongoClient.getDB("DB1");
String newcollection_a="";
	String utno_a=request.getParameter("utno");
String subject_a=request.getParameter("subject");
String division_a=request.getParameter("class");	
		


String temp_a=division_a.concat(subject_a);
newcollection_a=temp_a.concat(utno_a);

if(db.collectionExists(newcollection_a))
{
	int cnt=1;
	DBCollection question = db.getCollection(newcollection_a);
	
	DBCursor cursor = question.find();
	BasicDBObject dbobject=(BasicDBObject)cursor.next();
	String tot=dbobject.get("total_questions").toString();
	try 
	{
		//cursor.next();
		while (cursor.hasNext()) 
		{
		    DBObject object = cursor.next();
		    out.print("<tr><td colspan='2' id='td1'>"+cnt+")"+object.get("Question")+"&nbsp&nbsp");
			if(object.get("Qimage")!=null)
			{
				String imagename="data/"+newcollection_a+cnt+".jpeg";
				out.println("<img src='"+imagename+"' style='width:304px;height:158px' >");
			}
			out.println("</td><td><form action='edit_que.jsp' method='post'><input type='submit'  value='Edit'></td></tr>");
		    out.println("<tr><td>a)"+object.get("Option1")+"</td><td>b)"+object.get("Option2")+"</td></tr><tr><td>c)"+object.get("Option3")+"</td><td>d)"+object.get("Option4")+"</td></tr><tr><td>Correct Answer: "+object.get("Correct_ans")+"</td><td>Marks : "+object.get("Mark")+"</td></tr>");

out.println("<input type='hidden' name='Qno' value='"+(cnt-1)+"'>");
out.println("<input type='hidden' name='queno' value='"+tot+"'>");
		
		out.println("<input type='hidden' name='colname' value='"+newcollection_a+"'>");
		out.println("<input type='hidden' name='utno' value='"+utno_a+"'>");
			out.println("<input type='hidden' name='subject' value='"+subject_a+"'>");
			out.println("<input type='hidden' name='class' value='"+division_a+"'></form>");

		    cnt++;       
	 	}
			
		//out.println("<input type='hidden' name='Qno' value='"+(Qno+1)+"'>");	
		%> <%
	} 
	finally 
	{ 
		cursor.close(); 
	}
}
else
{
	out.println("No Question Paper exists under this");
}
    
%>


</table>
</html>
