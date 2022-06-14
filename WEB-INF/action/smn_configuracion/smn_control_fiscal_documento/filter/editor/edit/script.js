setComboValue('smn_documento_id','${fld:smn_documento_id}','form1');
setComboValue('smn_proveedor_rf','${fld:smn_proveedor_rf}','form1');
document.form1.cfd_numero_documento_fiscal_inicial.value='${fld:cfd_numero_documento_fiscal_inicial@#,###,###}';
document.form1.cfd_numero_documento_fiscal_final.value='${fld:cfd_numero_documento_fiscal_final@#,###,###}';
document.form1.cfd_ultimo_numero_fiscal_usado.value='${fld:cfd_ultimo_numero_fiscal_usado@#,###,###}';
document.form1.cfd_fecha_solicitud.value='${fld:cfd_fecha_solicitud@dd-MM-yyyy}';
document.form1.cfd_fecha_recepcion.value='${fld:cfd_fecha_recepcion@dd-MM-yyyy}';
document.form1.cfd_serie.value='${fld:cfd_serie@js}';
setComboValue('cfd_estatus','${fld:cfd_estatus}','form1');
document.form1.id.value='${fld:smn_control_fiscal_documento_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

