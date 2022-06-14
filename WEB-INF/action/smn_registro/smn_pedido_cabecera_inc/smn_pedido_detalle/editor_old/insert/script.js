GenerarImp();


function GenerarImp() {

			//Este codigo fue creado por SIMONE y ajustado en este crud por Kelvin Marcano

		//document.form1.smn_tasa_rf.disabled=false;
		var valueCombo = document.getElementById('smn_item_rf')value;
		//var valueCombo = getIDSelectedIndex(combo);
		var uri="${def:actionroot}/GenerarImpuesto?id=" + valueCombo + "&baremos="+'${fld:baremos}';
		//alert(uri);
		//geo_idt = valueCombo.split("-").pop().trim();
		//alert(valueCombo);
		if (id!=null && id!="") 
		{	
			return ajaxCall(	
							httpMethod="GET", 
							uri, 
							divResponse=null, 
							divProgress="status", 
							formName="form1", 
							afterResponseFn=null, //function 'setElementFirstIndex' select first element of combo list
							onErrorFn=null); 				
		}
}

addNew();
alertBox ('${lbl:b_record_added}: ${fld:id}', '${lbl:b_continue_button}', null, 'search(); setFocusOnForm("form1");');

