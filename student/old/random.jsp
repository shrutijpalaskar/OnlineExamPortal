<!DOCTYPE html>
<%@ page import ="java.util.*" %>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
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
<%@ page import ="com.mongodb.DBObject" %>
<html>
<body>
<%
int lastqno;
MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
	DB db = mongoClient.getDB( "DB1" );
	DBCollection coll = db.getCollection("se3DELDut2");
	lastqno= coll.find().count();
	lastqno--;
%>
<%!
int arry[]=new int[100];
int n=-1;

public void num_generator(int min,int max,int lastqno)
{
	n++;
	if(n>lastqno)
		return;
	Random ran = new Random();
	int i = min+ran.nextInt(max);
	if(ran.nextInt(2)==0)
	{
		if(i<=max)
		{
			arry[n]=i;
			if(i!=min)
				num_generator(min,i-1,lastqno);
			if(i!=max)
				num_generator(i+1,max,lastqno);
			return;		
		}
		else
		{
			n--;
			num_generator(min,max,lastqno);
		}
	}
	else
	{
		if(i<=max)
		{
			arry[n]=i;
			if(i!=max)
				num_generator(i+1,max,lastqno);
			if(i!=min)
				num_generator(min,i-1,lastqno);
			return;		
		}
		else
		{
			n--;
			num_generator(min,max,lastqno);
		}
	}
}
%>


<%
String studn="Pict Pune";
String rlno="2201";
//String studn=request.getParameter("sname");
//String rollno=request.getParameter("rno");
//String rlno=request.getParameter("rno");
int flag=0;
String rollno="2201se";
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/answers","root","root123"); 
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select count(srno) from "+rollno+"");
if(rs.next())
	flag=rs.getInt("count(srno)");


if(flag>0)
{
%>
	<form
	action="questions.jsp" method="post">
	 
	<input type="hidden" name="index" value="1">
	<%out.print("<input type='hidden' name='rno' value='"+rlno+"'>");
	  out.print("<input type='hidden' name='maxqs' value='"+lastqno+"'>");
	  out.print("<input type='hidden' name='sname' value='"+studn+"'>");%>	

	<input type="submit" name='submit' value="Continue">
<%
}else
{
num_generator(1,lastqno,lastqno);
st.executeUpdate("delete from "+rollno+"");
for(int i=0;i<lastqno;i++)
	st.executeUpdate("insert into 2201se values('"+(i+1)+"','"+arry[i]+"',0)"); 
%>


	<form
	action="questions.jsp" method="post">
	 
	<input type="hidden" name="index" value="1">
	<%out.print("<input type='hidden' name='rno' value='"+rlno+"'>");
	  out.print("<input type='hidden' name='maxqs' value='"+lastqno+"'>");
	  out.print("<input type='hidden' name='sname' value='"+studn+"'>");%>		

	<input type="submit" name='submit' value="Continue"> 

<%}
%>



</body>
</html>
