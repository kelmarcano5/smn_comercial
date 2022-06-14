listboxClear("smn_unidad_medida_rf");

//var optionChoose = document.createElement("option");
// optionChoose.text = '[${lbl:b_choose}]';
//optionChoose.value = "0";
//document.form1.smn_unidad_medida_rf.add(optionChoose, 0);

//alert('${fld:precml}@######000');
if ('${fld:descuento}' == "") {
	//alert('descuento igual a vacio'+'${fld:prec_descuento}');
	document.form2.pde_precio.value = Math.trunc('${fld:prec_descuento}').toFixed(2);
document.form2.pde_precio.disabled=true;
}
	
if ('${fld:descuento}' != "") {
			//alert('descuento no es igual a vacio'+'${fld:precml}');
		document.form2.pde_precio.value = Math.trunc('${fld:precml}').toFixed(2);
		document.form2.pde_precio.disabled=true;
}



<smn_unidad_medida_rf_rows>
	var option = document.createElement("option");
	option.text = "${fld:item@js}"; 
	option.value = "${fld:id}";
	document.form2.smn_unidad_medida_rf.add(option, 0);
</smn_unidad_medida_rf_rows>


