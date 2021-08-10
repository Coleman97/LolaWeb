if(document.readyState == 'loading'){
	document.addEventListener('DOMContentLoaded', ready)
}else{
	ready()
}

function ready(){
 	 var removeCartItemButtons = document.getElementsByClassName('btn-danger')
	console.log(removeCartItemButtons)
	for(var i = 0; i < removeCartItemButtons.length; i++){
	var button = removeCartItemButtons[i]
	button.addEventListener('click', removeCartItem)
	}
	
	//var quantityInputs = document.getElementsByClassName('cart-quantity-input')
	///for(var i = 0; i < quantityInputs.length; i++){
		//var input = quantityInputs[i]
		//input.addEventListener('change', quantityChanged)
	//} 
	
}

function removeCartItem(event){
	var buttonClicked = event.target
		buttonClicked.parentElement.parentElement.parentElement.parentElement.remove()
		updateCartTotal()
}

function quantityChanged(event){
	var input = event.target
	if(isNaN(input.value) || input.value < 0){
		input.value = 1
	}
	updateCartTotal()
}

function updateCartTotal(){
	var cartItemContainer =  document.getElementsByClassName('cart-items')[0]
	//console.log(cartItemContainer)
	var cartRows = cartItemContainer.getElementsByClassName('cart-row')
	//console.log(cartRows)
	var subTotal = 0;
	var Tax = (6.25/100) * subTotal
	var total = 0
	var ProdName = document.getElementsByClassName('cartProd-name').innerText
	console.log(ProdName)
	for(var i = 0; i < cartRows.length; i++){
		var cartRow = cartRows[i]
		var priceElement = cartRow.getElementsByClassName('cart-price')[0]
		var quantityElement = cartRow.getElementsByClassName('cart-quantity-input')[0]
		var price = parseFloat(priceElement.innerText.replace('$', ''))
		var quantity =  quantityElement.value
		subTotal = subTotal + (price * quantity)
		console.log(subTotal)
		var Tax = (6.25/100) * subTotal
		total = subTotal + Tax
		}
		total = Math.round(total * 100) / 100
		document.getElementsByClassName('cart-Subtotal-price')[0].innerText = '$' + subTotal
		document.getElementsByClassName('cart-total-price')[0].innerText = '$' + total
		
		console.log(total)
}













