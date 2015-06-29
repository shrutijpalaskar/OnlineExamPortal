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
<br />
<br><br><br><br>

<title>NOTICE DISPLAY</title><center>
<form method="post" action="del.jsp">
<table border="2" cellspacing="6" cellpadding="2">
<tr><th></th>
<th></th>
<th>NOTICE</th>
<th>DATE</th></tr>
<%@page import="com.mongodb.*" %>
<%@page import="java.util.*" %>
<%@page import="java.text.SimpleDateFormat" %>
<%
String database = "DB1";
String coll = "";
java.util.Date dNow=new java.util.Date();
SimpleDateFormat dF=new SimpleDateFormat("dd-MM-yyyy");
java.util.Date today_date=new java.util.Date();
String today=dF.format(today_date);
int i=0;

    MongoClient mongoClient = new MongoClient();
    DB db = mongoClient.getDB(database);


    DBCollection notices = db.getCollection("notices");
    DBCursor cursor=notices.find();
try{
while(cursor.hasNext()){
DBObject object=cursor.next();
out.println("<tr><td><input type='checkbox' value='"+object.get("no")+"' name='id'></td><td>"+object.get("no")+"</td><td>"+object.get("notice")+"</td><td>"+object.get("date")+"</td><td></tr>");
i++;}}
finally{cursor.close();}
out.println("</table>");
out.println("<br><br><br><input type='submit' value='delete selected' name='delete'>");    
%>

</form>
</center>
</body>
</html>


