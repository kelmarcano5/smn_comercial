//addNew();


alertBox ('${lbl:b_record_updated}', '${lbl:b_continue_button}', null, 'parent.closeDialog(); setFocusOnForm("form1");');



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