package net.webapp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import net.webapp.model.Customer;

public class UserDBUtil {

	public static List<Customer> validate() {
	    List<Customer> customers = new ArrayList<>();

	    try (Connection con = DBConnect.getConnection();
	         PreparedStatement pstmt = con.prepareStatement("SELECT * FROM register")) {

	        ResultSet rs = pstmt.executeQuery();

	        while (rs.next()) {
	            int id = rs.getInt("id");
	            String fullname = rs.getString("fullname");
	            String username1 = rs.getString("username");
	            String nic = rs.getString("nic");
	            String address = rs.getString("address");
	            String email1 = rs.getString("email");
	            String phone = rs.getString("phone");

	            customers.add(new Customer(id, fullname, username1, nic, address, email1, phone));
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return customers;  // Returning the list, even if empty
	}

    public static boolean insertCustomer(String fullname, String username, String nic, String address, String email, String phone) {
        boolean isSuccess = false;

        try (Connection con = DBConnect.getConnection();
             PreparedStatement pstmt = con.prepareStatement("INSERT INTO register (fullname, username, nic, address, email, phone) VALUES (?, ?, ?, ?, ?, ?)")) {

            pstmt.setString(1, fullname);
            pstmt.setString(2, username);
            pstmt.setString(3, nic);
            pstmt.setString(4, address);
            pstmt.setString(5, email);
            pstmt.setString(6, phone);

            int rowsAffected = pstmt.executeUpdate();
            isSuccess = rowsAffected > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }
    public static boolean isUsernameExists(String username) {
        boolean exists = false;

        try (Connection con = DBConnect.getConnection();
             PreparedStatement pstmt = con.prepareStatement("SELECT username FROM register WHERE username = ?")) {
            
            pstmt.setString(1, username);
            ResultSet rs = pstmt.executeQuery();
            
            exists = rs.next(); // true if a record is found

        } catch (Exception e) {
            e.printStackTrace();
        }

        return exists;
    }



   
    public static boolean updateCustomer(String fullname, String username, String nic, String address, String email, String phone) {
        boolean isSuccess = false;

        try (Connection con = DBConnect.getConnection();
             PreparedStatement pstmt = con.prepareStatement("UPDATE register SET fullname=?, nic=?, address=?, email=?, phone=? WHERE username=?")) {

            pstmt.setString(1, fullname);
            pstmt.setString(2, nic);
            pstmt.setString(3, address);
            pstmt.setString(4, email);
            pstmt.setString(5, phone);
            pstmt.setString(6, username);

            int rowsAffected = pstmt.executeUpdate();
            isSuccess = rowsAffected > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }

    public static boolean deleteCustomer(int id) {
        boolean isSuccess = false;
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = DBConnect.getConnection();
            String sql = "DELETE FROM register WHERE id=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, id);

            isSuccess = pstmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
            try { if (con != null) con.close(); } catch (Exception e) { e.printStackTrace(); }
        }

        return isSuccess;
    }
}

