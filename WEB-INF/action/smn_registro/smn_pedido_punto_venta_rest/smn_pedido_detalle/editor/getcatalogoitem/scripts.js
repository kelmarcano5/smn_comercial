listboxClear("smn_catalogo_item_comercio_id");

var optionChoose = document.createElement("option");
 optionChoose.text = '[${lbl:b_choose}]';
optionChoose.value = "0";
document.form1.smn_catalogo_item_comercio_id.add(optionChoose, 0);

//alert('${fld:precml}@######000');
//document.form2.pde_precio.value = Math.trunc('${fld:precml}');
//document.form2.pde_precio.disabled=true;

<smn_catalogo_item_comercio_id_rows>
	var option = document.createElement("option");
	option.text = "${fld:item@js}"; 
	option.value = "${fld:id}";
	document.form1.smn_catalogo_item_comercio_id.add(option, 0);
</smn_catalogo_item_comercio_id_rows>


