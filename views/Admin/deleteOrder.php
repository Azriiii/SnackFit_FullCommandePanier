
<?php
require_once "../core/OrderC.php";

$OrderC=new OrderC();

if (isset($_POST['deleteID'])){	
	$OrderC->deleteOrder($_POST['deleteID']);
	header('Location: tables-Orders.php');
}
?>