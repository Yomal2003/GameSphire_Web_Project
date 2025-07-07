package net.webapp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Logout")
public class User_Logout_Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public User_Logout_Servlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        // Invalidate the current session (logs user out)
        HttpSession session = request.getSession(false); // avoid creating new session
        if (session != null) {
            session.invalidate();
            
        
        }

        // Redirect to login page
        response.sendRedirect("login");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        doGet(request, response);
    }
}