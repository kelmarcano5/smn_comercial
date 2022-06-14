<smn_auxiliar_unidades_negocios_rf_rows>
var caso =  "${fld:caso}";
var clase_contratante = "${fld:smn_clase_auxiliar_id}";
document.getElementById('smn_clase_ord_rf').value=clase_contratante;

if (caso == 'true'){
	document.getElementById("smn_auxiliar_unidades_negocios_rf").required = true;
	document.getElementById("smn_auxiliar_sucursales_rf").required = true;
	document.getElementById("smn_auxiliar_areas_servicios_rf").required = true;
	document.getElementById("smn_auxiliar_unidades_servicios_rf").required = true;
	document.getElementById("smn_auxiliar_ord_rf").required = true;
	document.getElementById('contratante2').style.display='';
	document.getElementById('contratante3').style.display='';
	document.getElementById('contratante4').style.display='';
	document.getElementById('contratante5').style.display='';
}else{
	document.getElementById("smn_auxiliar_unidades_negocios_rf").required = false;
	document.getElementById("smn_auxiliar_sucursales_rf").required = false;
	document.getElementById("smn_auxiliar_areas_servicios_rf").required = false;
	document.getElementById("smn_auxiliar_unidades_servicios_rf").required = false;
	document.getElementById("smn_auxiliar_ord_rf").required = false;
	document.getElementById('contratante2').style.display='none';
	document.getElementById('contratante3').style.display='none';
	document.getElementById('contratante4').style.display='none';
	document.getElementById('contratante5').style.display='none';
	
	//setElementFirstIndex('smn_auxiliar_ord_rf');
	setElementFirstIndex('smn_auxiliar_unidades_negocios_rf');
	setElementFirstIndex('smn_auxiliar_sucursales_rf');
	setElementFirstIndex('smn_auxiliar_areas_servicios_rf');
	setElementFirstIndex('smn_auxiliar_unidades_servicios_rf');
}
	
</smn_auxiliar_unidades_negocios_rf_rows>


	 



