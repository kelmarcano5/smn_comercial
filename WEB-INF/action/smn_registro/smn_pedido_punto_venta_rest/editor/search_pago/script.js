 var elemento = window.document.getElementById('pag');
elemento.innerHTML="";
 <rows_pagos>
 var fila="<td align='center'>"+'${fld:smn_pedido_cabecera_id}'+"</td><td>"+'${fld:ppv_numero_documento_forma_pago}'+"</td><td>"+'${fld:ppv_numero_autorizacion}'+"</td><td>"+'${fld:ppv_documento_identidad_pagador}'+"</td><td>"+'${fld:ppv_nombre_pagador}'+"</td><td>"+'${fld:ppv_monto_pagar_ml}'+"</td><td>"+'${fld:ppv_monto_pago_ml}'+"</td><td>"+'${fld:ppv_monto_devuelto_ml}'+"</td><td>"+'${fld:ppv_estatus}'+"</td><td>"+'${fld:ppv_fecha_registro}'+"</td>";
 document.getElementById("pag").innerHTML = fila;
</rows_pagos>