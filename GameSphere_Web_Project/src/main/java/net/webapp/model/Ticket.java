package net.webapp.model;

import java.sql.Timestamp;
import java.util.Date; // Can be used if you prefer java.util.Date


public class Ticket {
    private int ticketId;
    private int creatorUserId;
    private String title;
    private String description;
    private String status;
    private String priority;
    private Timestamp createdAt; 
    private Timestamp updatedAt;

    
    public Ticket() {
    }

    
    public Ticket(int creatorUserId, String title, String description, String status, String priority) {
        this.creatorUserId = creatorUserId;
        this.title = title;
        this.description = description;
        this.status = status;
        this.priority = priority;
    }


    
    public int getTicketId() {
        return ticketId;
    }

    public void setTicketId(int ticketId) {
        this.ticketId = ticketId;
    }

    public int getCreatorUserId() {
        return creatorUserId;
    }

    public void setCreatorUserId(int creatorUserId) {
        this.creatorUserId = creatorUserId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPriority() {
        return priority;
    }

    public void setPriority(String priority) {
        this.priority = priority;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public Timestamp getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Timestamp updatedAt) {
        this.updatedAt = updatedAt;
    }

    @Override
    public String toString() {
        return "Ticket{" +
               "ticketId=" + ticketId +
               ", creatorUserId=" + creatorUserId +
               ", title='" + title + '\'' +
               ", description='" + description + '\'' +
               ", status='" + status + '\'' +
               ", priority='" + priority + '\'' +
               ", createdAt=" + createdAt +
               ", updatedAt=" + updatedAt +
               '}';
    }
}