
procesar_inv(id);

function procesar_inv(id2) {
			//var id = id2;
			//alert(id);
			//procesar2(id);
			var uri = "${def:context}${def:actionroot}/procesar?smn_pedido_cabecera_id="+id2;
			//alert(uri);
			openDialog("editor7", uri, 650, 600);	
}
//addNew();

// var pro = document.getElementById("numero_documento").value;
// //alert("NUMERO DE DOCUMENTO O DE PEDIDO: "+pro);

// processproductservice(pro);

// function processproductservice(pro) {
// 		if(pro != ""){
// 			var uri = "${def:context}${def:actionroot}/actualizar_estatus_de?id="+pro;
// 			openDialog("editor6", uri, 1000, 600);	
// 		}else{
// 			alertBox ('No se puede procesar el cliente', '${lbl:b_continue_button}', null, null);
// 		}
// }

//alertBox ('${lbl:b_record_updated}', '${lbl:b_continue_button}', null, 'setFocusOnForm("form1");');