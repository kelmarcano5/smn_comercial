document.form1.tpp_codigo.value='${fld:tpp_codigo@js}';
document.form1.tpp_descripcion.value='${fld:tpp_descripcion@js}';
setComboValue('tpp_estatus','${fld:tpp_estatus}','form1');
document.form1.tpp_fecha_vigencia.value='${fld:tpp_fecha_vigencia@dd-MM-yyyy}';
document.form1.id.value='${fld:smn_tipo_pedido_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


document.form1.tpp_codigo.disabled=true;
 

