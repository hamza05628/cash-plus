<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page session="true" %>

<%
    // Destroy session and redirect to login page
    session.invalidate();
    response.sendRedirect("login.jsp?logout=success");
%>
