//addNew();
$('.smn_pedido_detalle_id:checked').each(function() {
				documento_id=$(this).val();

		var uri="${def:actionroot}/update_detalle?id="+documento_id+"&id_cab=${fld:id}";
		//alert("Entrar al Insert Det dentro del segmentar factura"+uri);

			ajaxCall(httpMethod="GET", 
						uri, 
						divResponse=null, 
						divProgress="status", 
						formName="form1", 
						afterResponseFn=null, 
						onErrorFn=retryAddnewOrEdit);
				

				//alert(documento_id);
});


//alertBox ('${lbl:b_record_added}: ${fld:id}', '${lbl:b_continue_button}', null, null);

