<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="project.Conn"%>
<%@page import="java.sql.*"%>

<%
String email = session.getAttribute("email").toString();
try{
	Connection con = Conn.getCon(); 
	Statement st = con.createStatement();
	st.executeUpdate("Delete from cart where email = '"+email+"' and address is null");
	response.sendRedirect("cart.jsp?msg=removed");
	
}catch(Exception e){
	System.out.println(e);
}
%>
