<%
try
{
if(session.getAttribute("teacher")==null)
{%>
<jsp:forward page="teacher.html"/>
<%
}
}
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
	  
.tab {background-color:#C0DAF3; 
	  color:red;}

		a:link{color:black; text-decoration:none;}
		
		a:hover{background-color:#0C0959;
				text-decoration:underline;
				color:white;
				font-weight:bold;}
		
#x{width:200px;}

#s2 {width:50px}
a span {color: white;}
.col {width : 350px;}

</style>

<body>

<%

out.println(session.getAttribute("teacher"));

%>

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









<%@ page import ="com.mongodb.*" %>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>

<%

String newcollection=request.getParameter("colname");
int Qno=Integer.parseInt(request.getParameter("Qno"));


	String filename=newcollection+Qno+".jpeg";

MongoClient mongoClient=new MongoClient( "localhost" , 27017 );
DB db = mongoClient.getDB( "DB1" );

DBCollection coll2=db.getCollection(newcollection);
BasicDBObject findq2=new BasicDBObject("Q_no",Qno);
DBCursor cursor2=coll2.find(findq2);
if(cursor2.hasNext())
{
	BasicDBObject doc12=new BasicDBObject("Q_no",Qno);
	BasicDBObject newdoc12=new BasicDBObject();
	newdoc12.append("$set",new BasicDBObject("Qimage",filename));
	coll2.update(doc12,newdoc12);
}

out.println("File uploaded successfully !");
out.println("Go back to previous tab");

   File file ;
   int maxFileSize = 5000 * 1024;
   int maxMemSize = 5000 * 1024;
   ServletContext context = pageContext.getServletContext();
   String filePath ="/home/shruti/PL1/tomcat_install/apache-tomcat-7.0.54/webapps/ROOT/onlineexam/teacher/data/";
  // Verify the content type
   String contentType = request.getContentType();
   if ((contentType.indexOf("multipart/form-data") >= 0)) {

      DiskFileItemFactory factory = new DiskFileItemFactory();
      // maximum size that will be stored in memory
      factory.setSizeThreshold(maxMemSize);
      // Location to save data that is larger than maxMemSize.
      factory.setRepository(new File("1234.txt"));

      // Create a new file upload handler
      ServletFileUpload upload = new ServletFileUpload(factory);
      // maximum file size to be uploaded.
      upload.setSizeMax( maxFileSize );
      try{ 
         // Parse the request to get file items.
         List fileItems = upload.parseRequest(request);

         // Process the uploaded file items
         Iterator i = fileItems.iterator();

      
         while ( i.hasNext () ) 
         {
            FileItem fi = (FileItem)i.next();
            if ( !fi.isFormField () )	
            {
            // Get the uploaded file parameters
            String fieldName = fi.getFieldName();
            String fileName = fi.getName();

if(fileName.equals(""))
out.println("No file Selected");

            boolean isInMemory = fi.isInMemory();
            long sizeInBytes = fi.getSize();
            // Write the file
            if( fileName.lastIndexOf("\\") >= 0 ){
            file = new File( filePath + 
            fileName.substring( fileName.lastIndexOf("\\"))) ;
            }else{
            file = new File( filePath + filename) ;
            }
            fi.write( file ) ;
            }
         }
	
      }catch(Exception ex) {
        //out.println(ex);
      }
   }
%>

</body>
</html>
