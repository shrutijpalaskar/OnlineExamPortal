<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.util.*" %>
<%@ page import="com.mongodb.Mongo" %>
<%@ page import="com.mongodb.MongoClient" %>
<%@ page import ="com.mongodb.DB" %>
<%@ page import ="com.mongodb.BasicDBObject" %>
<%@ page import ="com.mongodb.DBCollection" %>
<%@ page import ="com.mongodb.DBCursor" %>
<%@ page import ="com.mongodb.BasicDBObjectBuilder" %>
<%@ page import ="com.mongodb.MongoException" %>
<%@ page import ="com.mongodb.WriteConcern" %>
<%@ page import ="com.mongodb.ServerAddress" %>

<%
String rollno=request.getParameter("rno");
String rlno=request.getParameter("rno");
rollno=rollno+"se";
int ql=1,mrks,tmarks=0;
String op=" ",mks=" ",anw=" ";
	MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
	DB db = mongoClient.getDB( "DB1" );
	DBCollection coll = db.getCollection("se4DELDut2");

	Class.forName("com.mysql.jdbc.Driver"); 
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/answers","root","root123"); 
	Statement st= con.createStatement();
	ResultSet rs=st.executeQuery("select qlist,opt from "+rollno+"");
	while(rs.next())
	{
		ql=rs.getInt("qlist");
		op=rs.getString("opt");
		BasicDBObject query = new BasicDBObject("qno",""+ql);
		DBCursor cursor = coll.find(query);
		if(cursor.hasNext()) 
		{
			cursor.next();
		 	anw=cursor.curr().get("Correct_ans").toString();
			mks=cursor.curr().get("Mark").toString();
			mrks=Integer.parseInt(mks);
			if(op.equals(""+anw))
			{
				tmarks=tmarks+mrks;
			}
		}
	}

	out.print("Your score="+tmarks);
%>
