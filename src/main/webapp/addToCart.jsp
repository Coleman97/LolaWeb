<%@page import="project.Conn"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.io.PrintWriter"%>
<%@page import ="project.SendEmail" %>
<%@page import ="project.User" %>

<%

String email = session.getAttribute("email").toString();
if(email == null || email == ""){
	PrintWriter pw = response.getWriter();
	pw.println("<script type=\"text/javascript\">");
	pw.println("alert('Log in to buy product');");
	pw.println("</script>");
	response.sendRedirect("Account.jsp");
}

String product_id = request.getParameter("id");
int quantity = 1;

System.out.println(quantity);
double Tax =0.0;
int Product_price = 0;
int Product_subTotal = 0;
int Product_Total = 0;
int cart_total = 0;

String link ="";
int z = 0;
try{
	Connection con = Conn.getCon(); 
	Statement st = con.createStatement();	
	ResultSet rs = st.executeQuery("Select * from product where id = '"+product_id+"'");
	while(rs.next()){
		Product_price = Integer.parseInt(rs.getString(7));
		Product_subTotal += Product_price * quantity;
		Tax = (6.25*Product_subTotal)/100;
		Product_Total = Product_subTotal + (int)Tax;
		link = rs.getString(8);
	}

	
	ResultSet rs1 = st.executeQuery("Select * from cart where Product_id = '"+product_id+"' and email = '"+email+"' and address is null");
	while(rs1.next()){
		quantity = rs1.getInt(3);
		quantity = quantity + 1;
		
		int price = rs1.getInt(4);
		
		Product_subTotal = price * quantity;
		Tax = (6.25*Product_subTotal)/100;
		Product_Total = Product_subTotal + (int)Tax;
		
		
		z=1;	
	}
	if(z==1){

		st.executeUpdate("update cart set sub_total = '"+Product_subTotal+"',total = '"+Product_Total+"',quantity = '"+quantity+"' where Product_id = '"+product_id+"' and email = '"+email+"' and address is null");
		response.sendRedirect(link + "?msg=exist");
		
	}
	if(z==0){
		PreparedStatement ps = con.prepareStatement("insert into cart(email,Product_id,quantity,price,sub_total,total) values(?,?,?,?,?,?)");
		ps.setString(1,email);
		ps.setString(2,product_id);
		ps.setInt(3,quantity);
		ps.setInt(4,Product_price);
		ps.setInt(5 ,Product_subTotal);
		ps.setInt(6 ,Product_Total);
		ps.executeUpdate();
		response.sendRedirect("cart.jsp?msg=added");
	}
}catch(Exception e){
	System.out.println(e);
	response.sendRedirect("cart.jsp?msg=invalid");
}

%>