<?php
require_once './app/views/autenticacion.view.php';
require_once './app/models/usuario.model.php';
require_once './app/helpers/auth.helper.php';

class AutenticacionController{
    private $view;
    private $model;
    private $authHelper;

    function __construct(){
        $this->view = new AutenticacionView();
        $this->model = new UsuarioModel();
        $this->authHelper = new AuthHelper();
    }

    function mostrarAcceso(){
        $this->view->verFormAcceso();
    }
    //verifica si los datos del usuario son correctos
    function acceso(){
        if(!empty($_POST['email']) && !empty($_POST['password'])){
            $email = $_POST['email'];
            $password = $_POST['password'];
            $usuario = $this->model->obtenerUsuario($email);
            //si el usuario existe y las contrasenias coinciden
            if ($usuario && password_verify($password, $usuario->password)){
                $this->authHelper->cargarSesion($usuario);
                header('Location: ' . BASE_URL);
            }
            else {
                $this->view->verFormAcceso("Usuario o contraseña invalida");
            }
        }
        else{
            $this->view->verFormAcceso("Complete todos los campos");
        }    
    }

    function salir(){
        $this->authHelper->destruirSesion();
    }
}