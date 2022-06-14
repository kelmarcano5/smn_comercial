//addnew();
//alertBox ('${lbl:b_record_added}: ${fld:id}', '${lbl:b_continue_button}', null, 'search(); setFocusOnForm("form1");');


		//var id2 = '${fld:id}';
		//var codigo = document.getElementById('sec_origen').value;
		//var descripcion = document.getElementById('sec_descripcion').value;
		//var documento = document.getElementById('smn_documento_id').value;

		//alert(id2+" "+codigo+" "+descripcion+" "+documento);


	
//parent.closeDialog();

if ('${fld:reference}' == 'true')
	{
		//alert('Referenced')
		//force close dialog
		//parent.closeDialog();
		parent.setID('${fld:id}');
		document.getElementById('id2').value = '${fld:id}' ;

		var d = document.getElementById('smn_documento_id');
		var documento2 = d.options[d.selectedIndex].text;

		var s = document.getElementById('sec_estatus_proceso');
		var status = s.options[s.selectedIndex].text;
		//alert(documento2);

			uri = "${def:context}${def:actionroot}/../smn_solicitud_servicio_entregas_detalle/form?id2=${fld:id}&documento=${fld:smn_documento_id}&documento2="+documento2 + "&status=" + status;	
				//alert(uri);
			openDialog("editor950", uri, 1000, 700);
	}
	else
	{

		var d = document.getElementById('smn_documento_id');
		var documento2 = d.options[d.selectedIndex].text;

		var s = document.getElementById('sec_estatus_proceso');
		var status = s.options[s.selectedIndex].text;
		//alert(documento2);
		//alert('No referenced')
		//addNew();
		//alertBox ('${lbl:b_record_added}: ${fld:id}', '${lbl:b_continue_button}', null, 'parent.search(); parent.setFocusOnForm("form1");');

			uri = "${def:context}${def:actionroot}/../smn_solicitud_servicio_entregas_detalle/form?id2=${fld:id}&documento=${fld:smn_documento_id}&documento2="+documento2 + "&status=" + status;	
			///	alert(uri);
		openDialog("editor950", uri, 1000, 700);
	}
