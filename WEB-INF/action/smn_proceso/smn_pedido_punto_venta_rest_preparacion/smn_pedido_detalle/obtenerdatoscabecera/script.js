var codigo = '${fld:numeropedido}';
var descripcion = '${fld:descripcion_cab}';
var documento = '${fld:documento}';
var cliente = '${fld:cliente}';
var status = '${fld:pca_estatus_val}';
var comprador = '${fld:comprador}';
var monto = '${fld:monto}';


document.getElementById("codigo").value = codigo;
document.getElementById("descripcion").value = descripcion;
document.getElementById("documento").value = documento;
document.getElementById("status").value = status;
document.getElementById("comprador").value = comprador;
document.getElementById("cliente").value = cliente;
document.getElementById("monto").value = monto;
document.getElementById("montopagar").value = monto;

//alert("datos1 : "+ codigo + "descripcion: " + descripcion + "documento: " + documento + "&cliente: " + cliente + "status: " + status + "comprador: " + comprador + " monto: " + monto);

