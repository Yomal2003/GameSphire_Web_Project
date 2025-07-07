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

@WebServlet("/feedUpdate")
public class feedUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		feedback fd = new feedback();
		fd.setEmail(request.getParameter("email"));
		fd.setGname(request.getParameter("gname"));
		fd.setName(request.getParameter("name"));
		fd.setMsg(request.getParameter("msg"));
	
		
		fedbackservice serv = new fedbackservice();
		serv.Updatefeed(fd);
		
		 RequestDispatcher dispa  = request.getRequestDispatcher("singleFeed");
		 dispa.forward(request, response);		
	
	}

}
