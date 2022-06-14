listboxClear("smn_forma_pago_rf");

var optionChoose = document.createElement("option");
optionChoose.text = '[${lbl:b_choose}]';
optionChoose.value = "0";
document.form1.smn_forma_pago_rf.add(optionChoose, 0);

<smn_forma_pago_rf_rows>
	var option = document.createElement("option");
	option.text = "${fld:item@js}"; 
	option.value = "${fld:id}";
	document.form1.smn_forma_pago_rf.add(option, 0);
</smn_forma_pago_rf_rows>
