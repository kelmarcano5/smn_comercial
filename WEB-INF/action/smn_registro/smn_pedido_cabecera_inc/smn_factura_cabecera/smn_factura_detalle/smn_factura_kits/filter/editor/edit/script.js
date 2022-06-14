document.form1.smn_factura_detalle_id.value='${fld:smn_factura_detalle_id@#,###,###}';
setComboValue('smn_item_origen_rf','${fld:smn_item_origen_rf}','form1');
setComboValue('smn_item_destino_rf','${fld:smn_item_destino_rf}','form1');
document.form1.fki_cantidad.value='${fld:fki_cantidad@#,###,###}';
document.form1.fki_precio_ml.value='${fld:fki_precio_ml@#,###,##0.00}';
document.form1.fki_monto_ml.value='${fld:fki_monto_ml@#,###,##0.00}';
setComboValue('smn_moneda_rf','${fld:smn_moneda_rf}','form1');
setComboValue('smn_tasa_rf','${fld:smn_tasa_rf}','form1');
document.form1.smn_precio_ma_rf.value='${fld:smn_precio_ma_rf@#,###,##0.00}';
document.form1.fki_monto_ma_rf.value='${fld:fki_monto_ma_rf@#,###,##0.00}';
setComboValue('fki_estatus','${fld:fki_estatus}','form1');
document.form1.id.value='${fld:smn_factura_kits_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");

//alert('${fld:smn_moneda_rf}');
if('${fld:smn_moneda_rf}' == '0' || '${fld:smn_moneda_rf}' == ""){

	document.getElementById('tasa').style.display='none';
	document.getElementById('precioma').style.display='none';
	document.getElementById('montoma').style.display='none';

}else{

	document.getElementById('tasa').style.display='';
	document.getElementById('precioma').style.display='';
	document.getElementById('montoma').style.display='';


}

 

