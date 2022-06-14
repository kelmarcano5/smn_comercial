var direccion = '${fld:smn_rel_auxiliar_direccion}';
$('#smn_rel_auxiliar_direccion').val(direccion).change();

document.form1.smn_pedido_detalle_id.value='${fld:smn_pedido_detalle_id@#,###,###}';
setComboValue('smn_rel_auxiliar_direccion','${fld:smn_rel_auxiliar_direccion}','form1');
document.form1.pfe_fecha_entrega.value='${fld:pfe_fecha_entrega@dd-MM-yyyy}';
document.form1.pfe_cantidad.value='${fld:pfe_cantidad@#,###,###}';
document.form1.id.value='${fld:smn_rel_pedido_fecha_entrega_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

