addNew2();
var id2 = document.getElementById("smn_pedido_cabecera_id").value;

recalcular_monto();
updateMontoPedido();

alertBox ('${lbl:b_record_added}: ${fld:id}', '${lbl:b_continue_button}', null, 'search_2(); parent.setFocusOnForm("form2");');

function updateMontoPedido(id) {
			//setTimeout(updateMontoPedido(id_cab), 5000);
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
					uri=uri="${def:actionroot}/recalcular_saldos?id2=" + id2,
					divResponse=null, 
					divProgress="status", 
					formName=null, 
					afterResponseFn=null, 
					onErrorFn=null);	

	
}