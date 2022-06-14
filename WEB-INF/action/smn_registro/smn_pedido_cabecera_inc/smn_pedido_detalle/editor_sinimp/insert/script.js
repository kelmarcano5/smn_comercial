addNew();
var id2 = document.getElementById("smn_pedido_cabecera_id").value;

var itm = '${fld:iditems}';
var cant = '${fld:cantidadpedido}';
//document.form1.item.value = itm;
//document.form1.cantidad.value = cant;
console.log("item="+itm+" cantidad="+cant);

recalcular_monto();
//updateMontoPedido();
//GenerarImp(itm);
actualizar_reserva_control_item(itm, cant);

alertBox ('${lbl:b_record_added}: ${fld:id}', '${lbl:b_continue_button}', null, 'parent.search(); parent.closeDialog();');
//alertBox ('${lbl:b_record_added}: ${fld:id}', '${lbl:b_continue_button}', null, 'search_2();');

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


function GenerarImp(itm) {

		var uri="${def:actionroot}/GenerarImpuesto?id=" + itm + "&baremos="+'${fld:baremos}';
		alert("FUNCTION GENERAR IMPUESTO EN PEDIDO DETALLE: "+uri);

		if (itm!=null && itm!="") 
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




