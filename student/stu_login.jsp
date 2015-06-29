<%@ page import ="com.mongodb.*" %>
<%@ page import ="java.util.Arrays" %>
<%@ page import ="com.mongodb.MongoClient" %>
<%@ page import ="com.mongodb.MongoException" %>
<%@ page import ="com.mongodb.WriteConcern" %>
<%@ page import ="com.mongodb.DB" %>
<%@ page import ="com.mongodb.DBCollection" %>
<%@ page import ="com.mongodb.BasicDBObject" %>
<%@ page import ="com.mongodb.DBObject" %>
<%@ page import ="com.mongodb.DBCursor" %>
<%@ page import ="com.mongodb.BasicDBObjectBuilder" %>
<%@ page import ="com.mongodb.ServerAddress;" %>
<%
String userid=request.getParameter("uname"); 
String password=request.getParameter("pword"); 
//session.setAttribute("uname",userid);

MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
DB db = mongoClient.getDB("DB1");
DBCollection coll=db.getCollection("stu_login");
BasicDBObject query=new BasicDBObject("sid",userid);
DBCursor cursor=coll.find(query);
String userid_db,password_db,sname_db;
if(cursor.hasNext())
{
BasicDBObject dbobject=(BasicDBObject)cursor.next();
sname_db=dbobject.get("sname").toString();
		userid_db=dbobject.get("userid").toString();
		password_db=dbobject.get("password").toString();
		if(userid.equals(userid_db)) 
		{ 
			if(password.equals(password_db)) 
			{ 
				out.println("Welcome "+sname_db+" !");
				session.setAttribute("student",userid); 
			} 
			else 
			{ 
				//out.println("Invalid password try again"); 
%>
<jsp:forward page="student.html"/>
<%
			} 
		} 


}
else
{%>
<jsp:forward page="student.html"/>
<%
}



/*String userid_db,password_db,sname_db;
try
{
BasicDBObject dbobject=(BasicDBObject)cursor.next();
	while (true) 
	{
		sname_db=dbobject.get("sname").toString();
		userid_db=dbobject.get("userid").toString();
		password_db=dbobject.get("password").toString();
		if(userid.equals(userid_db)) 
		{ 
			if(password.equals(password_db)) 
			{ 
				out.println("Welcome "+sname_db+" !");
				session.setAttribute("student",userid); 
				break;
			} 
			else 
			{ 
				out.println("Invalid password try again"); 
			} 
		} 
		else 
		{
			//out.println("Userid did not match, continuing while loop");
			dbobject=(BasicDBObject)cursor.next();
			continue;
			//out.println("No Entry Found");
		}
	}
}
catch(Exception e)
{
	out.println("hi");
	out.println(e);
}*/
cursor.close();
%>
<jsp:forward page="select_class.html"/>
