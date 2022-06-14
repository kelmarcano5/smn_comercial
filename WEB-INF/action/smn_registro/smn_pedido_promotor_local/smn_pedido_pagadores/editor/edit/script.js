document.form1.smn_pedido_cabecera_id.value='${fld:smn_pedido_cabecera_id@#######}';
setComboValue('smn_cliente_id','${fld:smn_cliente_id}','form1');
document.form1.ppa_monto.value='${fld:ppa_monto@#,###,##0.00}';
document.form1.id.value='${fld:smn_pedido_pagadores_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

