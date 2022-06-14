addNew3();
var id2 = document.getElementById("smn_pedido_cabecera_id").value;

recalcular_monto();
updateMontoPedido();
consultar();

alertBox ('${lbl:b_record_added}: ${fld:id}', '${lbl:b_continue_button}', null, 'search_3(); setFocusOnForm("form3");');
function consultar() {
	var id2 = document.form3.smn_pedido_cabecera_id.value;
	uri="${def:actionroot}/consultarsaldo?id2=" + id2;
	//alert(uri);
	 ajaxCall(httpMethod="GET", 
					uri,
					divResponse=null, 
					divProgress="status", 
					formName=null, 
					afterResponseFn=null, 
					onErrorFn=null);		
}

function updateMontoPedido(id) {
			//setTimeout(updateMontoPedido(id_cab), 5000);
	uri="${def:actionroot}/montoapagar2?id2=" + id2;
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
					uri=uri="${def:actionroot}/recalcular_saldos_pagos?id2=" + id2,
					divResponse=null, 
					divProgress="status", 
					formName=null, 
					afterResponseFn=null, 
					onErrorFn=null);	

	
}