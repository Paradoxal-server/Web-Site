<?php
/**
 * Created by PhpStorm.
 * User: Arisa
 * Date: 13/07/2018
 * Time: 15:28
 */

class C_DataBase
{
    private $M_BDD;

    public function __construct()
    {

    }

    public function login_database()
    {
        try{
            $this->M_BDD = new PDO("mysql:host=localhost;dbname=para","arisa","arisa");
        }catch (PDOException $e)
        {
            $error_bdd = array();
            $error_bdd['error'] = 1;
            $error_bdd['msg'] = "Erreur BDD";
            return $error_bdd;
        }
    }

    public function get_var_web()
    {
        $request = $this->M_BDD->prepare("SELECT * FROM var_web");
        $request->execute();
        return $request->fetch(PDO::FETCH_ASSOC);
    }

    public function get_news()
    {
        $request = $this->M_BDD->prepare("SELECT * FROM new order by date desc");
        $request->execute();
        return $request->fetchAll(PDO::FETCH_ASSOC);
    }

    public function get_rang($pseudo)
    {
        $request = $this->M_BDD->prepare("SELECT id_rang FROM user WHERE Pseudo=?");
        $request->execute(array($pseudo));
        $id = $request->fetch(PDO::FETCH_ASSOC);

        $rang_quest = $this->M_BDD->prepare("SELECT * FROM rang WHERE id=?");
        $rang_quest->execute(array($id['id_rang']));
        return $rang_quest->fetch(PDO::FETCH_ASSOC);;
    }

    public function get_exit_user($pseudo)
    {
        $request = $this->M_BDD->prepare("SELECT Pseudo FROM user WHERE Pseudo=?");
        $request->execute(array($pseudo));
        return $request->rowCount();
    }
    public function get_exit_user_and_email($pseudo,$email)
    {
        $request = $this->M_BDD->prepare("SELECT Pseudo FROM user WHERE Pseudo=? AND Email=?");
        $request->execute(array($pseudo,$email));
        return $request->rowCount();
    }

    public function get_user_info($pseudo)
    {
        $request = $this->M_BDD->prepare("SELECT Pseudo,Date_Connection,Date_Inscription,id_rang FROM user WHERE Pseudo=?");
        $request->execute(array($pseudo));
        return $request->fetch(PDO::FETCH_ASSOC);
    }
    public function get_user_info_security($pseudo)
    {
        $request = $this->M_BDD->prepare("SELECT * FROM user WHERE Pseudo=?");
        $request->execute(array($pseudo));
        return $request->fetch(PDO::FETCH_ASSOC);
    }

    public function get_id_info($pseudo,$id)
    {
        $request = $this->M_BDD->prepare("SELECT * FROM user WHERE Pseudo=? AND id=?");
        $request->execute(array($pseudo,$id));
        return $request->rowCount();
    }
    public function update($fiels,$val,$id)
    {
        $sql = "UPDATE user SET ".$fiels." = '".$val."' WHERE id=?";
        $request = $this->M_BDD->prepare($sql);
        $request->execute(array($id));
    }

    public function get_List_Menbre()
    {
        $request = $this->M_BDD->prepare("SELECT * FROM liste_menbre_du_serveur");
        $request->execute();
        return $request->fetchAll(PDO::FETCH_ASSOC);
    }

    public function insert_mbr($pseudo,$mdp,$email)
    {
        $request = $this->M_BDD->prepare("INSERT INTO user(Pseudo, Password, Email, Date_Inscription, Date_Connection, id_rang) VALUES (?,?,?,?,?,?)");
        $today = getdate();
        $date = $today['mday']."/".$today['mon']."/".$today['year'];

        $request->execute(array($pseudo,$mdp,$email,$date,$date,3));
    }

    public function cheeck_user($pseudo,$mdp)
    {
        $request = $this->M_BDD->prepare("SELECT * FROM user WHERE Pseudo=? AND Password=?");
        $request->execute(array($pseudo,$mdp));
        return $request->rowCount();
    }
    public function user_return_info($pseudo,$mdp)
    {
        $request = $this->M_BDD->prepare("SELECT * FROM user WHERE Pseudo=? AND Password=?");
        $request->execute(array($pseudo, $mdp));
        return $request->fetch(PDO::FETCH_ASSOC);
    }

    public function update_date($id)
    {
        $today = getdate();
        $date = $today['mday']."/".$today['mon']."/".$today['year'];
        $request = $this->M_BDD->prepare("UPDATE user SET Date_Connection=? WHERE id=?");
        $request->execute(array($date,$id));

    }

    public function get_world_nam($id)
    {
        $request = $this->M_BDD->prepare("SELECT * FROM world WHERE id=?");
        $request->execute(array($id));
        return $request->fetch(PDO::FETCH_ASSOC);
    }

    public function get_world_by_id($name)
    {
        $request = $this->M_BDD->prepare("SELECT * FROM world WHERE Name=?");
        $request->execute(array($name));
        return $request->fetch(PDO::FETCH_ASSOC);
    }

    public function get_world_list()
    {
        $request = $this->M_BDD->prepare("SELECT * FROM world");
        $request->execute();
        return $request->fetchAll(PDO::FETCH_ASSOC);
    }

    public function get_World_By_id_World_user($id)
    {
        $requets = $this->M_BDD->prepare("SELECT Pseudo FROM user WHERE id_world=?");
        $requets->execute(array($id));
        return $requets->fetchAll(PDO::FETCH_ASSOC);
    }
    public function get_id_world_by_id_user($id)
    {
        $request = $this->M_BDD->prepare("SELECT id_world FROM user WHERE id=?");
        $request->execute(array($id));
        return $request->fetch(PDO::FETCH_ASSOC);
    }
    public function __destruct()
    {
        $this->M_BDD = null;
    }

}