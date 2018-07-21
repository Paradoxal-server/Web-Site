<?php
/**
 * Created by PhpStorm.
 * User: Arisa
 * Date: 14/07/2018
 * Time: 11:49
 */
session_start();
require_once "classe/C_DataBase.php";
require_once "classe/C_Debug.php";

$Database = new C_DataBase();
$Debug = new C_Debug();

$Database->login_database();


 if(!empty($_POST['pseudo_insc']) AND !empty($_POST['mdp_insc']) AND !empty($_POST['mdp_insc_conf']) AND !empty($_POST['email_insc']) AND !empty($_POST['email_insc_conf']))
 {
     $pseudo = htmlspecialchars($_POST['pseudo_insc']);
     $email = htmlspecialchars($_POST['email_insc']);
     $email2 = htmlspecialchars($_POST['email_insc_conf']);
     $mdp = sha1($_POST['mdp_insc']);
     $dmp1 = sha1($_POST['mdp_insc_conf']);

     $pseudo = str_replace(" ","",$pseudo);
     if(strlen($pseudo) != 0) {
         if (strlen($pseudo) < 256) {
             $json = file_get_contents('https://api.mojang.com/users/profiles/minecraft/'.$pseudo);
             if (!empty($json)) {
                 $data = json_decode($json, true);
                 if (is_array($data) and !empty($data)) {
                     if ($mdp == $dmp1) {
                         if ($email == $email2) {
                             if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
                                 $rzep = $Database->get_exit_user_and_email($pseudo, $email);
                                 if ($rzep == 0) {
                                     $Database->insert_mbr($pseudo, $mdp, $email);
                                     echo '
                                        swal("Bravo!", "Votre compte à été crée!", "success")
                                        .then((value) => {
                                          $(location).attr("href", "index.php?page=web_espace.tpl")
                                        });
                                 ';
                                 } else {
                                     echo 'swal("Erreur!", "Pseudo ou Addresse Email deja utiliser!", "error");';
                                 }
                             } else {
                                 echo 'swal("Erreur!", "Votre addresse email ne sont valide!", "error");';
                             }
                         } else {
                             echo 'swal("Erreur!", "Vos addresse email ne sont pas identique!", "error");';
                         }
                     } else {
                         echo 'swal("Erreur!", "Vos mot de passe ne sont pas identique!", "error");';
                     }
                 } else {
                     echo 'swal("Erreur!", "API de Mojang est actuelement en Panne", "error");';
                 }
             } else {
                 echo 'swal("Erreur!", "Votre pseudo est pas enregister sur les services Mojang!", "error");';
             }
         } else {
             echo 'swal("Erreur!", "Votre pseudo ne doit pas dépasser 255 caractères!", "error");';
         }
     }else {
         echo 'swal("Erreur!", "Votre pseudo est invalide!", "error");';
     }

 }
 else
 {
     $pseudo = htmlspecialchars($_POST['pseudo_insc']);
     $email = htmlspecialchars($_POST['email_insc']);
    // header("Location:index.php?page=web_espace.tpl&bug=1&pseudo=".$pseudo."&email=".$email);
     echo 'swal("Erreur!", "Tout les champs ne sont pas remplie!", "error");';
 }

