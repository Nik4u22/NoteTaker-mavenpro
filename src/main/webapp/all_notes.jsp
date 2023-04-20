<%@page import="com.entities.Note"%>
<%@page import="java.util.List"%>
<%@page import="jakarta.persistence.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notes Details</title>
    <%@include file="all_js_css.jsp" %>
  </head>
  <body>
    <div class="container-fluid">
    	<%@include file = "navbar.jsp" %>
    	<br>
    	<h4>
    		Notes List
    	</h4>
    	<br>
    
	    <div class="row">
	    	<div class="col-12">
		  		<%
		    	Session s = FactoryProvider.getFactory().openSession();
		    	Query q = s.createQuery("from Note");
		    	List<Note> list = q.getResultList();
		    	
		    	for(Note note : list){
		    	%>
		    		<div class="card w-75">
		    		  <div class="card-body px-5">
		    		    <h5 class="card-title"><%= note.getTitle() %></h5>
		    		    <p class="card-text"><%= note.getContent() %></p>
		    		    <p class="card-text"><%= note.getAddedDate() %></p>
		    		    <a href="edit_note.jsp?note_id=<%=note.getId()%>" class="btn btn-primary">Edit</a>
		    		    <a href="DeleteNoteServlet?note_id=<%=note.getId()%>" class="btn btn-danger">Delete</a>
		    		  </div>
		    		</div>	    		
		  		<% 
		    	}
		    	s.close();
		    	%>  	
	    	</div>
	    
	    </div>
	        
   	</div>
    
</body>
</html>
