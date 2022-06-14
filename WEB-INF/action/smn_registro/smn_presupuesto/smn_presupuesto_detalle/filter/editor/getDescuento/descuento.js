var porcentaje_base = '${fld:porbase}';
var porcentaje_descuento = '${fld:pordesc}';
//alert("base: "+porcentaje_base+" incremento: "+porcentaje_incremento);

var montoml = document.getElementById('prd_monto_moneda_local').value;

total = montoml*porcentaje_base/100*porcentaje_descuento/100;

document.getElementById('prd_monto_descuento_ml').value=total;

var incml = document.getElementById('prd_monto_incremento_ml').value;

totalneto = parseFloat(montoml)+parseFloat(incml)-parseFloat(total);

document.getElementById('prd_monto_neto_ml').value=totalneto;


//CALCULO PARA MONEDA ALTERNA

var montoma = document.getElementById('prd_moneda_alterna').value;

totalma = montoma*porcentaje_base/100*porcentaje_descuento/100; 

document.getElementById('prd_monto_descuento_ma').value=totalma;

var incma = document.getElementById('prd_monto_incremento_ma').value;

totalnetoma = parseFloat(montoma)+parseFloat(incma)-parseFloat(totalma);

document.getElementById('prd_monto_neto_ma').value=totalnetoma;