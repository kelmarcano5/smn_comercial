addNew();
//addNew();
var idp =  '${fld:id2}';
updateMontoPedido(idp);
recalcular_monto();
alertBox ('${lbl:b_record_added}: ${fld:id}', '${lbl:b_continue_button}', null, 'parent.search(); parent.setFocusOnForm("form1");');
//var uri ="/smn_comercial/action/smn_registro/smn_pedido_punto_venta/smn_pago_punto_venta/editor/form?id2=${fld:id2}"; 
//alert(uri);
//openDialog("editor10", uri, 750, 680);
//alertBox ('${lbl:b_record_added}: ${fld:id}', '${lbl:b_continue_button}', null, 'search(); setFocusOnForm("form1");');

