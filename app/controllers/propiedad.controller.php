<?php
require_once './app/models/propiedad.model.php';
require_once './app/views/propiedad.view.php';
require_once './app/models/tipo.propiedad.model.php';
require_once './app/views/tipo.propiedad.view.php';
require_once './app/helpers/auth.helper.php';

class PropiedadController{

    private $model;
    private $view;
    private $tipoPropiedadModel;
    private $tipoPropiedadView;
    private $authHelper;

    function __construct(){
        $this->model = new PropiedadModel();
        $this->view = new PropiedadView();
        $this->tipoPropiedadModel = new TipoPropiedadModel();
        $this->tipoPropiedadView = new TipoPropiedadView();
        $this->authHelper = new AuthHelper();
    }

    function modificarPropiedad($id){
        $this->authHelper->estaLogueado();
        if(!empty($_REQUEST['tipo_propiedad']) && !empty($_REQUEST['direccion']) && !empty($_REQUEST['habitaciones']) 
        && !empty($_REQUEST['banios']) &&isset($_REQUEST['patio']) && !empty($_REQUEST['contrato'])){ 

            $tipo_propiedad = $_REQUEST['tipo_propiedad'];  
            $direccion = $_REQUEST['direccion'];
            $habitaciones = $_REQUEST['habitaciones'];
            $banios = $_REQUEST['banios'];
            $patio = $_REQUEST['patio'];
            $tipo_contrato = $_REQUEST['contrato'];
            $moneda = $_REQUEST['moneda'];
            $precio = $_REQUEST['precio'];
            
            if($_FILES['imagen']['type'] == "image/jpg" || 
               $_FILES['imagen']['type'] == "image/jpeg"|| 
               $_FILES['imagen']['type'] == "image/png"){

                $extension = explode('.', $_FILES['imagen']['name']);


                $this->model->modificarPropiedad($id, $tipo_propiedad, $direccion, $habitaciones, $banios, 
                $patio, $tipo_contrato, $moneda, $precio, end($extension), $_FILES['imagen']['tmp_name']);
            } 
            else{
                $this->model->modificarPropiedad($id, $tipo_propiedad, $direccion, $habitaciones, $banios, 
                $patio, $tipo_contrato, $moneda, $precio);
            } 
            header('Location: ' . BASE_URL);
           
        } else{
            $this->view->mostrarError('Faltan datos obligatorios');
            die();
        }
    }

    function mostrarFormModificacion($id){
        $this->authHelper->estaLogueado();
        $detallesItem = $this->model->detallePropiedad($id);
        $tiposPropiedad = $this->tipoPropiedadModel->obtenerTiposPropiedad();
        $this->view->mostrarDetallesForm($detallesItem, $tiposPropiedad);
    }

    function verItemPropiedad($id){
        $this->authHelper->verificarSesion();
        $detallesItem = $this->model->detallePropiedad($id);
        $this->view->verDetalle($detallesItem);
    }

    function verPropiedades(){  
        $this->authHelper->verificarSesion();
        $propiedades = $this->model->obtenerPropiedades();
        $this->view->mostrarPropiedades($propiedades);
    }
    function irFormAgregarPropiedad(){
        $this->authHelper->estaLogueado();
        $tiposPropiedad = $this->tipoPropiedadModel->obtenerTiposPropiedad();
        $this->tipoPropiedadView->mostrarTipoPropiedad($tiposPropiedad, null);
    }
  
    function agregarPropiedad(){
        $this->authHelper->estaLogueado();
        if(!empty($_REQUEST['tipo_propiedad']) && !empty($_REQUEST['direccion']) && !empty($_REQUEST['habitaciones']) && !empty($_REQUEST['banios']) 
        && isset($_REQUEST['patio']) && !empty($_REQUEST['contrato']) && !empty($_REQUEST['moneda'])
        && !empty($_REQUEST['precio'])){ 

            $tipo_propiedad = $_REQUEST['tipo_propiedad'];  
            $direccion = $_REQUEST['direccion'];
            $habitaciones = $_REQUEST['habitaciones'];
            $banios = $_REQUEST['banios'];
            $patio = $_REQUEST['patio'];
            $tipo_contrato = $_REQUEST['contrato'];
            $moneda = $_REQUEST['moneda'];
            $precio = $_REQUEST['precio'];
            
            if($_FILES['imagen']['type'] == "image/jpg" || 
               $_FILES['imagen']['type'] == "image/jpeg"|| 
               $_FILES['imagen']['type'] == "image/png"){
                //var_dump($_FILES);
                $extension = explode('.', $_FILES['imagen']['name']);
               // echo"extension:";
               // var_dump($extension);
                $this->model->insertarPropiedad($tipo_propiedad, $direccion, $habitaciones, $banios, 
                $patio, $tipo_contrato, $moneda, $precio, end($extension), $_FILES['imagen']['tmp_name']);
            } 
            else{
                $this->model->insertarPropiedad($tipo_propiedad, $direccion, $habitaciones, $banios, 
                $patio, $tipo_contrato, $moneda, $precio);
            } 
            
            header('Location: ' . BASE_URL);
           
        } else{
            $tiposPropiedad = $this->tipoPropiedadModel->obtenerTiposPropiedad();
            $this->tipoPropiedadView->mostrarTipoPropiedad($tiposPropiedad, 'Faltan datos obligatorios');
            die();
        }
    }

    function borrarPropiedad($id){
        $this->authHelper->estaLogueado();
        $this->model->eliminarPropiedad($id);
        header('Location: ' . BASE_URL);
    }
}