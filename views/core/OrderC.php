<?PHP
require_once "../core/CartC.php";
require_once "../entities/Order.php";
class OrderC {
	
	function addOrder($order){
        $sql="insert into Commande (id_client,id_produit,Qty,Prix,Cord,date_creation,date_expiration,etat_commande) values (:id_client,:id_produit,:Qty,:Prix,:Cord,SYSDATE(),:date_expiration,:etat_commande)";
		$db = config::getConnexion();
		try{
        $req=$db->prepare($sql);
		
        $id_client=$order->getid_client();
		$id_produit=$order->getid_produit();
        $Qty=$order->getQty();
		$Prix=$order->getPrix();
        $Cord=$order->getCord();
        $date_creation=$order->getdate_creation();
        $date_expiration=$order->getdate_expiration();
		$etat_commande=$order->getetat_commande();
		$req->bindValue(':id_client',$id_client);
		$req->bindValue(':id_produit',$id_produit);
		$req->bindValue(':Qty',$Qty);
		$req->bindValue(':Prix',$Prix);
        $req->bindValue(':Cord',$Cord);
		$req->bindValue(':date_expiration',$date_expiration);
		$req->bindValue(':etat_commande',$etat_commande);
		
            $req->execute();
           
        }
        catch (Exception $e){
            echo 'Erreur: '.$e->getMessage();
        }
		
	}
	
	function displayCosOrders($id_client){
		//$sql="SElECT * From order e inner join formationphp.order a on e.IP_ADD= a.IP_ADD";
		$sql="SElECT * From Commande where id_client='$id_client'";
		$db = config::getConnexion();
		try{
		$liste=$db->query($sql);
		return $liste;
		}
        catch (Exception $e){
            die('Erreur: '.$e->getMessage());
        }	
	}
	function displayOrders(){
		//$sql="SElECT * From order e inner join formationphp.order a on e.IP_ADD= a.IP_ADD";
		$sql="SElECT * From Commande order by id_client";
		$db = config::getConnexion();
		try{
		$liste=$db->query($sql);
		return $liste;
		}
        catch (Exception $e){
            die('Erreur: '.$e->getMessage());
        }	
	}
	function deleteOrder($id_commande){
		$sql="DELETE FROM Commande where id_commande= :id_commande";
		$db = config::getConnexion();
        $req=$db->prepare($sql);
		$req->bindValue(':id_commande',$id_commande);
		try{
            $req->execute();
           // header('Location: index.php');
        }
        catch (Exception $e){
            die('Erreur: '.$e->getMessage());
        }
	}
	
	
	function deleteCosOrder($id_client){
		$sql="DELETE FROM Commande where id_client= :id_client";
		$db = config::getConnexion();
        $req=$db->prepare($sql);
		$req->bindValue(':id_client',$id_client);
		try{
            $req->execute();
           // header('Location: index.php');
        }
        catch (Exception $e){
            die('Erreur: '.$e->getMessage());
        }
	}
	function updateOrder($order){
        $sql="UPDATE Commande SET Qty=:Qty, Prix=:Prix,Cord=:Cord, date_expiration=:date_expiration, etat_commande=:etat_commande WHERE id_commande= :id_commande";
		
		$db = config::getConnexion();
		//$db->setAttribute(PDO::ATTR_EMULATE_PREPARES,false);
try{		
        $req=$db->prepare($sql);
        $id_commande=$order->getid_commande();
		$Qty=$order->getQty();
		$Prix=$order->getPrix();
        $Cord=$order->getCord();
        $date_expiration=$order->getdate_expiration();
		$etat_commande=$order->getetat_commande();
		
		$req->bindValue(':id_commande',$id_commande);
		$req->bindValue(':Prix',$Prix);
        $req->bindValue(':Cord',$Cord);
		$req->bindValue(':Qty',$Qty);
		$req->bindValue(':date_expiration',$date_expiration);
		$req->bindValue(':etat_commande',$etat_commande);
		
		
            $s=$req->execute();
			
           // header('Location: index.php');
        }
        catch (Exception $e){
            echo " Erreur ! ".$e->getMessage();

        }
		
	}
	function getOrder($id_commande){
		$sql="SELECT * from Commande where id_commande= '$id_commande'";
		$db = config::getConnexion();
		try{
		$liste=$db->query($sql);
		return $liste;
		}
        catch (Exception $e){
            die('Erreur: '.$e->getMessage());
        }
	}
	
	function getOrderCID($id_commande){
		$sql="SELECT id_client from Commande where id_commande= '$id_commande'";
		$db = config::getConnexion();
		try{
		$liste=$db->query($sql);
		foreach($liste as $row)
		return $row['id_client'];
		}
        catch (Exception $e){
            die('Erreur: '.$e->getMessage());
        }
	}
	function getOrderPID($id_commande){
		$sql="SELECT id_produit from Commande where id_commande= '$id_commande'";
		$db = config::getConnexion();
		try{
		$liste=$db->query($sql);
		foreach($liste as $row)
		return $row['id_produit'];
		}
        catch (Exception $e){
            die('Erreur: '.$e->getMessage());
        }
	}
	
	function countOrdersDate($date){
		$sql="SELECT count(*) from Commande where date_creation='$date'";
		$db = config::getConnexion();
		try{
		$liste=$db->query($sql);
		foreach($liste as $row)
		return $row['count(*)'];
		}
        catch (Exception $e){
            die('Erreur: '.$e->getMessage());
        }
	}
	
	function getOrdersDate($date){
		$sql="SELECT * from Commande where date_creation='$date'";
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
