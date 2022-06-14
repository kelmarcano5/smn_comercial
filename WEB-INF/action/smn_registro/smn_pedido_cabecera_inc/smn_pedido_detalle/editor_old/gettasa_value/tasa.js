var divisa = '${fld:tasa_cambio}';

var monto_ml = document.getElementById('pde_precio').value;
var total_ma = 0

total_ma = monto_ml / divisa
//alert("DIVISA: "+divisa+ "TOTAL: "+total_ma);

document.getElementById('pde_precio_moneda_alterna').value = total_ma.toFixed(8);
document.getElementById('pde_precio_moneda_alterna').disabled = true;
//document.getElementById('ppv_monto_devuelto_ma').disabled = true;

 document.getElementById('divisa').value = divisa;

 var cantidad = document.getElementById('pde_cantidad_pedido').value;
 var precioma = document.getElementById('pde_precio_moneda_alterna').value;

 var total_ma2 = 0

 total_ma2 = cantidad * precioma;

document.getElementById('pde_monto_moneda_alterna').value = total_ma2.toFixed(8);
document.getElementById('pde_monto_moneda_alterna').disabled = true;