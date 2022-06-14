document.form3.id_pago.value = '${fld:id_pago}';
var idp = '${fld:id_pago}';
//alert(idp);
consultar_ultimo_pago(idp);
function consultar_ultimo_pago(id) {
	// document.getElementById('id_pag')
	 uri="${def:actionroot}/consultarsaldo2?id2=" + id;
	// alert(uri);
	 ajaxCall(httpMethod="GET", 
					uri,
					divResponse=null, 
					divProgress="status", 
					formName=null, 
					afterResponseFn=null, 
					onErrorFn=null);
}
//alertBox('Los saldos han sido actualizado en la cabecera del pedido', 'Continuar', null, null);
// function consultar() {
// 	var id2 = document.form3.smn_pedido_cabecera_id.value;
// 	uri="${def:actionroot}/consultarsaldo?id2=" + id2;
// 	//alert(uri);
// 	 ajaxCall(httpMethod="GET", 
// 					uri,
// 					divResponse=null, 
// 					divProgress="status", 
// 					formName=null, 
// 					afterResponseFn=null, 
// 					onErrorFn=null);		
// }