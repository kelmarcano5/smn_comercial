//search();
var vuelto = '${fld:saldo_devuelto@######}';
console.log(vuelto);
//alert(vuelto);
var montopagar = document.form1.ppv_monto_pagar_ml.value;

var vueltoma = '${fld:saldo_devuelto_ma@######}';
console.log(vueltoma);
//alert(vuelto);
var montopagarma = document.form1.ppv_monto_pagar_ma.value;

if (montopagar != 0 && montopagarma != 0 && vuelto == 1) {
	console.log("llego a la asignacion del saldo");
	document.form1.ppv_monto_devuelto_ml.value='${fld:saldo_devuelto@######0.00}';
	document.form1.ppv_monto_pago_ma.value='${fld:saldo_devuelto_ma@######0.00}';
		document.form1.ppv_monto_devuelto_ml.value='${fld:saldo_devuelto_ma@######0.00}';
}

if(vuelto == 0 && vueltoma==0){
	document.form1.ppv_monto_devuelto_ml.value=0;
	document.form1.ppv_monto_pagar_ml.value=0;
	document.form1.ppv_monto_pago_ml.value=0;
	document.form1.ppv_monto_devuelto_ma.value=0;
	document.form1.ppv_monto_pagar_ma.value=0;
	document.form1.ppv_monto_pago_ma.value=0;

	document.form1.smn_forma_pago_rf.disabled=true;
	document.form1.grabar.disabled=true;
	actualizarstatus();
	console.log(vuelto);
}else{
	
	document.form1.ppv_monto_pagar_ml.value='${fld:saldo_devuelto@######0.00}';
	document.form1.ppv_monto_pago_ma.value='${fld:saldo_devuelto_ma@######0.00}';
		document.form1.ppv_monto_devuelto_ml.value='${fld:saldo_devuelto_ma@######0.00}';
	//alert("Su saldo es igual a: "+ vuelto);

}


function consultar() {
		var id2 = document.form1.smn_pedido_cabecera_id.value;
		uri="${def:actionroot}/consultarsaldo?id2=" + id2
		//alert(uri);
		 ajaxCall(httpMethod="GET", 
						uri,
						divResponse=null, 
						divProgress="status", 
						formName=null, 
						afterResponseFn=null, 
						onErrorFn=null);		
}

function actualizarstatus() {
	var id2 = document.form1.smn_pedido_cabecera_id.value;
		uri="${def:actionroot}/change_status_pagado?id2=" + id2
		//alert(uri);
		 ajaxCall(httpMethod="GET", 
						uri,
						divResponse=null, 
						divProgress="status", 
						formName=null, 
						afterResponseFn=null, 
						onErrorFn=null);	
}

//alertBox('Los saldos han sido actualizado en la cabecera del pedido', 'Continuar', null, null);
