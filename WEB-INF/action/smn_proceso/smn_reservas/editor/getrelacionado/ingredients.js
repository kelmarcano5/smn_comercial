var elemento = window.document.getElementById('ing');
elemento.innerHTML="";

<smn_relacionado_rows>

	var id = "${fld:smn_relacionado_id}";
	var item = "${fld:item}";
	// var precio = "${fld:precio}";


	var fila ='<label id="item">'+
				'<input name="smn_relacionado_id" id="smn_relacionado_id" type="checkbox" value="'+id+'" style="width:10px" data-name=\"'+item+'\">'+item+
			   '</label><br>';
				
    elemento.innerHTML += fila;
	
</smn_relacionado_rows>







