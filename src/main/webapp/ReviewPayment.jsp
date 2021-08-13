<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import ="paypal.PaymentServices"%>
<%@page import ="com.paypal.api.payments.Payment"%>
<%@page import ="com.paypal.api.payments.PayerInfo"%>
<%@page import ="com.paypal.api.payments.Transaction"%>
<%@page import ="com.paypal.api.payments.ShippingAddress"%>
<%

String paymentId = request.getParameter("paymentId");
String payerId = request.getParameter("PayerID");

try{
	PaymentServices paymentServices = new PaymentServices();
	Payment	payment = paymentServices.getPaymentDetails(paymentId);
	
	PayerInfo payerInfo =  payment.getPayer().getPayerInfo();
	Transaction transaction = payment.getTransactions().get(0);
	ShippingAddress shippingAddress = transaction.getItemList().getShippingAddress();
	
	request.setAttribute("payer", payerInfo);
	request.setAttribute("transaction", transaction);
	request.setAttribute("shippingAddress", shippingAddress);
	
	String url ="review.jsp?paymentId=" + paymentId + "&PayerID=" + payerId;
	request.getRequestDispatcher(url).forward(request,response);
	
}catch(Exception e){
	e.printStackTrace();
	request.setAttribute("errorMessage", "Invalid Payment Details!");
	request.getRequestDispatcher("error.jsp").forward(request,response);
}

%>