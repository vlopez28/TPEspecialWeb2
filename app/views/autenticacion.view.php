<?php
require_once './libs/smarty-4.2.1/libs/Smarty.class.php';

class AutenticacionView{
    private $smarty;

    function __construct(){
        $this->smarty = new Smarty();
    }
    
    function verFormAcceso($error = null){
        $this->smarty->assign('error', $error);
        $this->smarty->display('templates/form_acceso.tpl');
    }


}