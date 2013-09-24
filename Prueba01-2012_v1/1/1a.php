<?php

mysql_connect('localhost','root','test'); //REVISEN SU CONFIGURAACION
mysql_select_db('une'); //REVISEN BASE DE DATOS
$consulta = "SELECT nombre, apellido, reprobados, promedio FROM alumnos ORDER BY apellido";
$resultado = mysql_query($consulta);
$fila = mysql_fetch_assoc($resultado);
while($fila != null){
	$promedio = $fila['promedio'];
	$reprobados = $fila['reprobados']; // ERROR MIO, COMILLAS
	echo $fila['nombre'].' '.$fila['apellido'].' ';
	// Recordar: && es Y, mientras que || es O. 
	// Por otro lado, "or" y "and" también sirven.
	if( ($promedio >= 5.5 && $reprobados == 0) || ($promedio >= 6.0 && $reprobados <= 1) || ($promedio >= 6.5 && $reprobados <= 2) ) 
		echo 'BECADO';
	else 
		echo 'NO BECADO';
	echo '<br>';
	$fila = mysql_fetch_assoc($resultado);
}

?>
