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
<title>Products -Lola Sleeveless Leather Dress</title>
<style><%@include file="/style.css"%></style>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Viaoda+Libre&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<div class="header">
		<div class="container">
			<div class="navbar">
				<div class="logo">
					<a href=""><img src="images/Transparent Logo.png" width="150px"></a>
				</div>
				<div id="textanime">
					Welcome To <span>Fashion House Of Lola.</span>
				</div>
				<div id="crow">|</div>
				<nav>
					<ul id="MenuItems">
						<li><a href="index.html" class="menu-fonts">Home</a></li>
						<li><a href="Products.html" class="menu-fonts">Products</a></li>
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
	<!-- -----Single Product -->
<%
	try{
		Connection con = Conn.getCon(); 
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("Select * from product where ID = 8");
		while(rs.next()){
%>
	<div class="small-container single-product">
		<div class="row">
			<div class="col-2">
				<img src="<%=rs.getString(3)%>" width="100%"
					id="ProductImg">

				<div class="small-img-row">
					<div class="small-img-col">
						<img src="" alt="" class="small-img">
					</div>
					<div class="small-img-col">
						<img src="" alt="" class="small-img">
					</div>
					<div class="small-img-col">
						<img src="" alt="" class="small-img">
					</div>
					<div class="small-img-col">
						<img src="" alt="" class="small-img">
					</div>

				</div>
			</div>

			<div class="col-2">
				<p><%=rs.getString(4)%></p>
				<h1><%=rs.getString(2)%></h1>
				<h4>$<%=rs.getString(7)%></h4>
				<div class="rating">
					<p>&#9733;&#9733;&#9733;&#9733;&#9734;</p>
				</div>
				<select name="" id="">
					<option>Select Size</option>
					<option>XXL</option>
					<option>XL</option>
					<option>Large</option>
					<option>Medium</option>
					<option>Small</option>
				</select> <input type="number" value="1"> <a href="" class="btn">Add
					To Cart</a>
				<h3>
					Product Description <i class="fa fa-indent" aria-hidden="true"></i>
				</h3>
				<br>
				<p class="details">
					<%=rs.getString(5)%>
				<hr
					style="height: 1px; border-width: 0; color: gray; background-color: gray; margin-top: 15px;">
				<br>
				<h3>Comments:</h3>
				<br>
				<p class="details">
					<%=rs.getString(6)%>
				</p>
				<hr
					style="height: 1px; border-width: 0; color: gray; background-color: gray; margin-top: 15px;">
				</p>
			</div>

		</div>
	</div>
<%
}
}catch(Exception e){
	e.printStackTrace();
		}
%>
	<!-- ======title======= -->
	<div class="small-container">
		<div class="row row-2">
			<h3>Related Products</h3>
			<a href="Products.html">View More</a>
		</div>
	</div>

	<!-- =======product========== -->

	<
	<div class="small-container">
		<div class="row">
			<div class="col-4">
				<a href="Lola bandage mini Dress.html"> <img
					src="images/Lola Bandage mini dress (1).jpeg" alt="">
					<h4>
						<b>Lola Bandage Mini Dress One</b>
					</h4></a>
				<div class="rating">
					<p>&#9733;&#9733;&#9733;&#9733;&#9734;</p>
				</div>
				<p>$50.00</p>

			</div>

			<div class="col-4">
				<a href="lola off shoulder maxi dress.html"> <img
					src="images/Lola off shoulder maxi dress.jpg" alt="">
					<h4>
						<b>Lola Off Shoulder Maxi Dress</b>
					</h4>
				</a>
				<div class="rating">
					<p>&#9733;&#9733;&#9733;&#9733;&#9734;</p>
				</div>
				<p>$50.00</p>

			</div>

			<div class="col-4">
				<a href="Lola metallic v-neck dress.html"> <img
					src="images/Lola metallic v-neck dress.jpeg" alt="">
					<h4>
						<b>Lola Metallic V-neck Dress </b>
					</h4></a>
				<div class="rating">
					<p>&#9733;&#9733;&#9733;&#9733;&#9734;</p>
				</div>
				<p>$50.00</p>

			</div>

			<div class="col-4">
				<a href="lola strapless rutched dress.html"> <img
					src="images/Lola strapless ruched dress.jpeg" alt="">
					<h4>
						<b>Lola Strapless Rutched Dress</b>
					</h4>
				</a>
				<div class="rating">
					<p>&#9733;&#9733;&#9733;&#9733;&#9734;</p>
				</div>
				<p>$50.00</p>

			</div>
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
					<a href="index.html"><img src="images/Transparent Logo.png"
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

	<!-- // ======JS FOR IMAGE SELECTOR=========// -->
	<script>
        var ProductImg = document.getElementById("ProductImg");
        var SmallImage = document.getElementsByClassName("small-img");

        SmallImage[0].onclick = function(){
            ProductImg.src = SmallImage[0].src;
        }
        SmallImage[1].onclick = function(){
            ProductImg.src = SmallImage[1].src;
        }
        SmallImage[2].onclick = function(){
            ProductImg.src = SmallImage[2].src;
        }
        SmallImage[3].onclick = function(){
            ProductImg.src = SmallImage[3].src;
        }
    </script>
</footer>
</html>