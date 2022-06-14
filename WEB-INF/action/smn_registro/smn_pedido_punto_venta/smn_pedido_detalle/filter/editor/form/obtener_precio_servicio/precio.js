var precio = '${fld:precio@#,###,##0.00}';
var precioma = '${fld:precioma@#,###,##0.00}';

if(precioma != 0) {
	document.form1.pde_precio_moneda_alterna.value = precioma;
	document.getElementById("prec_alt").style.display='';
	document.getElementById("mont_alt").style.display='';
	document.form1.pde_monto_moneda_alterna.disabled=true;
}else{
	document.getElementById("prec_alt").style.display='none';
	document.getElementById("mont_alt").style.display='none';
}

document.getElementById("pde_precio").value = (precio*100)/100;

