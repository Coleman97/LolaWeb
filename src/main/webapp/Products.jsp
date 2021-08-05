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
<title>All Products -Fashion House Of Lola</title>
<style><%@include file="/style.css"%></style>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Viaoda+Libre&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
						<li><a href="" class="menu-fonts">About</a></li>
						<li><a href="" class="menu-fonts">Contact</a></li>
						<li><a href="" class="menu-fonts">Account</a></li>
					</ul>
				</nav>
				<a href="" class="cart"><img src="images/cart.png" width="30px"
					height="30px"></a> <img src="images/menu.png" class="menu-icon"
					onclick="menutoggle()">
			</div>

		</div>
	</div>
	<!-- -----All Products -->
	<div class="small-container">
		<div class="row row-2">
			<h3>All Products</h3>
			
			<select>
				<option>Default Sorting</option>
				<option>Sort By Price</option>
				<option>Sort By Popularity</option>
				<option>Sort By Rating</option>
				<option>Sort By Sale</option>
			</select>
		</div>
		
		<form class="example" action="action_page.jsp">
  				<input type="text" placeholder="Search.." name="search">
  				<button type="submit"><i class="fa fa-search"></i></button>
		</form>

		<div class="row">
<%
	try{
		Connection con = Conn.getCon(); 
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("Select * from product where ACTIVE = 'yes'");
		while(rs.next()){
%>
			<div class="col-4">
				<a href="Lola Floral Ruffle Cut Out Dress.jsp">
				<img src="<%=rs.getString(3)%>" alt="">
					<h4>
						<b><%=rs.getString(2)%></b>
					</h4></a>
				<div class="rating">
					<p>&#9733;&#9733;&#9733;&#9733;&#9734;</p>
				</div>
				<p>$<%=rs.getString(7)%></p>

			</div>					
<%
}
}catch(Exception e){
	e.printStackTrace();
		}
%>

		</div>

		<div class="page-btn">
			<a href="Products.jsp"><span>1</span></a> <a href="ProductsPage2.jsp"><span>2</span></a>
			<span>3</span> <span>4</span> <span>&#8594;</span>
		</div>
	</div>

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
						POLICIES: <br> <a class="footer-link" href="">Shipping
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