var cant_exist = '${fld:cantidad_existente@#####}';
var cant_pedid = $('#pde_cantidad_pedido').val();
var total_cant = cant_exist-cant_pedid;
//alert("existencia"+cant_exist+" pedido: "+cant_pedid);
alertBox ('Cantidad en existencia=' + cant_exist + ' Cantidad en existencia - Cantidad del pedido='+total_cant, '${lbl:b_continue_button}', null, null);
if (parseInt(cant_pedid) < parseInt(cant_exist)) {
	document.form1.pde_cantidad_pedido.disabled=false;
	document.form1.grabar.disabled=false;
	pasar_cantidad();
	

}else{
	//document.form2.pde_cantidad_pedido.disabled=true;
	document.form1.grabar.disabled=true;
	document.form1.pde_cantidad_pedido.value="";
	alertBox ('Cantidad en existencia es menor a la cantidad del pedido', '${lbl:b_continue_button}', null, null);
}