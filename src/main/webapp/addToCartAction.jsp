<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="project.Conn"%>
<%@page import="java.sql.*"%>

<%
String Email = session.getAttribute("email").toString();
String Product_ID = request.getParameter("id");
int quantity = 1;
int product_price= 0;
int product_total = 0;
int cart_total=0;

int z =0;
try{
	Connection con = Conn.getCon(); 
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("Select * from product where ID = '"+Product_ID+"'");
	while(rs.next()){
		product_price=rs.getInt(4);
		product_total = product_price;
	}
	ResultSet rs1 = st.executeQuery("Select * from cart where Product_id = '"+Product_ID+"' and email = '"+Email+"' and Address is NULL");
	while(rs1.next()){
		cart_total=rs1.getInt(5);
		cart_total = cart_total + product_total;
		quantity = rs1.getInt(3);
		quantity = quantity + 1;
		z=1;
		
	}
	if(z==1){
		st.executeUpdate("update cart set total = '"+cart_total+"',quantity = '"+quantity+"' where Product_ID = "+Product_ID+" AND email = '"+Email+"' and Address is Null");
		response.sendRedirect("Products.jsp?msg=exist");
	}
	if(z==0){
		PreparedStatement ps = con.prepareStatement("insert into cart(email,Product_id,quantity,price,total) values(?,?,?,?,?)");
		ps.setString(1, Email);
		ps.setString(2, Product_ID);
		ps.setInt(3, quantity);
		ps.setInt(4, product_price);
		ps.setInt(5, product_total);
		ps.executeUpdate();
		response.sendRedirect("Products.jsp?msg=added");
	}
}catch(Exception e){
	e.printStackTrace();
	response.sendRedirect("Products.jsp?msg=invalid");
}
%>