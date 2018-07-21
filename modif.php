<?php
/**
 * Created by PhpStorm.
 * User: Arisa
 * Date: 13/07/2018
 * Time: 20:58
 */
require_once "classe/C_DataBase.php";
require_once "classe/C_Debug.php";

$Database = new C_DataBase();
$Debug = new C_Debug();

if(isset($_SESSION['id']))
{
    if(!empty($_POST['pseudo'])){
        $pseudo = htmlspecialchars($_POST['pseudo']);
        $exi = htmlspecialchars($_GET['user']);
        $Database->login_database();
        $user = $Database->get_user_info_security($exi);
        $secu = str_replace(' ','',$pseudo);
        if(strlen($secu)>0) {
            if ($pseudo != $user['Pseudo']) {

                $Database->update("Pseudo", $pseudo, $user['id']);
                header("Location: index.php?page=web_profils.tpl&user=" . $exi);
            }
        }
        else
        {
            header("Location: index.php?page=web_profils.tpl&user=".$exi."&bug=2");
        }
    }
    if(!empty($_POST['email'])){
        $pseudo = htmlspecialchars($_POST['email']);
        $exi = htmlspecialchars($_GET['user']);
        $Database->login_database();
        $user = $Database->get_user_info_security($exi);
        if (filter_var($pseudo, FILTER_VALIDATE_EMAIL)) {
            if($pseudo != $user['Email'])
            {
                $Database->update("Email",$pseudo,$user['id']);
                header("Location: index.php?page=web_profils.tpl&user=".$exi);
            }
        }
        else
        {
            header("Location: index.php?page=web_profils.tpl&user=".$exi."&bug=3");
        }


    }
    if(!empty($_POST['password']) AND !empty($_POST['password_conf'])) {
        $exi = htmlspecialchars($_GET['user']);
        $Database->login_database();
        $user = $Database->get_user_info_security($exi);
        $password = sha1($_POST['password']);
        $password_conf = sha1($_POST['password_conf']);

        if ($password == $password_conf) {
            $Database->update("Password", $password, $user['id']);
             header("Location: index.php?page=web_profils.tpl&user=".$exi);
        } else {
            // header("Location: index.php?page=web_profils.tpl&user=".$exi."&bug=1");
        }
    }
}
else
{
    header("Location: index.php");
}
