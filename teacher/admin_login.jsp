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

MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
DB db = mongoClient.getDB("DB1");
DBCollection coll=db.getCollection("admin_login");

BasicDBObject query = new BasicDBObject("userid","bagade").append("password","123");
//("tname","Prof. Bagade").append

DBCursor cursor=coll.find(query);

String userid_db,password_db,tname_db;
try
{

	while (cursor.hasNext()) 
	{
		//tname_db=cursor.next().get("tname").toString();
		userid_db=cursor.next().get("userid").toString();
		password_db=cursor.next().get("password").toString();
		 
		if(userid.equals(userid_db)) 
		{ 
			if(password.equals(password_db)) 
			{ 
				out.println("Welcome Prof. "+userid+" !"); 
			} 
			else 
			{ 
				out.println("Invalid password try again"); 
			} 
		} 
		else 
		{
			out.println("No Entry Found");
		}
	}
}
catch(Exception e)
{
	out.println("hi");
	out.println(e);
}
cursor.close();
%>
