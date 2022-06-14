var dias = '${fld:dias}';
var fecha = '${fld:fecha_requerida}';

$('#pca_fecha_vencimiento').val(sumaFecha(dias, fecha));
$("#pca_fecha_vencimiento").attr('disabled','disabled');

function sumaFecha(d, fecha){
	 var Fecha = new Date();
	 var sFecha = fecha || (Fecha.getDate() + "-" + (Fecha.getMonth() +1) + "-" + Fecha.getFullYear());
	 var sep = sFecha.indexOf('/') != -1 ? '/' : '-';
	 var aFecha = sFecha.split(sep);
	 var fecha = aFecha[2]+'-'+aFecha[1]+'-'+aFecha[0];
	 fecha= new Date(fecha);
	 fecha.setDate(fecha.getDate()+parseInt(d)+1);
	 var anno=fecha.getFullYear();
	 var mes= fecha.getMonth()+1;
	 var dia= fecha.getDate();
	 mes = (mes < 10) ? ("0" + mes) : mes;
	 dia = (dia < 10) ? ("0" + dia) : dia;
	 var fechaFinal = dia+sep+mes+sep+anno;

	 return (fechaFinal);
 }