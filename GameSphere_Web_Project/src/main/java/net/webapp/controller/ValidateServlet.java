package net.webapp.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import net.webapp.dao.UserDBUtil;
import net.webapp.model.Customer;

import java.io.IOException;
import java.util.List;

@WebServlet("/validateUser")
public class ValidateServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // This method would typically be used if you had a form POSTing to /validateUser,
        // for example, a search form.
        // For now, let's make it behave the same as doGet or call a common method.
        handleRequest(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // This method will be called after the redirect from Admin_Login_Servlet
        handleRequest(request, response);
    }

    private void handleRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Assuming UserDBUtil.validate() is meant to fetch the relevant list of customers
        // based on some criteria (or all if none specified, which seems to be the case here).
        // If UserDBUtil.validate() requires specific parameters from the request
        // (e.g., for a search), you'd need to adjust how it's called or
        // perhaps use a different method from UserDBUtil for "show all after login".
        List<Customer> customers = UserDBUtil.validate();

        // The logic for what "validate" means here is a bit unclear without seeing UserDBUtil.validate().
        // If it's supposed to validate a *specific* user based on parameters (which aren't being passed from admin login),
        // then it might always return null/empty here.
        // If UserDBUtil.validate() without params means "get all users for admin view", then this is fine.

        if (customers == null || customers.isEmpty()) {
            // If UserDBUtil.validate() was supposed to find a specific user and didn't,
            // this message makes sense.
            // If it's just "no customers in the system", the message might be different.
            // The original code set "allCustomers", so we'll stick to that attribute name
            // for consistency with the JSP, though the list is empty/null.
            request.setAttribute("allCustomers", customers); // customers will be null or an empty list
            request.setAttribute("errorMessage", "No customers found or no matching user found. Displaying available data.");
        } else {
            // Match found, or all customers successfully retrieved.
            // Using "customers" as the attribute name when data is present.
            request.setAttribute("customers", customers);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("ViewAll.jsp");
        dispatcher.forward(request, response);
    }
}