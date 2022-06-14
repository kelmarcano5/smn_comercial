var montoml = document.getElementById('prd_monto_moneda_local').value;
var montodes = document.getElementById("prd_monto_incremento_ml").value;

//var totalcero = parseFloat(montodes)-parseFloat(montonetoml);
document.getElementById("prd_monto_neto_ml").value=montoml;
document.getElementById("prd_monto_incremento_ml").value=0;


var montoma = document.getElementById('prd_moneda_alterna').value;
var montodesma = document.getElementById("prd_monto_incremento_ma").value;

//var totalcero = parseFloat(montodes)-parseFloat(montonetoml);
document.getElementById("prd_monto_neto_ma").value=montoma;
document.getElementById("prd_monto_incremento_ma").value=0;