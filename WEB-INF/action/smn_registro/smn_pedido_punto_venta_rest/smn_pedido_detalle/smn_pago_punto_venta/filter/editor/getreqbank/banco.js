//alert("getreqbank: "+'${fld:fop_requiere_banco}');
document.getElementById('req_banco').value = '${fld:fop_requiere_banco}';

var fop = document.getElementById('smn_forma_pago_rf');
var fop_text = fop.options[fop.selectedIndex].text;
var text_ = fop_text.substring(4,0);

var bank1 = '${fld:fop_requiere_banco}';
//var cod = '${fld:fop_codigo}';
//var bank2 = document.getElementById('req_banco').value; || cod != 'EF01'

if (bank1 == 'S' && text_ != 'EF01' && text_ != 'EF02') {
	document.getElementById('num_doc').style.display="";
	document.getElementById('num_aut').style.display="";
	document.getElementById('num_dep').style.display="";
	document.getElementById('doc_ident').style.display="";
	document.getElementById('nom_pag').style.display="";
}

if (bank1 == 'N') {
	document.getElementById('num_doc').style.display="none";
	document.getElementById('num_aut').style.display="none";
	document.getElementById('num_dep').style.display="none";
	document.getElementById('doc_ident').style.display="none";
	document.getElementById('nom_pag').style.display="none";
	document.getElementById('nom_pag').style.display="none";
}


if (bank1 == 'S' && text_ == 'T001') {
	document.getElementById('num_doc').style.display="";
	document.getElementById('num_aut').style.display="";
	document.getElementById('num_dep').style.display="none";
	document.getElementById('doc_ident').style.display="none";
	document.getElementById('nom_pag').style.display="none";
	//document.getElementById('monto_vuelto').style.display="none";
}

if (bank1 == 'S' && text_ == 'T002') {
	document.getElementById('num_doc').style.display="";
	document.getElementById('num_aut').style.display="";
	document.getElementById('num_dep').style.display="none";
	document.getElementById('doc_ident').style.display="none";
	document.getElementById('nom_pag').style.display="none";
	//document.getElementById('monto_vuelto').style.display="none";
}

if (bank1 == 'S' && text_ == 'T003') {
	document.getElementById('num_doc').style.display="";
	document.getElementById('num_aut').style.display="";
	document.getElementById('num_dep').style.display="none";
	document.getElementById('doc_ident').style.display="none";
	document.getElementById('nom_pag').style.display="none";
	//document.getElementById('monto_vuelto').style.display="none";
}

if (bank1 == 'S' && text_ == 'T004') {
	document.getElementById('num_doc').style.display="";
	document.getElementById('num_aut').style.display="";
	document.getElementById('num_dep').style.display="none";
	document.getElementById('doc_ident').style.display="none";
	document.getElementById('nom_pag').style.display="none";
	//document.getElementById('monto_vuelto').style.display="none";
}

if (bank1 == 'S' && text_ == 'T005') {
	document.getElementById('num_doc').style.display="";
	document.getElementById('num_aut').style.display="";
	document.getElementById('num_dep').style.display="none";
	document.getElementById('doc_ident').style.display="none";
	document.getElementById('nom_pag').style.display="none";
	//document.getElementById('monto_vuelto').style.display="none";
}