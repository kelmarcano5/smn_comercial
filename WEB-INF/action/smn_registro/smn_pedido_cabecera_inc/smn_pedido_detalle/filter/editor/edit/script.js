document.form1.smn_pedido_cabecera_id.value='${fld:smn_pedido_cabecera_id@#,###,###}';

var impuestos = '${fld:smn_codigos_impuestos_rf}';
$('#smn_codigos_impuestos_rf').val(impuestos).change();

var descuentos = '${fld:smn_codigo_descuento_rf}';
$('#smn_codigo_descuento_rf').val(descuentos).change();

var pde_naturaleza = '${fld:pde_naturaleza}';
$('#pde_naturaleza').val(pde_naturaleza).change();

document.form1.pde_monto_impuesto_ml.value=formatear_monto('${fld:pde_monto_impuesto_ml@#,###,##0.00}');
document.form1.pde_monto_impuesto_ma.value=formatear_monto('${fld:pde_monto_impuesto_ma@#,###,##0.00}');

document.form1.pde_descuento_ml.value=formatear_monto('${fld:pde_descuento_ml@#,###,##0.00}');
document.form1.pde_monto_descuento_ma.value=formatear_monto('${fld:pde_monto_descuento_ma@#,###,##0.00}');

document.form1.pde_monto_neto_ml.value=formatear_monto('${fld:pde_monto_neto_ml@#,###,##0.00}');
document.form1.pde_monto_neto_ma.value=formatear_monto('${fld:pde_monto_neto_ma@#,###,##0.00}');

setComboValue('pde_naturaleza','${fld:pde_naturaleza}','form1');
setComboValue('smn_servicios_rf','${fld:smn_servicios_rf}','form1');
setComboValue('smn_item_rf','${fld:smn_item_rf}','form1');
setComboValue('smn_activo_fijo_rf','${fld:smn_activo_fijo_rf}','form1');
document.form1.pde_cantidad_oferta.value='${fld:pde_cantidad_oferta@#######}';
document.form1.pde_cantidad_pedido.value='${fld:pde_cantidad_pedido@#######}';
document.form1.pde_cantidad_aprobada.value='${fld:pde_cantidad_aprobada@#######}';
document.form1.pde_precio.value=formatear_monto('${fld:pde_precio@#,###,##0.00}');
document.form1.pde_monto.value=formatear_monto('${fld:pde_monto@#,###,##0.00}');
setComboValue('smn_moneda_rf','${fld:smn_moneda_rf}','form1');
setComboValue('smn_tasa_rf','${fld:smn_tasa_rf}','form1');
document.form1.pde_precio_moneda_alterna.value=formatear_monto('${fld:pde_precio_moneda_alterna@#,###,##0.00}');
document.form1.pde_monto_moneda_alterna.value=formatear_monto('${fld:pde_monto_moneda_alterna@#,###,##0.00}');
document.form1.pde_especificaciones_pedido.value='${fld:pde_especificaciones_pedido@js}';
document.form1.pde_fecha_requerido.value='${fld:pde_fecha_requerida@dd-MM-yyyy}';
document.form1.pde_observaciones.value='${fld:pde_observaciones@js}';
document.form1.id.value='${fld:smn_pedido_detalle_id@#,###,###}';
setComboValue('pde_estatus','${fld:pde_estatus}','form1');
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");

var nat = '${fld:pde_naturaleza}';

document.form1.pde_naturaleza.disabled=true;

if(nat == 'IT'){
	var smn_item_rf = '${fld:smn_item_rf}';
	$('#smn_item_rf').val(smn_item_rf).change();;
		$('#item').show();
		$('#serv').hide();
		//document.getElementById('ite').style.display='';
}

if(nat == 'SE'){
	var smn_servicios_rf = '${fld:smn_servicios_rf}';
	$('#smn_servicios_rf').val(smn_servicios_rf).change();
		$('#serv').show();
		$('#item').hide();
		//document.getElementById('serv').style.display='';	
}

if(nat == 'AF'){
		//document.getElementById('act').style.display='';	
}

var mon = '${fld:smn_moneda_rf}';
if(mon != '360'){
	//console.log("MONEDA: "+'${fld:smn_moneda_rf}');
	//console.log("TASA: "+'${fld:smn_tasa_rf}');
	$('#tasa').show();
	$('#prec_alt').show();
	$('#mont_alt').show();
	//document.getElementById('tasa').style.display='';
	//document.getElementById('prec_alt').style.display='';
	//document.getElementById('mont_alt').style.display='';
}else{
	$('#tasa').hide();
	$('#prec_alt').hide();
	$('#mont_alt').hide();
	//document.getElementById('tasa').style.display='none';
	//document.getElementById('prec_alt').style.display='none';
	//document.getElementById('mont_alt').style.display='none';
}

if(mon == '0'){
	$('#tasa').hide();
	$('#prec_alt').hide();
	$('#mont_alt').hide();
	// document.getElementById('tasa').style.display='none';
	// document.getElementById('prec_alt').style.display='none';
	// document.getElementById('mont_alt').style.display='none';
}

 
function formatear_monto(monto){
		var base = monto;
		base1 = base.replace('.','');
		base = base1.replace('.','');
		base1 = base.replace(',','.');
		
		return base1;
}