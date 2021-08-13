<%@page import="project.Conn"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.io.PrintWriter"%>
<%@page import ="project.SendEmail" %>
<%@page import ="project.User" %>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Fashion House of Lola-Shopping Cart</title>
<link rel="shortcut icon" href="images/Transparent Logo.png">
<style><%@include file="/style.css"%></style>

<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Viaoda+Libre&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!--  <script src="AlWeb.js" async></script>-->
</head>
<body>
	<div class="header">
		<div class="container">
			<div class="navbar">
				<div class="logo">
					<a href="index.jsp"><img src="images/Transparent Logo.png"
						width="150px"></a>
				</div>
				<div id="textanime">
					Welcome To <span>Fashion House Of Lola.</span>
				</div>
				<div id="crow">|</div>
				<nav>
					<ul id="MenuItems">
						<li><a href="index.jsp" class="menu-fonts">Home</a></li>
						<li><a href="Products.jsp" class="menu-fonts">Products</a></li>
						<li><a href="Contact.jsp" class="menu-fonts">Contact</a></li>
						<li><a href="Policy.jsp" class="menu-fonts">Policy</a></li>
						<%
						if(session.getAttribute("email")== null){%>
						<li><a href="Account.jsp" class="menu-fonts">SignUp/Login</a></li>
						<%}else{
							String email = session.getAttribute("email").toString();
							try{
								Connection con2 = Conn.getCon(); 
								Statement st2 = con2.createStatement();	
								ResultSet rs2 = st2.executeQuery("Select username from users where email = '"+email+"'");
								while(rs2.next()){%>
								<li><a href="#" class="menu-fonts"><i class="fa fa-user" style="font-size:21px" aria-hidden="true"></i><%=rs2.getString(1)%></a></li>
								<li><a href= "LogoutAction.jsp"><i class="fa fa-sign-out" style="font-size:21px" aria-hidden="true">Logout</i></a></li>
								<% }}catch(Exception e){
									e.printStackTrace();
						}}%>
					</ul>
				</nav>
				<a href="cart.jsp" class="cart"><img src="images/cart.png" width="30px"
					height="30px"></a> <img src="images/menu.png" class="menu-icon"
					onclick="menutoggle()">
			</div>

		</div>
	</div>
<%
int Price = 0;
int subTotal = 0;
int Total = 0;
int quantity = 0;
if(session.getAttribute("email")!= null){
String email = session.getAttribute("email").toString();

try{
	Connection con = Conn.getCon(); 
	Statement st = con.createStatement();
	ResultSet rs1 = st.executeQuery("select sum(quantity),sum(sub_total),sum(total),price from cart where email = '"+email+"' and address is null");
	while(rs1.next()){
		quantity = rs1.getInt(1);
		subTotal = rs1.getInt(2);
		Total = rs1.getInt(3);
		
		System.out.println(quantity);
		System.out.println(subTotal);
		System.out.println(Total);
	
		
	}
	
%>
	<!-- ===========Cart================= -->
	<div class="small-container cart-page ">
	
		<table class="cart-items">
			<tr>
				<th>Product</th>
				<th>Quantity</th>
				<th>SubTotal</th>
			
			</tr>

		<%
			ResultSet rs = st.executeQuery("Select * from product join cart on product.id = cart.product_id and cart.email = '"+email+"' and cart.address is null");
			while(rs.next())
			{	
		%>
			<tr class="cart-row">
			 	<td>
			 		<div class="cart-info">
			 			<img width="100px" height="130px;" src="<%=rs.getString(3)%>">
			 			<div>
			 				<p><%=rs.getString(2)%></p>
			 				<small>Price: $<%=rs.getString(7)%></small> <br>
			 				<a href="Remove.jsp?id=<%=rs.getString(1)%>" class="">Remove</a>
			 			</div>
			 		</div>
			 	
			 	</td>
				<td><a href="incDecQtyAction.jsp?id=<%=rs.getString(1)%>&quantity=inc"><i class='fa fa-plus-circle' style="color:#ff523b" ></i></a><%=rs.getString(13)%><a href="incDecQtyAction.jsp?id=<%=rs.getString(1)%>&quantity=desc"><i class='fa fa-minus-circle' style="color:#ff523b"></i></a></td>
				<td class="cart-price">$<%=rs.getString(14)%>.00</td>
			
			
			</tr>
		<%
		}
		}catch(Exception e){
			System.out.println(e);
		}%>
			</table>
		
		
		<div class="total-price">
			<table>
				<tr>
					<td>Subtotal</td>
					<td class="cart-Subtotal-price">$<%out.println(subTotal);%>.00</td>
				
				</tr>
				
				<tr>
					<td>Tax</td>
					<td class="cart-tax-price">6.25%</td>
				
				</tr>
				
				<tr>
					<td>Total</td>
					<td class="cart-total-price">$<%out.println(Total);%>.00</td>
				</tr>
			</table>
		
		</div>
		
		<br>
		<br>
		<br>
		
	
		<div class="cart-proceed">
			<label>Select a payment option below!</label>
				<div>
				<button onclick="window.location.href = 'authorize_payment.jsp'" class="button"><img src="images/paypal.svg"></button>
				<button class="button2"><img src="images/square-vector-logo.svg"></button>
				</div>
			</div>
			</div>
<%}else{%>
		<div class="small-container cart-page ">
	
		<table class="cart-items">
			<tr>
				<th>Product</th>
				<th>Quantity</th>
				<th>SubTotal</th>
			
			</tr>
		</table>
			<div class="total-price">
			<table>
				<tr>
					<td>Subtotal</td>
					<td class="cart-Subtotal-price">$<%out.println(subTotal);%>.00</td>
				
				</tr>
				
				<tr>
					<td>Tax</td>
					<td class="cart-tax-price">6.25%</td>
				
				</tr>
				
				<tr>
					<td>Total</td>
					<td class="cart-total-price">$<%out.println(Total);%>.00</td>
				
				</tr>
				
			</table>
		
			</div>
		
		<br>
		<br>
		<br>
		
	
			<div class="cart-proceed">
			<label>Select a payment option below!</label>
				<div>
				<button onclick="window.location.href = 'authorize_Payment.jsp'" class="button"><img src="images/paypal.svg"></button>
				<button class="button2"><img src="images/square-vector-logo.svg"></button>
				</div>
			</div>
		</div>
		<%}%>
		
		
</body>
<footer>
	<div class="footer">
		<div class="container">
			<div class="row">
				<div class="footer-col-1">
					<h3>
						ADDRESS: <br> Anna, TX.<br> 75409
					</h3>

					<h3>
						POLICIES: <br> <a class="footer-link" href="Policy.jsp">Shipping
							and Returns.</a> <br> <img src="images/zpaymentgateways-3.png"
							width="300px" alt="">
				</div>
				<div class="footer-col-2">
					<a href="index.jsp"><img src="images/Transparent Logo.png"
						alt=""></a>
					<h3>
						We provide classic and elegant wears for women! <br> Feel
						free to shop with us.
					</h3>
				</div>
				<div class="footer-col-3">
					<h3>Contact us via these Links</h3>
					<ul>
						<li><a href="web.facebook.com" class="footer-link"><img
								style="width: 25px; height: 25px;" src="images/facebook.png"
								onclick="window.location.href = 'https://web.facebook.com/?_rdc=1&_rdr';">Facebook</a></li>
						<li><a href="" class="footer-link"><img
								style="width: 25px; height: 25px;" src="images/instagram.png"
								onclick="window.location.href = 'https://web.facebook.com/?_rdc=1&_rdr';">Instagram</a></li>
						</li>
					</ul>
					<div class="two">
						<h3>Phone Numbers:</h3>
						<p>+1 (469) 288-9947</p>
						<p class="text-footer">
							Made By <a class="footer-link" href="mailto:tobbycole12@.com">Tobbycole</a>
						</p>
					</div>
				</div>

			</div>
		</div>
	</div>


	<!-- -------Js Menu Controller---------- -->
	 <script>
        var MenuItems = document.getElementById("MenuItems");
        MenuItems.style.maxHeight = "0px";
    
        function menutoggle(){
            if(MenuItems.style.maxHeight == "0px"){
            MenuItems.style.maxHeight = "200px";
        }else {
            MenuItems.style.maxHeight = "0px";
        }
    }    
    </script>
</footer>
</html>