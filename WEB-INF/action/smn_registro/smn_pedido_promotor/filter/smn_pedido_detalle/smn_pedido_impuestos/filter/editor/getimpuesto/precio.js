var porcentaj =  "${fld:porccal}";
var sustraend =  "${fld:sustrae}";
var porcbase =  "${fld:porcbase}";
var tipocod = "${fld:tipocod}";
var base1 = 0.0;
var montoBase = 0.0;
var montoImpuesto = 0.0;
var total = 0.0;

document.getElementById('pim_porcentaje_impuesto').value = porcentaj;
document.getElementById('pim_porcentaje_impuesto').disabled = true;
document.getElementById('pim_monto_sustraendo').value = sustraend;
document.getElementById('pim_monto_sustraendo').disabled = true;

base1 = document.getElementById("pim_monto_base_ml").value;
//var excento = document.getElementById("pim_base_excenta_ml").value;
pim_porcentaje_impuesto
pim_monto_sustraendo
montoBase = (base1*porcbase)/100;
montoImpuesto = (montoBase*porcentaj)/100;

if(sustraend>0)
	total = montoImpuesto-sustraend;
else
	total = montoImpuesto;

if(tipocod == 'RE')
	total = total*-1;

document.getElementById("pim_monto_impuesto").value = total;
document.getElementById('pim_monto_impuesto').disabled = true;

// total2 = parseFloat(excento) - parseFloat(sustraend); 

// //alert(total2);

// document.getElementById("pim_monto_sustraendo_ml").value = total2;

// //document.getElementById('pim_monto_sustraendo_ml').disabled = true;

// total3 = parseFloat(total) - parseFloat(total2);

// //alert(total3)

// document.getElementById("pim_monto_neto_impuesto_ml").value = total3;
// document.getElementById('pim_monto_neto_impuesto_ml').disabled = true;


//CALCULO MONEDA ALTERNA
var basema = document.getElementById("pim_base_imponible_ma").value;
var excentoma = document.getElementById("pim_base_excenta_ma").value;

total1 = parseFloat(basema)*porcentaj/100;
//alert(total1);
document.getElementById("pim_monto_impuesto_ma").value = total1;
document.getElementById('pim_monto_impuesto_ma').disabled = true;

total4=0;
//total4 = excentoma - sustraend; 
alert(total4);
document.getElementById("pim_monto_sustraendo_ma").value = total4;
document.getElementById('pim_monto_sustraendo_ma').disabled = true;


total5 = ptotal1 - total4;
alert(total5)
document.getElementById("pim_monto_neto_impuesto_ma").value = total5;
document.getElementById('pim_monto_neto_impuesto_ma').disabled = true;
