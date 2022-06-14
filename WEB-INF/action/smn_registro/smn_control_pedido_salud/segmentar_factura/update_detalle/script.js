//addNew();
// var id_cabecera = '${fld:id_cab}';
var id_cabecera = $('#id2').val();
//alert(id_cabecera);
actualizarcabecera(id_cabecera);

//eliminar un registro
function actualizarcabecera(id) {
	var uri="${def:actionroot}/recalcular_cabecera?id2=" + id;
	//alert("actualiza cabecera"+uri);
		ajaxCall(httpMethod="GET", 
						uri,
						divResponse=null, 
						divProgress="status", 
						formName=null, 
						afterResponseFn=mensaje(), 
						onErrorFn=null);	
}

function mensaje(){
	alertBox ('${lbl:b_record_updated}', '${lbl:b_continue_button}', null, 'setFocusOnForm("form1"); search();');
}