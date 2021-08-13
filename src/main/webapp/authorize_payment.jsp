<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="project.Conn"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.io.PrintWriter"%>
<%@page import ="paypal.OrderDetail" %>
<%@page import ="paypal.PaymentServices" %>
 
 
 <%
 String email = session.getAttribute("email").toString();
 
 String ProductName = "";
 String Quantity ="";
 int SubTotal=0;
 String subTotal="";
 int total=0;
 String Total="";
 int tax=0;
 String Tax="";
 
 try {	
		Connection con = Conn.getCon(); 
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("Select name,quantity,sub_total,total from product join cart on product.id = cart.product_id and email = '"+email+"' and cart.address is null");
		while(rs.next()){
			ProductName = rs.getString(1);
			Quantity = Integer.toString(rs.getInt(2));
			SubTotal = rs.getInt(3);
			
			tax = (int)(6.25 * SubTotal) / 100;
			total = rs.getInt(4);
			
			Tax = Integer.toString(tax);
			subTotal = Integer.toString(SubTotal);
			Total = Integer.toString(total);
		}
		System.out.println(ProductName);
		System.out.println(Quantity);
		System.out.println(subTotal);
		System.out.println(Total);
		
		OrderDetail orderDetail =  new OrderDetail(ProductName,Quantity,subTotal,Total,Tax);
		
		PaymentServices paymentServices = new PaymentServices();
		String approvalLink = paymentServices.authorizePayment(orderDetail);
		
		response.sendRedirect(approvalLink);
	}catch(Exception e) {
		e.printStackTrace();
		request.setAttribute("errorMessage", "Invalid Payment Details!");
		request.getRequestDispatcher("error.jsp").forward(request,response);
		
	}
 
 %>