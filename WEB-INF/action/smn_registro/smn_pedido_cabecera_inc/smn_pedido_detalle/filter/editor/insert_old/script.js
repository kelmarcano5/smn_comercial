addNew();
var id2 = document.getElementById("smn_pedido_cabecera_id").value;

var itm = '${fld:cod_itm}';
var cant = '${fld:cant_ped}';
document.form1.item.value = itm;
document.form1.cantidad.value = cant;
console.log("item="+itm+" cantidad="+cant);

recalcular_monto();
updateMontoPedido();
//GenerarImp();
actualizar_reserva_control_item(itm, cant);

alertBox ('${lbl:b_record_added}: ${fld:id}', '${lbl:b_continue_button}', null, 'search_2();');

function updateMontoPedido(id) {
			//setTimeout(updateMontoPedido(id_cab), 5000); parent.setFocusOnForm("form2");
	uri="${def:actionroot}/montoapagar?id2=" + id2;
	//alert(uri);
	ajaxCall(httpMethod="GET", 
				uri, 
				divResponse="response", 
				divProgress="status", 
				formName=null, 
				afterResponseFn=null, 
				onErrorFn=null);
}

function recalcular_monto() {

	 ajaxCall(httpMethod="GET", 
					uri="${def:actionroot}/recalcular_saldos?id2=" + id2,
					divResponse=null, 
					divProgress="status", 
					formName=null, 
					afterResponseFn=null, 
					onErrorFn=null);	

	
}

function actualizar_reserva_control_item(itm, cant) {
	var uri="${def:actionroot}/actualizar_control_item?cod_itm=" + itm + "&cant_ped="+cant;
	console.log(uri);
	ajaxCall(httpMethod="GET", 
					uri,
					divResponse=null, 
					divProgress="status", 
					formName=null, 
					afterResponseFn=null, 
					onErrorFn=null);	
}


function GenerarImp() {

			//Este codigo fue creado por SIMONE y ajustado en este crud por Kelvin Marcano

		//document.form1.smn_tasa_rf.disabled=false;
		var valueCombo = document.getElementById('smn_item_rf')value;
		//var valueCombo = getIDSelectedIndex(combo);
		var uri="${def:actionroot}/GenerarImpuesto?id=" + valueCombo + "&baremos="+'${fld:baremos}';
		//alert(uri);
		//geo_idt = valueCombo.split("-").pop().trim();
		//alert(valueCombo);
		if (id!=null && id!="") 
		{	
			return ajaxCall(	
							httpMethod="GET", 
							uri, 
							divResponse=null, 
							divProgress="status", 
							formName="form1", 
							afterResponseFn=null, //function 'setElementFirstIndex' select first element of combo list
							onErrorFn=null); 				
		}
}


//alertBox ('${lbl:b_record_added}: ${fld:id}', '${lbl:b_continue_button}', null, 'search(); setFocusOnForm("form1");');

