// document.form1.smn_evento_id.value='${fld:smn_evento_id@#,###,###}';
// document.form1.smn_afiliado_id.value='${fld:smn_afiliado_id@#,###,###}';
// document.form1.smn_relacionado_id.value='${fld:smn_relacionado_id@#,###,###}';
setComboValue('smn_evento_id','${fld:smn_evento_id}','form1');
setComboValue('smn_afiliado_id','${fld:smn_afiliado_id}','form1');
// setComboValue('smn_relacionado_id','${fld:smn_relacionado_id}','form1');
document.form1.res_cantidad.value='${fld:res_cantidad@#,###,###}';
setComboValue('res_estatus','${fld:res_estatus}','form1');
document.form1.id.value='${fld:smn_reservas_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");

var elemento = window.document.getElementById('ing');
<rows>

	var id = "${fld:smn_relacionado_id}";
	var item = "${fld:item}";
	// var precio = "${fld:precio}"; " data-cantidad=\"'+cantidad+'\

	var fila ='<label id="item">'+
				'<input name="smn_relacionado_id" id="smn_relacionado_id" type="checkbox" value="'+id+'" style="width:10px" data-name=\"'+item+'\">'+item+
			   '</label><br>';
					
   elemento.innerHTML += fila;

    setCheckboxValue('smn_relacionado_id','${fld:smn_relacionado_id}','form1');
   
</rows>

 

