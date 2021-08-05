
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Fashion House of Laola-Shopping Cart</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Viaoda+Libre&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style><%@include file="/style.css"%></style>
<script src="AlWeb.js" async></script>
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
						<li><a href="Products.jspindex.jsp" class="menu-fonts">Products</a></li>
						<li><a href="" class="menu-fonts">About</a></li>
						<li><a href="" class="menu-fonts">Contact</a></li>
						<li><a href="" class="menu-fonts">Account</a></li>
					</ul>
				</nav>
				<a href="cart.jspindex.jsp" class="cart"><img
					src="images/cart.png" width="30px" height="30px"></a> <img
					src="images/menu.png" class="menu-icon" onclick="menutoggle()">
			</div>

		</div>
	</div>

	<!-- =========Account Page============ -->
	<div class="account-page">
		<div class="container">
			<div class="row">
				<div class="col-2">
					<img src="images/model_3.png" width="100%">
				</div>
				<div class="col-2">
					<div class="form-container">
						
						<form id="" action="NewPassAction.jsp">
						<p><b>Enter your new password.</b> </p>
							<input name="password" type="password" placeholder="New Password">
							<input name="confirm-password" type="text" placeholder="Confirm Password">
							<button type="submit" class="btn">Submit</button>
						</form>						
					</div>
				</div>
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

	<!-- ========js for acct toggle form============ -->
	<script>

        var LoginForm = document.getElementById("LoginForm");
        var RegForm = document.getElementById("RegForm");
        var indicator = document.getElementById("indicator")

        function register(){
            RegForm.style.transform = "translateX(0px)";
            LoginForm.style.transform = "translateX(0px)";
            indicator.style.transform = "translateX(100px)";
        }
        function login(){
            RegForm.style.transform = "translateX(300px)";
            LoginForm.style.transform = "translateX(300px)";
            indicator.style.transform = "translateX(0px)";
        }

    </script>
</footer>
</html>