//addNew();
//alertBox ('${lbl:b_record_updated}', '${lbl:b_continue_button}', null, 'setFocusOnForm("form1"); search();');
var montopagar = '${fld:montopagar}';
var monto = parseFloat(montopagar);
if (monto == null || monto == "") {
	monto == 0;
	document.getElementById('montopagar').value = monto;
}else{
	document.getElementById('montopagar').value = monto;
}




function setUpdate() {
	
	ajaxCall(httpMethod="GET", 
			uri="${def:actionroot}/update?id2=" + id,
			divResponse=null, 
			divProgress="status", 
			formName=null, 
			afterResponseFn=null, 
			onErrorFn=null);	

}

//alert("a pagar: "+monto);
