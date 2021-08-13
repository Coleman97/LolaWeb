<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="project.Conn"%>
<%@page import ="paypal.PaymentServices"%>
<%@page import ="com.paypal.api.payments.Payment"%>
<%@page import ="com.paypal.api.payments.PayerInfo"%>
<%@page import ="com.paypal.api.payments.Transaction"%>
<%@page import ="com.paypal.api.payments.ShippingAddress"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Review Payment</title>
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

<%
Transaction transaction = (Transaction)request.getAttribute("transaction");
PayerInfo payerInfo = (PayerInfo)request.getAttribute("payer");
ShippingAddress shippingAddress = (ShippingAddress)request.getAttribute("shippingAddress");

String paymentId = request.getParameter("paymentId");
String payerId = request.getParameter("payerId");
%>

<body>
	<div class="small-container cart-page ">
		<h1>Payment Done. Thank you for purchasing our products</h1>
    <br/>
    <h2>Receipt Details:</h2>
    <table>
        <tr>
            <td><b>Merchant:</b></td>
            <td><%=payerInfo.getFirstName()%> <%=payerInfo.getLastName()%></td>      
        </tr>
        <tr>
            <td><b>Description:</b></td>
            <td><%=transaction.getDescription()%></td>
        </tr>
        <tr>
            <td><b>Subtotal:</b></td>
            <td><%=transaction.getAmount().getDetails().getSubtotal()%> USD</td>
        </tr>
        <tr>
            <td><b>Shipping:</b></td>
            <td><%=transaction.getAmount().getDetails().getShipping()%> USD</td>
        </tr>
        <tr>
            <td><b>Tax:</b></td>
            <td><%=transaction.getAmount().getDetails().getTax()%> USD</td>
        </tr>
        <tr>
            <td><b>Total:</b></td>
            <td><%=transaction.getAmount().getTotal()%> USD</td>
        </tr>   
        <tr>
        	<td><a href="FinishPayment.jsp" class="btn">Proceed to Store<a></a></td>
        </tr>                 
    </table>
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