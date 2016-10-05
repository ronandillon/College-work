<%@ page import="com.google.appengine.api.blobstore.BlobstoreServiceFactory" %>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreService" %>

<%
    BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
%>


<html>
    <head>
	<style> 
		#header { background-color:black; 
			color:white;  
			text-align:center; 
			padding:5px;}  
	</style>  
    </head> 
   <div id="header"> 
	<h1>Picture Box</h1> </div>
    <body>
        <center><form action="<%= blobstoreService.createUploadUrl("/upload") %>" method="post" enctype="multipart/form-data">
            <input type="text" name="foo">
            <input type="file" name="myFile">
            <input type="submit" value="Submit">
        </form></center>
    </body>
</html>