addNew();
document.getElementById('smn_presupuesto_id').value = ${fld:smn_presupuesto_id};
document.form1.prd_cantidad.value = 1;
document.form1.prd_precio.value=0;
document.form1.prd_monto_moneda_local.value=0;

alertBox ('${lbl:b_record_added}: ${fld:id}', '${lbl:b_continue_button}', null, 'setFocusOnForm("form1");');

