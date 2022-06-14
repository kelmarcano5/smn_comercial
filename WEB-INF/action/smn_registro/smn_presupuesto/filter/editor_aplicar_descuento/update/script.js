addNew();


//var id_presupuesto = '${fld:id}';

//alert("llego al update"+id_presupuesto);

buscar_descuento();

function buscar_descuento() {
		//alert("llego"); 
		var uri="${def:actionroot}/buscardescuento?id=" + id;
	
		 ajaxCall(httpMethod="GET", 
							uri, 
							divResponse=null, 
							divProgress="status", 
							formName=null, 
							afterResponseFn=recalcular(), 
							onErrorFn=null);	
}

function recalcular() {
	var uri="${def:actionroot}/recalcular_monto?id=" + id;
	
		 ajaxCall(httpMethod="GET", 
							uri, 
							divResponse=null, 
							divProgress="status", 
							formName=null, 
							afterResponseFn=null, 
							onErrorFn=null);	
}

alertBox ('${lbl:b_record_updated}', '${lbl:b_continue_button}', null, 'parent.search(); parent.closeDialog();');