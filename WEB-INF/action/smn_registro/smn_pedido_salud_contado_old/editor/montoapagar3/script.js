var montopagar = '${fld:montopagar}';
var monto = parseFloat(montopagar);

var montopagarma = '${fld:montopagarma}';
var montoma = parseFloat(montopagarma);
document.form3.ppv_monto_pagar_ml.value = monto;

document.form3.ppv_monto_pago_ma.value = montoma;
document.getElementById('ppv_monto_pago_ma').disabled=true;

if(montoma != 0){

	var montopagarma = '${fld:montopagarma}';
	var montoma = parseFloat(montopagarma);
	document.form3.ppv_monto_pagar_ml.value = monto;

	document.getElementById("coin").style.display="none";
	document.getElementById("tasa3").style.display="none";
	document.getElementById("mo_pagar").style.display="";
	document.getElementById("mo_devo").style.display="";	
	document.getElementById("mo_pago").style.display="";

}else{
	document.getElementById("mo_pagar").style.display="none";
	document.getElementById("mo_devo").style.display="none";	
	document.getElementById("mo_pago").style.display="none";
}

var id = document.getElementById('smn_pedido_cabecera_id').value;
ajaxCall(httpMethod="GET", 
		uri="${def:actionroot}/update?id2=" + id,
		divResponse=null, 
		divProgress="status", 
		formName=form3, 
		afterResponseFn=null, 
		onErrorFn=null);	