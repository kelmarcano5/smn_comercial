cant_reserva=0;
var cant_reserva = document.getElementById("res_cantidad").value;
var cant_afiliado = '${fld:saldo_afiliacion}';
var cant_evento = '${fld:saldo_evento}';
var cant_reserva_afiliado = '${fld:reserva_afiliado}';
//alert("afiliado="+cant_afiliado+" evento="+cant_evento+" reservaporafiliado="+cant_reserva_afiliado);
if (cant_reserva<=parseInt(cant_reserva_afiliado) && cant_reserva<=parseInt(cant_afiliado) && cant_reserva<=parseInt(cant_evento)) {
	document.getElementById('grabar').disabled=false;
}else{
	alertBox('Verificar cantidad', 'Aceptar', null, null)
	document.getElementById('grabar').disabled=true;
	
}



	 



