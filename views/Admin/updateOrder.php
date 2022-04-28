<?php
require_once "../core/OrderC.php";

$OrderC=new OrderC();
if (isset($_POST['updateID']) and isset($_POST['Prix']) and isset($_POST['qty']) and isset($_POST['OED']) and isset($_POST['Status']) and isset($_POST['CORD'])){
	$Order=new Order(0,0,$_POST['qty'],$_POST['Prix']*$_POST['qty'],$_POST['CORD'],$_POST['OED'],$_POST['Status']);
	$Order->setid_commande($_POST['updateID']);
	$OrderC->updateOrder($Order);
	
	
	
	header('Location: tables-Orders.php');
}
?>
