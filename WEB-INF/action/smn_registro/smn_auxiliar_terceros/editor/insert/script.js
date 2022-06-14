if ('${fld:reference}' == 'true')
	{
		//alert('Referenced')
		//force close dialog
		parent.closeDialog();
		parent.setID('${fld:id_cli}');
		document.getElementById('id2').value = '${fld:id_cli}' ;
	}
	else
	{
		//alert('No referenced')
		addNew();
		alertBox ('${lbl:b_record_added}: ${fld:id_cli}', '${lbl:b_continue_button}', null, 'parent.search(); parent.setFocusOnForm("form1");');
	}
