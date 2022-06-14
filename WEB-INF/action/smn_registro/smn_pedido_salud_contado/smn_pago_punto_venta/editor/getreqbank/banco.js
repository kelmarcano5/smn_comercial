//alert("getreqbank: "+'${fld:fop_requiere_banco}');
document.getElementById('req_banco').value = '${fld:fop_requiere_banco}';

var fop = document.getElementById('smn_forma_pago_rf');
var fop_text = fop.options[fop.selectedIndex].text;
var text_ = fop_text.substring(4,0);

var bank1 = '${fld:fop_requiere_banco}';
console.log('requiere banco:'+bank1);
//var cod = '${fld:fop_codigo}';
//var bank2 = document.getElementById('req_banco').value; || cod != 'EF01'

if (bank1 == 'S' && text_ != 'EF01' && text_ != 'EF02') {
	$('#med_pag').hide();
	$('#num_doc').hide();
	$('#num_aut').hide();
	$('#num_dep').hide();
	$('#doc_ident').hide();
	$('#nom_pag').hide();
	document.getElementById('ppv_monto_pago_ml').disabled=false;
}

if (bank1 == 'N') {
	$('#med_pag').hide();
	$('#num_doc').hide();
	$('#num_aut').hide();
	$('#num_dep').hide();
	$('#doc_ident').hide();
	$('#nom_pag').hide();
	document.getElementById('ppv_monto_pago_ml').disabled=false;
}


if (bank1 == 'S' && text_ == 'T001') {
	$('#med_pag').hide();
	$('#num_doc').show();
	$('#num_aut').show();
	$('#num_dep').hide();
	$('#doc_ident').hide();
	$('#nom_pag').hide();
	document.getElementById('ppv_monto_pago_ml').disabled=false;
}

if (bank1 == 'S' && text_ == 'T002') {
	$('#num_doc').show();
	$('#num_aut').show();
	$('#num_dep').hide();
	$('#doc_ident').hide();
	$('#nom_pag').hide();
	document.getElementById('ppv_monto_pago_ml').disabled=false;
}

if (bank1 == 'S' && text_ == 'T003') {
	$('#num_doc').show();
	$('#num_aut').show();
	$('#num_dep').hide();
	$('#doc_ident').hide();
	$('#nom_pag').hide();
	document.getElementById('ppv_monto_pago_ml').disabled=false;
}

if (bank1 == 'S' && text_ == 'T004') {
	$('#num_doc').show();
	$('#num_aut').show();
	$('#num_dep').hide();
	$('#doc_ident').hide();
	$('#nom_pag').hide();
	document.getElementById('ppv_monto_pago_ml').disabled=false;
}

if (bank1 == 'S' && text_ == 'T005') {
	$('#num_doc').show();
	$('#num_aut').show();
	$('#num_dep').hide();
	$('#doc_ident').hide();
	$('#nom_pag').hide();
	document.getElementById('ppv_monto_pago_ml').disabled=false;
}