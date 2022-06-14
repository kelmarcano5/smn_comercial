var tipo = '${fld:tipo}';
var mon_alt = '${fld:moneda_alterna}';
var req_bank = '${fld:req_banco}';

if (tipo=='EF' && mon_alt == 'No') {
	$('#med_pag').hide();
	$('#num_doc').hide();
	$('#num_aut').hide();
	$('#num_dep').hide();
	$('#doc_ident').hide();
	$('#nom_pag').hide();
	$('#bancorig').hide();
	$('#bancodesti').hide();
	$('#cuentaban').hide();
	$('#coin').hide();
	$('#tasa').hide();
	document.getElementById('ppv_monto_pago_ml').disabled=false;
	document.getElementById('grabar').disabled=false;
}

if (tipo == 'EF' && mon_alt == 'Si') {
	$('#coin').show();
	$('#tasa').show();
	$('#bancorig').hide();
	$('#bancodesti').hide();
	$('#cuentaban').hide();
	$('#num_doc').hide();
	$('#num_aut').hide();
	$('#num_dep').hide();
	$('#doc_ident').hide();
	$('#nom_pag').hide();
	document.getElementById('ppv_monto_pago_ml').disabled=true;
	document.getElementById('ppv_monto_pago_ma').disabled=false;
	document.getElementById('grabar').disabled=false;
}


if (tipo=='TR' && req_bank=='S') {
	$('#coin').show();
	$('#tasa').show();
	$('#num_doc').show();
	$('#num_aut').show();
	$('#num_dep').show();
	$('#bancorig').show();
	$('#bancodesti').show();
	$('#cuentaban').show();
	
	$('#doc_ident').show();
	$('#nom_pag').show();
	document.getElementById('ppv_monto_pago_ml').disabled=false;		
	document.getElementById('grabar').disabled=false;

}

if (tipo=='TR' && mon_alt=='Si' && req_bank=='S') {
	$('#coin').show();
	$('#tasa').show();
	$('#num_doc').show();
	$('#num_aut').show();
	$('#num_dep').show();
	$('#bancorig').show();
	$('#bancodesti').show();
	$('#cuentaban').show();

	$('#doc_ident').show();
	$('#nom_pag').show();
	document.getElementById('ppv_monto_pago_ml').disabled=false;		
	document.getElementById('grabar').disabled=false;

}

if (tipo=='CH' && req_bank=='S') {
	$('#num_doc').show();
	$('#num_aut').show();
	$('#num_dep').show();
	$('#doc_ident').show();
	$('#nom_pag').show();
	document.getElementById('ppv_monto_pago_ml').disabled=false;
	document.getElementById('grabar').disabled=false;
}

if (tipo=='CR' && req_bank=='N') {
	$('#num_doc').show();
	$('#num_aut').show();
	$('#num_dep').show();
	$('#doc_ident').show();
	$('#nom_pag').show();
	document.getElementById('ppv_monto_pago_ml').disabled=false;
	document.getElementById('grabar').disabled=false;
}

if (tipo=='PV' && mon_alt=='No' && req_bank=='S') {
	$('#num_doc').show();
	$('#num_aut').show();
	$('#num_dep').show();
	$('#doc_ident').show();
	$('#nom_pag').show();
	document.getElementById('ppv_monto_pago_ml').disabled=false;
	document.getElementById('grabar').disabled=false;
}

if(mon_alt == 'Si'){

	// var m1 = document.getElementById('ppv_monto_pagar_ml').value;
	// document.getElementById('ppv_monto_pago_ml').value = m1;
	// document.getElementById('ppv_monto_devuelto_ml').value = m1;

	document.getElementById('coin').style.display='';
	document.getElementById('tasa').style.display='';
	document.getElementById('mo_pagar').style.display='';
	document.getElementById('mo_pago').style.display='';
	document.getElementById('mo_devo').style.display='';

}else{
	document.getElementById('coin').style.display='none';
	document.getElementById('tasa').style.display='none';
	document.getElementById('mo_pagar').style.display='none';
	document.getElementById('mo_pago').style.display='none';
	document.getElementById('mo_devo').style.display='none';
}
