 var elemento = window.document.getElementById('det');
elemento.innerHTML="";
 <rows>
 var fila="<td align='center'>"+'${fld:catalogo}'+"</td><td>"+'${fld:descripcion}'+"</td><td>"+'${fld:requerimientos}'+"</td><td>"+'${fld:cantidad}'+"</td><td>"+'${fld:pde_precio}'+"</td><td>"+'${fld:monto}'+"</td><td>"+'${fld:pde_fecha_registro}'+"</td>";
 document.getElementById("det").innerHTML = fila;
</rows>