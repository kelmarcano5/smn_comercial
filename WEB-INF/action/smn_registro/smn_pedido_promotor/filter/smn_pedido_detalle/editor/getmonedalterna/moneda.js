var mon_alt = '${fld:moneda_alterna}';
//alert(mon_alt);
if(mon_alt == 'Si'){

	var m1 = document.getElementById('ppv_monto_pagar_ml').value;
	document.getElementById('ppv_monto_pago_ml').value = m1;
	document.getElementById('ppv_monto_devuelto_ml').value = m1;

	document.getElementById('coin').style.display='';
	document.getElementById('tasa3').style.display='';
	document.getElementById('mo_pagar').style.display='';
	document.getElementById('mo_pago').style.display='';
	document.getElementById('mo_devo').style.display='';

}else{
	document.getElementById('coin').style.display='none';
	document.getElementById('tasa').style.display='none';
	document.getElementById('mo_pagar').style.display='none';
	document.getElementById('mo_pago').style.display='none';
	document.getElementById('mo_devo').style.display='none';
}
//alert(mon_alt);
//document.getElement
