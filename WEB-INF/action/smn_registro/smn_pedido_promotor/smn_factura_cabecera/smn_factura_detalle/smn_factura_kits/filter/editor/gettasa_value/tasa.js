var divisa = '${fld:tasa_cambio}';

var monto_ml = document.getElementById('fki_monto_ml').value;
var total_ma = 0

total_ma = monto_ml / divisa
//alert("DIVISA: "+divisa+ "TOTAL: "+total_ma);

document.getElementById('fki_monto_ma_rf').value = total_ma.toFixed(2);
document.getElementById('fki_monto_ma_rf').disabled = true;
//document.getElementById('ppv_monto_devuelto_ma').disabled = true;

 document.getElementById('divisa').value = divisa;