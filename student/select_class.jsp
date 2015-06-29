<%
		try{
		if(session.getAttribute("student")==null)
		{%>
		<jsp:forward page="student.html"/>

		<%
		}}
		catch(Exception e)
		{

		}



%>




<%@ page import ="com.mongodb.*" %>
<%@ page import ="java.util.*" %>
<%
//try
//{
out.println("select_class.jsp is being executed");
String newcollection_a="";
MongoClient mongoClient=new MongoClient( "localhost" , 27017 );
DB db = mongoClient.getDB( "DB1" );
String utno_a=request.getParameter("utno");
out.println("got utno" + utno_a);
String subject_a=request.getParameter("subject");
String division_a=request.getParameter("class");

String temp_a=division_a.concat(subject_a);
newcollection_a=temp_a.concat(utno_a);

DB db2=mongoClient.getDB("Result");
DBCollection colletn = db2.getCollection("questions"+newcollection_a);
BasicDBObject query = new BasicDBObject("rno",session.getAttribute("student").toString());
	DBCursor cursor = colletn.find(query);
if(cursor.hasNext())
{
%>
		<jsp:forward page="student.html"/>

		<%

}
if(db.collectionExists(newcollection_a))
{
	session.setAttribute("utno",utno_a);
	session.setAttribute("subject",subject_a);
	session.setAttribute("division",division_a);
	session.setAttribute("newcollection",newcollection_a);
	//out.println("session set newcollection as " +newcollection_a);
%>
<jsp:forward page="random.jsp"/>
<%	
}
else
{
	//queno=Integer.parseInt(request.getParameter("queno"));
	out.println("No test exists under this");
}
/*}
catch (Exception e)
{
out.println(e);
}*/
%>






