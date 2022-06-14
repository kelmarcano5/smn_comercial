addNew();

var id2 = document.getElementById("smn_pedido_cabecera_id").value;
consultar();

alertBox ('${lbl:b_record_added}: ${fld:id}', '${lbl:b_continue_button}', null, 'search(); setFocusOnForm("form1");');

function consultar() {
	var id2 = document.form1.smn_pedido_cabecera_id.value;
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