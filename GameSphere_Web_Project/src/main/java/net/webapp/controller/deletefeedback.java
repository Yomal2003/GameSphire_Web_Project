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


@WebServlet("/deletefeedback")
public class deletefeedback extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	feedback fb = new feedback();
	fb.setEmail(request.getParameter("email"));
	
	fedbackservice serv = new fedbackservice();
	serv.deleteFeed(fb);
	RequestDispatcher dispa = request.getRequestDispatcher("getAllFeedBacks");
	
	dispa.forward(request, response);
	
	
	}

}
