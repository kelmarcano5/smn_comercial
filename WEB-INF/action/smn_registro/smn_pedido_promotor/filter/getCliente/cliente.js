listboxClear("smn_cliente_id");

var optionChoose = document.createElement("option");
optionChoose.text = '[${lbl:b_choose}]';
optionChoose.value = "";
document.form1.smn_cliente_id.add(optionChoose, 0);

<smn_cliente_id_rows>
	var option = document.createElement("option");
	option.text = "${fld:item@js}"; 
	option.value = "${fld:id}";
	document.form1.smn_cliente_id.add(option, 0);
</smn_cliente_id_rows>
