<?php
require_once './libs/smarty-4.2.1/libs/Smarty.class.php';

class PropiedadView{

    private $smarty;

    function __construct(){
        $this->smarty = new Smarty();
    }

    function mostrarDetallesForm($detallesItem, $tiposPropiedad){        
        $this->smarty->assign('detalleForm', $detallesItem[0]);
        $this->smarty->assign('tiposPropiedad', $tiposPropiedad);
        $this->smarty->display('../templates/form_modificar.tpl');
    }

    function verDetalle($detallesItem){
        $this->smarty->assign('detalles', $detallesItem);
        $this->smarty->display('../templates/detalle.propiedad.tpl');
    }
    function mostrarPropiedades($propiedades){
        $this->smarty->assign('propiedades', $propiedades);
        $this->smarty->display('../templates/tabla.propiedades.tpl');     
    }
    
    function mostrarError($msg){
        echo "<h1>ERROR</h1>";
        echo "<h2>$msg</h2>";
    }
}