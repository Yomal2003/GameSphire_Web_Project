package net.webapp.dao;

import java.sql.Connection;
// import java.sql.Driver; // Not directly used, DriverManager handles it
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import net.webapp.model.User_Register; // Assuming this model has getUname(), getPassword(), getEmail(), getPhone()

public class User_Register_Dao {

    // Database connection details
    // IMPORTANT: Ensure 'userdb' is the correct database name.
    // If your 'member' table is in 'gamesphere_db', change it here.
    private String dbUrl = "jdbc:mysql://localhost:3306/gamesphere_db"; // Changed to gamesphere_db
    private String dbUname = "root";
    private String dbPassword = "root"; // Consider externalizing credentials
    private String dbDriver = "com.mysql.cj.jdbc.Driver";

    /**
     * Loads the JDBC driver.
     * This method is typically called once, but calling it multiple times is harmless.
     * Modern JDBC drivers often auto-register, making explicit loading optional.
     * @param dbDriver The JDBC driver class name.
     */
    private void loadDriver(String dbDriver) {
        try {
            Class.forName(dbDriver);
        } catch (ClassNotFoundException e) {
            // Consider a more robust error handling mechanism, e.g., throwing a custom exception
            System.err.println("JDBC Driver not found: " + e.getMessage());
            e.printStackTrace(); // For debugging, but might not be suitable for production logs
        }
    }

    /**
     * Establishes a connection to the database.
     * @return A Connection object or null if connection fails.
     */
    private Connection getConnection() {
        Connection con = null;
        try {
            con = DriverManager.getConnection(dbUrl, dbUname, dbPassword);
        } catch (SQLException e) {
            System.err.println("Database connection failed: " + e.getMessage());
            e.printStackTrace();
        }
        return con;
    }

    /**
     * Inserts a new member into the database.
     *
     * @param member The User_Register object containing member details.
     * IMPORTANT: member.getPassword() should return a HASHED password.
     * @return A string indicating the result of the operation.
     */
    public String insert(User_Register user) {
        loadDriver(dbDriver); // Load driver (can be done once at application startup too)
        String resultMessage = "Data not entered due to an error."; // Default error message

        // SQL query specifying column names, excluding the auto-increment 'id'
        String sql = "INSERT INTO user (uname, password, email, phone) VALUES (?, ?, ?, ?)";

        // Using try-with-resources to ensure Connection and PreparedStatement are closed
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            if (con == null) {
                return "Data not entered: Could not establish database connection.";
            }

            // Set parameters for the PreparedStatement
            // IMPORTANT: Ensure member.getPassword() returns a HASHED password for security.
            ps.setString(1, user.getUname());
            ps.setString(2, user.getPassword()); // This MUST be a hashed password
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPhone());

            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                resultMessage = "Data entered successfully";
            } else {
                resultMessage = "Data not entered, no rows affected."; // Should not happen with an insert unless there's a specific trigger/issue
            }

        } catch (SQLException e) {
            // Log the error more appropriately in a real application
            e.printStackTrace(); // For debugging
            // Check for unique constraint violations (MySQL error code 1062)
            if (e.getErrorCode() == 1062) { // MySQL specific error code for duplicate entry
                if (e.getMessage().toLowerCase().contains("uname")) {
                    resultMessage = "Registration failed: Username already exists.";
                } else if (e.getMessage().toLowerCase().contains("email")) {
                    resultMessage = "Registration failed: Email already exists.";
                } else {
                    resultMessage = "Registration failed: Duplicate entry.";
                }
            } else {
                resultMessage = "Data not entered due to a database error: " + e.getMessage();
            }
        }
        return resultMessage;
    }
}