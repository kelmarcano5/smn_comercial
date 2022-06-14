$('#codimp').show();
$('#porcimp').show();
$('#mtoimpml').show();
$('#mtoimpma').show(); 

var calculo = '${fld:porcen_cal}';
var base = '${fld:porcen_base}';
var codimp = '${fld:codimp}';

var montoml = $('#dpd_monto_del_pago_ml').val();
var montoma = $('#dpd_monto_del_pago_ma').val();

var saldo_ml = $('#dpd_monto_saldo_pago_ml').val();
var saldo_ma = $('#dpd_monto_saldo_pago_ma').val()

$('#porcen_cal_imp').val(calculo);
$('#porcen_base_imp').val(base);
if (saldo_ml != 0) {
	var montoimpml = parseFloat(montoml) * calculo / 100;

	var mtosersele = parseFloat(montoml) + parseFloat(montoimpml);
	$('#dpd_monto_por_pagar_ml').val(mtosersele.toFixed(2));

	$('#dpd_monto_impuesto_ml').val(montoimpml.toFixed(2));
}

if (saldo_ma != 0) {
	var montoimpma = parseFloat(montoma) * calculo / 100;

	var mtoporpagarma =  parseFloat(montoma) + parseFloat(montoimpma);

	$('#mcd_monto_por_pagar_ma').val(mtoporpagarma.toFixed(2));

	$('#dpd_monto_impuesto_ma').val(montoimpma.toFixed(2));
}

//alert("MONTO IMPUESTO ML: "+montoimpml+" MONTO IMPUESTO MA: "+montoimpma);


$('#smn_codigo_impuesto_rf').val(codimp).change();
$('#dpd_porcentaje_impuesto').val(calculo);
$('#smn_codigo_impuesto_rf').prop('disabled','true');
$('#dpd_porcentaje_impuesto').prop('disabled','true');

$('#dpd_monto_impuesto_ml').prop('disabled','true');
$('#dpd_monto_impuesto_ma').prop('disabled','true');

console.log("porc calculo imp: "+calculo+" porc base imp : "+base);
