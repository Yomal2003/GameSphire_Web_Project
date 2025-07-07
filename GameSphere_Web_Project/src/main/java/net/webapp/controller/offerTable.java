package net.webapp.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.webapp.dao.offerservices;
import net.webapp.model.offer;


@WebServlet("/offerTable")
public class offerTable extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public offerTable() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
    	
    	offerservices serv = new offerservices();
        ArrayList<offer> op = serv.getAllOffers();
        request.setAttribute("list1", op);
		RequestDispatcher dispatcher = request.getRequestDispatcher("alloffers.jsp");
        dispatcher.forward(request, response); // Or some other page
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
               
        offerservices serv = new offerservices();
        ArrayList<offer> op = serv.getAllOffers();
        request.setAttribute("list1", op);
	     
        RequestDispatcher dispa = request.getRequestDispatcher("alloffers.jsp");
        dispa.forward(request, response);
	}

}
