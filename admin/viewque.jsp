<%
try{
if(session.getAttribute("admin").equals(""))
{%>
<jsp:forward page="admin.html"/>

<%
}}
catch(Exception e)
{%>
<jsp:forward page="admin.html"/>

<%
}



%>
<html>
<head>
<title>PICT ONLINE EXAM PORTAL</title>
</head>
<style type = "text/css">

body {background-color: #8EFDE0; 
 	  background-image:url(books2.jpg); 
	  background-size:1366px 875px; 
	  background-repeat:no-repeat;
	  background-attachment:fixed;
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
<div id="div2">
<table border="1" id="table2">
<%@page import="com.mongodb.*" %>
<%
int queno=Integer.parseInt(request.getParameter("queno"));
MongoClient mongoClient = new MongoClient();
DB db = mongoClient.getDB("DB1");
String newcollection_a="";
	String utno_a=request.getParameter("utno");
String subject_a=request.getParameter("subject");
String division_a=request.getParameter("class");	
		


String temp_a=division_a.concat(subject_a);
newcollection_a=temp_a.concat(utno_a);

if(db.collectionExists(newcollection_a))
{
	int cnt=1;
	DBCollection question = db.getCollection(newcollection_a);
	
	DBCursor cursor = question.find();
	BasicDBObject dbobject=(BasicDBObject)cursor.next();
	String tot=dbobject.get("total_questions").toString();
	try 
	{
		//cursor.next();
		while (cursor.hasNext()) 
		{
		    DBObject object = cursor.next();
		    out.print("<tr><td colspan='2' id='td1'>"+cnt+")"+object.get("Question")+"&nbsp&nbsp");
			if(object.get("Qimage")!=null)
			{
				String qimage=object.get("Qimage").toString();
				String imagename="/onlineexam/teacher/data/"+qimage;
				out.println("<img src='"+imagename+"' style='width:304px;height:158px' >");
			}
			out.println("</td><td><form action='edit_que.jsp' method='post'><input type='submit'  value='Edit'></td></tr>");
		    out.println("<tr><td>a)"+object.get("Option1")+"</td><td>b)"+object.get("Option2")+"</td></tr><tr><td>c)"+object.get("Option3")+"</td><td>d)"+object.get("Option4")+"</td></tr><tr><td>Correct Answer: "+object.get("Correct_ans")+"</td><td>Marks : "+object.get("Mark")+"</td></tr>");

out.println("<input type='hidden' name='Qno' value='"+(cnt-1)+"'>");
out.println("<input type='hidden' name='queno' value='"+tot+"'>");
		
		out.println("<input type='hidden' name='colname' value='"+newcollection_a+"'>");
		out.println("<input type='hidden' name='utno' value='"+utno_a+"'>");
			out.println("<input type='hidden' name='subject' value='"+subject_a+"'>");
			out.println("<input type='hidden' name='class' value='"+division_a+"'></form>");

		    cnt++;       
	 	}
			
		//out.println("<input type='hidden' name='Qno' value='"+(Qno+1)+"'>");	
		%> <%
	} 
	finally 
	{ 
		cursor.close(); 
	}
}
else
{
	out.println("No Question Paper exists under this");
}
    
%>


</table>
</html>
