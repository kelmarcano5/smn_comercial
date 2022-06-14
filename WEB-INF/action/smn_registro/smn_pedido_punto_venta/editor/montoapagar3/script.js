var montopagar = '${fld:montopagar}';
var monto = parseFloat(montopagar);
document.form3.ppv_monto_pagar_ml.value = monto;

var id = document.getElementById('smn_pedido_cabecera_id').value;
ajaxCall(httpMethod="GET", 
		uri="${def:actionroot}/update?id2=" + id,
		divResponse=null, 
		divProgress="status", 
		formName=form3, 
		afterResponseFn=null, 
		onErrorFn=null);	
