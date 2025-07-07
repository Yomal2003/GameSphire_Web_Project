package net.webapp.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class User_Dashboard_Servlet
 * This servlet handles requests for the user dashboard page.
 * It ensures that only authenticated users can access the dashboard.
 */
@WebServlet("/UserDashboard") // Mapped to /UserDashboard URL
public class User_Dashboard_Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public User_Dashboard_Servlet() {
        super();
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false); // false = do not create a new session if one doesn't exist

        // Check if a session exists and if the "userId" attribute is set
        if (session != null && session.getAttribute("userId") != null) {
            // User is logged in, retrieve username for display (optional)
            String username = (String) session.getAttribute("username");
            if (username != null) {
                request.setAttribute("dashboardUsername", username); // Pass username to JSP
            }
            // Forward to the user dashboard page
            RequestDispatcher dispatcher = request.getRequestDispatcher("user_dashboard.jsp");
            dispatcher.forward(request, response);
        } else {
            // User is not logged in or session has expired
            // Redirect to the login page
            System.out.println("User_Dashboard_Servlet: No active session or userId. Redirecting to login.");
            response.sendRedirect(request.getContextPath() + "/login"); // Redirect to the login servlet
        }
    }

    /**
     * Handles POST requests to the /UserDashboard URL.
     * Typically, a dashboard might not handle POST directly unless it has forms.
     * For simplicity, this example forwards POST requests to the doGet method.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Delegate POST requests to doGet as dashboards are usually display-oriented
        doGet(request, response);
    }
}