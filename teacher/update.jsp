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
<title>UNIT TEST</title>
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
<tr><form action="add_que.jsp" method="post">
<%@ page import ="com.mongodb.*" %>
<%@ page import ="java.util.*" %>
<%


MongoClient mongoClient=new MongoClient( "localhost" , 27017 );
DB db = mongoClient.getDB( "DB1" );
try
{
	int queno=0;
	int Qno=0;
	String teacher="";
	DBCollection collection;
	String newcollection="";
	if(queno==0)
	{
	String utno=request.getParameter("utno");
	String division=request.getParameter("class");
	String subject=request.getParameter("subject");
	String date=request.getParameter("date");

	//String dateString = new SimpleDateFormat("yyyy.MM.dd  HH:mm:ss").format(new Date()); - See more at: http://www.jvmhost.com/articles/using-mongodb-java-jsp-mongo-java-api#sthash.ECNRjzVV.dpuf
	teacher=request.getParameter("teacher_id");
	String s_t_h=request.getParameter("t1");
	String s_t_m=request.getParameter("m1");
	String s_t_am=request.getParameter("am");
	String e_t_h=request.getParameter("t2");
	String e_t_m=request.getParameter("m2");
	String e_t_am=request.getParameter("pm");
	String total_marks=request.getParameter("marks");
	String total_questions=request.getParameter("no");

	String temp=division.concat(subject);
	newcollection=temp.concat(utno);

	if (db.collectionExists(newcollection)) 
	{

	collection=db.getCollection(newcollection);
	BasicDBObject doc=new BasicDBObject("utno",utno).append("division",division).append("subject",subject);
	BasicDBObject newdoc=new BasicDBObject();
	newdoc.append("$set",new BasicDBObject("date",date).append("start_time",new BasicDBObject("hours",s_t_h).append("minutes",s_t_m).append("AM/PM",s_t_am)).append("end_time",new BasicDBObject("hours",e_t_h).append("minutes",e_t_m).append("AM/PM",e_t_am)).append("total_marks",total_marks).append("total_questions",total_questions));
	collection.update(doc,newdoc);
	} 
	else 
	{

    	BasicDBObject options =new BasicDBObject();
    	options.put("size", 50000);
        collection = db.createCollection(newcollection,options);

	BasicDBObject doc=new BasicDBObject("utno",utno).append("division",division).append("subject",subject).append("date",date).append("start_time",new BasicDBObject("hours",s_t_h).append("minutes",s_t_m).append("AM/PM",s_t_am)).append("end_time",new BasicDBObject("hours",e_t_h).append("minutes",e_t_m).append("AM/PM",e_t_am)).append("total_marks",total_marks).append("total_questions",total_questions);
	collection.insert(doc);
	
	}

	queno=Integer.parseInt(total_questions);

	//run the query here

	} //end of if queno==0
	else
	{
	newcollection=request.getParameter("colname");
	teacher=request.getParameter("teacher_id");
	Qno=Integer.parseInt(request.getParameter("Qno"));
	String Question=request.getParameter("ques");
	String Mark=request.getParameter("mark");
	String o1=request.getParameter("o1");
	String o2=request.getParameter("o2");
	String o3=request.getParameter("o3");
	String o4=request.getParameter("o4");
	String correct=request.getParameter("correct");

	if (db.collectionExists(newcollection)) 
	{

	collection=db.getCollection(newcollection);
	} 
	else 
	{

    	BasicDBObject options =new BasicDBObject();
    	options.put("size", 50000);
        collection = db.createCollection(newcollection,options);
	}

BasicDBObject doctemp=new BasicDBObject("Q_no",Qno).append("Question",Question).append("Mark",Mark).append("Option1",o1).append("Option2",o2).append("Option3",o3).append("Option4",o4).append("Correct_ans",correct);
			collection.insert(doctemp);
}
	DBCollection coll=db.getCollection(newcollection);
	DBCursor cursor;
	cursor=coll.find();
	BasicDBObject dbobject=(BasicDBObject)cursor.next();
	int j=0;
	int[] qs;
	qs = new int[20];
	while((cursor.hasNext()) && j<20)
	{
		//int autostart = ((Number) mapObj.get("autostart")).intValue();
		qs[j]=((Number) dbobject.get("Q_no")).intValue();
	}
	for(int i=0;i<20;i++)
	{
		out.println("Currently db has questions : "+qs[i]);
		if(Qno<queno)
		{

		out.println("<input type='hidden' name='colname' value='"+newcollection+"'>");
		out.println("<input type='hidden' name='Qno' value='"+(Qno+1)+"'>");
		out.println("<input type='hidden' name='teacher_id' value='"+teacher+"'>");
		out.println("<input type='hidden' name='queno' value='"+queno+"'>");

		out.println("<td width=300px><b>QUESTION NO:"+(Qno+1)+"</b></td>");

		if(Qno==qs[i])
		{
			//update Qno and display previously stored data
			String q=dbobject.get("Question").toString();
			String op1=dbobject.get("Option1").toString();
			String op2=dbobject.get("Option2").toString();
			String op3=dbobject.get("Option3").toString();
			String op4=dbobject.get("Option4").toString();
			String m=dbobject.get("Mark").toString();
			String c=dbobject.get("Correct_ans").toString();

			out.println("<td width=150px>.</td>");
			out.println("<td>MARKS</td>");
			out.println("</tr>");

			out.println("<tr>");
			out.println("<td>");
			out.println("<textarea Value=q rows=4 cols=50 name='ques'></textarea></td>");
			out.println("<td><input type='file' name='img'/></td>");
			out.println("<td><input type='text' name='mark' value=m/></td>");

			out.println("</tr>");
			out.println("</table>");
			out.println("<br><b>OPTIONS:<b><br>");
			out.println("<input type='text' name='o1' value=op1 /> <input type='text' name='o2' value=op2 /><br><br>");
			out.println("<input type='text' name='o3' value=op3 /> <input type='text' name='o4' value=op4 /> <br><br>");
			out.println("<input type='text' name='correct' value=c>");
			out.println("<center>");
				out.println("<input type='submit' value = 'SAVE'>");
			out.println("</center>");

			//updating
		/*
			BasicDBObject doc1=new BasicDBObject("Qno",Qno);
			BasicDBObject newdoc1=new BasicDBObject();
			newdoc1.append("$set",new BasicDBObject("Question",Question).append("Mark",Mark).append("Option1",o1).append("Option2",o2).append("Option3",o3).append("Option4",o4).append("Correct_ans",correct));
		collection.update(doc1,newdoc1);	*/

			cursor.close();
		}
		else
		{
		
			out.println("<td width=150px>.</td>");
			out.println("<td>MARKS</td>");
			out.println("</tr>");

			out.println("<tr>");
			out.println("<td>");
			out.println("<textarea Value='Paste Question here' rows=4 cols=50 name='ques'></textarea></td>");
			out.println("<td><input type='file' name='img'/></td>");
			out.println("<td><input type='text' name='mark' placeholder='marks'/></td>");

			out.println("</tr>");
			out.println("</table>");
			out.println("<br><b>OPTIONS:<b><br>");
			out.println("<input type='text' name='o1' placeholder='A)' /> <input type='text' name='o2' placeholder='B)'/><br><br>");
			out.println("<input type='text' name='o3' placeholder='C)' /> <input type='text' name='o4' placeholder='D)' /> <br><br>");
			out.println("<input type='text' name='correct' placeholder='Correct Answer (Capital letter)'>");
			out.println("<center>");
				out.println("<input type='submit' value = 'SAVE'>");
			out.println("</center>");
		
			
		}
		}//end of if Qno < qno !!
		else
		{
	
		out.println("<H1>Your Question Paper Is Stored</h1>");
		out.println("<a>Click here to view Question Paper</a>");
		}
	}//end of for
	//end od else of if qno==0
}//end of try
catch (Exception e)
{
	out.println(e);
}
finally
{
	
}
%>
</form>
</body>
</html>
