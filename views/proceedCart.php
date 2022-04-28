<HTML>
<head>
</head>
<body>
<?PHP
include "../core/OrderC.php";
if (isset($_POST['cid']) and isset($_POST['OED']) and isset($_POST['CORD'])){
$OrderC= new OrderC();
$CartC=new CartC();
$result=$CartC->displayIPCarts();
foreach($result as $row)
{
	$id_produit=$row['id_produit'];
	$Qty=$row['Qty'];
	$Prix=$row['Prix'];
	$Order=new Order($_POST['cid'],$id_produit,$Qty,$Prix,$_POST['CORD'],$_POST['OED'],'En attente');
	$OrderC= new OrderC();
	$OrderC->addOrder($Order);
}
$CartC= new CartC();
echo $_POST['proceedIP'];
	$CartC->deleteCart($_POST['proceedIP']);
	header('Location: order.php');
}

?>
</body>
</HTMl>
