<%@page import="project.Conn"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.io.PrintWriter"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Fashion House Of Lola</title>
<link rel="shortcut icon" href="images/Transparent Logo.png">
<style><%@include file="/style.css"%></style>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Viaoda+Libre&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="AlWeb.js"></script>
</head>
<body>
	<div class="header">
		<div class="container">
			<div class="navbar">
				<div class="logo">
					<a href="index.html"><img src="images/Transparent Logo.png"
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
								Connection con = Conn.getCon(); 
								Statement st = con.createStatement();	
								ResultSet rs = st.executeQuery("Select username from users where email = '"+email+"'");
								while(rs.next()){%>
								<li><a href="#" class="menu-fonts"><i class="fa fa-user" style="font-size:21px" aria-hidden="true"></i><%=rs.getString(1)%></a></li>
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
			<div class="row">
				<div class="col-2">
					<h1>
						Define Your Looks,<br> Choose Your Style!
					</h1>
					<p style="font-size: 20px;">
						Comfort and elegance begins with what you wear and how you look. <br>
						We are here to make sure you make the right choices.
					</p>
					<a href="Products.jsp" class="btn">Explore Now &#8594; </a>
				</div>
				<div class="col-2">
					<img src="images/model_3.png" alt="">
				</div>
			</div>
		</div>
	</div>

	<!-- ----Just In Section -->
	<div class="categories">
		<div class="small-container">
			<h2>JUST IN</h2>
			<div class="row">
				<div class="col-3">
					<a href="Lola Abstract print pant set.jsp"><img
						src="images/Lola Abstract print pant set.jpeg" height="400px"
						alt=""></a>
				</div>
				<div class="col-3">
					<a href="Lola bandage mini Dress.jsp"><img
						src="images/Lola Bandage mini dress (1).jpeg" height="400px"
						alt=""></a>
				</div>
				<div class="col-3">
					<a href="Lola Floral Maxi Romper.jsp"><img
						src="images/Lola Floral maxi romper.jpeg" height="400px" alt=""></a>
				</div>
			</div>
		</div>
	</div>

	<!-- -----Featured Products -->
	<div class="small-container">
		<h3 class="title">Featured Products</h3>
		<div class="row">
			<div class="col-4">
				<a href="Lola Floral Ruffle Cut Out Dress.jsp"><img
					src="images/Lola Floral Ruffle cut out dress.jpeg" alt="">
					<h4>
						<b>Lola Floral Ruffle Cut-Out Dress</b>
					</h4></a>
				<div class="rating">
					<p style="color:#ffff00;">&#9733;&#9733;&#9733;&#9733;&#9734;</p>
				</div>
				<p>$50.00</p>

			</div>

			<div class="col-4">
				<a href="Lola one shoulder jumpsuit.jsp"> <img
					src="images/Lola one shoulder jumpsuit.jpeg" alt="">
					<h4>
						<b>Lola One Shoulder Jumpsuit</b>
					</h4>
				</a>
				<div class="rating">
					<p style="color:#ffff00;">&#9733;&#9733;&#9733;&#9733;&#9734;</p>
				</div>
				<p>$50.00</p>

			</div>

			<div class="col-4">
				<a href="Lola metallic v-neck dress.jsp"><img
					src="images/Lola metallic v-neck dress.jpeg" alt="">
					<h4>
						<b>Lola Metallic V-neck Dress </b>
					</h4></a>
				<div class="rating">
					<p style="color:#ffff00;">&#9733;&#9733;&#9733;&#9733;&#9734;</p>
				</div>
				<p>$50.00</p>

			</div>

			<div class="col-4">
				<a href="Lola faux suede ruffle dress.jsp"><img
					src="images/Lola faux suede ruffle dress.jpeg" alt="">
					<h4>
						<b>Lola Faux Suede Ruffle Dress</b>
					</h4> </a>
				<div class="rating">
					<p style="color:#ffff00;">&#9733;&#9733;&#9733;&#9733;&#9734;</p>
				</div>
				<p>$50.00</p>

			</div>
		</div>

		<!-- <h3 class="title">Featured Products</h3> -->
	</div>
	<div class="offer">
		<div class="small-container">
			<div class="row">
				<div class="col-2">
					<a href=""><img
						src="images/Lola pinky green leaf maxi dress.jpeg"
						class="offer-img" alt=""></a>
				</div>
				<div class="col-2">
					<p style="font: 15px;">Exclusively Available on Fashion House
						Of Lola</p>
					<h1>Lola Pinky Green Leaf Maxi Dress</h1>
					<SMAll style="font-size: 20px;">With it's unique design,
						the Pinky Green Leaf Maxi<br> dress is best for almost all
						occasions.
					</SMAll> <br> <a href="Lola pink green leaf maxi dress.jsp"
						class="btn">Buy Now &#8594;</a>
				</div>
			</div>
		</div>
	</div>
	<!-- --------brands-------- -->

	<!-- ------------footer-------- -->

</body>
<footer>
	<div class="footer">
		<div class="container">
			<div class="row">
				<div class="footer-col-1">
					<img src="" alt="">
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

</footer>
</html>