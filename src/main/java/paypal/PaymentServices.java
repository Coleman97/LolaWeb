package paypal;

import java.util.ArrayList;
import java.util.List;

import com.paypal.api.payments.Amount;
import com.paypal.api.payments.Details;
import com.paypal.api.payments.Item;
import com.paypal.api.payments.ItemList;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payer;
import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.PaymentExecution;
import com.paypal.api.payments.RedirectUrls;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;

public class PaymentServices {
	private static final String CLIENT_ID = "AVFAW_xO_4bRpd3FRUUwtbsPok46Sl1YpSgsY35224lu71L3piElHKbxf9VJlmtdiULjUam84lSaQc3-";
	private static final String CLIENT_SECRET =  "EPgKi3x7hZpYKL7drx6hSxl1xn-_dzh6UkhDUuKzZmXj7gjqGnnS2RtetTEJCZAoFt3gXlB2DlAW3IuT";
	private static final String MODE = "sandbox";
	
	
	public String authorizePayment(OrderDetail orderDetail) throws PayPalRESTException {
		Payer payer = getPayerInformation();
		RedirectUrls redirectUrls = getRedirectUrls();
		List<Transaction> listTransaction = getTransactionInformation(orderDetail);
		
		Payment requestPayment = new Payment();
		requestPayment.setTransactions(listTransaction)
					  .setRedirectUrls(redirectUrls)
					  .setPayer(payer)
					  .setIntent("authorize");
		
		APIContext apiContext = new APIContext(CLIENT_ID,CLIENT_SECRET,MODE);
		Payment approvedPayment = requestPayment.create(apiContext);
		
		System.out.println(approvedPayment);
		
		return getApprovalLink(approvedPayment);
	}
	
	
	private String getApprovalLink(Payment approvedPayment) {
		List<Links> links = approvedPayment.getLinks();
		String approvalLink = null;
		
		for(Links link : links) {
			if(link.getRel().equalsIgnoreCase("approval_url")) {
				approvalLink = link.getHref();
			}
		}
		
		
		return approvalLink;
	}
	
	private List<Transaction> getTransactionInformation(OrderDetail orderDetail){
		Details details = new Details();
		details.setSubtotal(orderDetail.getSubTotal());
		details.setShipping("0");
		details.setTax(orderDetail.getTax());
		
		Amount amount = new Amount();
		amount.setCurrency("USD");
		amount.setTotal(orderDetail.getTotal());
		amount.setDetails(details);
		
		Transaction transaction = new Transaction();
		transaction.setAmount(amount);
		transaction.setDescription(orderDetail.getProductName() + " " + orderDetail.getQuantity());
		
		ItemList itemList = new ItemList();
		List<Item> items =  getItems(orderDetail);
		
		itemList.setItems(items);
		transaction.setItemList(itemList);
		
		List<Transaction> listTransaction = new ArrayList<Transaction>();
		listTransaction.add(transaction);
			

		return listTransaction;
	}
	
	private List<Item> getItems(OrderDetail orderDetail){
		List<Item> items =  new ArrayList<Item>();
		
		for(Item item : items) {
		item = new Item();
		item.setCurrency("USD")
			.setName(orderDetail.getProductName())
			.setPrice(orderDetail.getSubTotal())
			.setTax(orderDetail.getTax())
			.setQuantity(orderDetail.getQuantity());
		
		items.add(item);
		}	
		return items;
	}

	private RedirectUrls getRedirectUrls() {
		RedirectUrls redirectUrls =  new RedirectUrls();
		redirectUrls.setCancelUrl("http://localhost:8080/App/cancel.jsp");
		redirectUrls.setReturnUrl("http://localhost:8080/App/ReviewPayment.jsp");
		
		return redirectUrls;
	}


	public Payment getPaymentDetails(String paymentId) throws PayPalRESTException{
		APIContext apiContext = new APIContext(CLIENT_ID,CLIENT_SECRET,MODE);
		
		return Payment.get(apiContext, paymentId);
	}
	
	public Payment executePayment(String paymentId, String payerId) throws PayPalRESTException {
		PaymentExecution  paymentExecution = new PaymentExecution();
		paymentExecution.setPayerId(payerId);
		
		Payment payment =  new Payment().setId(paymentId);
		
		APIContext apiContext = new APIContext(CLIENT_ID,CLIENT_SECRET,MODE);
		
		return payment.execute(apiContext, paymentExecution);
	}
	
	private Payer getPayerInformation() {
		Payer payer = new Payer();
		payer.setPaymentMethod("paypal");
		
		PayerInfo payerInfo = new PayerInfo();
		payerInfo.setFirstName("Cole")
				 .setLastName("Tobby")
				 .setEmail("tobbycole12@gmail.com");
		
		payer.setPayerInfo(payerInfo);
		
		return payer;
	}
}
