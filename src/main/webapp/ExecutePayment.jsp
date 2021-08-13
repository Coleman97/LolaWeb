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
	Payment payment = paymentServices.executePayment(paymentId, payerId);
	
	PayerInfo payerInfo =  payment.getPayer().getPayerInfo();
	Transaction transaction = payment.getTransactions().get(0);
	
	request.setAttribute("payer", payerInfo);
	request.setAttribute("transaction", transaction);
	
	request.getRequestDispatcher("reciept.jsp").forward(request,response);
}catch(Exception e){
	e.printStackTrace();
	request.setAttribute("errorMessage", "Could Not Execute Payment");
	request.getRequestDispatcher("error.jsp").forward(request,response);
}
%>