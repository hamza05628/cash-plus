package com.hamza.cashplus.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.hamza.cashplus.dao.UserDAO;
import com.hamza.cashplus.models.User;
import org.mindrot.jbcrypt.BCrypt;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        User user = UserDAO.getUserByEmail(email);

        if (user != null) {
            // Verify with BCrypt (works for both old plaintext and new hashed passwords)
            if (BCrypt.checkpw(password, user.getPassword()) || 
                password.equals(user.getPassword())) { // Fallback for old plaintext
                
                if (user.isVerified()) {
                    HttpSession session = request.getSession();
                    session.setAttribute("user", user);
                    response.sendRedirect("home.jsp");
                } else {
                    response.sendRedirect("login.jsp?error=email_not_verified");
                }
            } else {
                response.sendRedirect("login.jsp?error=invalid_password");
            }
        } else {
            response.sendRedirect("login.jsp?error=user_not_found");
        }
    }
}