<?php

mysql_connect('localhost','root','');
mysql_select_db('une');
// Las unicas diferencias con la 1a son las siguientes lineas:
$busqueda = $_REQUEST['apellido'];
$consulta = "SELECT nombre, apellido, reprobados, promedio FROM alumnos WHERE apellido LIKE '%busqueda%' ORDER BY apellido DESC";
// Fin diferencias
$resultado = mysql_query($consulta);
$fila = mysql_fetch_assoc($resultado);
while($fila != null){
	$promedio = $fila['promedio'];
	$reprobados = $fila['reprobados']
	echo $fila['nombre'].' '.$fila['apellido'].' – ';
	// Recordar: && es Y, mientras que || es O. 
	// Por otro lado, "or" y "and" también sirven.
	if( ($promedio >= 5.5 && $reprobados == 0) || ($promedio >= 6.0 && $reprobados <= 1) || ($promedio >= 6.5 && reprobados <= 2) ) 
		echo 'BECADO';
	else 
		echo 'NO BECADO';
	echo '<br>';
	$fila = mysql_fetch_assoc($resultado);
}

?>
