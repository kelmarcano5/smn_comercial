//var precio1 = '${fld:precio@##,###,##0.00}';
var centro = $('#centro').val();
var precio = parseFloat('${fld:precio}');
var preciom = '${fld:precioma}';
var moneda = '${fld:smn_moneda_rf}';
	$('#prec_alt').hide();
	$('#mont_alt').hide();
 console.log(precio);
 console.log(preciom);
 console.log(moneda);
if(preciom != 0) {
	if (moneda != 0 && moneda != "") {
		obtenertasadeldia(moneda, centro);
	}

	var precioma = '${fld:precioma@##,###,##0.00}';
	document.form1.pde_precio_moneda_alterna.value = formatear_monto(precioma);
	document.form1.smn_moneda_rf.value = moneda;

	$('#prec_alt').show();
	$('#mont_alt').show();
	document.form1.pde_monto_moneda_alterna.disabled=true;
	
}else{
	$('#prec_alt').hide();
	$('#mont_alt').hide();
	document.form1.pde_precio_moneda_alterna.value=0;
	document.form1.pde_monto_moneda_alterna.value=0;
	document.form1.pde_precio.disabled=true;
}

document.getElementById("pde_precio").value = precio.toFixed(2);
document.form2.pde_precio.disabled=true;
//document.getElementById("pde_precio").value = precio; document.form1.pde_precio.disabled=true;

function obtenertasadeldia(moneda, centro) {
	var uri="${def:actionroot}/gettasaactual?id=" + moneda +"&centro="+ centro;
	console.log(uri);
	 ajaxCall(	
			httpMethod="GET", 
			uri, 
			divResponse=null, 
			divProgress="status", 
			formName="form1", 
			afterResponseFn=null, //function 'setElementFirstIndex' select first element of combo list
			onErrorFn=null); 
}

function formatear_monto(monto)
	{
		var base = monto;
		base1 = base.replace('.','');
		base = base1.replace('.','');
		base1 = base.replace(',','.');
		
		return base1;
	}