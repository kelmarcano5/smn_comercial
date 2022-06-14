var porcentaje_base = '${fld:porbase}';
var porcentaje_descuento = '${fld:pordesc}';
		
		//	alert("1");
			//alert("base: "+porcentaje_base+" incremento: "+porcentaje_incremento);
var montoml = document.getElementById('prd_monto_moneda_local').value;

total = parseFloat(montoml)*porcentaje_base/100*porcentaje_descuento/100;

//alert(total);

document.getElementById('prd_monto_descuento_ml').value=total.toFixed(2);

var incml = document.getElementById('prd_monto_incremento_ml').value;

totalneto = parseFloat(montoml)+parseFloat(incml)-parseFloat(total);

//alert(totalneto);

document.getElementById('prd_monto_neto_ml').value=totalneto.toFixed(2);


//CALCULO PARA MONEDA ALTERNA

var montoma = document.getElementById('prd_moneda_alterna').value;

totalma = parseFloat(montoma)*porcentaje_base/100*porcentaje_descuento/100; 

//alert(totalma);

document.getElementById('prd_monto_descuento_ma').value=totalma;

var incma = document.getElementById('prd_monto_incremento_ma').value;

totalnetoma = parseFloat(montoma)+parseFloat(incma)-parseFloat(totalma);

document.getElementById('prd_monto_neto_ma').value=totalnetoma;
