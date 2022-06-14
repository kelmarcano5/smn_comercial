document.getElementById('prd_precio').value=0;
document.getElementById('prd_cantidad').value=1;

<prd_cantidad_rows>

var precio =  "${fld:bad_precio_moneda_local}";
var cantidad =  "${fld:bad_cantidad}";

document.getElementById('prd_precio').value=precio;
document.getElementById('prd_cantidad').value=cantidad;
document.getElementById('prd_monto_moneda_local').value=cantidad*precio;

</prd_cantidad_rows>




	 



