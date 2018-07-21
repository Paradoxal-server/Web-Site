<?php
/**
 * Created by PhpStorm.
 * User: Arisa
 * Date: 13/07/2018
 * Time: 16:22
 */

class C_Debug
{
    public function __construct()
    {

    }

    public function debug($var)
    {
        echo "<pre>";
            print_r($var);
        echo "</pre>";
    }

    public function __debugInfo()
    {

    }
}