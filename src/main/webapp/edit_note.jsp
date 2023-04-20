<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.helper.*, org.hibernate.*, com.entities.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Note</title>
    <%@include file="all_js_css.jsp" %>
  </head>
  <body>
    <div class="container-fluid">
    	<%@include file = "navbar.jsp" %>
    	<br>
    	<h4>
    		Edit your note details
    	</h4>
    	<br>
    	<%
    	int noteId = Integer.parseInt(request.getParameter("note_id").trim());
    	Session s = FactoryProvider.getFactory().openSession();
    	Note note = (Note)s.get(Note.class, noteId);
    	%>
		<form action="UpdateNoteServlet" method="post">
			<input value="<%= note.getId()%>" name="note_id" type="hidden"/>			
		
			<div class="form-group">
			  <label for="title">Title</label>
			  <input 
			  required type="text" 
			  class="form-control" 
			  id="title" 
			  aria-describedby="emailHelp" 
			  placeholder="Enter title"
			  name="title"
			  value="<%=note.getTitle()%>"/>
			</div>
			<div class="form-group">
			  <label for="content">Content</label>
			  <textarea 
			  required class="form-control" 
			  id="content" 
			  rows="5"
			  name="content">
			  <%=note.getContent()%>
			  </textarea>
			</div>
			<button type="submit" class="btn btn-primary">Update</button>
		</form>
    
   	</div>
    
</body>
</html>
