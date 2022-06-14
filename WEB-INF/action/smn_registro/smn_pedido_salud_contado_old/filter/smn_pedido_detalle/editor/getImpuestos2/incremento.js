var montoml = document.getElementById('pde_monto').value;
var montodes = document.getElementById("pde_monto_impuesto_ml").value;

//var totalcero = parseFloat(montodes)-parseFloat(montonetoml);
document.getElementById("pde_monto_neto_ml").value=montoml;
document.getElementById("pde_monto_impuesto_ml").value=0;


var montoma = document.getElementById('pde_monto_moneda_alterna').value;
var montodesma = document.getElementById("pde_monto_impuestos_ma").value;

//var totalcero = parseFloat(montodes)-parseFloat(montonetoml);
document.getElementById("pde_monto_neto_ma").value=montoma;
document.getElementById("pde_monto_impuesto_ma").value=0;