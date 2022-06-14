var tp = '${fld:smn_tipo_componente}';
var vs = '${fld:smn_visible_rf}';
var gp = '${fld:smn_grupo_prestador_rf}';
var fp = '${fld:smn_forma_calculo_rf}';
var por = '${fld:porcentaje}';

document.getElementById('smn_tipo_componente').value = tp;
document.getElementById('smn_forma_calculo_rf').value = fp;
document.getElementById('smn_visible_rf').value = vs;
document.getElementById('cmp_porcentaje').value = parseFloat(por);
document.getElementById('smn_grupo_prestador_rf').value = gp;

document.getElementById('smn_tipo_componente').disabled=true;
document.getElementById('smn_forma_calculo_rf').disabled=true;
document.getElementById('smn_visible_rf').disabled=true;
document.getElementById('cmp_porcentaje').disabled=true;
document.getElementById('smn_grupo_prestador_rf').disabled=true;

//alert("tipo: "+tp+" visible: "+vs+" grupo prest: "+gp+" forma_pago: "+fp+" porcentaje: "+por);


