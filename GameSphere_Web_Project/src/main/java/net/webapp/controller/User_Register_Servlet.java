package net.webapp.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.webapp.dao.User_Register_Dao;
import net.webapp.model.User_Register;

@WebServlet("/Register")
public class User_Register_Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private User_Register_Dao rDao; // DAO instance

    public User_Register_Servlet() {
        super();
    }

    @Override
    public void init() throws ServletException {
        super.init();
        rDao = new User_Register_Dao(); // Initialize DAO
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        // If user is already logged in (assuming "userId" or a similar attribute is set in session upon login)
        // Redirect them to dashboard instead of showing registration form.
        // Adjust "userId" to whatever attribute you set upon successful login.
        if (session != null && session.getAttribute("userId") != null) {
            response.sendRedirect(request.getContextPath() + "/UserDashboard"); // Or your dashboard servlet
        } else {
            // User is not logged in, show the registration page
            RequestDispatcher dispatcher = request.getRequestDispatcher("memberRegistration.jsp");
            dispatcher.forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uname = request.getParameter("uname");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        // Basic Server-side Validation (enhance as needed)
        if (uname == null || uname.trim().isEmpty() ||
            password == null || password.trim().isEmpty() || // Consider password strength rules
            email == null || email.trim().isEmpty() || // Consider email format validation
            phone == null || phone.trim().isEmpty()) {

            request.setAttribute("errorMessage", "All fields are required. Please fill them all out.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("memberRegistration.jsp");
            dispatcher.forward(request, response);
            return;
        }
        
        // Further validation (e.g., email format) can be added here
        if (!email.matches("^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$")) {
            request.setAttribute("errorMessage", "Invalid email format.");
            request.setAttribute("uname", uname); // Keep user input
            request.setAttribute("phone", phone); // Keep user input
            RequestDispatcher dispatcher = request.getRequestDispatcher("memberRegistration.jsp");
            dispatcher.forward(request, response);
            return;
        }


        User_Register member = new User_Register(uname, password, email, phone);
        // User_Register_Dao rDao = new User_Register_Dao(); // DAO is now initialized in init()
        String result = rDao.insert(member); // Assume insert method returns a descriptive string

        // Check the result from the DAO to set appropriate messages
        // Modify these conditions based on the actual strings your DAO returns
        if (result != null && (result.toLowerCase().contains("success") || result.toLowerCase().contains("inserted"))) {
            request.setAttribute("successMessage", result + " You can now sign in.");
             // Optionally redirect to login page after successful registration
            // response.sendRedirect(request.getContextPath() + "/login.jsp?registration=success");
            // return;
        } else {
            request.setAttribute("errorMessage", result); // This will show messages like "Username already exists"
            // Preserve user input to refill the form upon error
            request.setAttribute("uname", uname);
            request.setAttribute("email", email);
            request.setAttribute("phone", phone);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("memberRegistration.jsp");
        dispatcher.forward(request, response);
    }
}