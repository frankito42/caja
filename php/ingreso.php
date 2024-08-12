<?php
require "conn.php";
$monto=$_POST['monto'];


$sql = "INSERT INTO `ingresos`(`monto`, `fecha`,tipo,metodo) VALUES (:m,NOW(),:tipo,:metodo)";

// Preparar la consulta
$res = $conn->prepare($sql);

// Asociar los valores a los marcadores de posición
$res->bindParam(':m', $monto);
$res->bindParam(':tipo', $_POST['tipoIngreso']);
$res->bindParam(':metodo', $_POST['metodoPago']);


if($res->execute()){
    echo json_encode("ok");
}else{
    echo json_encode("error");

}









?>