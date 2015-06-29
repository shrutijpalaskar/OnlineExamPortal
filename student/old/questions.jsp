<!DOCTYPE html>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.util.*" %>
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

<html>
<head>
<title> EXAM </title>
</head>

<link rel = "stylesheet" type = "text/css" href = "stud.css" />
<%
String studn=request.getParameter("sname");
String qno=request.getParameter("index"); 
String rollno=request.getParameter("rno");
String rlno=request.getParameter("rno");
String ltqno=request.getParameter("maxqs");
int sno=Integer.parseInt(qno);
int lastqno=Integer.parseInt(ltqno);
String sub=request.getParameter("submit");
	Class.forName("com.mysql.jdbc.Driver"); 
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/answers","root","root123"); 
	Statement st= con.createStatement();
	ResultSet rs;

if(sub.equals("First"))
	sno=1;
else if(sub.equals("Next") && sno<lastqno)
	sno++;
else if(sub.equals("Prev")&& sno>1)
	sno--;
else if(sub.equals("Last"))
	sno=lastqno;
%>
<body>

	<div id="color">
	<table >
		<tr>
			<td width='400px'><img src = "logo.png"/></td>
			<td><img src = "puch.png"/></td>
		</tr>
	</table>
	<br>
	</div>
	<br>
	<%out.print("<b id='pos4'>ROLL NO:" +rollno+"</b>");%>
	<%out.print("<b id='pos5'>NAME:" +studn+"</b>");%>
	<b id='pos6'>TIME:</b>
	<br>
	


<%
String marked=" ";
rollno=rollno+"se";
int qsno=0;


	rs=st.executeQuery("select qlist from "+rollno+" where srno='"+sno+"'");
	if(rs.next())
	{
		qsno=rs.getInt("qlist");
	}

	MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
	DB db = mongoClient.getDB( "DB1" );
	DBCollection coll = db.getCollection("se3DELDut2");
	BasicDBObject query = new BasicDBObject("Q_no",qsno);
	//BasicDBObject query = new BasicDBObject();
	DBCursor cursor = coll.find(query);
	String str="",op1="",op2="",op3="",op4=""; 
	rs=st.executeQuery("select opt from "+rollno+" where srno='"+sno+"'");
out.println("<h1>"+qsno+"</h1>");

	if(rs.next())
	{
		marked=rs.getString("opt");
	}
			while (cursor.hasNext()) 
		{
BasicDBObject dbobject=(BasicDBObject)cursor.next();
	
			//cursor.next();
		 	str=dbobject.get("Question").toString();
			op1=dbobject.get("Option1").toString();
			op2=cursor.curr().get("Option2").toString();
			op3=cursor.curr().get("Option3").toString();
			op4=cursor.curr().get("Option4").toString();
		}
	if(marked.equals("A"))
	{
%>			
	<center>
	<div id='border'>
		<div id='border1'>
<%
			out.print("Q"+sno+" "+str);
%>
		</div>
		<br>
		<table id='tab'  cellpadding='7'  >

		<form>
			<tr>
				<td>A</td>
				<td width=50px><input type='radio' name="opt"value='A' checked/></td>
				<td><%out.print(" "+op1);%></td>
			</tr>

			<tr>
				<td>B</td>
				<td><input type='radio' value='B' name="opt" /></td>
				<td><%out.print(" "+op2);%></td>
			</tr>
			
			<tr>
				<td>C</td>
				<td><input type='radio' name="opt" value='C' /></td>
				<td><%out.print(" "+op3);%></td>
			</tr>
			
			<tr>
				<td>D</td>
				<td><input type='radio' name="opt" value='D' /></td>
				<td><%out.print(" "+op4);%></td>
			</tr>
		</form>
		</table>
		
		<br><br><br><br><br><br><br><br>
		<div id="pos"><hr width="1100px"/></div>
		</div>
	</center>					    	
<%		    			    		    	
	}else if(marked.equals("B"))
	{
%>			
	<center>
	<div id='border'>
		<div id='border1'>
<%
			out.print("Q"+sno+" "+str);
%>
		</div>
		<br>
		<table id='tab'  cellpadding='7'  >

		<form>
			<tr>
				<td>A</td>
				<td width=50px><input type='radio' name="opt"value='A' /></td>
				<td><%out.print(" "+op1);%></td>
			</tr>

			<tr>
				<td>B</td>
				<td><input type='radio' value='B' name="opt" checked/></td>
				<td><%out.print(" "+op2);%></td>
			</tr>
			
			<tr>
				<td>C</td>
				<td><input type='radio' name="opt" value='C' /></td>
				<td><%out.print(" "+op3);%></td>
			</tr>
			
			<tr>
				<td>D</td>
				<td><input type='radio' name="opt" value='D' /></td>
				<td><%out.print(" "+op4);%></td>
			</tr>
		</form>
		</table>
		
		<br><br><br><br><br><br><br><br>
		<div id="pos"><hr width="1100px"/></div>
		</div>
	</center>					    	
<%		    			    		    	
	}else if(marked.equals("C"))
	{
%>			
	<center>
	<div id='border'>
		<div id='border1'>
<%
			out.print("Q"+sno+" "+str);
%>
		</div>
		<br>
		<table id='tab'  cellpadding='7'  >

		<form>
			<tr>
				<td>A</td>
				<td width=50px><input type='radio' name="opt"value='A' /></td>
				<td><%out.print(" "+op1);%></td>
			</tr>

			<tr>
				<td>B</td>
				<td><input type='radio' value='B' name="opt" /></td>
				<td><%out.print(" "+op2);%></td>
			</tr>
			
			<tr>
				<td>C</td>
				<td><input type='radio' name="opt" value='C' checked/></td>
				<td><%out.print(" "+op3);%></td>
			</tr>
			
			<tr>
				<td>D</td>
				<td><input type='radio' name="opt" value='D' /></td>
				<td><%out.print(" "+op4);%></td>
			</tr>
		</form>
		</table>
		
		<br><br><br><br><br><br><br><br>
		<div id="pos"><hr width="1100px"/></div>
		</div>
	</center>					    	
<%		    			    		    	
	}else if(marked.equals("D"))
	{
%>			
	<center>
	<div id='border'>
		<div id='border1'>
<%
			out.print("Q"+sno+" "+str);
%>
		</div>
		<br>
		<table id='tab'  cellpadding='7'  >

		<form>
			<tr>
				<td>A</td>
				<td width=50px><input type='radio' name="opt"value='A' /></td>
				<td><%out.print(" "+op1);%></td>
			</tr>

			<tr>
				<td>B</td>
				<td><input type='radio' value='B' name="opt" /></td>
				<td><%out.print(" "+op2);%></td>
			</tr>
			
			<tr>
				<td>C</td>
				<td><input type='radio' name="opt" value='C' /></td>
				<td><%out.print(" "+op3);%></td>
			</tr>
			
			<tr>
				<td>D</td>
				<td><input type='radio' name="opt" value='D' checked/></td>
				<td><%out.print(" "+op4);%></td>
			</tr>
		</form>
		</table>
		
		<br><br><br><br><br><br><br><br>
		<div id="pos"><hr width="1100px"/></div>
		</div>
	</center>					    	
<%		    			    		    	
	}else
	{
%>			
	<center>
	<div id='border'>
		<div id='border1'>
<%
			out.print("Q"+sno+" "+str);
%>
		</div>
		<br>
		<table id='tab'  cellpadding='7'  >

		<form>
			<tr>
				<td>A</td>
				<td width=50px><input type='radio' name="opt"value='A' /></td>
				<td><%out.print(" "+op1);%></td>
			</tr>

			<tr>
				<td>B</td>
				<td><input type='radio' value='B' name="opt" /></td>
				<td><%out.print(" "+op2);%></td>
			</tr>
			
			<tr>
				<td>C</td>
				<td><input type='radio' name="opt" value='C' /></td>
				<td><%out.print(" "+op3);%></td>
			</tr>
			
			<tr>
				<td>D</td>
				<td><input type='radio' name="opt" value='D' /></td>
				<td><%out.print(" "+op4);%></td>
			</tr>
		</form>
		</table>
		
		<br><br><br><br><br><br><br><br>
		<div id="pos"><hr width="1100px"/></div>
		</div>
	</center>					    	
<%		    			    		    	
	}
%>

		

	<form action='questionlist.jsp' method='post'>
	<%
	out.print("<input type='hidden' name='index' value='"+sno+"'>");
	out.print("<input type='hidden' name='rno' value='"+rlno+"'>");	
	out.print("<input type='hidden' name='sname' value='"+studn+"'>");
	out.print("<input type='hidden' name='maxqs' value='"+lastqno+"'>");
	%>
	<p id="pos1">
		<input type='submit' name='submit' value='QUESTION LIST'>
	</p>
	</form>

	<form action='submit.jsp' method='post'>
	<%
	out.print("<input type='hidden' name='rno' value='"+rlno+"'>");	
	out.print("<input type='hidden' name='index' value='"+sno+"'>");
	out.print("<input type='hidden' name='maxqs' value='"+lastqno+"'>");
	out.print("<input type='hidden' name='sname' value='"+studn+"'>");
	%>
	<p id="pos2">
		<input type='submit' name='submit' value='SUBMIT TEST'>
	</p>
	</form>

	<form action='questions.jsp' method='post'>
	<%
	out.print("<input type='hidden' name='index' value='"+sno+"'>");
	out.print("<input type='hidden' name='rno' value='"+rlno+"'>");
	out.print("<input type='hidden' name='sname' value='"+studn+"'>");
	out.print("<input type='hidden' name='maxqs' value='"+lastqno+"'>");	
	%>
	<p id="pos3">
	<input type='submit' name='submit' value='First'>
	<input type='submit' name='submit' value='Prev'>
	<input type='submit' name='submit' value='Next'>
	<input type='submit' name='submit' value='Last'>
	</form>
	</p>
	</p>

	
</body>

</html>
