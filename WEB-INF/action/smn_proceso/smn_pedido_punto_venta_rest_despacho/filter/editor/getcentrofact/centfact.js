var centro_fact = document.getElementById("smn_centro_facturacion_id").value;
var sub_centro_fact = document.getElementById("smn_sub_centro_facturacion_id").value;
var cliente = document.getElementById("smn_cliente_id").value;
var comprador = document.getElementById("smn_auxiliar_rf").value;

var ent = '${fld:smn_entidades_rf}';
var suc = '${fld:smn_sucursales_rf}';
var are = '${fld:smn_areas_servicios_rf}';
var uni = '${fld:smn_unidades_servicios_rf}';
var alm = '${fld:smn_almacen_rf}';
var cen = '${fld:smn_centro_costo_rf}';
var doc = '${fld:smn_documento_id}';
var vig = '${fld:cfc_vigencia}';
var sta = '${fld:cfc_estatus}';
var tpl = '${fld:tlc_naturaleza}';
var lin = '${fld:smn_linea_comercial_id}';

		//alert("ENTRO"+centro_fact);

//alertBox('Desea registrar el pedido', '${lbl:b_yes}', '${lbl:b_not}', 'activarform('+centro_fact+','+sub_centro_fact+','+cliente+','+comprador+','+ent+','+suc+','+are+','+uni+','+alm+','+cen+','+doc+','+vig+','+sta+','+tpl+','+lin+')');

//function activarform(centro_fact,sub_centro_fact,cliente,comprador,ent,suc,are,uni,alm,cen,doc,vig,sta,tpl,lin) {

	//alert("llego");
	if (centro_fact!=null && centro_fact!="") 
		{
			//var uri="${def:actionroot}/getcentrofact?centro_fact=" + centro_fact + "&sub_centro_fact="+ sub_centro_fact +"&cliente="+cliente;
			 var uri="${def:actionroot}/insertarPedido?smn_centro_facturacion_id_1=" + centro_fact + "&smn_sub_centro_facturacion_id_1="+ sub_centro_fact +"&smn_cliente="+cliente +"&smn_entidad_rf="+ent+
			"&smn_sucursal_rf="+suc+"&smn_area_servicio_rf="+are+"&smn_unidad_servicio_rf="+uni+"&smn_almacen_rf="+alm+"&smn_centro_costo_rf="+cen+"&smn_documento_id="+doc+"&cfc_vigencia="+vig+"&cfc_estatus="+sta+"&tlc_naturaleza="+tpl+"&smn_linea_comercial_id="+lin+"&smn_auxiliar_rf"+comprador;
		//	alert("INSERTAR EN PEDIDO"+uri);

			 ajaxCall(	
							httpMethod="POST", 
							uri, 
							divResponse=null, 
							divProgress="status", 
							formName="form1", 
							afterResponseFn=null, //function 'setElementFirstIndex' select first element of combo list
							onErrorFn=null);				
		}else{
			alert("Centro de Facturacion vacio por favor verifique sus opciones");
		}
//}
		

		
//insertarPedido(ent,suc,are,uni,alm,cen,doc,vig,sta);

//alert("valores tabla smn_centro_facturacion?empresa="+ent + " sucursal="+suc +" area=" +are + " unidad="+uni+" almacen=" +alm+ " centro_costo="+cen+ " documento="+doc+" fecha_vigencia=" +vig+" status=" +sta);

//function insertarPedido(entidad, sucursal, area, unidad, almacen, centro, documento, f_vigencia, status) {
//	}