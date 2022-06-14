var porcentaje_base = '${fld:porbase}';
var porcentaje_incremento = '${fld:porinc}';
//alert("base: "+porcentaje_base+" incremento: "+porcentaje_incremento);

var montoml = document.getElementById('prd_monto_moneda_local').value;
//alert(montoml);
total = parseFloat(montoml) * porcentaje_base/100*porcentaje_incremento/100;

//alert(total);

document.getElementById('prd_monto_incremento_ml').value=total.toFixed(2);

totalneto = parseFloat(montoml)+parseFloat(total);

document.getElementById('prd_monto_neto_ml').value=totalneto.toFixed(2);


//CALCULO PARA MONEDA ALTERNA

var montoma = document.getElementById('prd_moneda_alterna').value;

totalma =parseFloat(montoma) * porcentaje_base/100 *porcentaje_incremento/100; 

//alert(totalma);

document.getElementById('prd_monto_incremento_ma').value=totalma;

totalnetoma = parseFloat(montoma)+parseFloat(totalma);

document.getElementById('prd_monto_neto_ma').value=totalnetoma;