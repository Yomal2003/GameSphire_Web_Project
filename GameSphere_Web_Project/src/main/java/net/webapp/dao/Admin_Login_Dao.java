package net.webapp.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import net.webapp.model.Admin_Login; // Assuming this has getUsername() and getPassword()
                                    // and potentially setId() and getId() if you want to return the full bean

public class Admin_Login_Dao {

    // Database connection details - ensure 'user' table exists in 'gamesphere_db'
    // and has columns 'id' (INT, PK, AI), 'uname' (VARCHAR), 'password' (VARCHAR)
    private String dbUrl = "jdbc:mysql://localhost:3306/gamesphere_db";
    private String dbUname = "root";
    private String dbPassword = "root"; // Consider externalizing credentials
    private String dbDriver = "com.mysql.cj.jdbc.Driver";

    /**
     * Loads the JDBC driver.
     */
    private void loadDriver() { // Made private as it's an internal utility
        try {
            Class.forName(dbDriver);
        } catch (ClassNotFoundException e) {
            System.err.println("JDBC Driver not found: " + dbDriver);
            e.printStackTrace(); // Consider a more robust error handling mechanism
        }
    }

    /**
     * Establishes a connection to the database.
     * @return A Connection object.
     * @throws SQLException if a database access error occurs.
     */
    private Connection getConnection() throws SQLException { // Made private
        return DriverManager.getConnection(dbUrl, dbUname, dbPassword);
    }

    
    public Integer validateAndGetId(Admin_Login loginBean) {
        loadDriver();
        Integer userId = null; // Use Integer to allow for null return

        
        String sql = "SELECT id FROM admin WHERE uname = ? AND password = ?";
        // ^^^^ WARNING: Comparing plain text password! ^^^^

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, loginBean.getUsername());
            ps.setString(2, loginBean.getPassword()); // Plain text password from bean

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    userId = rs.getInt("id"); // Retrieve the user's ID
                }
            }
        } catch (SQLException e) {
            System.err.println("SQL Exception during login validation: " + e.getMessage());
            e.printStackTrace(); // Log or handle more gracefully in production
        }
        return userId;
    }

    // Original validate method (kept for reference, but validateAndGetId is preferred)
    // This method only checks if a user exists, doesn't return ID and has security issues.
    public boolean validate_original(Admin_Login loginBean) {
        boolean status = false;
        loadDriver();
        // String sql = "select * from user where uname = ? and password =?"; // Original query
        // SECURITY WARNING: Comparing plain text password is insecure!
        String sql = "SELECT id FROM admin WHERE uname = ? AND password = ?";


        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, loginBean.getUsername());
            ps.setString(2, loginBean.getPassword());

            try (ResultSet rs = ps.executeQuery()) {
                status = rs.next(); // True if a row is found, false otherwise
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }
}
