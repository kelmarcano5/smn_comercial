var nt = '${fld:pde_naturaleza}';
$('#pde_naturaleza').val(nt).change();

// var mo = '${fld:smn_moneda_rf}';
// $('#smn_moneda_rf').val(mo).change();

// var ta = '${fld:smn_tasa_rf}';
// $('#smn_tasa_rf').val(ta).change();

document.form1.smn_pedido_cabecera_id.value='${fld:smn_pedido_cabecera_id@#######}';
setComboValue('pde_naturaleza','${fld:pde_naturaleza}','form1');
document.form1.pde_cantidad_oferta.value='${fld:pde_cantidad_oferta@#######}';
document.form1.pde_cantidad_pedido.value='${fld:pde_cantidad_pedido@#######}';
document.form1.pde_cantidad_aprobada.value='${fld:pde_cantidad_aprobada@#######}';
document.form1.pde_precio.value='${fld:pde_precio@######0.00}';
document.form1.pde_monto.value=formatear_monto('${fld:pde_monto@#,###,##0.00}');
setComboValue('smn_moneda_rf','${fld:smn_moneda_rf}','form1');
setComboValue('smn_tasa_rf','${fld:smn_tasa_rf}','form1');
document.form1.pde_precio_moneda_alterna.value='${fld:pde_precio_moneda_alterna@#,###,##0.00}';
document.form1.pde_monto_moneda_alterna.value='${fld:pde_monto_moneda_alterna@#,###,##0.00}';
document.form1.pde_especificaciones_pedido.value='${fld:pde_especificaciones_pedido@js}';
document.form1.pde_fecha_requerida.value='${fld:pde_fecha_requerida@dd-MM-yyyy}';
document.form1.pde_observaciones.value='${fld:pde_observaciones@js}';
document.form1.id.value='${fld:smn_pedido_detalle_id@#######}';
setComboValue('pde_estatus','${fld:pde_estatus}','form1');

document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");

var nat = '${fld:pde_naturaleza}';
var lin = '${fld:linea}';
//alert(lin);
document.form1.pde_naturaleza.disabled=false;



if(nat == 'IT'){
		console.log(lin);
		$('#itm').show();
		$('#serv').hide();
		$('#act').hide();
		var it = '${fld:smn_item_rf}';
		$('#smn_item_rf').val(it).change();

		 setComboValue('smn_item_rf','${fld:smn_item_rf}','form1');

		document.form1.smn_item_rf.disabled=true;
		//chgComboItem_linea_edit(lin, '${fld:smn_item_rf}');
}

if(nat == 'SE'){	
		$('#serv').show();
		$('#itm').hide();
		$('#act').hide();

		var se = '${fld:smn_servicios_rf}';
		//alert(se);
		$('#smn_servicios_rf').val(se).change();
		//setComboValue('smn_servicios_rf','${fld:smn_servicios_rf}','form1');
		//	document.form1.smn_servicios_rf.disabled=true;
		//chgComboServicio_linea_edit(lin, '${fld:smn_servicios_rf}');
}

if(nat == 'AF'){
		$('#act').show();
		$('#serv').hide();
		$('#itm').hide();
		var ac = '${fld:smn_activo_fijo_rf}';
		$('#smn_activo_fijo_rf').val(ac).change();
		//setComboValue('smn_activo_fijo_rf','${fld:smn_activo_fijo_rf}','form1');
}
//alert("naturaleza desde el edit: "+nat);
function formatear_monto(monto)
	{
		var base = monto;
		base1 = base.replace('.','');
		base = base1.replace('.','');
		base1 = base.replace(',','.');
		
		return base1;
	}