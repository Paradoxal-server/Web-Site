<?php
    /**
     * Created by PhpStorm.
     * User: Arisa
     * Date: 21/07/2018
     * Time: 11:14
     */

    require_once "../classe/C_DataBase.php";
    require_once "../classe/smarty/Smarty.class.php";
    require_once "../classe/C_Debug.php";

    $Smarty = new Smarty();
    $DataBase = new C_DataBase();
    $Debug = new C_Debug();

    $Smarty->setTemplateDir("template/");
    //Ouverure de session
    session_start();

    //Connection BDD
    $DataBase->login_database();
    $var_base = $DataBase->get_var_web();
    $var_index = array();
    $var_user = array();
    $var_index['title_page'] = "Panel Uitlisateur | " . $var_base['Title'];
    $var_index['title'] = $var_base['Title'];

    $var_user['connect'] = -1;
    if(isset($_SESSION['id']))
    {
        $json = file_get_contents('https://api.mojang.com/users/profiles/minecraft/'.$_SESSION['pseudo']);
        if (!empty($json)) {
            $data = json_decode($json, true);
            if (is_array($data) and !empty($data)) {
                $var_user["uuid"] = $data['id'];

            }
        }

        $var_user['connect'] = 1;
        $var_user['pseudo'] = $_SESSION['pseudo'];
        $rang_info = $DataBase->get_rang($_SESSION['pseudo']);
        $var_user['Permission'] = $rang_info['Permission'];
        $var_user['NameRang'] = $rang_info['Non_du_rang'];
        $var_user['id'] = $_SESSION['id'];
    }

    $word = $DataBase->get_id_world_by_id_user($_SESSION['id']);
    $wordname = $DataBase->get_world_nam($word['id_world']);

    $var_index['word'] = $wordname['Name'];
    $var_index['user'] = $var_user;
    $Smarty->assign("val", $var_index);
try {
    $Smarty->display("dashbord.tpl");
} catch (SmartyException $e) {
    echo $e->getMessage();
}

