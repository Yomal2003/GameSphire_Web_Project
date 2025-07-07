// File: net/webapp/controller/User_Login_Servlet.java
package net.webapp.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.webapp.model.User_Login;
import net.webapp.dao.User_Login_Dao;

/**
 * Servlet implementation class User_Login_Servlet
 */
@WebServlet("/login") // Ensure this matches the action of your login form
public class User_Login_Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private User_Login_Dao loginDao; // DAO instance

    public User_Login_Servlet() {
        super();
    }

    @Override
    public void init() throws ServletException {
        super.init();
        loginDao = new User_Login_Dao(); // Initialize DAO
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward to the login page
        RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
        dispatcher.forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User_Login loginBean = new User_Login();
        loginBean.setUsername(username);
        loginBean.setPassword(password); // Storing plain text password in bean for DAO

        Integer userId = loginDao.validateAndGetId(loginBean); // Use the new DAO method

        if (userId != null) { // Check if userId is not null (meaning login was successful)
            HttpSession session = request.getSession(); // Get or create session
            session.setAttribute("userId", userId);     // Store the Integer userId
            session.setAttribute("username", username); // Optionally store username for display
            
            System.out.println("Login successful for user: " + username + ", ID: " + userId + ". Redirecting to UserDashboard.");
            // Redirect to the user's dashboard or ticket list
            // Assuming "UserDashboard" is another servlet or JSP that expects a logged-in user
            response.sendRedirect(request.getContextPath() + "/UserDashboard"); // Redirect to ticket list
        } else {
            System.out.println("Login failed for user: " + username);
            // Set an error message for the login page
            request.setAttribute("loginError", "Invalid username or password. Please try again.");
            // Forward back to the login page to display the error
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
        }
    }
}
