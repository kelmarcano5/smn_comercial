var porcentaje_base = '${fld:porbase}';
var porcentaje_descuento = '${fld:pordesc}';
//alert("PORCENTAJE BASE: "+porcentaje_base+" porcentaje_descuento: "+porcentaje_descuento);
$('#pim_porcentaje_retencion').val(porcentaje_descuento);
$("#pim_porcentaje_retencion").attr('disabled','disabled');

			//alert("base: "+porcentaje_base+" incremento: "+porcentaje_incremento);
var montoml = document.getElementById('pim_monto_base_ml').value;

total = parseFloat(montoml)*porcentaje_base/100*porcentaje_descuento/100;

//alert(total);

document.getElementById('pim_monto_descuento_retencion').value=total.toFixed(2)

//CALCULO PARA MONEDA ALTERNA

var montoma = document.getElementById('pim_monto_base_ma').value;

totalma = parseFloat(montoma)*porcentaje_base/100*porcentaje_descuento/100; 

// Format number to 2 decimal places
var num1 = totalma.toFixed(2);

// Replace dot with a comma
var num2 = num1.toString().replace(/\./g, ',');
//alert(num2);

document.getElementById('pim_monto_descuento_ma').value=num2;


function formatear_monto(monto)
{
	var base = monto;
	base1 = base.replace('.','');
	base = base1.replace('.','');
	base1 = base.replace(',','.');
	
	return base1;
}