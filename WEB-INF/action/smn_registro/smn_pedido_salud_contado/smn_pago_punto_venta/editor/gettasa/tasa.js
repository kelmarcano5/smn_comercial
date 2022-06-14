var tasa_cambio_valor = '${fld:tasa_cambio}';
$('#divisa').val(tasa_cambio_valor);



//var montopagoml = $('#ppv_monto_pagar_ml').val();
//alert(montopagoml);
//var total = parseFloat(montopagoml) / parseFloat(tasa_cambio_valor);
//alert(total);
//$('#ppv_monto_pago_ma').val(total.toFixed(2));


listboxClear("smn_tasa_rf");

// var optionChoose = document.createElement("option");
// optionChoose.text = '[${lbl:b_choose}]';
// optionChoose.value = "0";
// document.form1.smn_tasa_rf.add(optionChoose, 0);

<smn_tasa_rf_rows>
	var option = document.createElement("option");
	option.text = "${fld:item@js} -> ${fld:tasa_cambio@#,###,##0.00}"; 
	option.value = "${fld:id}";
	document.form1.smn_tasa_rf.add(option, 0);
</smn_tasa_rf_rows>
