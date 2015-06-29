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


<%@ page import ="com.mongodb.*" %>
<%@ page import ="java.util.Arrays" %>
<%
try
{
String utno=request.getParameter("utno");
String division=request.getParameter("class");
String subject=request.getParameter("subject");
String date=request.getParameter("date");

//String dateString = new SimpleDateFormat("yyyy.MM.dd  HH:mm:ss").format(new Date()); - See more at: http://www.jvmhost.com/articles/using-mongodb-java-jsp-mongo-java-api#sthash.ECNRjzVV.dpuf
String s_t_h=request.getParameter("t1");
String s_t_m=request.getParameter("m1");
String s_t_am=request.getParameter("am");
String e_t_h=request.getParameter("t2");
String e_t_m=request.getParameter("m2");
String e_t_am=request.getParameter("pm");
String total_marks=request.getParameter("marks");
String total_questions=request.getParameter("no");

MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
DB db = mongoClient.getDB("DB1");

String temp=division.concat(subject);
String newcollection=temp.concat(utno);
DBCollection collection;
if (db.collectionExists(newcollection)) 
{
	collection=db.getCollection(newcollection);
} 
else 
{
    	BasicDBObject options =new BasicDBObject("capped", true);
    	options.put("size", 50000);
        collection = db.createCollection(newcollection,options);
}
BasicDBObject doc=new BasicDBObject("utno",utno).append("division",division).append("subject",subject).append("date",date).append("start_time",new BasicDBObject("hours",s_t_h).append("minutes",s_t_m).append("AM/PM",s_t_am)).append("end_time",new BasicDBObject("hours",e_t_h).append("minutes",e_t_m).append("AM/PM",e_t_am)).append("total_marks",total_marks).append("total_questions",total_questions);
collection.insert(doc);
}
catch (Exception e)
{
	out.println(e);
}
%>
