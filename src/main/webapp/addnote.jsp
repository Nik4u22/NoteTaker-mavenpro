<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Note</title>
    <%@include file="all_js_css.jsp" %>
  </head>
  <body>
    <div class="container-fluid">
    	<%@include file = "navbar.jsp" %>
    	<br>
    	<h4>
    		Please fill your note details
    	</h4>
    	<br>
    	<form action="SaveNoteServlet" method="post">
		  <div class="form-group">
		    <label for="title">Title</label>
		    <input 
		    required type="text" 
		    class="form-control" 
		    id="title" 
		    aria-describedby="emailHelp" 
		    placeholder="Enter title"
		    name="title"/>
		  </div>
		  <div class="form-group">
		    <label for="content">Content</label>
		    <textarea 
		    required class="form-control" 
		    id="content" 
		    rows="5"
		    name="content">
		    </textarea>
		  </div>
		  <button type="submit" class="btn btn-primary">Submit</button>
		</form>
    
   	</div>
    
</body>
</html>
