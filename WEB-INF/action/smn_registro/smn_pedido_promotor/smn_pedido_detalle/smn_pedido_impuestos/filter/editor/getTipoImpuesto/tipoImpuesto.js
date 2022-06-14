listboxClear("smn_tipo_impuesto_rf");

<smn_tipo_impuesto_rf_rows>
	var option = document.createElement("option");
	option.text = "${fld:item@js}"; 
	option.value = "${fld:id}";
	document.form1.smn_tipo_impuesto_rf.add(option, 0);
</smn_tipo_impuesto_rf_rows>
