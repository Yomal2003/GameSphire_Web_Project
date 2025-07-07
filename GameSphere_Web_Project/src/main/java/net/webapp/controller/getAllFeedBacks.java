package net.webapp.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.webapp.dao.fedbackservice;
import net.webapp.model.feedback;


@WebServlet("/getAllFeedBacks")
public class getAllFeedBacks extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
		fedbackservice serv = new fedbackservice();
		ArrayList<feedback> fb = serv.getAllFeedBacks();
		request.setAttribute("list1", fb);
	
		RequestDispatcher dispa  = request.getRequestDispatcher("allfeedback.jsp");
 
		 dispa.forward(request, response);
	}

}
