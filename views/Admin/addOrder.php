<?PHP
include "../core/OrderC.php";


echo $_POST['CID'];
echo $_POST['PID'];
echo $_POST['Qty'];
echo $_POST['OED'];
if(isset($_POST['CID']) and isset($_POST['Qty']) and isset($_POST['PID']) and isset($_POST['OED']) and isset($_POST['CORD'])){

$prix=180*$_POST['Qty'];
$Order1=new Order($_POST['CID'],$_POST['PID'],$_POST['Qty'],$prix,$_POST['CORD'],$_POST['OED'],'En Attente');
//Partie2
/*
var_dump($employe1);
}
*/
//Partie3
$Order1C=new OrderC();
$Order1C->addOrder($Order1);
header('Location: tables-Orders.php');
	
}else{
	echo "verify the fields.";
}
//*/

?>
