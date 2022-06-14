$('#divisa').val('${fld:tasa_cambio}');

listboxClear("smn_tasa_rf");

// var optionChoose = document.createElement("option");
// optionChoose.text = '[${lbl:b_choose}]';
// optionChoose.value = "0";
// document.form3.smn_tasa_rf.add(optionChoose, 0);

<smn_tasa_rf_rows>
	var option = document.createElement("option");
	option.text = "${fld:item@js} -> ${fld:tasa_cambio@#,###,##0.00}"; 
	option.value = "${fld:id}";
	document.form3.smn_tasa_rf.add(option, 0);
</smn_tasa_rf_rows>
