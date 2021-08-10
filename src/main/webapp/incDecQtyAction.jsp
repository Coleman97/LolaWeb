<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="project.Conn"%>
<%@page import="java.sql.*"%>

<%
String email = session.getAttribute("email").toString();
String id = request.getParameter("id");
String incdesc = request.getParameter("quantity");
int price = 0;
int sub_total = 0;
int total =0;
int quantity = 0;
double Tax = 0.0;
int final_total = 0;
try{
	Connection con = Conn.getCon(); 
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("Select * from cart where email = '"+email+"' and product_id = '"+id+"' and address is null");
	while(rs.next()){
		price = rs.getInt(4);
		sub_total = rs.getInt(5);
		total = rs.getInt(6);
		quantity = rs.getInt(3);
	}
	if(quantity == 1 && incdesc.equals("desc")){
		response.sendRedirect("cart.jsp?msg=notPossible");
	}else if(quantity != 1 && incdesc.equals("desc")){
		sub_total = sub_total-price;
		quantity = quantity - 1;
		
		sub_total = price * quantity;
		Tax = (6.25*sub_total)/100;
		total = sub_total + (int)Tax;
		
		st.executeUpdate("Update cart set sub_total = '"+sub_total+"',total = '"+total+"',quantity = '"+quantity+"' where email = '"+email+"' and product_id = '"+id+"' and address is null");
		response.sendRedirect("cart.jsp?msg=desc");
	}
	else{
		sub_total = sub_total+price;
		quantity = quantity + 1;
		
		sub_total = price * quantity;
		Tax = (6.25*sub_total)/100;
		total = sub_total + (int)Tax;
		
		st.executeUpdate("Update cart set sub_total = '"+sub_total+"',total = '"+total+"',quantity = '"+quantity+"' where email = '"+email+"' and product_id = '"+id+"' and address is null");
		response.sendRedirect("cart.jsp?msg=inc");
	}
}catch(Exception e){
	System.out.println(e);
}
%>