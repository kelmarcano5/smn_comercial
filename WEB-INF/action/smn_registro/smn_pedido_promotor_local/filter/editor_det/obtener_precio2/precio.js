var precio1 = '${fld:precio@#,###,##0.00}';
var precio = formatear_monto(precio1);
var precioma = '${fld:precioma@#,###,##0.00}';

if(precioma != 0) {
	document.form2.pde_precio_moneda_alterna.value = formatear_monto(precioma);
	document.getElementById("prec_alt").style.display='';
	document.getElementById("mont_alt").style.display='';
	document.form2.pde_monto_moneda_alterna.disabled=true;
}else{
	document.getElementById("prec_alt").style.display='none';
	document.getElementById("mont_alt").style.display='none';
}

document.getElementById("pde_precio").value = (precio*100)/100;
	document.form2.pde_precio.disabled=true;

function formatear_monto(monto)
	{
		var base = monto;
		base1 = base.replace('.','');
		base = base1.replace('.','');
		base1 = base.replace(',','.');
		
		return base1;
	}