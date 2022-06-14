search();

var id = '${fld:id2}';
//alert(id);
setTimeout(function(){ 
	 recalcular2(id);
}, 2000);


//eliminar un registro
function recalcular2(id) {
	var uri="${def:actionroot}/recalcular_monto2?id2=" + id;
	//alert(uri);
				ajaxCall(httpMethod="GET", 
						uri,
						divResponse=null, 
						divProgress="status", 
						formName=null, 
						afterResponseFn=null, 
						onErrorFn=null);	
}