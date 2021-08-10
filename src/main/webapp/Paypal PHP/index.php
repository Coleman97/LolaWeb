<?php 
// Include configuration file 
include_once 'config.php'; 
 
// Include database connection file 
include_once 'dbConnect.php'; 
?>

<div class="container">
    <?php 
        // Fetch products from the database 
        $results = $db->query("SELECT * FROM products WHERE status = 1"); 
        while($row = $results->fetch_assoc()){ 
    ?>
        <div class="pro-box">
            <img src="images/<?php echo $row['image']; ?>"/>
            <div class="body">
                <h5><?php echo $row['name']; ?></h5>
                <h6>Price: <?php echo '$'.$row['price'].' '.'USD'; ?></h6>
				
                <!-- PayPal payment form for displaying the buy button -->
                <form action="<?php echo 'https://www.sandbox.paypal.com/cgi-bin/webscr'; ?>" method="post">

                    <!-- Identify your business so that you can collect the payments. -->
                    <input type="hidden" name="business" value="<?php echo 'sb-5qzsx6843349@business.example.com'; ?>">
					
                    <!-- Specify a Buy Now button. -->
                    <input type="hidden" name="cmd" value="_xclick">

                    <input type="hidden" name="notify_url" value="<?php echo 'http://localhost:8082/Paypal PHP/ipn.php'; ?>">
     
                    <!-- Specify details about the item that buyers will purchase. -->
                    <input type="hidden" name="item_name" value="<?php echo $row['name']; ?>">
                    <input type="hidden" name="item_number" value="<?php echo $row['id']; ?>">
                    <input type="hidden" name="amount" value="<?php echo $row['price']; ?>">
                    <input type="hidden" name="currency_code" value="<?php echo 'USD'; ?>">
					
                    <!-- Specify URLs -->
                    <input type="hidden" name="return" value="<?php echo 'http://localhost:8082/Paypal PHP/success.php'; ?>">
                    <input type="hidden" name="cancel_return" value="<?php echo 'http://localhost:8082/Paypal PHP/cancel.php'; ?>">
					
                    <!-- Display the payment button. -->
                    <input type="image" name="submit" border="0" src="https://www.paypalobjects.com/en_US/i/btn/btn_buynow_LG.gif">
                </form>
            </div>
        </div>
    <?php } ?>
</div>

     