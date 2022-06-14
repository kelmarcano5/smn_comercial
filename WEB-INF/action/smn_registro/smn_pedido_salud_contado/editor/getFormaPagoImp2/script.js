$('#codimp').show();
$('#porcimp').show();
$('#mtoimpml').show();
$('#mtoimpma').show(); 

var calculo = '${fld:porcen_cal}';
var base = '${fld:porcen_base}';
var codimp = '${fld:codimp}';

var montoml = $('#ppv_monto_pago_ml').val();
var montoma = $('#ppv_monto_pago_ma').val();

var mtoserml = $('#ppv_monto_pagar_ml').val();
var mtoserma = $('#ppv_monto_pagar_ma').val();

var saldo_ml = $('#ppv_monto_devuelto_ml').val();
var saldo_ma = $('#ppv_monto_devuelto_ma').val();

var mtoservicioml = $('#ppv_monto_servicio_ml').val();
var mtoservicioma = $('#ppv_monto_servicio_ma').val();

$('#porcen_cal_imp').val(calculo);
$('#porcen_base_imp').val(base);


if (saldo_ml != 0) {
	var montoimpml = parseFloat(montoml) * calculo / 100;

	var mtosersele = parseFloat(mtoservicioml) + parseFloat(montoimpml);
	$('#ppv_monto_pagar_ml').val(mtosersele.toFixed(2));

	$('#ppv_monto_impuesto_ml').val(montoimpml.toFixed(2));

	var mtosersalml = parseFloat(mtoservicioml) + parseFloat(montoimpml)- parseFloat(montoml);
	$('#ppv_monto_devuelto_ml').val(mtosersalml.toFixed(2));

}

if (saldo_ma != 0 || saldo_ma != '') {
	var montoimpma = parseFloat(montoma) * calculo / 100;
//alert(montoimpma);
	var mtoporpagarma =  parseFloat(montoma) + parseFloat(montoimpma);

	$('#ppv_monto_pago_ma').val(mtoporpagarma.toFixed(2));

	$('#ppv_monto_impuesto_ma').val(montoimpma.toFixed(2));

	var mtosersalma = parseFloat(mtoservicioma) + parseFloat(montoimpma)- parseFloat(montoma);

	if(mtoservicioma==0){
		$('#ppv_monto_devuelto_ma').val(0);
		$('#ppv_monto_impuesto_ma').val(0);
	}else{
		$('#ppv_monto_devuelto_ma').val(mtosersalma.toFixed(2));
	}
	
}

//alert("MONTO IMPUESTO ML: "+montoimpml+" MONTO IMPUESTO MA: "+montoimpma);


$('#smn_codigo_impuesto_rf').val(codimp).change();
$('#ppv_porcentaje').val(calculo);
$('#smn_codigo_impuesto_rf').prop('disabled','true');
$('#ppv_porcentaje').prop('disabled','true');

$('#ppv_monto_impuesto_ml').prop('disabled','true');
$('#ppv_monto_impuesto_ma').prop('disabled','true');

console.log("porc calculo imp: "+calculo+" porc base imp : "+base);
