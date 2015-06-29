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
<center>
<table width = "70%" border="1" id="table2">
<%@page import="com.mongodb.*" %>
<%
int queno=Integer.parseInt(request.getParameter("queno"));
MongoClient mongoClient = new MongoClient();
DB db = mongoClient.getDB("Result");
String newcollection_a="";
	String utno_a=request.getParameter("utno");
String subject_a=request.getParameter("subject");
String division_a=request.getParameter("class");	
		


String temp_a=division_a.concat(subject_a);
newcollection_a="questions"+temp_a.concat(utno_a);

if(db.collectionExists(newcollection_a))
{
	DBCollection question = db.getCollection(newcollection_a);
	
	DBCursor cursor = question.find();
	
	try 
	{
		//cursor.next();
		while (cursor.hasNext()) 
		{
		    BasicDBObject dbobject=(BasicDBObject)cursor.next();
		    
		    out.println("<tr align = 'center' height = '40px'><td>"+dbobject.get("rno")+"</td><td>"+dbobject.get("marks")+"</td></tr>");

		
		out.println("<input type='hidden' name='colname' value='"+newcollection_a+"'>");
		out.println("<input type='hidden' name='utno' value='"+utno_a+"'>");
			out.println("<input type='hidden' name='subject' value='"+subject_a+"'>");
			out.println("<input type='hidden' name='class' value='"+division_a+"'></form>");
      
	 	}	
		%> <%
	} 
	finally 
	{ 
		cursor.close(); 
	}
}
else
{
	out.println("No Result exists under this");
}
    
%>


</table>
</center>
</body>
</html>
