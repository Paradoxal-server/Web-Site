<?php
/**
 * Created by PhpStorm.
 * User: Arisa
 * Date: 21/07/2018
 * Time: 13:31
 */
require_once "../classe/C_DataBase.php";
require_once "../classe/C_Debug.php";
session_start();
$Database = new C_DataBase();
$Debug = new C_Debug();

$Database->login_database();

if(!empty($_POST['pseudoConf']))
{
    $pseudo = htmlspecialchars($_POST['pseudoConf']);
    $user = $Database->get_user_info_security_by_id($_SESSION['id']);
    if($pseudo == $user['Pseudo'])
    {
        $Database->delete_user($_SESSION['id']);
        session_destroy();
        echo "            swal({
            title: \"Modification\",
            text: \"Modification effectuez\",
            type: \"success\",
            timer: 2000,
            confirmButtonText:\"Ok\",
            showConfirmButton: false
            }).then(function() {
                window.location = \"../index.php\";
            });";

    }
    else
    {
        echo 'swal("Erreur!", "Votre pseudo est refusée!", "error");';
    }

}