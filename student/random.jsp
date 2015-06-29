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
<%!
int arry[]=new int[50];
int n=-1;

public void num_generator(int min,int max,int last)
{
	n++;
	if(n>last)
		return;
	Random ran = new Random();
	int i = min+ran.nextInt(max);
	if(ran.nextInt(2)==0)
	{
		if(i<=max)
		{
			arry[n]=i;
			if(i!=min)
				num_generator(min,i-1,last);
			if(i!=max)
				num_generator(i+1,max,last);
			return;		
		}
		else
		{
			n--;
			num_generator(min,max,last);
		}
	}
	else
	{
		if(i<=max)
		{
			arry[n]=i;
			if(i!=max)
				num_generator(i+1,max,last);
			if(i!=min)
				num_generator(min,i-1,last);
			return;		
		}
		else
		{
			n--;
			num_generator(min,max,last);
		}
	}
}
%>


<%
String studn="";
//String studn=request.getParameter("sname");
String rollno=session.getAttribute("student").toString();
String rlno=session.getAttribute("student").toString();
int lastqno=0,flag=0;
String optn="0";
rollno=rollno+"se";
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/answers","root","root123"); 
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select count(srno) from "+rollno+"");
if(rs.next())
	flag=rs.getInt("count(srno)");

MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
	DB db = mongoClient.getDB( "DB1" );

	String newcollection=session.getAttribute("newcollection").toString();
	DBCollection coll = db.getCollection(newcollection);
	lastqno= coll.find().count();
	lastqno--;
if(flag>0)
{
	rs=st.executeQuery("select opt from "+rollno+" where srno=1");
	if(rs.next())
	{
		optn=rs.getString("opt");
	}
%>
	<form
	action="questions.jsp" method="post">
	 
	<input type="hidden" name="index" value="1">
	<%out.print("<input type='hidden' name='rno' value='"+rlno+"'>");
	  out.print("<input type='hidden' name='opt' value='"+optn+"'>");
	  out.print("<input type='hidden' name='maxqs' value='"+lastqno+"'>");
	  out.print("<input type='hidden' name='sname' value='"+studn+"'>");%>	

	<input type="submit" name='submit' value="Continue">
<%
}else
{
num_generator(1,lastqno,lastqno);
//st.executeUpdate("create table "+rollno+"(srno int,qlist int,opt varchar(1))");
for(int i=0;i<lastqno;i++)
	st.executeUpdate("insert into "+rollno+" values('"+(i+1)+"','"+arry[i]+"',0)"); 
//for(int i=0;i<lastqno;i++)
%>


	<form
	action="questions.jsp" method="post">
	 
	<input type="hidden" name="index" value="1">
	<%out.print("<input type='hidden' name='rno' value='"+rlno+"'>");
	  out.print("<input type='hidden' name='maxqs' value='"+lastqno+"'>");
	  out.print("<input type='hidden' name='opt' value='"+optn+"'>");
	  out.print("<input type='hidden' name='sname' value='"+studn+"'>");%>		

	<input type="submit" name='submit' value="Continue"> 

<%}
%>



</body>
</html>
