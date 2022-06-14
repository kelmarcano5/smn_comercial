var smn_cliente_id = '${fld:smn_cliente_id}';
if (smn_cliente_id == '' || smn_cliente_id == 0)  {

}else{
	$('#smn_cliente_id').val(smn_cliente_id).change();
}

var smn_codigo_impuesto_rf = '${fld:smn_codigo_impuesto_rf}';
if (smn_codigo_impuesto_rf == '' || smn_codigo_impuesto_rf == 0)  {

}else{
	$('#smn_codigo_impuesto_rf').val(smn_codigo_impuesto_rf).change();
}

document.form1.smn_pedido_cabecera_id.value='${fld:smn_pedido_cabecera_id@#######}';
setComboValue('smn_cliente_id','${fld:smn_cliente_id}','form1');
document.form1.ppa_monto.value='${fld:ppa_monto@#,###,##0.00}';
document.form1.id.value='${fld:smn_pedido_pagadores_id@#######}';

setComboValue('smn_codigo_impuesto_rf','${fld:smn_codigo_impuesto_rf}','form1');
document.form1.ppa_porcentaje.value='${fld:ppa_porcentaje@#,###,##0.00}';
document.form1.ppa_monto_impuesto_ml.value='${fld:ppa_monto_impuesto_ml@#,###,##0.00}';
document.form1.ppa_monto_impuesto_ma.value='${fld:ppa_monto_impuesto_ma@#,###,##0.00}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

