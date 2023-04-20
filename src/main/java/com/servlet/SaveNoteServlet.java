package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.*;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

public class SaveNoteServlet extends jakarta.servlet.http.HttpServlet {
	private static final long serialVersionUID = 1L;

   
    public SaveNoteServlet() {
        // TODO Auto-generated constructor stub
    }

	protected void doGet(jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response) throws jakarta.servlet.ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response) throws jakarta.servlet.ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
			
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			Note note = new Note(title, content, new Date()); 
			Session s1 = FactoryProvider.getFactory().openSession();
			Transaction tx1 = s1.beginTransaction();
			s1.save(note);
			tx1.commit();
			s1.close();
			
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.println("<h1 style='text-align:center;'>Note added successfully</h1>");
			out.println("<h1 style='text-align:center;'><a href='all_notes.jsp'>View all notes</a></h1>");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		doGet(request, response);
	}

}
