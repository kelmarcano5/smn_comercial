var porcentaj =  "${fld:porccal}";
var sustraend =  "${fld:sustrae}";
//alert(porcentaj);
//document.getElementById('porcentaje').value = porcentaj;
//document.getElementById('sustraendo').value = sustraend;

var base = document.getElementById("pim_base_imponible_ml").value;
var excento = document.getElementById("pim_base_excenta_ml").value;

total = parseFloat(base)*porcentaj/100;

//alert(total);

document.getElementById("pim_monto_impuesto_ml").value = total;
document.getElementById('pim_monto_impuesto_ml').disabled = true;

total2 = parseFloat(excento) - parseFloat(sustraend); 

//alert(total2);

document.getElementById("pim_monto_sustraendo_ml").value = total2;

//document.getElementById('pim_monto_sustraendo_ml').disabled = true;

total3 = parseFloat(total) - parseFloat(total2);

//alert(total3)

document.getElementById("pim_monto_neto_impuesto_ml").value = total3;
document.getElementById('pim_monto_neto_impuesto_ml').disabled = true;


//CALCULO MONEDA ALTERNA
var basema = document.getElementById("pim_base_imponible_ma").value;
var excentoma = document.getElementById("pim_base_excenta_ma").value;

total1 = parseFloat(basema)*porcentaj/100;
alert(total1);
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
