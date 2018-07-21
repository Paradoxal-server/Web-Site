<?php
/**
 * Created by PhpStorm.
 * User: Arisa
 * Date: 14/07/2018
 * Time: 12:39
 */
session_start();
session_destroy();

echo 'swal({title: "Vous êtez deconnectez!",text: "vous allez redirigez dans 2s!", type: "success",timer: 2000, confirmButtonText:"Ok", showConfirmButton: false}).then(function() { window.location = "index.php";});';