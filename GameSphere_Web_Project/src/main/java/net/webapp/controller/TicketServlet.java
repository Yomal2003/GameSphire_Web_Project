package net.webapp.controller; 

import java.io.IOException;
import java.util.List;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.webapp.dao.TicketDao;
import net.webapp.model.Ticket;


@WebServlet("/tickets") 
public class TicketServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private TicketDao ticketDao;

    @Override
    public void init() {
        ticketDao = new TicketDao(); 
    }

    
    private Integer getLoggedInUserId(HttpServletRequest request) {
        HttpSession session = request.getSession(false); 
        if (session != null) {
            Object userIdObj = session.getAttribute("userId");
            if (userIdObj instanceof Integer) {
                return (Integer) userIdObj;
            } else if (userIdObj != null) {
                
                System.err.println("Warning: Session attribute 'userId' is not an Integer. Actual type: " + userIdObj.getClass().getName());
            }
        }
        return null; 
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list"; 
        }

        Integer loggedInUserId = getLoggedInUserId(request);

      
        if (loggedInUserId == null) {
            System.out.println("User not logged in for action: " + action + ". Redirecting to login page.");
            response.sendRedirect(request.getContextPath() + "/login"); 
            return;
        }

        try {
            switch (action) {
                case "new":
                    showNewTicketForm(request, response, loggedInUserId);
                    break;
                case "delete":
                    deleteTicket(request, response, loggedInUserId);
                    break;
                case "edit":
                    showEditTicketForm(request, response, loggedInUserId);
                    break;
                case "list":
                default:
                    listUserTickets(request, response, loggedInUserId);
                    break;
            }
        } catch (Exception e) {
            System.err.println("Error in TicketServlet doGet: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("errorMessage", "An unexpected error occurred: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("/error.jsp"); 
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        Integer loggedInUserId = getLoggedInUserId(request);

        if (loggedInUserId == null) {
            System.out.println("User not logged in for POST action: " + action + ". Redirecting to login page.");
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }
        
        if (action == null) {
           
            listUserTickets(request, response, loggedInUserId);
            return;
        }

        try {
            switch (action) {
                case "create":
                    createTicket(request, response, loggedInUserId);
                    break;
                case "update":
                    updateTicket(request, response, loggedInUserId);
                    break;
                default:
                    listUserTickets(request, response, loggedInUserId);
                    break;
            }
        } catch (Exception e) {
            System.err.println("Error in TicketServlet doPost: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("errorMessage", "An unexpected error occurred during POST: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("/error.jsp");
            dispatcher.forward(request, response);
        }
    }

    private void listUserTickets(HttpServletRequest request, HttpServletResponse response, Integer loggedInUserId)
            throws ServletException, IOException {
        
        List<Ticket> userTickets = ticketDao.getTicketsByCreatorId(loggedInUserId);
        request.setAttribute("userTickets", userTickets);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("/ticketDashboard.jsp"); 
        dispatcher.forward(request, response);
    }

    private void showNewTicketForm(HttpServletRequest request, HttpServletResponse response, Integer loggedInUserId)
            throws ServletException, IOException {
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("/newTicketForm.jsp");
        dispatcher.forward(request, response);
    }

    private void createTicket(HttpServletRequest request, HttpServletResponse response, Integer creatorUserId)
            throws ServletException, IOException {
        

        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String priority = request.getParameter("priority");

        if (title == null || title.trim().isEmpty() || description == null || description.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Title and Description are required.");
            request.setAttribute("ticketTitle", title); 
            request.setAttribute("ticketDescription", description);
            request.setAttribute("ticketPriority", priority);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/newTicketForm.jsp");
            dispatcher.forward(request, response);
            return;
        }
        
        Ticket newTicket = new Ticket();
        newTicket.setCreatorUserId(creatorUserId);
        newTicket.setTitle(title);
        newTicket.setDescription(description);
        newTicket.setPriority(priority != null ? priority : "Medium"); 
        newTicket.setStatus("Open"); 

        if (ticketDao.addTicket(newTicket)) {
            request.getSession().setAttribute("successMessage", "Ticket created successfully!");
            response.sendRedirect(request.getContextPath() + "/tickets?action=list");
        } else {
            request.setAttribute("errorMessage", "Failed to create ticket. Please try again.");
            request.setAttribute("ticketTitle", title);
            request.setAttribute("ticketDescription", description);
            request.setAttribute("ticketPriority", priority);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/newTicketForm.jsp");
            dispatcher.forward(request, response);
        }
    }
    
    private void showEditTicketForm(HttpServletRequest request, HttpServletResponse response, Integer loggedInUserId)
            throws ServletException, IOException {
        
        
        try {
            int ticketId = Integer.parseInt(request.getParameter("ticketId"));
            Ticket existingTicket = ticketDao.getTicketById(ticketId);

            if (existingTicket != null && existingTicket.getCreatorUserId() == loggedInUserId.intValue()) {
                request.setAttribute("ticket", existingTicket);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/editTicketForm.jsp");
                dispatcher.forward(request, response);
            } else {
                request.setAttribute("errorMessage", "Ticket not found or you do not have permission to edit it.");
                listUserTickets(request, response, loggedInUserId);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid Ticket ID format.");
            listUserTickets(request, response, loggedInUserId);
        }
    }

    private void updateTicket(HttpServletRequest request, HttpServletResponse response, Integer loggedInUserId)
            throws ServletException, IOException {
       

        try {
            int ticketId = Integer.parseInt(request.getParameter("ticketId"));
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            String priority = request.getParameter("priority");
            String status = request.getParameter("status");

            if (title == null || title.trim().isEmpty() || description == null || description.trim().isEmpty() || status == null || status.trim().isEmpty()) {
                request.setAttribute("errorMessage", "Title, Description, and Status are required.");
                
                Ticket ticketToEdit = ticketDao.getTicketById(ticketId); 
                 if (ticketToEdit != null && ticketToEdit.getCreatorUserId() == loggedInUserId.intValue()) {
                    request.setAttribute("ticket", ticketToEdit); 
                    
                    request.setAttribute("ticketTitle", title); 
                    request.setAttribute("ticketDescription", description);
                    request.setAttribute("ticketPriority", priority);
                    request.setAttribute("ticketStatus", status);
                }
                RequestDispatcher dispatcher = request.getRequestDispatcher("/editTicketForm.jsp");
                dispatcher.forward(request, response);
                return;
            }

            
            Ticket existingTicket = ticketDao.getTicketById(ticketId);
            if (existingTicket == null || existingTicket.getCreatorUserId() != loggedInUserId.intValue()) {
                request.setAttribute("errorMessage", "Failed to update ticket: Permission denied or ticket not found.");
                listUserTickets(request, response, loggedInUserId);
                return;
            }

            Ticket ticketToUpdate = new Ticket(); 
            ticketToUpdate.setTicketId(ticketId);
            ticketToUpdate.setCreatorUserId(loggedInUserId); 
            ticketToUpdate.setTitle(title);
            ticketToUpdate.setDescription(description);
            ticketToUpdate.setPriority(priority != null ? priority : "Medium");
            ticketToUpdate.setStatus(status);

            if (ticketDao.updateTicket(ticketToUpdate)) {
                request.getSession().setAttribute("successMessage", "Ticket updated successfully!");
                response.sendRedirect(request.getContextPath() + "/tickets?action=list");
            } else {
                request.setAttribute("errorMessage", "Failed to update ticket. Please check the details.");
                
                request.setAttribute("ticket", ticketToUpdate); 
                RequestDispatcher dispatcher = request.getRequestDispatcher("/editTicketForm.jsp");
                dispatcher.forward(request, response);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid Ticket ID format for update.");
            listUserTickets(request, response, loggedInUserId);
        }
    }


    private void deleteTicket(HttpServletRequest request, HttpServletResponse response, Integer loggedInUserId)
            throws ServletException, IOException {
        

        try {
            int ticketId = Integer.parseInt(request.getParameter("ticketId"));
            if (ticketDao.deleteTicket(ticketId, loggedInUserId)) { 
                request.getSession().setAttribute("successMessage", "Ticket deleted successfully!");
            } else {
                request.getSession().setAttribute("errorMessage", "Failed to delete ticket or permission denied.");
            }
        } catch (NumberFormatException e) {
            request.getSession().setAttribute("errorMessage", "Invalid Ticket ID for deletion.");
            System.err.println("Invalid Ticket ID for deletion: " + request.getParameter("ticketId"));
            e.printStackTrace();
        }
        response.sendRedirect(request.getContextPath() + "/tickets?action=list");
    }
}
