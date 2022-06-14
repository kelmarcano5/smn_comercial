setComboValue('smn_naturaleza_auxiliar_rf','${fld:smn_naturaleza_auxiliar_rf}','form1');
setComboValue('smn_clase_auxiliar_rf','${fld:smn_clase_auxiliar_rf}','form1');
setComboValue('aux_tipo_persona','${fld:aux_tipo_persona}','form1');
document.form1.aux_codigo.value='${fld:aux_codigo@js}';
document.form1.aux_descripcion.value='${fld:aux_descripcion@js}';
document.form1.aux_apellidos.value='${fld:aux_apellidos@js}';
document.form1.aux_nombres.value='${fld:aux_nombres@js}';
setComboValue('aux_tipo_doc_oficial_rf','${fld:aux_tipo_doc_oficial_rf}','form1');
document.form1.aux_num_doc_oficial.value='${fld:aux_num_doc_oficial@js}';
document.form1.aux_rif.value='${fld:aux_rif@js}';
setComboValue('aux_sexo','${fld:aux_sexo}','form1');
setComboValue('aux_estado_civil','${fld:aux_estado_civil}','form1');
document.form1.aux_fecha_nac.value='${fld:aux_fecha_nac@dd-MM-yyyy}';
document.form1.aux_lugar_nac.value='${fld:aux_lugar_nac@js}';
setComboValue('aux_direccion_rf','${fld:aux_direccion_rf}','form1');
setComboValue('aux_nacionalidad_rf','${fld:aux_nacionalidad_rf}','form1');
setComboValue('aux_nacionalizado','${fld:aux_nacionalizado}','form1');
document.form1.aux_fecha_gaceta_nac.value='${fld:aux_fecha_gaceta_nac@dd-MM-yyyy}';
document.form1.aux_num_gaceta.value='${fld:aux_num_gaceta@#######}';
setComboValue('aux_afiliacion','${fld:aux_afiliacion}','form1');
setComboValue('aux_condicion_financiera_rf','${fld:aux_condicion_financiera_rf}','form1');
setComboValue('aux_cuenta_bancaria_rf','${fld:aux_cuenta_bancaria_rf}','form1');
document.form1.aux_persona_contacto.value='${fld:aux_persona_contacto@js}';
setComboValue('aux_titular_rf','${fld:aux_titular_rf}','form1');
document.form1.aux_observacion.value='${fld:aux_observacion@js}';
document.form1.aux_peso.value='${fld:aux_peso@#,###,##0.00}';
setComboValue('aux_unidad_med_peso_rf','${fld:aux_unidad_med_peso_rf}','form1');
document.form1.aux_estatura.value='${fld:aux_estatura@#,###,##0.00}';
setComboValue('aux_unidad_med_estatura_rf','${fld:aux_unidad_med_estatura_rf}','form1');
setComboValue('aux_lateralidad','${fld:aux_lateralidad}','form1');
document.form1.aux_talla_camisa.value='${fld:aux_talla_camisa@#,###,##0.00}';
setComboValue('aux_unidad_med_camisa_rf','${fld:aux_unidad_med_camisa_rf}','form1');
document.form1.aux_talla_pantalon.value='${fld:aux_talla_pantalon@#,###,##0.00}';
setComboValue('aux_unidad_med_pantalon_rf','${fld:aux_unidad_med_pantalon_rf}','form1');
document.form1.aux_talla_zapato.value='${fld:aux_talla_zapato@#,###,##0.00}';
setComboValue('aux_unidad_med_zapato_rf','${fld:aux_unidad_med_zapato_rf}','form1');
document.form1.aux_talla_braga.value='${fld:aux_talla_braga@#,###,##0.00}';
setComboValue('aux_unidad_med_braga_rf','${fld:aux_unidad_med_braga_rf}','form1');
document.form1.aux_talla_casco.value='${fld:aux_talla_casco@#,###,##0.00}';
setComboValue('aux_unidad_med_casco_rf','${fld:aux_unidad_med_casco_rf}','form1');
document.form1.aux_numero_historia.value='${fld:aux_numero_historia@######}';
document.form1.id.value='${fld:smn_auxiliar_id@#######}';

document.form1.apc_apellidos.value='${fld:apc_apellidos@js}';
document.form1.apc_nombres.value='${fld:apc_nombres@js}';
document.form1.apc_telefono_contacto.value='${fld:apc_telefono_contacto@js}';
document.form1.apc_email.value='${fld:apc_email@js}';
document.form1.apc_direccion.value='${fld:apc_direccion@js}';

setComboValue('smn_tipo_contactos_rf','${fld:smn_tipo_contactos_rf}','form1');
document.form1.auc_descripcion.value='${fld:auc_descripcion@js}';

setComboValue('smn_tipo_contactos_rf1','${fld:smn_tipo_contactos_rf1}','form1');
document.form1.auc_descripcion1.value='${fld:auc_descripcion1@js}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


document.form1.aux_codigo.disabled=true;
 

