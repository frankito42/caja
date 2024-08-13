<?php
session_start();
ob_start();
require_once 'dompdf/autoload.inc.php';
use Dompdf\Dompdf;
?>
<?php
 require "php/conn.php";


 $sql="SELECT * FROM `ingresos` WHERE fecha='$_GET[fecha]'";
 
 // Preparar la consulta
 $res = $conn->prepare($sql);
 $res->execute();
 $res=$res->fetchAll(PDO::FETCH_ASSOC);
?>

<html>
  <head>
    <title>Impreciones info</title>
  </head>
  
<body style="background: #fcfcfc;">  

<div id="contenedor">
  
<h1 style="text-align: center;border-radius:5px;background:#cfcfcf;">Caja de la fecha <?php echo $res[0]['fecha']?></h1>

<table style="width:100%;" border="1" CELLPADDING=10 CELLSPACING=0>
          <thead style="background: #cfcfcf;">
              <tr>
                  <th>Detalle</th>
                  <th>Fecha</th>
                  <th>Monto</th>
              </tr>
          </thead>
        <tbody>
          <?php $total=0; foreach ($res as $key):$total+=($key['tipo']=="Ingreso")?$key['monto']:-$key['monto'];?>
          <tr>
            <td style="padding: 2px;">
              <?php echo $key['tipo']?>/<?php echo $key['metodo']?>
              <br>
              <span style="background: #cfcfcf;border-radius: 5px;padding: 2px;"><?php echo $key['detalle']?></span>
            </td>
            <td style="padding: 2px;"><?php echo strtoupper($key['fecha'])?></td>
            <td style="padding: 2px;"><?php echo "$".number_format($key['monto'])?></td>
          </tr>
          <?php endforeach?>
          <tr>
            <td colspan="2" style="padding: 2px;">TOTAL</td>
            <td><?php echo "$".number_format($total);?></td>
          </tr>
        </tbody>
         
      </table>




 
</div>
          
</body>
</html>
<?php
$dompdf = new Dompdf();
$dompdf->loadHtml(ob_get_clean());
$dompdf->setPaper('A4', 'portrait'); // (Opcional) Configurar papel y orientaci車n
$dompdf->render(); // Generar el PDF desde contenido HTML
$pdf = $dompdf->output();// Obtener el PDF generado
$date="caja del ".date("d-m-Y");
$dompdf->stream($date,array("Attachment" => false));
?>
