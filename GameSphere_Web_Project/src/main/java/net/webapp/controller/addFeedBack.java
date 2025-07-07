package net.webapp.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.webapp.dao.fedbackservice;
import net.webapp.model.feedback;

/**
 * Servlet implementation class addFeedBack
 */
@WebServlet("/addFeedBack")
public class addFeedBack extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String gname = request.getParameter("gname"); // This corresponds to "Subject" in the form
		String msg = request.getParameter("msg");     // This corresponds to "Message" in the form

		// Set model data
		feedback fb = new feedback();
		fb.setName(name);
		fb.setEmail(email);
		fb.setGname(gname);
		fb.setMsg(msg);
		
		fedbackservice serv = new fedbackservice();
		serv.addMsg(fb);

		
		response.sendRedirect("addFeedBack");
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        
            // Forward to the user dashboard page
            RequestDispatcher dispatcher = request.getRequestDispatcher("feedbackui.jsp");
            dispatcher.forward(request, response);
        
    }

}
