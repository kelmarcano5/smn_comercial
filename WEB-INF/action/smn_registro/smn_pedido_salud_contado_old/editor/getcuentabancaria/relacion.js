listboxClear("ppv_cuenta_bancaria");

var optionChoose = document.createElement("option");
optionChoose.text = '[${lbl:b_choose}]';
optionChoose.value = "0";
document.form3.ppv_cuenta_bancaria.add(optionChoose, 0);

<ppv_cuenta_bancaria_rows>
	var option = document.createElement("option");
	option.text = "${fld:item@js}"; 
	option.value = "${fld:id}";
	document.form3.ppv_cuenta_bancaria.add(option, 0);
</ppv_cuenta_bancaria_rows>
