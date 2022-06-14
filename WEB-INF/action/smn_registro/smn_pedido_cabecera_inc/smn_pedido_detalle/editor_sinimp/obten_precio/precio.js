var precio1 = '${fld:precio@##,###,##0.00}';
var precio = formatear_monto(precio1);
var preciom = '${fld:precioma}';
var moneda = '${fld:smn_moneda_rf}';
var tipo = $('#tipotasa').val();
	$('#prec_alt').hide();
	$('#mont_alt').hide();
 console.log(precio);
 console.log(preciom);
 console.log(moneda);
 $("#smn_tasa_rf option[value=0]").remove();
if(preciom != 0) {
			$('#moneda').show();
				document.form1.smn_moneda_rf.disabled=true;
					document.form1.smn_tasa_rf.disabled=true;
			$('#tasa').show();

	if (moneda != 0 && moneda != "") {
		obtenertasadeldia(moneda);
		chgCombo30(moneda);
	}

	var precioma = '${fld:precioma@##,###,##0.00}';
	//alert("entro aqui");
	document.form1.pde_precio_moneda_alterna.value = formatear_monto(precioma);
	document.form1.smn_moneda_rf.value = moneda;
	$('#prec_alt').show();
	$('#mont_alt').show();
	//document.getElementById("prec_alt").style.display='';
	//document.getElementById("mont_alt").style.display='';
	document.form1.pde_monto_moneda_alterna.disabled=true;
}else{
	
	$('#prec_alt').hide();
	$('#mont_alt').hide();
	document.form1.pde_precio_moneda_alterna.value =0;
	document.form1.pde_monto_moneda_alterna.value =0;
	document.form1.pde_precio.disabled=true;
	//document.getElementById("prec_alt").style.display='none';
	//document.getElementById("mont_alt").style.display='none';
		document.form1.pde_precio.disabled=true;
}

document.getElementById("pde_precio").value = precio;
	document.form1.pde_precio.disabled=true;

function obtenertasadeldia(moneda) {
	var uri="${def:actionroot}/gettasaactual?id=" + moneda + "&tipotasa="+tipotasa;
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

//Este codigo fue creado por SIMONE y ajustado en este crud por Kelvin Marcano
function chgCombo30(moneda)
{				
	var tipo = $('#tipotasa').val();
	//alert(valueCombo);
	if (moneda!=null && moneda!="") 
	{	
		return ajaxCall(	
						httpMethod="GET", 
						uri="${def:actionroot}/gettasa?id=" + moneda + "&tipotasa="+tipo, 
						divResponse=null, 
						divProgress="status", 
						formName="form1", 
						afterResponseFn=setElementFirstIndex('smn_tasa_rf'), //function 'setElementFirstIndex' select first element of combo list
						onErrorFn=null); 				
	}
}

function formatear_monto(monto)
	{
		var base = monto;
		base1 = base.replace('.','');
		base = base1.replace('.','');
		base1 = base.replace(',','.');
		
		return base1;
	}