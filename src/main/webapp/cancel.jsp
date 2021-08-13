<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="project.Conn"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.io.PrintWriter"%>
<%@page import ="project.SendEmail" %>
<%@page import ="project.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment Cancelled</title>
</head>
<body>
<%RequestDispatcher rd=request.getRequestDispatcher("Products.jsp");
PrintWriter pw = response.getWriter();
pw.println("<script type=\"text/javascript\">");
pw.println("alert('Payment Procedure has been cancelled!');");
pw.println("</script>");
rd.include(request, response); %>
</body>
</html>