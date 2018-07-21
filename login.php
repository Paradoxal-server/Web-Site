<?php
/**
 * Created by PhpStorm.
 * User: Arisa
 * Date: 14/07/2018
 * Time: 12:22
 */
session_start();
require_once "classe/C_DataBase.php";
require_once "classe/C_Debug.php";

$Database = new C_DataBase();
$Debug = new C_Debug();

$Database->login_database();

if(!empty($_POST['pseudo_connect']) AND !empty($_POST['mdp_connect'])) {
    $pseudo  = htmlspecialchars($_POST['pseudo_connect']);
    $mdp  = sha1($_POST['mdp_connect']);

    $pseudo  = str_replace(" ","",$pseudo);

    if(strlen($pseudo) != 0)
    {
        $ex = $Database->cheeck_user($pseudo,$mdp);
        if($ex == 1)
        {
            $info = $Database->user_return_info($pseudo,$mdp);
            $Database->update_date($info['id']);
            $_SESSION['id']= $info['id'];
            $_SESSION['pseudo'] = $info['Pseudo'];
            $_SESSION['rang'] = $info['id_rang'];
            echo '
            swal({
            title: "Vous êtez connectez!",
            text: "vous allez redirigez dans 2s!",
            type: "success",
            timer: 2000,
            confirmButtonText:"Ok",
            showConfirmButton: false
            }).then(function() {
                window.location = "index.php";
            });
            ';
        }
        else
        {
            echo 'swal("Erreur!", "Votre pseudo ou mot de passe incorect", "error");';
        }
    }
    else
    {
        echo 'swal("Erreur!", "Votre pseudo est invalide!", "error");';
    }
}
else
{
    echo 'swal("Erreur!", "Tout les champs ne sont pas remplie!", "error");';
}