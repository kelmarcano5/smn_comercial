var elemento = window.document.getElementById('ing');
elemento.innerHTML="";

<smn_ingredientes_rows>

	var id = "${fld:smn_ingredientes_id}";
	var item = "${fld:item}";
	var precio = "${fld:precio}";


	var fila ='<label id="item">'+
				'<input name="smn_ingredientes_id" id="smn_ingredientes_id" type="checkbox" value="'+id+'" style="width:10px" onclick=\"concatenaritem(this, this); calcularprecioingrediente(this, this)\" data-name=\"'+item+'\" data-precio=\"'+precio+'\">'+item+
			   '</label><br>';
				
    elemento.innerHTML += fila;
	
</smn_ingredientes_rows>







