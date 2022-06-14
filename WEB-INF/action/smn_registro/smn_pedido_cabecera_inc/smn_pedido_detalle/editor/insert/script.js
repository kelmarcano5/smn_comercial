var id2 = document.getElementById("smn_pedido_cabecera_id").value;
var baremos = $('#baremos').val();
var itm = '${fld:cod_itm}';
var cant = '${fld:cant_ped}';
document.form1.item.value = itm;
document.form1.cantidad.value = cant;
console.log("item="+itm+" cantidad="+cant);

var imp = $('#smn_codigos_impuestos_rf').val();
var desc = $('#smn_codigo_descuento_rf').val();

if (imp !='') {
	var codimpuesto = $('#smn_codigos_impuestos_rf').val();
	var montoimpuestoml = $('#pde_monto_impuesto_ml').val();
	var montoimpuestoma = $('#pde_monto_impuesto_ma').val();
	var montobase = $('#pde_monto').val();
	var montobasema = $('#pde_monto_moneda_alterna').val();
	var moneda = $('#smn_moneda_rf').val();
	var tasa = $('#smn_tasa_rf').val();
	//console.log('COD IMPUESTO: '+codimpuesto+' MONTO IMPUESTO ML: '+montoimpuestoml+'  MONTO IMPUESTO MA:'+montoimpuestoma+'  MONTO BASE: '+montobase+' MONEDA: '+moneda+' TASA: '+tasa);
	GenerarImp(itm, codimpuesto, montoimpuestoml, montoimpuestoml, montobase, montobasema, moneda, tasa);
}

if (desc != '') {
	var coddescuento = $('#smn_codigo_descuento_rf').val();
	var montodescuentoml = $('#pde_descuento_ml').val();
	var montodescuentoma = $('#pde_monto_descuento_ma').val();
	var montobase = $('#pde_monto').val();
	var montobasema = $('#pde_monto_moneda_alterna').val();
	var moneda = $('#smn_moneda_rf').val();
	var tasa = $('#smn_tasa_rf').val();
	//console.log('COD DESCUENTO: '+coddescuento+' MONTO IMPUESTO ML: '+montodescuentoml+'  MONTO IMPUESTO MA:'+montodescuentoma+'  MONTO BASE: '+montobase+' MONEDA: '+moneda+' TASA: '+tasa);
	GenerarDesc(itm, coddescuento, montodescuentoml, montodescuentoma, montobase, montobasema, moneda, tasa);
}

recalcular_monto();
updateMontoPedido();

if (despacho=='SI') {
	console.log("Entro en el control item");
	actualizar_reserva_control_item(itm, cant);
	
}else{
	console.log("Entro en el control item negativo");
	actualizar_reserva_control_item_negativo(itm, cant);
}

alertBox ('${lbl:b_record_added}: ${fld:id}', '${lbl:b_continue_button}', null, 'search_2();');

function updateMontoPedido(id) {
			//setTimeout(updateMontoPedido(id_cab), 5000); parent.setFocusOnForm("form2");
	uri="${def:actionroot}/montoapagar?id2=" + id2;
	//alert(uri);
	ajaxCall(httpMethod="GET", 
				uri, 
				divResponse="response", 
				divProgress="status", 
				formName="form1", 
				afterResponseFn=null, 
				onErrorFn=null);
}

function recalcular_monto() {

	 ajaxCall(httpMethod="GET", 
					uri="${def:actionroot}/recalcular_saldos?id2=" + id2,
					divResponse=null, 
					divProgress="status", 
					formName="form1", 
					afterResponseFn=null, 
					onErrorFn=null);	

	
}

function actualizar_reserva_control_item_negativo(itm, cant) {
	var uri="${def:actionroot}/actualizar_control_item_neg?cod_itm=" + itm + "&cant_ped="+cant;
	console.log(uri);
	ajaxCall(httpMethod="GET", 
					uri,
					divResponse=null, 
					divProgress="status", 
					formName="form1", 
					afterResponseFn=null, 
					onErrorFn=null);	
}

function actualizar_reserva_control_item(itm, cant) {
	var uri="${def:actionroot}/actualizar_control_item?cod_itm=" + itm + "&cant_ped="+cant;
	console.log(uri);
	ajaxCall(httpMethod="GET", 
					uri,
					divResponse=null, 
					divProgress="status", 
					formName="form1", 
					afterResponseFn=null, 
					onErrorFn=null);	
}


function GenerarImp(id, codimpuesto, montoimpuestoml, montoimpuestoml, montobase, montobasema, moneda, tasa) {
		var uri="${def:actionroot}/GenerarImpuesto?id=" + id + "&cod_imp="+codimpuesto+"&montoimpuestoml="+montoimpuestoml+"&montoimpuestoma="+montoimpuestoma+"&montobaseml="+montobase+"&montobasema="+montobasema+"&smn_moneda_rf="+moneda+"&smn_tasa_rf="+tasa;
		//alert(uri);
		if (id!=null && id!="") 
		{	
			ajaxCall(httpMethod="GET", 
					uri, 
					divResponse=null, 
					divProgress="status", 
					formName="form1", 
					afterResponseFn=null, //function 'setElementFirstIndex' select first element of combo list
					onErrorFn=null); 				
		}
}

function GenerarDesc(id, codimpuesto, montoimpuestoml, montoimpuestoml, montobase, montobasema, moneda, tasa) {
		var uri="${def:actionroot}/GenerarDescuento?id=" + id + "&cod_des="+coddescuento+"&montodescuentoml="+montodescuentoml+"&montodescuentoma="+montodescuentoma+"&montobaseml="+montobase+"&montobasema="+montobasema+"&smn_moneda_rf="+moneda+"&smn_tasa_rf="+tasa;
		//alert(uri);
		if (id!=null && id!="") 
		{	
			ajaxCall(httpMethod="GET", 
					uri, 
					divResponse=null, 
					divProgress="status", 
					formName="form1", 
					afterResponseFn=null, //function 'setElementFirstIndex' select first element of combo list
					onErrorFn=null); 				
		}
}

addNew();
alertBox ('${lbl:b_record_added}: ${fld:id}', '${lbl:b_continue_button}', null, 'search(); setFocusOnForm("form1");');

