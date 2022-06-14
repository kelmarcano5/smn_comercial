var tipo = '${fld:tipo}';
var mon_alt = '${fld:moneda_alterna}';
var req_bank = '${fld:req_banco}';


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
		document.getElementById('ppv_monto_pago_ma').disabled=true;
	document.getElementById('grabar').disabled=false;
}


if (tipo=='TR' && mon_alt=='No' && req_bank=='S') {
	$('#coin').show();
	$('#tasa').show();
	$('#num_doc').show();
	$('#num_aut').hide();
	$('#num_dep').hide();
	$('#bancorig').show();
	$('#bancodesti').show();
	$('#cuentaban').show();
	
	$('#doc_ident').show();
	$('#nom_pag').show();

		$('#mo_pago').show();
		$('#mo_pagar').show();
		$('#mo_devo').show();
		$('#ppv_monto_pagar_ma').prop('disabled','true');
		$('#ppv_monto_pago_ma').prop('disabled','true');
		$('#ppv_monto_devuelto_ma').prop('disabled','true');
	document.getElementById('ppv_monto_pago_ml').disabled=false;		
	document.getElementById('grabar').disabled=false;

}

if (tipo=='TR' && mon_alt=='Si' && req_bank=='S') {
	$('#coin').show();
	$('#tasa').show();
	$('#num_doc').show();
	$('#num_aut').hide();
	$('#num_dep').hide();
	$('#bancorig').show();
	$('#bancodesti').show();
	$('#cuentaban').show();

	$('#doc_ident').show();
	$('#nom_pag').show();

			$('#mo_pago').show();
		$('#mo_pagar').show();
		$('#mo_devo').show();
		$('#ppv_monto_pago_ma').prop('disabled','true');
		$('#ppv_monto_devuelto_ma').prop('disabled','true');

	document.getElementById('ppv_monto_pago_ml').disabled=true;		
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
	$('#num_dep').hide();
	$('#med_pag').show();
	$('#doc_ident').show();
	$('#nom_pag').show();
	$('#bancorig').hide();
	$('#bancodesti').hide();
	$('#cuentaban').hide();
	document.getElementById('ppv_monto_pago_ml').disabled=false;
	document.getElementById('grabar').disabled=false;
}

