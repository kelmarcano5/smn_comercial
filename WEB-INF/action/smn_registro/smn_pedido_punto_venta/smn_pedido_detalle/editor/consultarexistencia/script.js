var cant_exist = '${fld:cantidad_existente@#####}';
var cant_pedid = document.form1.pde_cantidad_pedido.value;
//alert("existencia"+cant_exist+" pedido: "+cant_pedid);
if (parseInt(cant_pedid) < parseInt(cant_exist)) {
	document.form1.pde_cantidad_pedido.disabled=false;
	document.form1.grabar.disabled=false;

	pasar_cantidad();
	//pasar_cantidad_ma();

}else{
	//document.form2.pde_cantidad_pedido.disabled=true;
	document.form1.grabar.disabled=true;
	document.form1.pde_cantidad_pedido.value="";
	alertBox ('Cantidad en existencia es menor a la cantidad del pedido', '${lbl:b_continue_button}', null, null);
}
