package net.webapp.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import net.webapp.model.Ticket; // Import the Ticket model

public class TicketDao {

    
    private String dbUrl = "jdbc:mysql://localhost:3306/gamesphere_db";
    private String dbUname = "root";
    private String dbPassword = "root";
    private String dbDriver = "com.mysql.cj.jdbc.Driver";

    /**
     * Loads the JDBC driver.
     */
    private void loadDriver() {
        try {
            Class.forName(dbDriver);
        } catch (ClassNotFoundException e) {
            System.err.println("JDBC Driver not found: " + dbDriver);
            e.printStackTrace(); 
        }
    }

    
    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(dbUrl, dbUname, dbPassword);
    }

   
    public boolean addTicket(Ticket ticket) {
        loadDriver();
        
        String sql = "INSERT INTO tickets (creator_user_id, title, description, status, priority) VALUES (?, ?, ?, ?, ?)";
        int rowsAffected = 0;

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, ticket.getCreatorUserId());
            ps.setString(2, ticket.getTitle());
            ps.setString(3, ticket.getDescription());
            ps.setString(4, ticket.getStatus() != null ? ticket.getStatus() : "Open"); // Default if not set
            ps.setString(5, ticket.getPriority() != null ? ticket.getPriority() : "Medium"); // Default if not set

            rowsAffected = ps.executeUpdate();

        } catch (SQLException e) {
            System.err.println("SQLException in addTicket: " + e.getMessage());
            e.printStackTrace(); 
        }
        return rowsAffected > 0;
    }

    
    public List<Ticket> getTicketsByCreatorId(int creatorUserId) {
        loadDriver();
        List<Ticket> ticketList = new ArrayList<>();
        String sql = "SELECT ticket_id, creator_user_id, title, description, status, priority, created_at, updated_at FROM tickets WHERE creator_user_id = ? ORDER BY created_at DESC";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, creatorUserId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Ticket ticket = new Ticket();
                    ticket.setTicketId(rs.getInt("ticket_id"));
                    ticket.setCreatorUserId(rs.getInt("creator_user_id"));
                    ticket.setTitle(rs.getString("title"));
                    ticket.setDescription(rs.getString("description"));
                    ticket.setStatus(rs.getString("status"));
                    ticket.setPriority(rs.getString("priority"));
                    ticket.setCreatedAt(rs.getTimestamp("created_at"));
                    ticket.setUpdatedAt(rs.getTimestamp("updated_at"));
                    ticketList.add(ticket);
                }
            }
        } catch (SQLException e) {
            System.err.println("SQLException in getTicketsByCreatorId: " + e.getMessage());
            e.printStackTrace(); 
        }
        return ticketList;
    }

    
    public Ticket getTicketById(int ticketId) {
        loadDriver();
        Ticket ticket = null;
        String sql = "SELECT ticket_id, creator_user_id, title, description, status, priority, created_at, updated_at FROM tickets WHERE ticket_id = ?";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, ticketId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    ticket = new Ticket();
                    ticket.setTicketId(rs.getInt("ticket_id"));
                    ticket.setCreatorUserId(rs.getInt("creator_user_id"));
                    ticket.setTitle(rs.getString("title"));
                    ticket.setDescription(rs.getString("description"));
                    ticket.setStatus(rs.getString("status"));
                    ticket.setPriority(rs.getString("priority"));
                    ticket.setCreatedAt(rs.getTimestamp("created_at"));
                    ticket.setUpdatedAt(rs.getTimestamp("updated_at"));
                }
            }
        } catch (SQLException e) {
            System.err.println("SQLException in getTicketById: " + e.getMessage());
            e.printStackTrace(); 
        }
        return ticket;
    }

    
    public boolean updateTicket(Ticket ticket) {
        loadDriver();
        String sql = "UPDATE tickets SET title = ?, description = ?, status = ?, priority = ? WHERE ticket_id = ? AND creator_user_id = ?";
        int rowsAffected = 0;

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, ticket.getTitle());
            ps.setString(2, ticket.getDescription());
            ps.setString(3, ticket.getStatus());
            ps.setString(4, ticket.getPriority());
            ps.setInt(5, ticket.getTicketId());
            ps.setInt(6, ticket.getCreatorUserId()); 
            rowsAffected = ps.executeUpdate();

        } catch (SQLException e) {
            System.err.println("SQLException in updateTicket: " + e.getMessage());
            e.printStackTrace(); 
        }
        return rowsAffected > 0;
    }
    
    
    public boolean updateTicketStatus(int ticketId, String newStatus) {
        loadDriver();
        String sql = "UPDATE tickets SET status = ? WHERE ticket_id = ?";
        int rowsAffected = 0;

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, newStatus);
            ps.setInt(2, ticketId);
            rowsAffected = ps.executeUpdate();

        } catch (SQLException e) {
            System.err.println("SQLException in updateTicketStatus: " + e.getMessage());
            e.printStackTrace(); 
        }
        return rowsAffected > 0;
    }


    
    public boolean deleteTicket(int ticketId, int creatorUserId) {
        loadDriver();
        String sql = "DELETE FROM tickets WHERE ticket_id = ? AND creator_user_id = ?";
        int rowsAffected = 0;

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, ticketId);
            ps.setInt(2, creatorUserId); 

            rowsAffected = ps.executeUpdate();

        } catch (SQLException e) {
            System.err.println("SQLException in deleteTicket: " + e.getMessage());
            e.printStackTrace(); 
        }
        return rowsAffected > 0;
    }
    
    
    public static void main(String[] args) {
        TicketDao ticketDao = new TicketDao();

        
        Ticket newTicket = new Ticket();
        newTicket.setCreatorUserId(1);
        newTicket.setTitle("Test Ticket from DAO Main");
        newTicket.setDescription("This is a test description for the ticket.");
        newTicket.setStatus("Open");
        newTicket.setPriority("High");

        if (ticketDao.addTicket(newTicket)) {
            System.out.println("New ticket added successfully.");
        } else {
            System.out.println("Failed to add new ticket.");
        }

        
        System.out.println("\nTickets for user 1:");
        List<Ticket> userTickets = ticketDao.getTicketsByCreatorId(1);
        if (userTickets.isEmpty()) {
            System.out.println("No tickets found for user 1.");
        } else {
            for (Ticket t : userTickets) {
                System.out.println(t);
                
                if (userTickets.indexOf(t) == 0) { 
                    System.out.println("Attempting to update ticket ID: " + t.getTicketId());
                    t.setStatus("In Progress");
                    t.setDescription(t.getDescription() + "\n[Update]: Test update from DAO main.");
                    if(ticketDao.updateTicket(t)){ 
                        System.out.println("Ticket ID " + t.getTicketId() + " updated.");
                        
                        Ticket updatedT = ticketDao.getTicketById(t.getTicketId());
                        System.out.println("Updated ticket details: " + updatedT);
                    } else {
                        System.out.println("Failed to update ticket ID " + t.getTicketId() + " or permission denied.");
                    }
                }
            }
        }
        
        
        if (!userTickets.isEmpty()) {
            int firstTicketId = userTickets.get(0).getTicketId();
            System.out.println("\nFetching ticket with ID: " + firstTicketId);
            Ticket specificTicket = ticketDao.getTicketById(firstTicketId);
            if (specificTicket != null) {
                System.out.println(specificTicket);

               
            } else {
                System.out.println("Ticket with ID " + firstTicketId + " not found.");
            }
        } else {
             System.out.println("Skipping get/delete specific ticket test as no tickets were found for user 1.");
        }
    }
}