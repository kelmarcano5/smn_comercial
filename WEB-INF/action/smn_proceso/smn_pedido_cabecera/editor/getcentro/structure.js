listboxClear("smn_estructura_organizacional_id");

var optionChoose = document.createElement("option");
optionChoose.text = '[${lbl:b_choose}]';
optionChoose.value = "0";
document.form1.smn_estructura_organizacional_id.add(optionChoose, 0);

<smn_estructura_organizacional_id_rows>
	var option = document.createElement("option");
	option.text = "${fld:item@js}"; 
	option.value = "${fld:id}";
	document.form1.smn_estructura_organizacional_id.add(option, 0);
</smn_estructura_organizacional_id_rows>
