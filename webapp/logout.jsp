<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Invalider la session
    session.invalidate();
    // Rediriger vers la page de connexion
    response.sendRedirect("login.jsp");
%>
