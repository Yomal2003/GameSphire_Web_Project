package net.webapp.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.webapp.dao.offerservices;
import net.webapp.model.offer;

@WebServlet("/offerUpdateServ")
public class offerUpdateServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("offerUpdate.jsp");
        dispatcher.forward(request, response); // Or some other page
	}
	
	
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		offer os  = new offer();
		os.setName(request.getParameter("name"));
		os.setCprice(Integer.parseInt(request.getParameter("cprice")));  
		os.setOprice(Integer.parseInt(request.getParameter("oprice")));  // Convert string to int
		os.setDate(Date.valueOf(request.getParameter("date")));  // Convert string to Date

		
		offerservices oserv = new offerservices();
		oserv.updateOffer(os);
		
 RequestDispatcher dispa  = request.getRequestDispatcher("singleOffer");
 dispa.forward(request, response);
 
	}

}
