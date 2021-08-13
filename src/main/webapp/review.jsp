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
String payerId = request.getParameter("PayerID");
%>

<body>
	<div class="small-container cart-page " align=>
		<form action="ExecutePayment.jsp" method="post">
    <table class="cart-items">
        <tr>
            <td colspan="2"><b>Transaction Details:</b></td>
            <td>
                <input type="hidden" name="paymentId" value="<%=paymentId %>" />
                <input type="hidden" name="PayerID" value="<%=payerId %>" />
            </td>
        </tr>
        <tr>
            <td>Description:</td>
            <td><%=transaction.getDescription()%></td>
        </tr>
        <tr>
            <td>Subtotal:</td>
            <td><%=transaction.getAmount().getDetails().getSubtotal()%> USD</td>
        </tr>
        <tr>
            <td>Shipping:</td>
            <td><%=transaction.getAmount().getDetails().getShipping()%> USD</td>
        </tr>
        <tr>
            <td>Tax:</td>
            <td><%=transaction.getAmount().getDetails().getTax()%> USD</td>
        </tr>
        <tr>
            <td>Total:</td>
            <td><%=transaction.getAmount().getTotal()%> USD</td>
        </tr>
        <tr><td><br/></td></tr>
        <tr>
            <td colspan="2"><b>Payer Information:</b></td>
        </tr>
        <tr>
            <td>First Name:</td>
            <td><%=payerInfo.getFirstName()%></td>
        </tr>
        <tr>
            <td>Last Name:</td>
            <td><%=payerInfo.getLastName()%></td>
        </tr>
        <tr>
            <td>Email:</td>
            <td><%=payerInfo.getEmail()%></td>
        </tr>
        <tr><td><br/></td></tr>
        <tr>
            <td colspan="2"><b>Shipping Address:</b></td>
        </tr>
        <tr>
            <td>Recipient Name:</td>
            <td><%=shippingAddress.getRecipientName()%></td>
        </tr>
        <tr>
            <td>Line 1:</td>
            <td><%=shippingAddress.getLine1()%></td>
        </tr>
        <tr>
            <td>City:</td>
            <td><%=shippingAddress.getCity()%></td>
        </tr>
        <tr>
            <td>State:</td>
            <td><%=shippingAddress.getState()%></td>
        </tr>
        <tr>
            <td>Country Code:</td>
            <td><%=shippingAddress.getCountryCode()%></td>
        </tr>
        <tr>
            <td>Postal Code:</td>
            <td><%=shippingAddress.getPostalCode()%></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="Pay Now" />
            </td>
        </tr>    
    </table>
    </form>
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