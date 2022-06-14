$('#form4').show();
var detalle_id = '${fld:smn_pedido_detalle_id}';
var producto = '${fld:catalogo}';
var cantidad ='${fld:pde_cantidad_pedido}';
var precio ='${fld:pde_precio@#,###,##0.00}';
var monto ='${fld:monto@#,###,##0.00}';
var precioma ='${fld:precioma@#,###,##0.00}';
var montoma ='${fld:montoma@#,###,##0.00}';

 $("#smn_item_rf").val('0')

$("#tabla4").append('<tr><td align="center"><img src="${def:context}/images/delete.png"  type="button" class="borrar" onclick="deleteDetalle(${fld:smn_pedido_detalle_id})" ></td><td align="left">'+producto+'</td><td align="center">'+cantidad+'</td><td align="right">'+precio+'</td><td align="right">'+monto+'</td><td align="right">'+precioma+'</td><td align="right">'+montoma+'</td></tr>');

$(document).on('click', '.borrar', function (event) {
    event.preventDefault();
    //deleteDetalle(id);
    $(this).closest('tr').remove();
});

// var elemento = window.document.getElementById('det');
// var fila="";
// //var fila2="";
// elemento.innerHTML="";
//  <rows>
// 	var res = fila.concat("<td align='center'>"+'${fld:catalogo}'+"</td><td>"+'${fld:descripcion}'+"</td><td>"+'${fld:requerimientos}'+"</td><td>"+'${fld:cantidad}'+"</td><td>"+'${fld:pde_precio}'+"</td><td>"+'${fld:monto}'+"</td><td>"+'${fld:pde_fecha_registro}'+"</td>");
 	//<td align="center"><img src="${def:context}/images/delete.png"  onclick="deleteDetalle(${fld:smn_pedido_detalle_id})" title="${lbl:b_delete_button}"></td>
// </rows>

// 	document.getElementById("det").innerHTML = res;
