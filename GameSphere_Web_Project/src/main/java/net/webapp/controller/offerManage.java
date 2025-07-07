package net.webapp.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.webapp.dao.offerservices;
import net.webapp.model.offer;

@WebServlet("/offerManage")
public class offerManage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("offerui.jsp");
        dispatcher.forward(request, response);
        
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("gname");
        int cprice = Integer.parseInt(request.getParameter("gcp"));
        int oprice = Integer.parseInt(request.getParameter("gop"));
        String dateStr = request.getParameter("odate");
        Date sqlDate = Date.valueOf(dateStr); // ✅ Convert String to java.sql.Date
      

		// Set model data
		offer offerObj = new offer();
		offerObj.setName(name);
		offerObj.setCprice(cprice);
		offerObj.setOprice(oprice);
		offerObj.setDate(sqlDate);

		offerservices service = new offerservices();
		service.addOffer(offerObj);

		// Redirect to offers page (or confirmation)
		response.sendRedirect("offerui.jsp");

	}

}
