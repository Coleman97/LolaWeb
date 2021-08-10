<?php 
/* 
 * PayPal and database configuration 
 */ 
  
// PayPal configuration 
define('PAYPAL_ID', 'sb-5qzsx6843349@business.example.com'); 
define('PAYPAL_SANDBOX', TRUE); //TRUE or FALSE 
 
define('PAYPAL_RETURN_URL', 'http://localhost:8080/Paypal PHP/success.php'); 
define('PAYPAL_CANCEL_URL', 'http://localhost:8080/Paypal PHP/cancel.php'); 
define('PAYPAL_NOTIFY_URL', 'http://localhost:8080/Paypal PHP/ipn.php'); 
define('PAYPAL_CURRENCY', 'USD'); 
 
// Database configuration 
define('DB_HOST', 'localhost:3308'); 
define('DB_USERNAME', 'root'); 
define('DB_PASSWORD', ''); //x-vh3tZ#KRFx0aii
define('DB_NAME', 'db_paymentgateway'); 
 
// Change not required 
define('PAYPAL_URL', (PAYPAL_SANDBOX == true)?"https://www.sandbox.paypal.com/cgi-bin/webscr":"https://www.paypal.com/cgi-bin/webscr");
?>