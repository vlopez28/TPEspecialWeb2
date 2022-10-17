<?php

class TipoPropiedadModel{
    private $db;

    function __construct(){
        $this->db = $this->conectar();
    }
    
    private function conectar(){
        $db = new PDO('mysql:host=localhost;'.'dbname=inmobiliaria;charset=utf8', 'root', '');
        return $db;
    }
    function eliminarCategoria($id){
        $query = $this->db->prepare('DELETE FROM tipo_propiedad WHERE id=?');
        $query->execute([$id]);
        return $this->db->lastInsertId();
    }

    function insertarTipoPropiedad($tipo_propiedad){
        $query = $this->db->prepare('INSERT INTO `tipo_propiedad`(`tipo`) VALUES (?)');
        $query->execute([$tipo_propiedad]);
        return $this->db->lastInsertId();
    }

    function obtenerDetalleTipoPropiedad($id){
        $query = $this->db->prepare('SELECT * FROM `tipo_propiedad` WHERE id=?');
        $query->execute([$id]);
        $detallesTipoPropiedad = $query->fetchAll(PDO::FETCH_OBJ);
        return $detallesTipoPropiedad;
    }

    function modificarTipoPropiedad($dato, $id){
        $query = $this->db->prepare('UPDATE `tipo_propiedad` SET `tipo` = ? WHERE `tipo_propiedad`.`id` = ?');
        $query->execute([$dato, $id]);
    }

    function obtenerTiposPropiedad(){
        $query = $this->db->prepare('SELECT * FROM tipo_propiedad');
        $query->execute();
        $tiposPropiedad = $query->fetchAll(PDO::FETCH_OBJ);
        return $tiposPropiedad;
    }
    
    function obtenerItemsCategoria($id){
        $query = $this->db->prepare('SELECT t.tipo, p.direccion, p.habitaciones, p.banios, p.patio, p.tipo_contrato, 
        p.moneda, p.precio 
        FROM tipo_propiedad t INNER JOIN propiedad p 
        ON t.id = p.tipo_propiedad_id 
        WHERE t.id=?');
        $query->execute([$id]);
        $itemsCategoria = $query->fetchAll(PDO::FETCH_OBJ); 
        return $itemsCategoria; 
    }

}