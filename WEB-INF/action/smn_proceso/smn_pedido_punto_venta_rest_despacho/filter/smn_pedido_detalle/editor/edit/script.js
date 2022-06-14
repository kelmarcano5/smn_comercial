document.form1.smn_pedido_cabecera_id.value='${fld:smn_pedido_cabecera_id@#,###,###}';
setComboValue('pde_naturaleza','${fld:pde_naturaleza}','form1');
setComboValue('smn_servicios_rf','${fld:smn_servicios_rf}','form1');
setComboValue('smn_item_rf','${fld:smn_item_rf}','form1');
setComboValue('smn_activo_fijo_rf','${fld:smn_activo_fijo_rf}','form1');
document.form1.pde_cantidad_oferta.value='${fld:pde_cantidad_oferta@#######}';
document.form1.pde_cantidad_pedido.value='${fld:pde_cantidad_pedido@#######}';
document.form1.pde_cantidad_aprobada.value='${fld:pde_cantidad_aprobada@#######}';
document.form1.pde_precio.value='${fld:pde_precio@######000}';
document.form1.pde_monto.value='${fld:pde_monto@######}';
setComboValue('smn_moneda_rf','${fld:smn_moneda_rf}','form1');
setComboValue('smn_tasa_rf','${fld:smn_tasa_rf}','form1');
document.form1.pde_precio_moneda_alterna.value='${fld:pde_precio_moneda_alterna@######}';
document.form1.pde_monto_moneda_alterna.value='${fld:pde_monto_moneda_alterna@######}';
document.form1.pde_especificaciones_pedido.value='${fld:pde_especificaciones_pedido@js}';
document.form1.pde_fecha_requerido.value='${fld:pde_fecha_requerido@dd-MM-yyyy}';
document.form1.pde_observaciones.value='${fld:pde_observaciones@js}';
document.form1.id.value='${fld:smn_pedido_detalle_id@#,###,###}';
setComboValue('pde_estatus','${fld:pde_estatus}','form1');
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");
setComboValue('smn_catalogo_item_comercio_id','${fld:smn_catalogo_item_comercio_id}','form1');
setComboValue('smn_unidad_medida_rf','${fld:smn_unidad_medida_rf}','form1');
document.form1.pde_tiempo_sug_preparacion.value='${fld:pde_tiempo_sug_preparacion@js}';
document.form1.smn_descripcion_ingrediente.value='${fld:smn_descripcion_ingrediente@js}';
//setComboValue('smn_descripcion_ingrediente','${fld:smn_descripcion_ingrediente}','form1'); 

var elemento = window.document.getElementById('ing');
<rows>

	var id = "${fld:smn_ingredientes_id}";
	var item = "${fld:item}";
	var precio = "${fld:precio}";

	var fila ='<label id="item">'+
				'<input name="smn_ingredientes_id" id="smn_ingredientes_id" type="checkbox" value="'+id+'" style="width:10px" onclick=\"concatenaritem(this, this); calcularprecioingrediente(this, this)\" data-name=\"'+item+'\" data-precio=\"'+precio+'\">'+item+
			   '</label><br>';
					
   elemento.innerHTML += fila;

    //setCheckboxValue('smn_ingredientes_id','${fld:smn_ingredientes_id}','form1');
   
</rows>