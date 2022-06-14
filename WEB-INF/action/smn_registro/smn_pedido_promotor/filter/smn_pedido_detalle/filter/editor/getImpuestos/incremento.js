var porcentaje_base = '${fld:porbase}';
var porcentaje_impuesto = '${fld:porinc}';

// $('#porcentaje_impuesto').val(porcentaje_base);
// $('#sustraendo_impuesto').val(porcentaje_impuesto);
//alert("base: "+porcentaje_base+" incremento: "+porcentaje_incremento);

var montoml = document.getElementById('pde_monto').value;
//alert(montoml);
total = parseFloat(montoml) * porcentaje_base/100*porcentaje_impuesto/100;

//alert(total);

document.getElementById('pde_monto_impuesto_ml').value=total.toFixed(2);

totalneto = parseFloat(montoml)+parseFloat(total);

document.getElementById('pde_monto_neto_ml').value=totalneto.toFixed(2);


//CALCULO PARA MONEDA ALTERNA

var montoma = document.getElementById('pde_monto_moneda_alterna').value;

totalma =parseFloat(montoma) * porcentaje_base/100 *porcentaje_impuesto/100; 

//alert(totalma);

document.getElementById('pde_monto_impuesto_ma').value=totalma;

totalnetoma = parseFloat(montoma)+parseFloat(totalma);

document.getElementById('pde_monto_neto_ma').value=totalnetoma;