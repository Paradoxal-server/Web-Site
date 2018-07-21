<?php
/**
 * Created by PhpStorm.
 * User: Arisa
 * Date: 14/07/2018
 * Time: 12:39
 */
session_start();
session_destroy();
header("Location:index.php");