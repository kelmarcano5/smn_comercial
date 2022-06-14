var tipo = '${fld:tipo}';
var gen_ord_desp = '${fld:gen_ord_desp}';
<<<<<<< HEAD
<<<<<<< HEAD
=======
$('#despacho').val(gen_ord_desp);
console.log("GENERAR ORDEN DESPACHO: "+gen_ord_desp);
>>>>>>> a5898d36b06ae8eb52b4f79d47345249ded34511
=======
$('#despacho').val(gen_ord_desp);
console.log("GENERAR ORDEN DESPACHO: "+gen_ord_desp);
>>>>>>> a5898d36b06ae8eb52b4f79d47345249ded34511
var gen_fac = '${fld:gen_fac}';
var req_monalt = '${fld:req_monalt}';
var req_fven = '${fld:req_fven}';
var req_vend = '${fld:req_vend}';
var req_tiem_entrega = '${fld:req_tiem_entrega}';
var tipo_mov = '${fld:tipo_mov}';
var usa_anexo = '${fld:usa_anexo}';
var usa_bonific = '${fld:usa_bonific}';
var usa_descuento = '${fld:usa_descuento}';
<<<<<<< HEAD
<<<<<<< HEAD
=======
var entrega_por_orden = '${fld:entrega_por_orden}';
console.log("ENTREGA POR ORDEN: "+entrega_por_orden);

>>>>>>> a5898d36b06ae8eb52b4f79d47345249ded34511
=======
var entrega_por_orden = '${fld:entrega_por_orden}';
console.log("ENTREGA POR ORDEN: "+entrega_por_orden);

>>>>>>> a5898d36b06ae8eb52b4f79d47345249ded34511
//alert(req_vend);
if(req_tiem_entrega=='SI'){
	$('#fch_requerida').show();
}else{
	$('#fch_requerida').hide();
		//$('#fch_requerida').show();
	document.form1.pca_fecha_requerida.value='${def:date}';
}

if (req_vend == 'SI') {
	$('#vendedor').show();
}else{
	$('#vendedor').hide();
}




