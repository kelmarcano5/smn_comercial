setComboValue('smn_documento_id','${fld:smn_documento_id}','form1');
setComboValue('smn_entidades_rf','${fld:smn_entidades_rf}','form1');
setComboValue('smn_sucursales_rf','${fld:smn_sucursales_rf}','form1');
setComboValue('smn_clase_auxiliar_rf','${fld:smn_clase_auxiliar_rf}','form1');
setComboValue('smn_auxiliar_rf','${fld:smn_auxiliar_rf}','form1');
setComboValue('smn_clase_ord_rf','${fld:smn_clase_ord_rf}','form1');
setComboValue('smn_auxiliar_ord_rf','${fld:smn_auxiliar_ord_rf}','form1');
setComboValue('smn_baremo_rf','${fld:smn_baremo_rf}','form1');
setComboValue('smn_auxiliar_unidades_negocios_rf','${fld:smn_auxiliar_unidades_negocios_rf}','form1');
setComboValue('smn_auxiliar_sucursales_rf','${fld:smn_auxiliar_sucursales_rf}','form1');
setComboValue('smn_auxiliar_areas_servicios_rf','${fld:smn_auxiliar_areas_servicios_rf}','form1');
setComboValue('smn_auxiliar_unidades_servicios_rf','${fld:smn_auxiliar_unidades_servicios_rf}','form1');
document.form1.pre_vigencia_hasta.value='${fld:pre_vigencia_hasta@dd-MM-yyyy}';
setComboValue('smn_ordenes_medicas_id','${fld:smn_ordenes_medicas_id}','form1');
document.form1.pre_fecha_entrega.value='${fld:pre_fecha_entrega@dd-MM-yyyy}';

document.form1.pre_monto_descuento.value='${fld:pre_monto_descuento@#,###,##0.00}';
document.form1.pre_monto_neto_moneda_local.value='${fld:pre_monto_neto_moneda_local@#,###,##0.00}';

//document.form1.pre_monto_ml.value='${fld:pre_monto_ml@#,###,##0.00}';
//setComboValue('smn_moneda_rf','${fld:smn_moneda_rf}','form1');
//document.form1.pre_monto_ma.value='${fld:pre_monto_ma@#,###,##0.00}';
//setComboValue('smn_estado_presupuesto_id','${fld:smn_estado_presupuesto_id}','form1');
document.form1.id.value='${fld:smn_presupuesto_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


var mdes = '${fld:pre_monto_descuento@#,###,##0.00}';
var mnet = '${fld:pre_monto_neto_moneda_local@#,###,##0.00}';

//alert("monto descuento: "+ mdes +"monto neto: "+ mnet);

if(mdes != 0){
	document.getElementById("montodes").style.display='';
}else{
	document.getElementById("montodes").style.display='none';
}

if (mnet != 0) {
	document.getElementById("montoneto").style.display='';
}else{
	document.getElementById("montoneto").style.display='none';
}
