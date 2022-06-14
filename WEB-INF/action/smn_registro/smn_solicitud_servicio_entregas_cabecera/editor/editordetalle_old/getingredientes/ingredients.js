var elemento = window.document.getElementById('ing');
elemento.innerHTML="";

<smn_ingredientes_rows>

	var id = "${fld:smn_ingredientes_id}";
	var item = "${fld:item}";

		var fila ='<label id="item">'+
				'<input name="smn_ingredientes_id" id="smn_ingredientes_id" type="checkbox" value="'+id+'" style="width:10px" onclick=\"concatenaritem(this);\" data-name=\"'+item+'\">'+item+
			   '</label><br>';
				
    elemento.innerHTML += fila;
	
</smn_ingredientes_rows>