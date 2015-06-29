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


 ul li{
        float: left;
        width: 170px;
        text-align: center;
        line-height: 25px;
	margin-left:0px;
    }
    ul li a{
        display: block;
        padding: 5px;
        color: #3;
        background: #e2f2f2;
        text-decoration: none;
    }
    ul li a:hover{
		border:1px solid;
        color: #fff;
        background: #939393;
    }
    ul li ul{
        display: none;
    }
	ul li:hover ul{
        display: block;
    }






	  
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
<ul>
<li><a href="admin_home.jsp">HOME</a></li>
<li><a href="notices1.html">NOTICES</a>
			<ul><li><a href="create_notice.html">CIRCULATE A NOTICE</a></li>
			<li><a href="today_notice.jsp">TODAY'S NOTICES</a></li>
			<li><a href="disp_all_notices.jsp">VIEW ALL NOTICES</a></li>
		
	</li></ul>


<li><a href="specifications.html">SPECIFICATIONS</a></li>
<li><a href="select_class.html">QUESTION PAPERS</a></li>
<li><a href="copytest_select_class.html">COPY TEST</a></li>
<li><a href="select_class_result.html">RESULTS</a></li>
<li><a href="/onlineexam/main_page.html">SIGN OUT</a></li>
</ul>
</table>
<br />
</body>
</html>



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
out.println("Test Specifications Saved");
}
catch (Exception e)
{
	out.println(e);
}
%>
