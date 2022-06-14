var porcentaje_base = '${fld:porbase}';
var porcentaje_descuento = '${fld:pordesc}';
		
		//	alert("1");
			//alert("base: "+porcentaje_base+" incremento: "+porcentaje_incremento);
var montoml = document.getElementById('pde_monto').value;
total = parseFloat(montoml)*porcentaje_base/100*porcentaje_descuento/100;
//alert(total);
document.getElementById('pde_descuento_ml').value=total.toFixed(2);

var incml = document.getElementById('pde_monto_impuesto_ml').value;

if (incml == 0 || incml== '') {
	totalneto = parseFloat(montoml)-parseFloat(total);
	//alert(totalneto);
	document.getElementById('pde_monto_neto_ml').value=totalneto.toFixed(2);
}else{
	totalneto = parseFloat(montoml)+parseFloat(incml)-parseFloat(total);
	//alert(totalneto);
	document.getElementById('pde_monto_neto_ml').value=totalneto.toFixed(2);
}


//CALCULO PARA MONEDA ALTERNA
var montoma = document.getElementById('pde_monto_moneda_alterna').value;
totalma = parseFloat(montoma)*porcentaje_base/100*porcentaje_descuento/100; 
//alert(totalma);
document.getElementById('pde_monto_descuento_ma').value=totalma.toFixed(2);

var incma = document.getElementById('pde_monto_impuesto_ma').value;

if (incma == 0 || incma== '') {
	totalnetoma = parseFloat(montoma)-parseFloat(totalma);
	document.getElementById('pde_monto_neto_ma').value=totalnetoma.toFixed(2);
}else{
	totalnetoma = parseFloat(montoma)+parseFloat(incma)-parseFloat(totalma);
	document.getElementById('pde_monto_neto_ma').value=totalnetoma.toFixed(2);
}



