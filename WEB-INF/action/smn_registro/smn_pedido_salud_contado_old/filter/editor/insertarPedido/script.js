var id2 = '${fld:id}';
var ent = '${fld:smn_entidad_rf}';

//alert(ent);

	if( id2 != ''){
		document.getElementById('form1').style.display = "none";
		document.form2.smn_pedido_cabecera_id.value = id2;
		document.form2.empresa.value = ent;
		document.getElementById('form2').style.display = "";

			//catalogossss(ent);


	}else{
		document.getElementById('form1').style.display = "";
			document.getElementById('form2').style.display = "none";
		alert('No se pudo generar el pedido por favor intente nuevamente')
	}


	// function catalogossss(ent) {
	// 	//alert("LLEGO AL CATALOGO EN EL ISNERT"+ent);
	// 	ajaxCall(httpMethod="GET", 
	// 				uri="${def:actionroot}/getcatalogoitem?id=" + ent, 
	// 				divResponse=null, 
	// 				divProgress="status", 
	// 				formName=null, 
	// 				afterResponseFn=null, 
	// 				onErrorFn=null);	
	// }