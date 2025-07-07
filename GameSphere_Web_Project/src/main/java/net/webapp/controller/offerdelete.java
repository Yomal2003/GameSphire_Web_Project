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


@WebServlet("/offerdelete")
public class offerdelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public offerdelete() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		offer op = new offer();
		op.setName(request.getParameter("name"));
		
		offerservices serv = new offerservices();
		serv.deleteoffer(op);
		RequestDispatcher dispa = request.getRequestDispatcher("offerTable");
		
		dispa.forward(request, response);
	}

}
