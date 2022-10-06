<?php
include_once './app/models/propiedad.model.php';
include_once './app/views/propiedad.view.php';

class PropiedadController{

    private $model;
    private $view;

    function __construct(){
        $this->model = new PropiedadModel();
        $this->view = new PropiedadView();
    }

    //funcion para modificar item
    function modificarItemPropiedad($id){
        //poner los datos del id en el form seria hacer un select y mostrar
        //al form cambiarle el form action para poder luego ver lo que me traigo
        //traerme los nuevos datos del form con el request
        //y hacer el update

    }

    function verItemPropiedad($id){
        $detallesItem = $this->model->detallePropiedad($id);
        $this->view->verDetalle($detallesItem);
    }

    function agregarPropiedad(){
        if(!empty($_REQUEST['tipo_propiedad']) && !empty($_REQUEST['direccion']) && !empty($_REQUEST['habitaciones']) && !empty($_REQUEST['banios']) 
        && !empty($_REQUEST['patio'])&& !empty($_REQUEST['contrato'])){ 

            $tipo_propiedad = $_REQUEST['tipo_propiedad'];  
            $direccion = $_REQUEST['direccion'];
            $habitaciones = $_REQUEST['habitaciones'];
            $banios = $_REQUEST['banios'];
            $patio = $_REQUEST['patio'];
            $tipo_contrato = $_REQUEST['contrato'];
            $precio_alq = $_REQUEST['precio_alq'];
            $precio_vta = $_REQUEST['precio_vta'];
    
            $id = $this->model->insertarPropiedad($tipo_propiedad, $direccion, $habitaciones, $banios, $patio, 
            $tipo_contrato, $precio_alq, $precio_vta);
            header('Location: ' . BASE_URL);
        } else{
            $this->view->mostrarError('Faltan datos obligatorios');
            die();
        }
    }

    function borrarPropiedad($id){
        $this->model->eliminarPropiedad($id);
        header('Location: ' . BASE_URL);
    }
     
}