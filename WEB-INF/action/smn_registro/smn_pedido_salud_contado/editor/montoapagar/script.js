var montopagar = '${fld:montopagar}';
var monto = parseFloat(montopagar);
document.form4.montopagar.value = monto;

var montopagarma = '${fld:montopagarma}';
var montoma = parseFloat(montopagarma);
document.form4.montopagarma.value = montoma;

//setUpdate();

//function setUpdate() {
	var id = document.getElementById('smn_pedido_cabecera_id').value;
	ajaxCall(httpMethod="GET", 
			uri="${def:actionroot}/update?id2=" + id,
			divResponse=null, 
			divProgress="status", 
			formName=form2, 
			afterResponseFn=null, 
			onErrorFn=null);	

//}

//alert("a pagar: "+monto);
