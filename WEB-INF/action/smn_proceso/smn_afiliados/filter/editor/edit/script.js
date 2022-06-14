setComboValue('afi_auxiliar_rf','${fld:afi_auxiliar_rf}','form1');
document.form1.afi_fecha_inicio.value='${fld:afi_fecha_inicio@dd-MM-yyyy}';
document.form1.afi_fecha_final.value='${fld:afi_fecha_final@dd-MM-yyyy}';
document.form1.afi_fecha_desafiliacion.value='${fld:afi_fecha_desafiliacion@dd-MM-yyyy}';
setComboValue('smn_rol_id','${fld:smn_rol_id}','form1');
setComboValue('smn_servicio_id','${fld:smn_servicio_id}','form1');
setComboValue('afi_estatus','${fld:afi_estatus}','form1');
document.form1.id.value='${fld:smn_afiliados_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

