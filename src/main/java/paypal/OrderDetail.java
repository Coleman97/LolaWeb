package paypal;


public class OrderDetail {
	private String ProductName;
	private String Quantity;
	private float subTotal;
	private float Total;
	private float Tax;


public OrderDetail(String productName, String quantity, String subTotal, String total, String tax) {
	super();
	ProductName = productName;
	Quantity = quantity;
	this.subTotal = Float.parseFloat(subTotal);
	Total = Float.parseFloat(total);
	Tax =Float.parseFloat(tax);
}


public String getProductName() {
		return ProductName;
	}

	public String getQuantity() {
		return Quantity;
	}

	public String getSubTotal() {
		return String.format("%.2f",subTotal);
	}

	public String getTotal() {
		return String.format("%.2f",Total);
	}

	public String getTax() {
		return String.format("%.2f",Tax);
	}

}