<html>
<head>
<title>PICT ONLINE EXAM PORTAL</title>
</head>
<style type = "text/css">

body {background-color: #8EFDE0; 
 	  background:url(books2.jpg); 
	  background-size:1366px 875px; 
	  background-repeat:no-repeat;
	  color:white;
	  font-size:16;}
	  
.tab {background-color:#C0DAF3; 
	  color:red;}

		a:link{color:black; text-decoration:none;}
		
		a:hover{background-color:#0C0959;
				text-decoration:underline;
				color:white;
				font-weight:bold;}
		
#x{width:200px;}

#s2 {width:50px}

.col {width : 350px;}

</style>

<body>

<center>
<img src="pict.png" />
</center>
<br>
<table border='4%' width='100%' class="tab" cellpadding="6">
<tr>
<td><a href="tea_home.jsp">HOME</a></td>
<td><a href="specifications.html">SPECIFICATIONS</a></td>
<td><a href="update_existing.jsp">INSERT QUESTIONS</a></td>
<td><a href="select_class.html">QUESTION PAPERS</a></td>
<td><a href="copytest_select_class.html">COPY TEST</a></td>
<td><a href="select_class_result.html">RESULTS</a></td>
<td><a href="/onlineexam/main_page.html">SIGN OUT</a></td>
</tr>
</table>
<br />

<table>
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
<%@ page import ="com.mongodb.ServerAddress" %>
<%@page import="java.util.*" %>
<%@page import="java.text.SimpleDateFormat" %>
<%

try
{
MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
DB db = mongoClient.getDB("DB1");
DBCollection notices=db.getCollection("notices");

java.util.Date dNow=new java.util.Date();
SimpleDateFormat dF=new SimpleDateFormat("dd-MM-yyyy");
java.util.Date today_date=new java.util.Date();
String today=dF.format(today_date);

				BasicDBObject findq=new BasicDBObject("date",(today));
				DBCursor c=notices.find(findq);
				out.println("&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp TODAY'S NOTICES<br>");
                                while(c.hasNext())
                                  {
                                    BasicDBObject obj=(BasicDBObject)c.next();
                                   out.println("<h3><tr><td>*&nbsp&nbsp</td><td>"+obj.get("notice")+"</td><td>"+obj.get("date")+"</tr></h3>");
                                  }
				c.close();
			

}
catch(Exception e)
{
	out.println(e);
}

%>

</body>
</html>
