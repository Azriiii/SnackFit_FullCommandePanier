<?PHP
    require_once "../config.php";
require "../entities/Cart.php";
class CartC {
function displayCart ($cart){
		echo "IP Adress: ".$cart->getADD_IP()."<br>";
		echo "Product ID: ".$cart->getid_produit()."<br>";
		echo "Quantity: ".$cart->getQty()."<br>";
	}
	
	function addCart($cart){
		$sql="insert into Panier (ADD_IP,id_produit,Qty,Prix) values (:ADD_IP, :id_produit,:Qty,:Prix)";
		$db = config::getConnexion();
		try{
        $req=$db->prepare($sql);
		
        $ADD_IP=$cart->getADD_IP();
        $id_produit=$cart->getid_produit();
        $Qty=$cart->getQty();
        $Prix=$cart->getPrix();
		$req->bindValue(':ADD_IP',$ADD_IP);
		$req->bindValue(':id_produit',$id_produit);
		$req->bindValue(':Qty',$Qty);
		$req->bindValue(':Prix',$Prix);
            $req->execute();
           
        }
        catch (Exception $e){
            echo 'Erreur: '.$e->getMessage();
        }
		
	}
	
	function displayCarts(){
		//$sql="SElECT * From cart e inner join formationphp.cart a on e.ADD_IP= a.ADD_IP";
		$sql="SElECT * From Panier order by ADD_IP";
		$db = config::getConnexion();
		try{
		$liste=$db->query($sql);
		return $liste;
		}
        catch (Exception $e){
            die('Erreur: '.$e->getMessage());
        }	
	}
	function displayIPCarts(){
		$ADD_IP=my_simple_crypt(getRealIpUser(), "e");
		//$sql="SElECT * From cart e inner join formationphp.cart a on e.ADD_IP= a.ADD_IP";
		$sql="SElECT * From Panier where ADD_IP='$ADD_IP'";
		$db = config::getConnexion();
		try{
		$liste=$db->query($sql);
		return $liste;
		}
        catch (Exception $e){
            die('Erreur: '.$e->getMessage());
        }	
	}
	function deleteCart($IP_AD){
		$sql="DELETE FROM Panier where ADD_IP= :ADD_IP";
		$db = config::getConnexion();
        $req=$db->prepare($sql);
		$req->bindValue(':ADD_IP',$IP_AD);
		try{
            $req->execute();
           // header('Location: index.php');
        }
        catch (Exception $e){
            die('Erreur: '.$e->getMessage());
        }
	}
	
	function deleteProdCart($ADD_IP,$id_produit){
		$sql="DELETE FROM Panier where ADD_IP= :ADD_IP and id_produit= :id_produit";
		$db = config::getConnexion();
        $req=$db->prepare($sql);
		$req->bindValue(':ADD_IP',$ADD_IP);
		$req->bindValue(':id_produit',$id_produit);
		try{
            $req->execute();
           // header('Location: index.php');
        }
        catch (Exception $e){
            die('Erreur: '.$e->getMessage());
        }
	}
	function updateCart($cart){
		$sql="UPDATE Panier SET Qty=:Qty, Prix=:Prix WHERE ADD_IP= :ADD_IP and id_produit= :id_produit";
		
		$db = config::getConnexion();
		//$db->setAttribute(PDO::ATTR_EMULATE_PREPARES,false);
try{		
        $req=$db->prepare($sql);
        $Qty=$cart->getQty();
				$Prix=$cart->getPrix();
				$ADD_IP=$cart->getADD_IP();
				$id_produit=$cart->getid_produit();
		
		$req->bindValue(':ADD_IP',$ADD_IP);
		$req->bindValue(':id_produit',$id_produit);
		$req->bindValue(':Qty',$Qty);
		$req->bindValue(':Prix',$Prix);
		
		
            $s=$req->execute();
			
           // header('Location: index.php');
        }
        catch (Exception $e){
            echo " Erreur ! ".$e->getMessage();
        }
		
	}
	function getCart($ADD_IP,$id_produit){
		$sql="SELECT * from Panier where ADD_IP= '$ADD_IP' and id_produit= '$id_produit'";
		$db = config::getConnexion();
		try{
		$liste=$db->query($sql);
		return $liste;
		}
        catch (Exception $e){
            die('Erreur: '.$e->getMessage());
        }
	}
	function countCart($ADD_IP){
		$sql="SELECT count(*)count from Panier where ADD_IP= '$ADD_IP'";
		$db = config::getConnexion();
		try{
		$liste=$db->query($sql);
		return $liste;
		}
        catch (Exception $e){
            die('Erreur: '.$e->getMessage());
        }
	}
}

?>
