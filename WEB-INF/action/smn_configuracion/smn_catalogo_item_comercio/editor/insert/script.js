addNew();

var pro = '${fld:id}';
			//alert("Dentro del scripts js: "+aux);
		
			//if (pro != "") {
				//alert(aux);
//processproductservice(pro);

	function processproductservice(pro) {
		//alert(aux);

			if(pro != ""){
				var uri = "${def:context}${def:actionroot}/procesar_producto?id="+pro;
				//alert(uri);
				openDialog("editor6", uri, 1000, 600);	
			}else{
				alertBox ('No se puede procesar el cliente', '${lbl:b_continue_button}', null, null);
			}

	}

			//}

alertBox('${lbl:b_record_added}: ${fld:id}', '${lbl:b_continue_button}', null, 'search(); setFocusOnForm("form1");');

