<?php
require_once './app/views/tipo.propiedad.view.php';
require_once './app/models/tipo.propiedad.model.php';
require_once './app/helpers/auth.helper.php';

class TipoPropiedadController{

    private $model;
    private $view;
    private $authHelper;

    function __construct(){
        $this->model = new TipoPropiedadModel();
        $this->view = new TipoPropiedadView();
        $this->authHelper = new AuthHelper();
    }
    //ver error cuando borra categoria si items asociados dice que hay una session start
    function borrarCategoria($id){
       $this->authHelper->estaLogueado();
        try{
            $this->model->eliminarCategoria($id);
            $this->listarTiposPropiedad();
        } catch(Exception $e){
            $tiposPropiedad = $this->model->obtenerTiposPropiedad();
            $this->view->mostrarListaTiposPropiedad($tiposPropiedad, "Existen propiedades asociadas a esta categoria.
            Borre las mismas e intente nuevamente"); 
        }
        
    }
    //ver mismo error que al borrar
    function insertarCategoria(){
        $this->authHelper->estaLogueado();
        if(!empty($_REQUEST['tipo'])){ 
            $tipo_propiedad = $_REQUEST['tipo'];  
            $id_tipo_propiedad = $this->model->insertarTipoPropiedad($tipo_propiedad);
            $this->listarTiposPropiedad();   
        } else{
            $tiposPropiedad = $this->model->obtenerTiposPropiedad();
            $this->view->mostrarListaTiposPropiedad($tiposPropiedad, "Ingrese la categoria"); 
        }
    }

    function mostrarFormModificarCategoria($id){
        $this->authHelper->estaLogueado();
        $detalleTipoPropiedad = $this->model->obtenerDetalleTipoPropiedad($id);
        $this->view->mostrarDetallesFormModif($detalleTipoPropiedad);
    }

    function modificarCategoria($id){
        $this->authHelper->estaLogueado();
        if(!empty($_REQUEST['tipo'])){ 
            $tipo_propiedad = $_REQUEST['tipo'];  
            
            $id_tipo_propiedad = $this->model->modificarTipoPropiedad($tipo_propiedad, $id);
            $this->listarTiposPropiedad();
            
        } else{
            $this->view->mostrarError('Faltan datos obligatorios');
            die();
        }
    }

    function verItemsCategorias($id){
        $itemsCategoria = $this->model->obtenerItemsCategoria($id);
        if(!empty($itemsCategoria)){
            $this->view->mostrarItemsCategoria($itemsCategoria);
        }
        else{
            $this->view->mostrarError('No hay propiedades de este tipo');
            die();
        } 
    }

    function listarTiposPropiedad(){
        $this->authHelper->verificarSesion();
        $tiposPropiedad = $this->model->obtenerTiposPropiedad();
        $this->view->mostrarListaTiposPropiedad($tiposPropiedad, null);        
    }

    function verTiposPropiedad(){
        $tiposPropiedad = $this->model->obtenerTiposPropiedad();
        $this->view->mostrarTipoPropiedad($tiposPropiedad, null);
    }
}