<?php
    /**
     * Created by PhpStorm.
     * User: Arisa
     * Date: 13/07/2018
     * Time: 15:22
     */

    //Imporationd es fichier

    require_once "classe/C_DataBase.php";
    require_once "classe/smarty/Smarty.class.php";
    require_once "classe/C_Debug.php";
    require "classe/MinecraftQuery.php";
    require "classe/MinecraftQueryException.php";

    use xPaw\MinecraftQuery;
    use xPaw\MinecraftQueryException;

    //Création des objet
    $Smarty = new Smarty();
    $DataBase = new C_DataBase();
    $Debug = new C_Debug();

    //Configuration de Smarty
    $Smarty->setTemplateDir("template/");
    //Ouverure de session
    session_start();

    //Connection BDD
    $bdd=$DataBase->login_database();
    if($bdd['error']==1)
    {
        $val_erorr = array();
        $val_erorr['erreur'] = $bdd['msg'];

        $Smarty->assign("val",$val_erorr);
        try {
           $Smarty->display("error/error.tpl");
        } catch (SmartyException $e) {
            echo $e->getMessage();
        }

    }
    $var_base = $DataBase->get_var_web();

    if(isset($_GET['page'])) {
        if($_GET['page'] =="web_espace.tpl")
        {
            if(isset($_SESSION['id']))
            {
                header("Location:index.php");
            }
            $var_index = array();
            $var_user = array();

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
                $var_user['id'] = $_SESSION['id'];
            }

            $var_index['title_page'] = "Connection/Inscription | " . $var_base['Title'];
            $var_index['title'] = $var_base['Title'];

            $var_msg = array();
            $var_msg['heading'] = "Bienvenu sur  le serveur ".$var_base['Title'];
            $var_msg['body'] =  "Bonjour à tous et merci de venir voir le site du serveur paradoxal<br>Un serveur moddé avec 59 mods, fait par des amis qui aime minecraft entre amis";
            $var_index['msg'] = $var_msg;

            $Smarty->assign("val", $var_index);
            $Smarty->assign("paget","espace.tpl");
            $Smarty->display("web_index.tpl");
        }
        else if($_GET['page'] == "web_play.tpl")
        {
            $var_index = array();
            $var_user = array();

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
                $var_user['id'] = $_SESSION['id'];
            }

            $var_index['title_page'] = "Rejoindre le serveur | " . $var_base['Title'];
            $var_index['title'] = $var_base['Title'];

            $var_msg = array();
            $var_msg['heading'] = "Bienvenu sur  le serveur ".$var_base['Title'];
            $var_msg['body'] =  "Bonjour à tous et merci de venir voir le site du serveur paradoxal<br>Un serveur moddé avec 59 mods, fait par des amis qui aime minecraft entre amis";
            $var_index['msg'] = $var_msg;
            $var_index['user'] = $var_user;
            $Smarty->assign("val", $var_index);
            $Smarty->assign("paget","play.tpl");
            $Smarty->display("web_index.tpl");
        }
        else if($_GET['page'] == "web_menbre.tpl")
        {
            $var_index = array();
            $var_user = array();

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
                $var_user['id'] = $_SESSION['id'];
            }

            $var_index['title_page'] = "Liste des menbres | " . $var_base['Title'];
            $var_index['title'] = $var_base['Title'];

            $var_msg = array();
            $var_msg['heading'] = "Bienvenu sur  le serveur ".$var_base['Title'];
            $var_msg['body'] =  "Bonjour à tous et merci de venir voir le site du serveur paradoxal<br>Un serveur moddé avec 59 mods, fait par des amis qui aime minecraft entre amis";

            $var_player = array();
            $player_list= $DataBase->get_List_Menbre();
            $var_player['count'] = count($player_list)+1;
            foreach ($player_list as $item)
            {
                $var_player['id-'.$item['id']]= $item['id'];
                $var_player['Pseudo-'.$item['id']]= $item['Pseudo'];
                $var_player['uuid-'.$item['id']]= $item['uuid'];
                $var_player['Metier-'.$item['id']]= $item['Metier'];
                $world_player = $DataBase->get_world_nam($item['id']);
                $var_player['idworld-'.$world_player['id']] = $world_player['id'];
                $var_player['Name-'.$world_player['id']] = $world_player['Name'];
            }

            $var_index['msg'] = $var_msg;
            $var_index['user'] = $var_user;
            $var_index['player'] = $var_player;

            //$Debug->debug($var_index);
            $Smarty->assign("val", $var_index);
            $Smarty->assign("paget","menbre.tpl");
            $Smarty->display("web_index.tpl");
        }
        else if($_GET['page'] == "web_world.tpl")
        {
            if(isset($_GET['id']) && !empty($_GET['id']))
            {
                $securint = intval($_GET['id']);
                $world = $DataBase->get_world_nam($securint);
                $owner_List = array();
                $getowner = $DataBase->get_World_By_id_World_user($securint);
                $y=1;
                $world['idguest'] = 0;


                $count = count($getowner);

                foreach ($getowner as $owner)
                {
                    $owner_List['pseudo-'.$y] = $owner['Pseudo'];
                    $owner_List['count'] = $count;
                    $y++;
                }

                $var_index = array();
                $var_index['title_page'] = "Monde : ".$world['Name']."| " . $var_base['Title'];
                $var_index['title'] = $var_base['Title'];

                $var_index['serveur'] = $var_serveur;

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
                    $var_user['id'] = $_SESSION['id'];
                    $idwordguest = $DataBase->get_id_world_by_id_user($_SESSION['id']);
                    $world['idguest'] = $idwordguest['id_world'];

                }


                $var_index['word'] = $world;
                $var_index['user'] = $var_user;
                $var_index['new'] = $val_new;
                $var_index['worldinfo']  = $owner_List;
              //  $Debug->debug($var_index);

                $var_msg = array();
                $var_msg['heading'] = "Bienvenu sur  le serveur ".$var_base['Title'];
                $var_msg['body'] =  "Bonjour à tous et merci de venir voir le site du serveur paradoxal<br>Un serveur moddé avec 59 mods, fait par des amis qui aime minecraft entre amis";
                $var_index['msg'] = $var_msg;
                $Smarty->assign("val", $var_index);
                $Smarty->assign("paget","world.tpl");
                $Smarty->display("web_index.tpl");
            }
        }
        else if($_GET['page'] == "web_staff.tpl")
        {
            $var_index = array();
            $var_index['title_page'] = "Staff | " . $var_base['Title'];
            $var_index['title'] = $var_base['Title'];

            $var_user['connect'] = -1;
            if (isset($_SESSION['id'])) {
                $json = file_get_contents('https://api.mojang.com/users/profiles/minecraft/' . $_SESSION['pseudo']);
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
                $var_user['id'] = $_SESSION['id'];

            }
            $var_index['user'] = $var_user;
            $var_msg = array();
            $var_msg['heading'] = "Bienvenu sur  le serveur " . $var_base['Title'];
            $var_msg['body'] = "Bonjour à tous et merci de venir voir le site du serveur paradoxal<br>Un serveur moddé avec 59 mods, fait par des amis qui aime minecraft entre amis";
            $var_index['msg'] = $var_msg;
            $Smarty->assign("val", $var_index);
            $Smarty->assign("paget", "staff.tpl");
            $Smarty->display("web_index.tpl");
        }
        else if($_GET['page'] == "web_rules.tpl")
        {
            $var_index = array();
            $var_index['title_page'] = "Régles | " . $var_base['Title'];
            $var_index['title'] = $var_base['Title'];
            $var_user['connect'] = -1;
            if (isset($_SESSION['id'])) {
                $json = file_get_contents('https://api.mojang.com/users/profiles/minecraft/' . $_SESSION['pseudo']);
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
                $var_user['id'] = $_SESSION['id'];

            }
            $var_index['user'] = $var_user;
            $var_msg = array();
            $var_msg['heading'] = "Bienvenu sur  le serveur " . $var_base['Title'];
            $var_msg['body'] = "Bonjour à tous et merci de venir voir le site du serveur paradoxal<br>Un serveur moddé avec 59 mods, fait par des amis qui aime minecraft entre amis";
            $var_index['msg'] = $var_msg;
            $Smarty->assign("val", $var_index);
            $Smarty->assign("paget", "rules.tpl");
            $Smarty->display("web_index.tpl");
        }
        else if($_GET['page'])
        {
            if(isset($_SESSION['id']))
            {
                header("Location: panel_user/index.php");
            }
            else
            {
                header("Location: index.php");
            }
        }
        else
        {
            $val_erorr = array();
            $val_erorr['erreur'] = "Page non trouver";

            $Smarty->assign("val",$val_erorr);
            try {
                $Smarty->display("template/error/error.tpl");
            } catch (SmartyException $e) {
                echo $e->getMessage();
            }
        }
    }
    else
    {
        $var_index = array();
        $var_serveur = array();
        $var_user = array();
        $var_index['title_page'] = "Accueil | " . $var_base['Title'];
        $var_index['title'] = $var_base['Title'];

        $var_serveur = array();

        //serveur
        $MC_Query = new MinecraftQuery();

        try {
            $MC_Query->Connect($var_base['addr_server'], $var_base['port_serrver']);
            $MC_Info = $MC_Query->GetInfo();
            $MC_Player = $MC_Query->GetPlayers();
            $var_serveur['server'] = 1;
            $var_serveur['max_Player'] = $MC_Info['MaxPlayers'];

            $var_serveur['player_online'] = $MC_Info['Players'];
            $percentage = ($MC_Info['Players'] * 100) / $MC_Info['MaxPlayers'];
            $var_serveur['percentage'] = $percentage;
        } catch (MinecraftQueryException $e) {
            $var_serveur['server'] = -1;
        }
        $val_new = array();
        //new
        $var_new = $DataBase->get_news();
        for ($i = 0; $i <= 1; $i++) {
            $autohor = $var_new[$i]["Author"];

            $rang = $DataBase->get_rang($autohor);
            $phrase_auteur = "Auteur: " . $autohor . " - " . $rang["Non_du_rang"];

            $val_new['author-' . $i] = $phrase_auteur;
            $val_new['date-' . $i] = $var_new[$i]["date"];
            $val_new['title-' . $i] = $var_new[$i]["Message_Title"];
            $val_new['message-' . $i] = $var_new[$i]["Message"];
        }


        $var_index['serveur'] = $var_serveur;

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
            $var_user['id'] = $_SESSION['id'];
        }



        $var_index['user'] = $var_user;
        $var_index['new'] = $val_new;
        $var_msg = array();
        $var_msg['heading'] = "Bienvenu sur  le serveur ".$var_base['Title'];
        $var_msg['body'] =  "Bonjour à tous et merci de venir voir le site du serveur paradoxal<br>Un serveur moddé avec 59 mods, fait par des amis qui aime minecraft entre amis";
        $var_index['msg'] = $var_msg;
        $Smarty->assign("val", $var_index);
        $Smarty->assign("paget","home.tpl");
        $Smarty->display("web_index.tpl");
    }