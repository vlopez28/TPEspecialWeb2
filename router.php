<?php 
require_once './app/controllers/tipo.propiedad.controller.php';
require_once './app/controllers/propiedad.controller.php';
require_once './app/controllers/autenticacion.controller.php';

define('BASE_URL', '//'.$_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']).'/');
define('LOGIN', '//'.$_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']).'/acceso');

$controller = new PropiedadController();
$tipoPropiedadController = new TipoPropiedadController();
$autenticacionController = new AutenticacionController();


if(!empty($_GET['action'])){
    $action = $_GET['action'];
}
else{
    $action = 'listar';
}

$params = explode('/', $action);

switch($params[0]){
    case 'listar':
        $controller->verPropiedades();
        break;
    case 'irFormAlta':
        $controller->irFormAgregarPropiedad();
        break;  
    case 'insertar':
        $controller->agregarPropiedad();
        break;
    case 'borrar':
        $controller->borrarPropiedad($params[1]);
        break;
    case 'verItem':
        $controller->verItemPropiedad($params[1]);
        break;  
    case 'formModificar':
        $controller->mostrarFormModificacion($params[1]);
        break; 
    case 'modificarItem':
        $controller->modificarPropiedad($params[1]);
        break; 
    case 'listarTiposPropiedad':
        $tipoPropiedadController->listarTiposPropiedad();   
        break; 
    case 'verItemsSegunTipoPropiedad':
        $tipoPropiedadController->verItemsCategorias($params[1]);    
        break; 
    case 'formModificarCategoria':
        $tipoPropiedadController->mostrarFormModificarCategoria($params[1]);    
        break;
    case 'modificarCategoria':
        $tipoPropiedadController->modificarCategoria($params[1]);    
        break;
    case 'insertarCategoria':
        $tipoPropiedadController->insertarCategoria();    
        break;
    case 'borrarCategoria':
        $tipoPropiedadController->borrarCategoria($params[1]);    
        break;
    case 'acceso':
        $autenticacionController->mostrarAcceso();
        break;
    case 'verificar':
        $autenticacionController->acceso();
        break;
    case 'salir':
        $autenticacionController->salir();
        break;
    default:
        header("HTTP/1.0 404 Not Found");
        echo "404 - page not found";
        break;
    
}