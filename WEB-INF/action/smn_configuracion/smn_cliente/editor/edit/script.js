var smn_clasificacion_cliente_id = '${fld:smn_clasificacion_cliente_id}';
$('#smn_clasificacion_cliente_id').val(smn_clasificacion_cliente_id).trigger('change');

// var smn_clase_auxiliar_rf = '${fld:smn_clase_auxiliar_rf}';
// $('#smn_clase_auxiliar_rf').val(smn_clase_auxiliar_rf).trigger('change');

var aux = '${fld:smn_auxiliar_rf}';
if (aux != "") {
	$('#smn_auxiliar_rf').val(aux).trigger('change');
}

var smn_clasificacion_abc_rf = '${fld:smn_clasificacion_abc_rf}';
$('#smn_clasificacion_abc_rf').val(smn_clasificacion_abc_rf).trigger('change');

var smn_sector_economico_rf = '${fld:smn_sector_economico_rf}';
$('#smn_sector_economico_rf').val(smn_sector_economico_rf).trigger('change');

var smn_forma_pago_rf = '${fld:smn_forma_pago_rf}';
$('#smn_forma_pago_rf').val(smn_forma_pago_rf).trigger('change');

var smn_condicion_financiera_rf = '${fld:smn_condicion_financiera_rf}';
$('#smn_condicion_financiera_rf').val(smn_condicion_financiera_rf).trigger('change');

var smn_promotor_rf = '${fld:smn_promotor_rf}';
$('#smn_promotor_rf').val(smn_promotor_rf).trigger('change');

setComboValue('smn_clasificacion_cliente_id','${fld:smn_clasificacion_cliente_id}','form1');
setComboValue('smn_clase_auxiliar_rf','${fld:smn_clase_auxiliar_rf}','form1');
setComboValue('smn_auxiliar_rf','${fld:smn_auxiliar_rf}','form1');
setComboValue('smn_clasificacion_abc_rf','${fld:smn_clasificacion_abc_rf}','form1');
setComboValue('smn_sector_economico_rf','${fld:smn_sector_economico_rf}','form1');
//setComboValue('smn_condicion_financiera_rf','${fld:smn_condicion_financiera_rf}','form1');
setComboValue('smn_forma_pago_rf','${fld:smn_forma_pago_rf}','form1');
setComboValue('cli_nacional_ext','${fld:cli_nacional_ext}','form1');
document.form1.cli_vigencia.value='${fld:cli_vigencia@dd-MM-yyyy}';
setComboValue('cli_estatus','${fld:cli_estatus}','form1');
document.form1.id.value='${fld:smn_cliente_id@#,###,###}';

 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

