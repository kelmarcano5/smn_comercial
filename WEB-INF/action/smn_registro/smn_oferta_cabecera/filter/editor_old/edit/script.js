setComboValue('smn_documento_id','${fld:smn_documento_id}','form1');
document.form1.ofe_numero_documento.value='${fld:ofe_numero_documento@#,###,###}';
setComboValue('smn_entidad_rf','${fld:smn_entidad_rf}','form1');
setComboValue('smn_sucursal_rf','${fld:smn_sucursal_rf}','form1');
document.form1.ofe_fecha_desde.value='${fld:ofe_fecha_desde@dd-MM-yyyy}';
document.form1.ofe_fecha_hasta.value='${fld:ofe_fecha_hasta@dd-MM-yyyy}';
document.form1.ofe_observaciones.value='${fld:ofe_observaciones@js}';
setComboValue('ofe_estatus','${fld:ofe_estatus}','form1');
document.form1.id.value='${fld:smn_oferta_cabecera_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

