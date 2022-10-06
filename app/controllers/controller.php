<?php
include_once './app/models/propiedad.model.php';
include_once './app/views/propiedad.view.php';

include_once './app/models/tipo.propiedad.model.php';


class Controller{

    private $propiedadModel;
    private $tipoPropiedadModel;
    private $view;

    function __construct(){
        $this->propiedadModel = new PropiedadModel();
        $this->tipoPropiedadModel = new TipoPropiedadModel();
        $this->view = new PropiedadView();
    }

//veo todas las propiedades que pedi a la db
    function verPropiedades(){
        //obtiene las propiedades del modelo
        $propiedades = $this->propiedadModel->obtenerPropiedades();
        $this->view->mostrarPropiedades($propiedades);
        
    }
    function verTiposPropiedad(){
        $tiposPropiedad = $this->tipoPropiedadModel->obtenerTiposPropiedad();
        $this->view->mostrarTipoPropiedad($tiposPropiedad);
    }
}