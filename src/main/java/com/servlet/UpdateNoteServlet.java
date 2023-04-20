package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.*;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

public class UpdateNoteServlet extends jakarta.servlet.http.HttpServlet {
	private static final long serialVersionUID = 1L;

   
    public UpdateNoteServlet() {
        // TODO Auto-generated constructor stub
    }

	protected void doGet(jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response) throws jakarta.servlet.ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response) throws jakarta.servlet.ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
			
			int noteId = Integer.parseInt(request.getParameter("note_id").trim());
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			 
			Session s1 = FactoryProvider.getFactory().openSession();
			Transaction tx1 = s1.beginTransaction();
			Note note = (Note)s1.get(Note.class, noteId);
			note.setTitle(title);
			note.setContent(content);
			note.setAddedDate(new Date());
			s1.save(note);
			tx1.commit();
			s1.close();
			
			response.sendRedirect("all_notes.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		doGet(request, response);
	}

}
