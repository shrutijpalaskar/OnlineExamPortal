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



<%@ page import ="com.mongodb.*" %>
<%@ page import ="java.util.*" %>
<%
//try
//{
String newcollection_a="";
MongoClient mongoClient=new MongoClient( "localhost" , 27017 );
DB db = mongoClient.getDB( "DB1" );
String utno_a=request.getParameter("utno");
String subject_a=request.getParameter("subject");
String division_a=request.getParameter("class");
String temp_a=division_a.concat(subject_a);
newcollection_a=temp_a.concat(utno_a);
/*int queno;
String no="";
session.setAttribute("Qno",Qno);
session.setAttribute("colname",colname);		*/
if(db.collectionExists(newcollection_a))
{
	/*out.println("inside coll exists");
	DBCollection coll_a=db.getCollection(newcollection_a);
	DBCursor cursor_a=coll_a.find();
	BasicDBObject dbobject_a=(BasicDBObject)cursor_a.next();
	no=dbobject_a.get("total_questions").toString();
	queno=Integer.parseInt(no);
	out.println("got que value" +queno);
	session.setAttribute("queno",queno);		*/

	session.setAttribute("utno",utno_a);
	session.setAttribute("subject",subject_a);
	session.setAttribute("division",division_a);
	
}
else
{
	//queno=Integer.parseInt(request.getParameter("queno"));
	out.println("No test exists under this");
}
/*}
catch (Exception e)
{
out.println(e);
}*/
%>







