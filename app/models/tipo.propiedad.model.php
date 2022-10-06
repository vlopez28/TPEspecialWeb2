<?php

class TipoPropiedadModel{

    function obtenerTiposPropiedad(){
        $db = new PDO('mysql:host=localhost;'.'dbname=inmobiliaria;charset=utf8', 'root', '');
        
        $query = $db->prepare('SELECT * FROM tipo_propiedad');
        $query->execute();
        //3.obtengo respuesta
        $tiposPropiedad = $query->fetchAll(PDO::FETCH_OBJ); //obtengo arreglo de las tareas, de objetos tipo json
        //4.cierro conexion, no lo hago xq lo hace solo PDO
    
        return $tiposPropiedad;
    }
    

}