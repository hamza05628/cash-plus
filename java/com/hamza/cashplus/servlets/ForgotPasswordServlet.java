package com.hamza.cashplus.servlets;

import java.io.IOException;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hamza.cashplus.dao.UserDAO;
import com.hamza.cashplus.models.User;
import com.hamza.cashplus.utils.EmailService;


@WebServlet("/forgot-password")
public class ForgotPasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // In a real application, you would inject this
    private EmailService emailService = new EmailService();

protected void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
    
    String email = request.getParameter("email");
    String action = request.getParameter("action");
    
    HttpSession session = request.getSession();
    
    if ("send-code".equals(action)) {
        // Generate and send verification code
        String verificationCode = generateVerificationCode();
        session.setAttribute("verificationCode", verificationCode);
        session.setAttribute("email", email);
        
        boolean emailSent = emailService.sendVerificationEmail(email, verificationCode);
        
        response.setContentType("application/json");
        if (emailSent) {
            response.getWriter().write("{\"status\":\"success\"}");
        } else {
            response.getWriter().write("{\"status\":\"error\", \"message\":\"Failed to send verification email\"}");
        }
        
    } else if ("verify-code".equals(action)) {
        String enteredCode = request.getParameter("verificationCode");
        String storedCode = (String) session.getAttribute("verificationCode");
        
        response.setContentType("application/json");
        if (enteredCode != null && enteredCode.equals(storedCode)) {
            response.getWriter().write("{\"status\":\"success\"}");
        } else {
            response.getWriter().write("{\"status\":\"error\", \"message\":\"Invalid verification code\"}");
        }
        
    } else if ("reset-password".equals(action)) {
        String newPassword = request.getParameter("newPassword");
        String emailForReset = (String) session.getAttribute("email");
        
        // Verify the user exists before updating password
        User user = UserDAO.getUserByEmail(emailForReset);
        if (user == null) {
            response.setContentType("application/json");
            response.getWriter().write("{\"status\":\"error\", \"message\":\"User not found\"}");
            return;
        }
        
        // Update the password
        boolean passwordUpdated = UserDAO.updatePassword(emailForReset, newPassword);
        
        response.setContentType("application/json");
        if (passwordUpdated) {
            // Clear session attributes
            session.removeAttribute("verificationCode");
            session.removeAttribute("email");
            response.getWriter().write("{\"status\":\"success\"}");
        } else {
            response.getWriter().write("{\"status\":\"error\", \"message\":\"Failed to update password\"}");
        }
    }
}    
    private String generateVerificationCode() {
        Random random = new Random();
        int code = 100000 + random.nextInt(900000);
        return String.valueOf(code);
    }
    
    private boolean updatePasswordInDatabase(String email, String newPassword) {
        // Implement your database update logic here
        // This is just a placeholder
        return true;
    }
}