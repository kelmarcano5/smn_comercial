var precio = '${fld:precio}';
var preciom = '${fld:precioma}';
var moneda = '${fld:smn_moneda_rf}';
	$('#prec_alt').hide();
	$('#mont_alt').hide();
console.log(precio);
console.log(preciom);
console.log(moneda);
if(preciom != 0) {
	if (moneda != 0 && moneda != "") {
		obtenertasadeldia(moneda);
	}

	var precioma = '${fld:precioma}';
	alert("entro aqui");
	document.form1.pde_precio_moneda_alterna.value = precioma;
	document.form1.smn_moneda_rf.value = moneda;
	$('#prec_alt').show();
	$('#mont_alt').show();
	//document.getElementById("prec_alt").style.display='';
	//document.getElementById("mont_alt").style.display='';
	document.form1.pde_monto_moneda_alterna.disabled=true;
}else{
	$('#prec_alt').hide();
	$('#mont_alt').hide();
		var precio = '${fld:precio}';
		alert("entro aqui");
		document.form1.pde_precio.value = precio;
		document.form1.pde_precio.value =0;
		document.form1.pde_monto.value =0;
		
	//document.getElementById("prec_alt").style.display='none';
	//document.getElementById("mont_alt").style.display='none';
}

document.getElementById("pde_precio").value = precio;


function obtenertasadeldia(moneda) {
	var uri="${def:actionroot}/gettasaactual?id=" + moneda;
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