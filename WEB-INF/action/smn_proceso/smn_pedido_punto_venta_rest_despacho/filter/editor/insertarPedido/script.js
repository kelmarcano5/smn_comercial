var c = '${fld:smn_cliente}';
var c_cl = document.getElementById("smn_cliente_id");
var client = c_cl.options[c_cl.selectedIndex].text;
var c_co = document.getElementById("smn_auxiliar_rf");
var comp = c_co.options[c_co.selectedIndex].text;
if (client == "[Cualquiera]") {
	//alert("comp2"+comp);
	client = "";
}
if (comp == "[Cualquiera]") {
	//alert("comp2"+comp);
	comp = "";
}
var id2 = '${fld:id}';

	if( id2 != ''){
		document.getElementById('form1').style.display = "none";
		document.form2.smn_pedido_cabecera_id.value = id2;
		document.getElementById('form2').style.display = "";
	}else{
		document.getElementById('form1').style.display = "";
			document.getElementById('form2').style.display = "none";
		alert('No se pudo generar el pedido por favor intente nuevamente')
	}