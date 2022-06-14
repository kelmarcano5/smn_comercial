var elemento = window.document.getElementById('det');
var fila="";
//var fila2="";
elemento.innerHTML="";
 <rows>
	var res = fila.concat("<td align='center'>"+'${fld:catalogo}'+"</td><td>"+'${fld:descripcion}'+"</td><td>"+'${fld:requerimientos}'+"</td><td>"+'${fld:cantidad}'+"</td><td>"+'${fld:pde_precio}'+"</td><td>"+'${fld:monto}'+"</td><td>"+'${fld:pde_fecha_registro}'+"</td>");
 	
</rows>

	document.getElementById("det").innerHTML = res;
