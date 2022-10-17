<?php
require_once './libs/smarty-4.2.1/libs/Smarty.class.php';

class TipoPropiedadView{
    
    private $smarty;

    function __construct(){
        $this->smarty = new Smarty();
    }

    function mostrarDetallesFormModif($detalleTipoPropiedad){
        $this->smarty->assign('detalleTipoPropiedad', $detalleTipoPropiedad[0]);
        $this->smarty->display('../templates/form.modificar.categoria.tpl');
    }

    function mostrarTipoPropiedad($tiposPropiedad, $error){
        $this->smarty->assign('error', $error);
        $this->smarty->assign('tiposPropiedad', $tiposPropiedad);
        $this->smarty->display('../templates/form_alta.tpl');     
    }

    function mostrarListaTiposPropiedad($tiposPropiedad, $error){
        $this->smarty->assign('tiposPropiedad', $tiposPropiedad);
        $this->smarty->assign('error', $error);        
        $this->smarty->display('../templates/tipos.propiedad.tpl');
    }

    function mostrarItemsCategoria($itemsCategoria){
       
        $this->smarty->assign('itemsCategoria', $itemsCategoria);
        $this->smarty->display('../templates/detalle.items.categoria.tpl');
    }
    function mostrarError($msg){
        echo "<h1>ERROR</h1>";
        echo "<h2>$msg</h2>";
    }
}