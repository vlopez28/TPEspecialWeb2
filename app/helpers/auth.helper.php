<?php

class AuthHelper{

    public function estaLogueado(){
        $this->verificarSesion();
        if((!isset($_SESSION['IS_LOGGED'])) || (!$_SESSION['IS_LOGGED'] === true) || empty($_SESSION['USER_ID'])){
            header('Location: ' . LOGIN);
            die();
        }
    }
    public function cargarSesion($usuario){
        session_start();
        $_SESSION['USER_ID'] = $usuario->id;
        $_SESSION['USER_EMAIL'] = $usuario->email;
        $_SESSION['IS_LOGGED'] = true;
    }

    public function verificarSesion(){
        if (session_status() !== PHP_SESSION_ACTIVE) {
            session_start();
        }
    }
    
    function destruirSesion(){
        session_start();
        session_destroy();
        header('Location: ' . LOGIN);
    }

}