addNew();

// var pro = document.getElementById("numero_documento").value;

// processproductservice(pro);

// function processproductservice(pro) {

// 		if(pro != ""){
// 			var uri = "${def:context}${def:actionroot}/actualizar_estatus_ap?id="+pro;


// 			alert("Llego al update de aprobacion"+uri);
// 			openDialog("editor6", uri, 1000, 600);	
// 		}else{
// 			alertBox ('No se puede procesar el cliente', '${lbl:b_continue_button}', null, null);
// 		}

// }

alertBox ('${lbl:b_record_updated}', '${lbl:b_continue_button}', null, 'setFocusOnForm("form1");');