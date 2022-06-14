addNew();

$("#smn_documento_id").empty();
$("#pca_vendedor").empty();
$("#smn_cliente_id").empty();
$("#smn_condicion_financiera_rf").empty();
$('#pca_descripcion').val('');
$('#pca_fecha_vencimiento').val('');
$('#pca_fecha_requerida_desde').val('');
// $("#select2_example").empty();
// $("#smn_documento_id").select2("val", "");
// $("#pca_vendedor").select2("val", "");
// $('#smn_documento_id').val('').change();
// $('#pca_vendedor').val('').change();
// $('#smn_cliente_id').val('').change();
// $('#pca_fecha_requerida_desde').val('');
// $('#pca_descripcion').val('');
// $('#smn_condicion_financiera_rf').val('').change();;
// $('#pca_fecha_vencimiento').val('');

alertBox ('${lbl:b_record_added}: ${fld:id}', '${lbl:b_continue_button}', null, 'search(); setFocusOnForm("form1"); parent.parent.closeDialog();');
// var fecha_req = $('#fecha_requerida').val();
// console.log(fecha_req);
// var despacho = $('#despacho').val();
// console.log("despacho : "+despacho);
// var id_cab = '${fld:id}';
// goTodetail(id_cab);

// function goTodetail(id_cab) {

// 	uri = "${def:context}${def:actionroot}/../editor_det/form?id2="+id_cab+"&despacho="+despacho+"&fecha_requerida="+fecha_req;
// 	console.log("got to detail : "+uri);
// 	//alert(uri);
// 	openDialog("editor5", uri, 650, 650);
// }