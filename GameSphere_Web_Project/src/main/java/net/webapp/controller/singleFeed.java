package net.webapp.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.webapp.dao.fedbackservice;
import net.webapp.model.feedback;

@WebServlet("/singleFeed")
public class singleFeed extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
		
		feedback fd = new feedback();
		fd.setEmail(request.getParameter("email"));
		fedbackservice serv = new fedbackservice();
		feedback fd1 = serv.getSingle(fd);
		RequestDispatcher dis = request.getRequestDispatcher("single.jsp");
	    request.setAttribute("fd2", fd1);
		dis.forward(request, response);
		
		
		
		
		
	}

}
