package com.hamza.cashplus.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hamza.cashplus.dao.UserDAO;

@WebServlet("/verify")
public class VerifyServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String token = request.getParameter("token");
        if (token != null && UserDAO.verifyUser(token)) {
            response.getWriter().println("Your account has been verified successfully!");
        } else {
            response.getWriter().println("Invalid or expired verification link.");
        }
    }
}
