setComboValue('cic_origen','${fld:cic_origen}','form1');
setComboValue('smn_cliente_rf','${fld:smn_cliente_rf}','form1');
setComboValue('cic_maneja_ingredientes','${fld:cic_maneja_ingredientes}','form1');
setComboValue('smn_item_rf','${fld:smn_item_rf}','form1');
setComboValue('smn_categoria_menu_id','${fld:smn_categoria_menu_id}','form1');
setComboValue('smn_categoria_item_id_a','${fld:smn_categoria_item_id_a}','form1');
setComboValue('smn_categoria_item_id_b','${fld:smn_categoria_item_id_b}','form1');
setComboValue('smn_baremos_rf','${fld:smn_baremos_rf}','form1');
document.form1.id.value='${fld:smn_catalogo_item_comercio_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");

document.form1.cic_tiempo_sug_preparacion.value='${fld:cic_tiempo_sug_preparacion@js}';
document.form1.cic_descripcion.value='${fld:cic_descripcion@js}';

setComboValue('smn_unidad_medida_rf','${fld:smn_unidad_medida_rf}','form1');

