<?php
class PropiedadModel{ 

    private $db;

    function __construct(){
        $this->db = $this->conectar();
    }
    
    private function conectar(){
        $db = new PDO('mysql:host=localhost;'.'dbname=inmobiliaria;charset=utf8', 'root', '');
        return $db;
    }

    function modificarPropiedad($id, $tipo_propiedad, $direccion, $habitaciones, $banios, 
    $patio, $tipo_contrato, $moneda, $precio, $extension = null, $imagen = null){

        $pathImagen = null;
        if($imagen){
            $pathImagen = $this->subirImagen($imagen, $extension);
        }

        $query = $this->db->prepare('UPDATE `propiedad` SET `tipo_propiedad_id` = ?, 
        `direccion` = ?, `habitaciones` = ?, `banios` = ?, `patio` = ?, 
        `tipo_contrato` = ?, `moneda` = ?, `precio` = ?, `imagen` = ? WHERE `propiedad`.`id` = ?');
        $query->execute([$tipo_propiedad, $direccion, $habitaciones, $banios, $patio, $tipo_contrato, 
        $moneda, $precio, $pathImagen, $id]);

    }

    function detallePropiedad($id){
        $query = $this->db->prepare('SELECT t.tipo, t.id as tipo_propiedad_id, p.id, p.direccion, p.habitaciones, p.banios, p.patio, 
        p.tipo_contrato, p.moneda, p.precio, p.imagen  
        FROM propiedad p 
        INNER JOIN tipo_propiedad t 
        ON p.tipo_propiedad_id = t.id 
        WHERE p.id=?;');
        $query->execute([$id]);
        $detallesItem = $query->fetchAll(PDO::FETCH_OBJ); 
        return $detallesItem; 
    }

    function insertarPropiedad($tipo_propiedad, $direccion, $habitaciones, $banios, $patio, 
        $tipo_contrato, $moneda, $precio, $extension = null, $imagen = null){
       // echo " extension que llega";
           // var_dump($extension);
        $pathImagen = null;
        if($imagen){
            $pathImagen = $this->subirImagen($imagen, $extension);
        }
        
        $query = $this->db->prepare('INSERT INTO `propiedad` (`id`, `tipo_propiedad_id`, `direccion`, 
        `habitaciones`, `banios`, `patio`, `tipo_contrato`, `moneda`, `precio`, `imagen`) 
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);');
        $query->execute([NULL, $tipo_propiedad, $direccion, $habitaciones, $banios, $patio, $tipo_contrato, 
        $moneda, $precio, $pathImagen]);
        return $this->db->lastInsertId();
    }
    private function subirImagen($imagen, $extension){
        $target = 'images/casas/' . uniqid() . '.' . $extension;
        move_uploaded_file($imagen, $target);
        return $target;
    }

    function eliminarPropiedad($id){
        $query = $this->db->prepare('DELETE FROM propiedad WHERE id=?');
        $query->execute([$id]);
        return $this->db->lastInsertId();
    }

    function obtenerPropiedades(){
        $query = $this->db->prepare('SELECT p.id, p.direccion, p.habitaciones, p.banios, p.patio, p.tipo_contrato, 
        p.moneda, p.precio, p.imagen, t.tipo
        FROM propiedad p 
        INNER JOIN tipo_propiedad t
        ON p.tipo_propiedad_id = t.id');
        $query->execute();

        $propiedades = $query->fetchAll(PDO::FETCH_OBJ); 
       
        return $propiedades; 
    }
}