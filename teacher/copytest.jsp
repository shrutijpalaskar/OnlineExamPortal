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
</body>
</html>

<%@ page import="com.mongodb.*"
    import="java.util.*"%>
<%
String database = "DB1";
try{
     MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
     DB db = mongoClient.getDB( database );
     
     String ai= request.getParameter("utno");
     String bi= request.getParameter("class");
     String ci= request.getParameter("subject");
     String di= bi+ci+ai;
     
     String a= request.getParameter("utno1");
     String b= request.getParameter("class1");
     String c= request.getParameter("subject1");
     String d= b+c+a;
     DBCollection question= db.getCollection(di);

     if (db.collectionExists(di)) {
    	 
    	 DBCursor dbCursor = question.find();
    	 while(dbCursor.hasNext())
    	 {
    		 DBObject list = dbCursor.next();
    		 DBCollection destination =  db.getCollection(d);
        	 destination.insert(list, WriteConcern.NORMAL);
    	 }
         out.println("<b>TEST TRANSFERRED SUCCESSFULLY !</b>");   
    	 
     } 
  
}catch(Exception e){

}

%>

