<?php 
require_once './app/controllers/controller.php';

//en el controlador unir las dos tablas para que el form vea el select ya con el nombre que corresponda es mejor que hacer un join investigar
require_once './app/controllers/propiedad.controller.php';

define('BASE_URL', '//'.$_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']).'/');


$action = 'listar';
if(!empty($_GET['action'])){
    $action = $_GET['action'];
}

$params = explode('/', $action);

switch($params[0]){
    case 'listar':
        $controller = new Controller();
        $controller->verPropiedades();
        $controller->verTiposPropiedad();
        break;
    case 'insertar':
        $controller = new PropiedadController();
        $controller->agregarPropiedad();
        break;
    case 'borrar':
        $controller = new PropiedadController();
        $controller->borrarPropiedad($params[1]);
        break;
    case 'verItem':
        $controller = new PropiedadController();
        $controller->verItemPropiedad($params[1]);
        break;  
    case 'modificar':
        $controller = new PropiedadController();
        $controller->modificarItemPropiedad($params[1]);
        break;       
    default:
        header("HTTP/1.0 404 Not Found");
        echo "404 - page not found";
        break;
    
}