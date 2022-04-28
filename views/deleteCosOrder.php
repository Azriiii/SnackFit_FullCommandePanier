<?PHP
include "../core/OrderC.php";
$OrderC=new OrderC();
if (isset($_POST['deleteID'])){
	$OrderC->deleteOrder($_POST['deleteID']);
	header('Location: order.php');
}

?>
