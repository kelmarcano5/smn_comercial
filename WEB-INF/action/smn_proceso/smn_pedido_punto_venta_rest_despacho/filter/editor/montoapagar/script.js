//addNew();
//alertBox ('${lbl:b_record_updated}', '${lbl:b_continue_button}', null, 'setFocusOnForm("form1"); search();');
var montopagar = '${fld:montopagar}';
var monto = parseFloat(montopagar);
document.getElementById('montopagar').value = monto;



function setUpdate() {
	
	ajaxCall(httpMethod="GET", 
			uri="${def:actionroot}/update?id2=" + id,
			divResponse=null, 
			divProgress="status", 
			formName=form2, 
			afterResponseFn=null, 
			onErrorFn=null);	

}

//alert("a pagar: "+monto);
