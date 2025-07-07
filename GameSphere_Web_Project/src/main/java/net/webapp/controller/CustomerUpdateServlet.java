package net.webapp.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import net.webapp.dao.UserDBUtil;

@WebServlet("/CustomerUpdateServlet")
public class CustomerUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String fullname = request.getParameter("fullname");
        String username = request.getParameter("username"); 
        String nic = request.getParameter("nic");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        
        
        String countryCode = request.getParameter("countryCode");
        String localPhoneNumber = request.getParameter("phoneNumber"); 

        String fullPhoneNumber = null; 

        
        if (countryCode != null && !countryCode.trim().isEmpty() && 
            localPhoneNumber != null && !localPhoneNumber.trim().isEmpty()) {
            
            fullPhoneNumber = countryCode.trim() + " " + localPhoneNumber.trim();
        } else if (localPhoneNumber != null && !localPhoneNumber.trim().isEmpty()) {
            
            fullPhoneNumber = localPhoneNumber.trim(); 
        }
        
        boolean isUpdated = UserDBUtil.updateCustomer(fullname, username, nic, address, email, fullPhoneNumber);

        if (isUpdated) {
            request.setAttribute("message", "Customer '" + fullname + "' updated successfully!");
            
            

          
            RequestDispatcher dis = request.getRequestDispatcher("ViewAll.jsp");
            dis.forward(request, response);
        } else {
            request.setAttribute("message", "Update failed for customer '" + fullname + "'. Please try again.");
           
            RequestDispatcher dis = request.getRequestDispatcher("error.jsp"); 
            dis.forward(request, response);
        }
    }
}