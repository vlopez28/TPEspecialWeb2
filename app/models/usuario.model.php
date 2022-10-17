<?php

class UsuarioModel{
    private $db;

    function __construct(){
        $this->db = $this->conectar();
    }
    
    private function conectar(){
        $db = new PDO('mysql:host=localhost;'.'dbname=inmobiliaria;charset=utf8', 'root', '');
        return $db;
    }
    //obtengo el usuario de la db
    function obtenerUsuario($email){
        $query = $this->db->prepare('SELECT * FROM usuario WHERE email = ?');
        $query->execute([$email]);
        $usuario = $query->fetch(PDO::FETCH_OBJ);
        return $usuario;
    }
    
}