// listboxClear("smn_descuento_ml_rf");

// var optionChoose = document.createElement("option");
// optionChoose.text = '[${lbl:b_choose}]';
// optionChoose.value = "";
// document.form1.smn_descuento_ml_rf.add(optionChoose, 0);

// <smn_descuento_ml_rf_rows>
// 	var option = document.createElement("option");
// 	option.text = "${fld:item@js}"; 
// 	option.value = "${fld:id}";
// 	document.form1.smn_descuento_ml_rf.add(option, 0);
// </smn_descuento_ml_rf_rows>
//var descuento_monto = document.getElementById('psd_monto_descuento_propuesto_ml').value;
//var descuento_neto_monto = document.getElementById('psd_monto_neto_propuesto_ml').value;
//var monto = document.getElementById('psd_monto_propuesto_ml').value;
//var div = 100;
//var resultado = "";
//var resultado2 = "";

var precio = '${fld:precio@#,###,##0.00}';
//alert(precio);
//resultado = (monto * porce) / div;
//resultado2 = monto - porce;
//alert();
document.getElementById("pde_precio").value = (precio*100)/100;

*