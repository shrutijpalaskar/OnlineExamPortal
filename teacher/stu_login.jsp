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
DBCollection coll=db.getCollection("stu_login");

//BasicDBObject query = new BasicDBObject("userid","bagade").append("password","123");
//("tname","Prof. Bagade").append

DBCursor cursor=coll.find();

String userid_db,password_db,sname_db;
try
{
BasicDBObject dbobject=(BasicDBObject)cursor.next();
	while (true) 
	{
		//out.println(cursor.next());
		
		sname_db=dbobject.get("sname").toString();
		userid_db=dbobject.get("userid").toString();
		password_db=dbobject.get("password").toString();
		//out.println("Userid from db "+userid_db);
		//out.println("Password from db "+password_db);
		 
		if(userid.equals(userid_db)) 
		{ 
			//out.println("Userid is equal");
			if(password.equals(password_db)) 
			{ 
				out.println("Welcome "+sname_db+" !"); 
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
}
cursor.close();
%>
