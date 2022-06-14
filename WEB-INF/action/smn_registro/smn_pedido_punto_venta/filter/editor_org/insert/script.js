addNew();
alertBox ('${lbl:b_record_added}: ${fld:id}', '${lbl:b_continue_button}', null, 'parent.search(); parent.setFocusOnForm("form1");');

var uri ="/smn_comercial/action/smn_registro/smn_pedido_punto_venta/smn_pedido_detalle/editor/form?id2=${fld:id}"; 
alert(uri);
openDialog("editor10", uri, 650, 580);