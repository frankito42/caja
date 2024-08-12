<?php
require "conn.php";


$sql = "SELECT * FROM `ingresos` WHERE fecha=CURRENT_DATE()";

// Preparar la consulta
$res = $conn->prepare($sql);
$res->execute();
$res=$res->fetchAll(PDO::FETCH_ASSOC);



echo json_encode($res);










?>