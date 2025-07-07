package net.webapp.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.webapp.dao.offerservices;
import net.webapp.model.offer;


@WebServlet("/singleOffer")
public class singleOffer extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		offer os = new offer();
		os.setName(request.getParameter("name"));
	    offerservices serv = new offerservices();
	    offer  of1 = serv.getSingleOfferByName(os);
	    RequestDispatcher dis = request.getRequestDispatcher("singleofferUi.jsp");
	    request.setAttribute("of2", of1);
		dis.forward(request, response);
	    
	}

}
