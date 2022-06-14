setComboValue('smn_documento_grp_titulo_imp_id','${fld:smn_documento_grp_titulo_imp_id}','form1');
setComboValue('dgi_naturaleza','${fld:dgi_naturaleza}','form1');
setComboValue('smn_servicios_rf','${fld:smn_servicios_rf}','form1');
setComboValue('smn_item_rf','${fld:smn_item_rf}','form1');
setComboValue('smn_componentes_rf','${fld:smn_componentes_rf}','form1');
document.form1.id.value='${fld:smn_detalle_documento_titulo_imp_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


var tipo = '${fld:dgi_naturaleza}';


		if(tipo=="I"){
			document.getElementById("ite").style.display="";
			document.getElementById("act").style.display="none";
			document.getElementById("serv").style.display="none";	
		}else if(tipo=="S"){
			document.getElementById("serv").style.display="";
			document.getElementById("ite").style.display="none";
				document.getElementById("act").style.display="none";
		}else if(tipo=="A"){
			document.getElementById("act").style.display="";
			document.getElementById("serv").style.display="none";
			document.getElementById("ite").style.display="none";
		}else if(tipo == ""){
				document.getElementById("act").style.display="none";
			document.getElementById("serv").style.display="none";
			document.getElementById("ite").style.display="none";
		}