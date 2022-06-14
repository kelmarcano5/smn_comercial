var elemento = window.document.getElementById('ing');
elemento.innerHTML="";

<smn_ingredientes_rows>

	var id = "${fld:smn_ingredientes_id}";
	var item = "${fld:item}";

	var fila ='<input name="smn_ingredientes_id" id="smn_ingredientes_id" type="checkbox" value="'+id+'" style="width:10px">'+item+'<br>';
				
    elemento.innerHTML += fila;
	
</smn_ingredientes_rows>