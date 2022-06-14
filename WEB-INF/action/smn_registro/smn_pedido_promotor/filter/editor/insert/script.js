//addNew();
//alertBox ('${lbl:b_record_added}: ${fld:id}', '${lbl:b_continue_button}', null, 'search(); setFocusOnForm("form1");');
var fecha_req = $('#fecha_requerida').val();
console.log(fecha_req);
var despacho = $('#despacho').val();
console.log("despacho : "+despacho);
var id_cab = '${fld:id}';
goTodetail(id_cab);

function goTodetail(id_cab) {

	uri = "${def:context}${def:actionroot}/../editor_det/form?id2="+id_cab+"&despacho="+despacho+"&fecha_requerida="+fecha_req;
	console.log("got to detail : "+uri);
	//alert(uri);
	openDialog("editor5", uri, 650, 650);
}