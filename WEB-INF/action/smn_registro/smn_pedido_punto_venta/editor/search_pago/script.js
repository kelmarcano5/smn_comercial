$('#form5').show();
var forma = '${fld:forma_pago}';
//var doc_pago='${fld:ppv_numero_documento_forma_pago}';
var num_aut='${fld:ppv_numero_autorizacion}';
var doc_ident='${fld:ppv_documento_identidad_pagador}';
var nom_pag='${fld:ppv_nombre_pagador}';
var mont_pagar='${fld:ppv_monto_pagar_ml@##,###,##0.00}';
var mont_pago='${fld:ppv_monto_pago_ml@##,###,##0.00}';
var mont_dev='${fld:ppv_monto_devuelto_ml@##,###,##0.00}';

$("#tabla5").append('<tr><td align="left">'+forma+'</td><td align="center">'+num_aut+'</td><td align="right">'+doc_ident+'</td><td align="right">'+nom_pag+'</td><td align="right">'+mont_pagar+'</td><td align="right">'+mont_pago+'</td><td align="right">'+mont_dev+'</td></tr>');
//  var elemento = window.document.getElementById('pag');<td align="left">'+doc_pago+'</td>
// elemento.innerHTML="";
//  <rows_pagos>
//  var fila="<td align='center'>"+'${fld:smn_pedido_cabecera_id}'+"</td><td>"+'${fld:ppv_numero_documento_forma_pago}'+"</td><td>"+'${fld:ppv_numero_autorizacion}'+"</td><td>"+'${fld:ppv_documento_identidad_pagador}'+"</td><td>"+'${fld:ppv_nombre_pagador}'+"</td><td>"+'${fld:ppv_monto_pagar_ml}'+"</td><td>"+'${fld:ppv_monto_pago_ml}'+"</td><td>"+'${fld:ppv_monto_devuelto_ml}'+"</td><td>"+'${fld:ppv_estatus}'+"</td><td>"+'${fld:ppv_fecha_registro}'+"</td>";
//  document.getElementById("pag")= fila;
// </rows_pagos>
