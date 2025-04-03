package com.hamza.cashplus.servlets;

import java.io.IOException;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.hamza.cashplus.dao.UserDAO;
import com.hamza.cashplus.utils.EmailUtil;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        HttpSession session = request.getSession();

        // Check if user already exists
        if (UserDAO.getUserByEmail(email) == null) {
            // Plain text password is passed (no change)
            String plainPassword = password;

            // Generate a unique verification token
            String verificationToken = UUID.randomUUID().toString();

            // Register the user (UserDAO will handle hashing)
            if (UserDAO.registerUser(email, plainPassword, false, verificationToken)) { 
                // Send the verification email
                String verificationLink = "http://localhost:8080/cashplus/verify?token=" + verificationToken;
                EmailUtil.sendVerificationEmail(email, verificationLink);

                session.setAttribute("successMessage", "Registration successful! Please check your email to verify.");
                response.sendRedirect("login.jsp");
            } else {
                session.setAttribute("errorMessage", "Registration failed.");
                response.sendRedirect("register.jsp");
            }
        } else {
            session.setAttribute("errorMessage", "Email is already in use.");
            response.sendRedirect("register.jsp");
        }
    }
}