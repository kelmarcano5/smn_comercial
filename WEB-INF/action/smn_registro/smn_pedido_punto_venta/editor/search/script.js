$('#form4').show();
var producto = '${fld:catalogo}';
var cantidad ='${fld:pde_cantidad_pedido}';
var precio ='${fld:pde_precio@##,###,##0.00}';
var monto ='${fld:monto@##,###,##0.00}';
	
 $("#smn_item_rf").val('0')

$("#tabla4").append('<tr><td align="left">'+producto+'</td><td align="center">'+cantidad+'</td><td align="right">'+precio+'</td><td align="right">'+monto+'</td></tr>');



// var elemento = window.document.getElementById('det');
// var fila="";
// //var fila2="";
// elemento.innerHTML="";
//  <rows>
// 	var res = fila.concat("<td align='center'>"+'${fld:catalogo}'+"</td><td>"+'${fld:descripcion}'+"</td><td>"+'${fld:requerimientos}'+"</td><td>"+'${fld:cantidad}'+"</td><td>"+'${fld:pde_precio}'+"</td><td>"+'${fld:monto}'+"</td><td>"+'${fld:pde_fecha_registro}'+"</td>");
 	
// </rows>

// 	document.getElementById("det").innerHTML = res;
