package net.webapp.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.webapp.dao.UserDBUtil;

@WebServlet("/delete")
public class CustomerDeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        boolean isDeleted = UserDBUtil.deleteCustomer(id);

        if (isDeleted) {
            request.setAttribute("message", "User Deleted Successfully!");
            RequestDispatcher dis = request.getRequestDispatcher("ViewAll.jsp");
            dis.forward(request, response);
        } else {
            request.setAttribute("message", "Deletion Failed!");
            RequestDispatcher dis = request.getRequestDispatcher("error.jsp");
            dis.forward(request, response);
        }
    }
}