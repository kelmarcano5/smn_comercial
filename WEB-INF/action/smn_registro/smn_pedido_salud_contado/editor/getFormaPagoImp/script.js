$('#codimp').show();
$('#porcimp').show();
$('#mtoimpml').show();
$('#mtoimpma').show(); 

var calculo = '${fld:porcen_cal}';
var base = '${fld:porcen_base}';
var codimp = '${fld:codimp}';

var montoml = $('#ppv_monto_pagar_ml').val();
var montoma = $('#ppv_monto_pagar_ma').val();

var montopagma = $('#ppv_monto_pago_ma').val();

var divisa = $('#divisa').val();

//alert(montopagma);
if (montoma == 'NaN' || montoma == '') {
	montoma=0;
}

$('#porcen_cal_imp').val(calculo);
$('#porcen_base_imp').val(base);

var montoimpml = parseFloat(montoml) * parseFloat(calculo) / 100;
var montoimpma = parseFloat(montoma) * parseFloat(calculo) / 100;

//alert("MONTO IMPUESTO ML: "+montoimpml+" MONTO IMPUESTO MA: "+montoimpma);

var mtosersele = parseFloat(montoml) + parseFloat(montoimpml);
//var mtoporpagarml =  parseFloat(montoml) + parseFloat(montoimpml);
var mtoporpagarma =  parseFloat(montoma) + parseFloat(montoimpma);

$('#ppv_monto_pagar_ml').val(mtosersele.toFixed(2));
$('#ppv_monto_pagar_ml').val(mtosersele.toFixed(2));
$('#ppv_monto_pagar_ma').val(mtoporpagarma.toFixed(2));
$('#ppv_monto_devuelto_ma').val(0);


$('#ppv_monto_impuesto_ml').val(montoimpml.toFixed(2));
$('#ppv_monto_impuesto_ma').val(montoimpma.toFixed(2));

$('#smn_codigo_impuesto_rf').val(codimp).change();
$('#ppv_porcentaje').val(calculo);
$('#smn_codigo_impuesto_rf').prop('disabled','true');
$('#ppv_porcentaje').prop('disabled','true');

$('#ppv_monto_impuesto_ml').prop('disabled','true');
$('#ppv_monto_impuesto_ma').prop('disabled','true');
