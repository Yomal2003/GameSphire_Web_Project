package net.webapp.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.webapp.dao.UserDBUtil; // Assuming UserDBUtil is correctly implemented and in this package

@WebServlet("/CustomerInsert")
public class CustomerInsert extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String fullname = request.getParameter("fullname");
        String username = request.getParameter("username");
        String nic = request.getParameter("nic");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        // Check if username already exists
        boolean usernameExists = false; // Default to false
        try {
            // It's good practice to handle potential exceptions from database calls
            usernameExists = UserDBUtil.isUsernameExists(username);
        } catch (Exception e) {
            // Log the exception or handle it appropriately
            e.printStackTrace(); // For demonstration; use a proper logger in production
            request.setAttribute("message", "An error occurred while checking username. Please try again.");
            RequestDispatcher dis = request.getRequestDispatcher("error.jsp"); // Or a generic error page
            dis.forward(request, response);
            return; // Important to return after forwarding
        }


        if (usernameExists) {
            request.setAttribute("message", "Username already exists. Please choose another one.");
            RequestDispatcher dis = request.getRequestDispatcher("Register.jsp"); // Or your register page
            dis.forward(request, response);
        } else {
            boolean isSuccess = false; // Default to false
            try {
                // It's good practice to handle potential exceptions from database calls
                isSuccess = UserDBUtil.insertCustomer(fullname, username, nic, address, email, phone);
            } catch (Exception e) {
                // Log the exception or handle it appropriately
                e.printStackTrace(); // For demonstration; use a proper logger in production
                request.setAttribute("message", "An error occurred during registration. Please try again.");
                RequestDispatcher dis = request.getRequestDispatcher("error.jsp"); // Or a generic error page
                dis.forward(request, response);
                return; // Important to return after forwarding
            }


            if (isSuccess) {
                request.setAttribute("message", "Registration Successful!");
                RequestDispatcher dis = request.getRequestDispatcher("ViewAll.jsp"); // Or a login page / success page
                dis.forward(request, response);
            } else {
                // This 'else' might be reached if UserDBUtil.insertCustomer returns false without throwing an exception
                request.setAttribute("message", "Registration Failed! Please check your details and try again.");
                RequestDispatcher dis = request.getRequestDispatcher("Register.jsp"); // Back to register page might be better than a generic error.jsp for a non-exception failure
                dis.forward(request, response);
            }
        }
    }

    /**
     * Handles HTTP GET requests.
     * In this case, it forwards the request to the registration page.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Typically, a GET request to /CustomerInsert might display the registration form.
        // If you want to show a message or pre-fill something, you can set attributes here.
        // request.setAttribute("someAttribute", "someValue");

        RequestDispatcher dis = request.getRequestDispatcher("Register.jsp");
        dis.forward(request, response);
    }

}