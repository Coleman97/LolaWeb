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

    var quantityInput = document.getElementsByClassName('cart-quantity-input')
    for(var i = 0; i < quantityInput.length; i++){
        var input = quantityInput[i]
        input.addEventListener('change', quantityChanged)
    }

    var addToCartButton = document.getElementsByClassName('shop-item-button')
    for(var i = 0; i < quantityInput.length; i++){
        var button = addToCartButton[i]
        button.addEventListener('click', addToCart)
    }
}

function quantityChanged(event){
    var input = event.target
    if(isNaN(input.value) || input.value <= 0){
        input.value = 1
    }
    updateCartTotal()
}

function removeCartItem(event){
    var buttonClicked = event.target
    buttonClicked.parentElement.parentElement.remove()
    updateCartTotal()
}

// function addToCartClicked(event){
//     var button = event.target
//     var shopItem = button.parentElement.parentElement 
//     var title = shopItem.getElementsByClassName('shop-item-title')[0].innerText
//     var price = shopItem.getElementsByClassName('shop-item-price')[0].innerText
//     // var imageSrc = shopItem.getElementsByClassName('shop-item-title').src
//     console.log(title,price)
// }

function updateCartTotal(){
    var cartItemContainer = document.getElementsByClassName('cart-items')[0]
    var cartRows = cartItemContainer.getElementsByClassName('cart-row')
    var total = 0
    for(var i = 0; i < cartRows.length; i++){
        var cartRow = cartRows[i]
        var priceElement = cartRow.getElementsByClassName('cart-price')[0]
        var quantityElement = cartRow.getElementsByClassName('cart-quantity-input')[0]
        var price = parseFloat(priceElement.innerText.replace('$', ''))
        var quantity = quantityElement.value
        total = total +(price * quantity)
    }
    total = Math.round(total * 100) / 100
    document.getElementsByClassName('cart-total-price')[0].innerText = '$' + total
}


function addToCart(){
    var cartRow =  document.createElement('div')
    var cartItems = document.getElementsByClassName('cart-items')[0]
        var cartRowContent = `
        <div class="cart-item cart-column">
        <img class="cart-item-image" src="images/Lola Floral Ruffle cut out dress.jpeg" width="100" height="100">
        <span class="cart-item-title">Lola Floral Ruffle Cut Out Dress</span>
        </div>
        <span class="cart-price cart-column">$50.00</span>
        <div class="cart-quantity cart-column">
        <input class="cart-quantity-input" type="number" value="1">
        <button class="botton btn-danger" type="button">REMOVE</button>
        </div>`
    cartRow.innerHTML = cartRowContent
    cartItems.append(cartRow)
      
}