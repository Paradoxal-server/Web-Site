<?php
/**
 * Created by PhpStorm.
 * User: Arisa
 * Date: 21/07/2018
 * Time: 12:57
 */
require_once "../classe/C_DataBase.php";
require_once "../classe/C_Debug.php";
session_start();
$Database = new C_DataBase();
$Debug = new C_Debug();

$Database->login_database();

if(isset($_SESSION['id']))
{
    if(!empty($_POST['pseudo'])) {
        $pseudo = htmlspecialchars($_POST['pseudo']);
        $user = $Database->get_user_info_security_by_id($_SESSION['id']);
        if($pseudo != $user['Pseudo'])
        {
            $json = file_get_contents('https://api.mojang.com/users/profiles/minecraft/'.$pseudo);
            if (!empty($json)) {
             echo '
            swal({
            title: "Modification",
            text: "Modification effectuez",
            type: "success",
            timer: 2000,
            confirmButtonText:"Ok",
            showConfirmButton: false
            }).then(function() {
                window.location = "index.php?page=profils";
            });
            ';
                $Database->update("Pseudo", $pseudo, $user['id']);
                $_SESSION['pseudo'] = $pseudo;
            }
            else
            {
                echo 'swal("Erreur!", "Votre pseudo est pas enregister sur les services Mojang!", "error");';
            }
        }
    }
    if(!empty($_POST['email'])) {
        $pseudo = htmlspecialchars($_POST['email']);
        $user = $Database->get_user_info_security_by_id($_SESSION['id']);
        if($pseudo != $user['Email'])
        {
            if (filter_var($pseudo, FILTER_VALIDATE_EMAIL)) {
                echo '
                swal({
                title: "Modification",
                text: "Modification effectuez",
                type: "success",
                timer: 2000,
                confirmButtonText:"Ok",
                showConfirmButton: false
                }).then(function() {
                    window.location = "index.php?page=profils";
                });
                ';
                $Database->update("Email", $pseudo, $user['id']);
            }
            else
            {
                echo 'swal("Erreur!", "Votre addresse email ne sont valide!", "error");';
            }
        }
    }

    if(!empty($_POST['password']))
    {
        $password = sha1($_POST['password']);
        $user = $Database->get_user_info_security_by_id($_SESSION['id']);
        if($password != $user['Password'])
        {
            echo '
                swal({
                title: "Modification",
                text: "Modification effectuez",
                type: "success",
                timer: 2000,
                confirmButtonText:"Ok",
                showConfirmButton: false
                }).then(function() {
                    window.location = "index.php?page=profils";
                });
                ';
            $Database->update("Password", $password, $user['id']);
        }
    }
}