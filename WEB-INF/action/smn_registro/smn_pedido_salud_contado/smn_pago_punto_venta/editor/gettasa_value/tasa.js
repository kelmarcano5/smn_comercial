var divisa = '${fld:tasa}';

//var monto_ml = document.getElementById('ppv_monto_pago_ml').value;
//var total_ma = 0

//total_ma = monto_ml / divisa
//alert("DIVISA: "+divisa.toFixed(2)+ "TOTAL: "+total_ma.toFixed(2));

//document.getElementById('ppv_monto_pago_ma').value = total_ma.toFixed(2);
document.getElementById('ppv_monto_pago_ma').disabled = true;
document.getElementById('ppv_monto_devuelto_ma').disabled = true;

 document.getElementById('divisa').value = divisa;