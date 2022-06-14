//if("${fld:codigo_impuesto_id}")
//{
<query_rows>
	var cod_impuesto_id = "${fld:codigo_impuesto_id}";
	var cod_impuesto_item = "${fld:item}";
	var porcentaj =  "${fld:porccal}";
	var sustraend =  "${fld:sustrae}";

	/*listboxClear("smn_cod_impuesto_deduc_rf");
	var option = document.createElement("option");
	option.text = cod_impuesto_item; 
	option.value = cod_impuesto_id;
	document.form1.smn_cod_impuesto_deduc_rf.add(option, 0);*/
	//document.getElementById('smn_cod_impuesto_deduc_rf').disabled = true;
	setSelectedIndexValue(cod_impuesto_item, smn_cod_impuesto_deduc_rf);
	
	/*listboxClear("smn_tipo_impuesto_rf");
	var option = document.createElement("option");
	option.text = "${fld:tipo_impuesto@js}"; 
	option.value = "${fld:codigo_impuesto_id}";
	document.form1.smn_tipo_impuesto_rf.add(option, 0);*/
	setSelectedIndexValue("${fld:tipo_impuesto}", smn_tipo_impuesto_rf);

	document.getElementById('pim_porcentaje_impuesto').value = porcentaj;
	document.getElementById('pim_porcentaje_impuesto').disabled = true;
	document.getElementById('pim_monto_sustraendo').value = sustraend;
	document.getElementById('pim_monto_sustraendo').disabled = true;

	var base1 = document.getElementById("pim_monto_base_ml").value;

	/*base1 = base.replace('.','');
	base = base1.replace('.','');
	base1 = base.replace(',','.'); */

	total = parseFloat(base1)*porcentaj/100;

	document.getElementById("pim_monto_base_ml").value = base1;
	document.getElementById("pim_monto_impuesto").value = total;
	document.getElementById('pim_monto_impuesto').disabled = true;
	document.getElementById("pim_monto_impuesto_ma").value = 0.0;
	/*var basema = document.getElementById("pim_base_imponible_ma").value;
	var excentoma = document.getElementById("pim_base_excenta_ma").value;

	total1 = parseFloat(basema)*porcentaj/100;
	alert(total1);
	document.getElementById("oci_monto_impuesto_ma").value = total1;
	document.getElementById('oci_monto_impuesto_ma').disabled = true;

	total4=0;
	//total4 = excentoma - sustraend; 
	alert(total4);
	document.getElementById("pim_monto_sustraendo_ma").value = total4;
	document.getElementById('pim_monto_sustraendo_ma').disabled = true;


	total5 = ptotal1 - total4;
	alert(total5)
	document.getElementById("pim_monto_neto_impuesto_ma").value = total5;
	document.getElementById('pim_monto_neto_impuesto_ma').disabled = true;*/
</query_rows>
//}