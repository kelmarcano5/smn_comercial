select
		smn_entrega.smn_rel_cliente_documento.smn_rel_cliente_documento_id,
	smn_entrega.smn_documento.doc_descripcion as smn_documento_id_combo,
		smn_base.smn_auxiliar.aux_descripcion as smn_cliente_id_combo
from
	smn_entrega.smn_rel_cliente_documento
	inner join smn_entrega.smn_documento on smn_entrega.smn_documento.smn_documento_id = smn_entrega.smn_rel_cliente_documento.smn_documento_id
	inner join smn_comercial.smn_cliente on smn_comercial.smn_cliente.smn_cliente_id = 	smn_entrega.smn_rel_cliente_documento.smn_cliente_id
	inner join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf
where
	smn_rel_cliente_documento_id = ${fld:id}
