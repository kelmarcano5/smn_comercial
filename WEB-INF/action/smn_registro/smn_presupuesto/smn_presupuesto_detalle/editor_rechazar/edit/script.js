setComboValue('smn_presupuesto_id','${fld:smn_presupuesto_id}','form1');
setComboValue('smn_servicios_rf','${fld:smn_servicios_rf}','form1');
setComboValue('smn_item_rf','${fld:smn_item_rf}','form1');
document.form1.prd_cantidad.value='${fld:prd_cantidad}';
document.form1.prd_precio.value='${fld:prd_precio}';
document.form1.prd_monto_moneda_local.value='${fld:prd_monto_moneda_local}';
document.form1.prd_monto_moneda_local2.value='${fld:prd_monto_moneda_local}';
setComboValue('smn_moneda_rf','${fld:smn_moneda_rf}','form1');
document.form1.prd_precio_ma.value='${fld:prd_precio_ma@#,###,##0.00}';
setComboValue('smn_tipo_componentes_rf','${fld:smn_tipo_componentes_rf}','form1');
setComboValue('smn_componentes_rf','${fld:smn_componentes_rf}','form1');
setComboValue('smn_codigo_descuento_rf','${fld:smn_codigo_descuento_rf}','form1');
setComboValue('smn_tasa_rf','${fld:smn_tasa_rf}','form1');
document.form1.prd_moneda_alterna.value='${fld:prd_moneda_alterna@#,###,##0.00}';
document.form1.id.value='${fld:smn_presupuesto_detalle_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");
document.form1.prd_observaciones.value='${fld:prd_observaciones}';

var tp = '${fld:smn_tipo_componentes_rf}';

// if(tp == 'IT'){
// 	document.getElementById('item').style.display='';
// 	document.getElementById('servicio').style.display='none';
// }

// if(tp == 'SE'){
// 	document.getElementById('servicio').style.display='';
// 	document.getElementById('item').style.display='none';
// }

document.form1.prd_monto_descuento_ml.value='${fld:prd_monto_descuento_ml@#,###,##0.00}';
document.form1.prd_monto_neto_ml.value='${fld:prd_monto_neto_ml@#,###,##0.00}';
document.form1.prd_monto_descuento_ma.value='${fld:prd_monto_descuento_ma@#,###,##0.00}';
document.form1.prd_monto_neto_ma.value='${fld:prd_monto_neto_ma@#,###,##0.00}';

document.form1.prd_monto_incremento_ml.value='${fld:prd_monto_incremento_ml@#,###,##0.00}';
document.form1.prd_monto_incremento_ma.value='${fld:prd_monto_incremento_ma@#,###,##0.00}';

var tasa = '${fld:smn_tasa_rf}';

var montodesml = '${fld:prd_monto_descuento_ml@#,###,##0.00}';
var montonetml = '${fld:prd_monto_neto_ml@#,###,##0.00}';
var montodesma = '${fld:prd_monto_descuento_ma@#,###,##0.00}';
var montonetma = '${fld:prd_monto_neto_ma@#,###,##0.00}';
var montoincml = '${fld:prd_monto_incremento_ml@#,###,##0.00}';
var montoincma = '${fld:prd_monto_incremento_ma@#,###,##0.00}';


// if (tasa != 0) {
// 	document.getElementById('tasa').style.display='';
// }else{
// 	document.getElementById('tasa').style.display='none';
// }

// if(montodesml != 0){
// 	document.getElementById('montodesml').style.display='';
// 				document.getElementById('prd_monto_descuento_ml').disabled=true;
// }else{
// 	document.getElementById('montodesml').style.display='none';
// 	document.getElementById('prd_monto_descuento_ml').value=0;
// 			document.getElementById('prd_monto_descuento_ml').disabled=true;
// }

// if(montonetml != 0){
// 	document.getElementById('montonetml').style.display='';
// 				document.getElementById('prd_monto_neto_ml').disabled=true;
// }else{
// 	document.getElementById('montonetml').style.display='none';
// 	document.getElementById('prd_monto_neto_ml').value=0;
// 			document.getElementById('prd_monto_neto_ml').disabled=true;
// }

// if(montoincml != 0) {
// 	document.getElementById('montoincml').style.display='';
// 			document.getElementById('prd_monto_incremento_ml').disabled=true;
// }else{
// 		document.getElementById('montoincml').style.display='';
// 	//document.getElementById('montoincml').style.display='none';
// 		document.getElementById('prd_monto_incremento_ml').value=0;
// 		document.getElementById('prd_monto_incremento_ml').disabled=true;
// }

// if(montodesma != 0) {
// 	document.getElementById('montodesma').style.display='';
// 	document.getElementById('prd_monto_descuento_ma').disabled=true;
// }else{
// 	document.getElementById('montodesma').style.display='none';
// 		document.getElementById('prd_monto_descuento_ma').value=0;
// 		document.getElementById('prd_monto_descuento_ma').disabled=true;
// }

// if(montonetma != 0){
// 	document.getElementById('montonetma').style.display='';
// 	document.getElementById('prd_monto_neto_ma').disabled=true;
// }else{
// 	document.getElementById('montonetma').style.display='none';
// 	document.getElementById('prd_monto_neto_ma').value=0;
// 		document.getElementById('prd_monto_neto_ma').disabled=true;
// }

// if(montoincma != 0) {
// 	document.getElementById('montoincma').style.display='';
// 	document.getElementById('prd_monto_incremento_ma').disabled=true;
// }else{
// 	document.getElementById('montoincma').style.display='';
// //	document.getElementById('montoincma').style.display='none';
// 		document.getElementById('prd_monto_incremento_ma').value=0;
// 		document.getElementById('prd_monto_incremento_ma').disabled=true;
// }


 

