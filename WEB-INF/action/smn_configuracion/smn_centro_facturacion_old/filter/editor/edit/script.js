document.form1.cfc_codigo.value='${fld:cfc_codigo@js}';
document.form1.cfc_nombre.value='${fld:cfc_nombre@js}';

setComboValue('smn_entidades_rf','${fld:smn_entidades_rf}','form1');
setComboValue('smn_sucursales_rf','${fld:smn_sucursales_rf}','form1');
setComboValue('smn_areas_servicios_rf','${fld:smn_areas_servicios_rf}','form1');
setComboValue('smn_unidades_servicios_rf','${fld:smn_unidades_servicios_rf}','form1');

setComboValue('smn_almacen_rf','${fld:smn_almacen_rf}','form1');
setComboValue('smn_centro_costo_rf','${fld:smn_centro_costo_rf}','form1');
setComboValue('smn_documento_id','${fld:smn_documento_id}','form1');
setComboValue('smn_caja_rf','${fld:smn_caja_rf}','form1');

setComboValue('smn_baremos_rf','${fld:smn_baremos_rf}','form1');

document.form1.cfc_numero_identificacion.value='${fld:cfc_numero_identificacion@js}';
document.form1.cfc_control_fiscal_1.value='${fld:cfc_control_fiscal_1@#######}';
document.form1.cfc_control_fiscal_2.value='${fld:cfc_control_fiscal_2@#######}';
document.form1.cfc_vigencia.value='${fld:cfc_vigencia@dd-MM-yyyy}';
setComboValue('cfc_estatus','${fld:cfc_estatus}','form1');
document.form1.id.value='${fld:smn_centro_facturacion_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");

setComboValue('smn_documento_id','${fld:smn_documento_id}','form1');
document.form1.cfc_codigo.disabled=true;
document.form1.smn_centro_costo_rf.disabled=false;