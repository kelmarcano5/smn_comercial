//search();
var vuelto = '${fld:saldo_devuelto}';
//alert(vuelto);
if(vuelto == 0){
	document.form3.ppv_monto_devuelto_ml.value=0;
	alert("Su saldo es igual a: "+ vuelto);
	//consultarsaldo();
	parent.closeDialog();
}else{
	//alert("llego");
	//recalcular_monto();
	document.form3.ppv_monto_devuelto_ml.value=0;

	//document.form3.ppv_monto_devuelto_ml.value='${fld:saldo_devuelto}';
		document.form3.ppv_monto_pagar_ml.value='${fld:saldo_devuelto}';
	alert("Su saldo es igual a: "+ vuelto);

}


function consultar() {
		var id2 = document.form3.smn_pedido_cabecera_id.value;
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

//alertBox('Los saldos han sido actualizado en la cabecera del pedido', 'Continuar', null, null);
