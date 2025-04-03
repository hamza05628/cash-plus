package com.hamza.cashplus.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.mindrot.jbcrypt.BCrypt;

import com.hamza.cashplus.config.DatabaseConfig;
import com.hamza.cashplus.models.User;

public class UserDAO {

    public static User getUserByEmail(String email) {
        User user = null;
        try {
            Connection conn = DatabaseConfig.getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM users WHERE email = ?");
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new User(rs.getInt("id"), rs.getString("email"), rs.getString("password"), rs.getBoolean("is_verified"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public static boolean registerUser(String email, String plainPassword, boolean isVerified, String verificationToken) {
        try {
            Connection conn = DatabaseConfig.getConnection();
            
            // Hash the password before storing (added BCrypt here)
            String hashedPassword = BCrypt.hashpw(plainPassword, BCrypt.gensalt());
            
            PreparedStatement ps = conn.prepareStatement(
                "INSERT INTO users (email, password, is_verified, verification_token) VALUES (?, ?, ?, ?)");
            ps.setString(1, email);
            ps.setString(2, hashedPassword);  // Store hashed password
            ps.setBoolean(3, isVerified);
            ps.setString(4, verificationToken);

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean verifyUser(String token) {
        try {
            Connection conn = DatabaseConfig.getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT id FROM users WHERE verification_token = ?");
            ps.setString(1, token);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) { // Token exists
                PreparedStatement updatePs = conn.prepareStatement("UPDATE users SET is_verified = 1, verification_token = NULL WHERE verification_token = ?");
                updatePs.setString(1, token);
                return updatePs.executeUpdate() > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

 // In UserDAO.java
    public static boolean authenticateUser(String email, String plainPassword) {
        try {
            Connection conn = DatabaseConfig.getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT password FROM users WHERE email = ?");
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String storedHash = rs.getString("password");
                // Verify the password against the stored hash
                return BCrypt.checkpw(plainPassword, storedHash);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    

    public static boolean updatePassword(String email, String newPassword) {
        try {
            Connection conn = DatabaseConfig.getConnection();
            // Hash the new password before storing
            String hashedPassword = BCrypt.hashpw(newPassword, BCrypt.gensalt());
            
            PreparedStatement ps = conn.prepareStatement("UPDATE users SET password = ? WHERE email = ?");
            ps.setString(1, hashedPassword);
            ps.setString(2, email);

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
