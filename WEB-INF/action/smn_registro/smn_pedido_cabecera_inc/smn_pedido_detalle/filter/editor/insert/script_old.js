var id2 = document.getElementById("smn_pedido_cabecera_id").value;

var itm = '${fld:cod_itm}';
var cant = '${fld:cant_ped}';
document.form1.item.value = itm;
document.form1.cantidad.value = cant;
console.log("item="+itm+" cantidad="+cant);

recalcular_monto();
updateMontoPedido();

	if (despacho=='SI') {
		console.log("Entro en el control item");
		actualizar_reserva_control_item(itm, cant);
		//GenerarImp(itm);
	}else{
		console.log("Entro en el control item negativo");
		actualizar_reserva_control_item_negativo(itm, cant);
		//GenerarImp(itm);
	}

//alertBox ('${lbl:b_record_added}: ${fld:id}', '${lbl:b_continue_button}', null, 'search_2();');

	function updateMontoPedido(id) {
		uri="${def:actionroot}/montoapagar?id2=" + id2;
		ajaxCall(httpMethod="GET", 
					uri, 
					divResponse="response", 
					divProgress="status", 
					formName="form1", 
					afterResponseFn=null, 
					onErrorFn=null);
	}

	function recalcular_monto() {
		 ajaxCall(httpMethod="GET", 
						uri="${def:actionroot}/recalcular_saldos?id2=" + id2,
						divResponse=null, 
						divProgress="status", 
						formName="form1", 
						afterResponseFn=null, 
						onErrorFn=null);	

		
	}

	function actualizar_reserva_control_item_negativo(itm, cant) {
		var uri="${def:actionroot}/actualizar_control_item_neg?cod_itm=" + itm + "&cant_ped="+cant;
		console.log(uri);
		ajaxCall(httpMethod="GET", 
						uri,
						divResponse=null, 
						divProgress="status", 
						formName="form1", 
						afterResponseFn=GenerarImp(), 
						onErrorFn=null);	
	}

	function actualizar_reserva_control_item(itm, cant) {
		var uri="${def:actionroot}/actualizar_control_item?cod_itm=" + itm + "&cant_ped="+cant;
		console.log(uri);
		ajaxCall(httpMethod="GET", 
						uri,
						divResponse=null, 
						divProgress="status", 
						formName="form1", 
						afterResponseFn=GenerarImp(), 
						onErrorFn=null);	
	}

	// function GenerarImp(id) {
	// 	//Este codigo fue creado por SIMONE y ajustado en este crud por Kelvin Marcano
	// 	var uri="${def:actionroot}/GenerarImpuesto?id=" + id + "&baremos="+'${fld:baremos}';
	// 	alert(uri);
	// 	if (id!=null && id!="") 
	// 	{	
	// 		return ajaxCall(	
	// 						httpMethod="GET", 
	// 						uri, 
	// 						divResponse=null, 
	// 						divProgress="status", 
	// 						formName="form1", 
	// 						afterResponseFn=null, //function 'setElementFirstIndex' select first element of combo list
	// 						onErrorFn=null); 				
	// 	}
	// }

addNew();
alertBox ('${lbl:b_record_added}: ${fld:id}', '${lbl:b_continue_button}', null, 'search(); setFocusOnForm("form1");');

