<?php

require_once('connectdb.php');

$result = array('error'=>false);
$action = '';

if(isset($_GET['action'])){
    $action = $_GET['action']; // get action value in url
}
if($action=='read'){
    $sql = $conn->query("SELECT * FROM position");
    $positions = array();
    while($row = $sql->fetch_assoc()){
        array_push($positions,$row);
    }
    $result['positions'] = $positions; 
}

//echo json_encode($result);
/*
if($action=='create'){ // article id needed in database, sepoarate firstlibelle from lastlibelle
    $libelle = $_POST['libelle'];
    $prixVente = $_POST['prixVente'];
    $prixAchat = $_POST['prixAchat'];
    $categorie = $_POST['categorie'];
    $ajouterArticle = $conn->query("INSERT INTO positionstock (libelle, prixVente, prixAchat, categorie)
    VALUES('$libelle', '$prixVente','$prixAchat', '$categorie')");  // *important de preciser l'ordre. positionstock (libelle, prixVente, prixAchat, category)
   

    if($ajouterArticle){
        $result['message'] = "Article ajouté avec succes";
    }
    else{
        $result['error'] = true;
        $result['message'] = "Echec l'article n'a pas été ajouté";
    }
}


if($action=='update'){ // article id needed in database, sepoarate firstlibelle from lastlibelle
    $idpositions=$_POST['idpositions'];
    $libelle = $_POST['libelle'];
    $prixVente = $_POST['prixVente'];
    $prixAchat = $_POST['prixAchat'];
    $categorie = $_POST['category'];
   
    
    //$idpositions= $conn->query("SELECT idpositions from positionstock where libelle='$libelle'");
    $modifierArticle = $conn->query("UPDATE positionstock SET
    libelle='$libelle', prixVente= '$prixVente',prixAchat='$prixAchat', category='$categorie' WHERE idpositions='$idpositions'");
   
    if($modifierArticle){
        $result['message'] = "Article modifié avec succes";
        var_dump( $modifierArticle);
    }
    else{
        $result['error'] = true;
        $result['message'] = "Echec l'article n'a pas été modifié";
    }
    
}

if($action=='delete'){ // article id needed in database, sepoarate firstlibelle from lastlibelle
    $idpositions = $_POST['idpositions'];
   
    $supprimmerArticle = $conn->query("DELETE FROM positionstock WHERE idpositions='$idpositions'"); 
   

    if($modifierArticle){
        $result['message'] = "Article supprimé avec succes";
    }
    else{
        $result['error'] = true;
        $result['message'] = "Echec l'article n'a pas été supprimé";
    }
}
*/
echo json_encode($result);



?>