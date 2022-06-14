document.form1.smn_factura_cabecera_id_name.value='${fld:fca_rif_pl0@js}';
document.form1.smn_factura_cabecera_id.value='${fld:smn_factura_cabecera_id@#,###,###}';
setComboValue('smn_cliente_id','${fld:smn_cliente_id}','form1');
document.form1.smn_monto_rf.value='${fld:smn_monto_rf@#,###,##0.00}';
document.form1.id.value='${fld:smn_factura_pagadores_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

