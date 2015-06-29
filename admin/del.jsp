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

<title>Deleteing notices...</title>
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
String [] delval=request.getParameterValues("id");
int [] delval1=new int[delval.length];
int k=0;
if(delval!=null && delval.length!=0)
{//out.println("u hav");
for(int i=0;i<delval.length;i++){
//out.println(delval[i]);
}
}
//out.println("delval1 is");
for(int i=0;i<delval.length;i++)
{
delval1[i]=Integer.parseInt(delval[i]);
//out.println(delval1[i]);
}


    MongoClient mongoClient = new MongoClient();
    DB db = mongoClient.getDB(database);
String opt=request.getParameter("list");

    DBCollection notices = db.getCollection("notices");
BasicDBObject object=new BasicDBObject();
 DBCursor cursor=notices.find();
int i=0;
while(i<delval1.length)
{
notices.remove(new BasicDBObject().append("no",delval1[i]));
i++;
//out.println("deleted");
}
out.println("<h1>Removed Successfully!!</h1>");
%>
</body>
</html>


