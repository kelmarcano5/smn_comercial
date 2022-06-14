select
		smn_comercial.smn_tipo_documentos_fact.smn_tipo_documentos_fact_id,
	case
	when smn_comercial.smn_tipo_documentos_fact.tdf_naturaleza='PD' then '${lbl:b_pedido}'
	when smn_comercial.smn_tipo_documentos_fact.tdf_naturaleza='OF' then '${lbl:b_oferta}'
	when smn_comercial.smn_tipo_documentos_fact.tdf_naturaleza='DE' then '${lbl:b_nota_despacho}'
	when smn_comercial.smn_tipo_documentos_fact.tdf_naturaleza='FC' then '${lbl:b_factura}'
	when smn_comercial.smn_tipo_documentos_fact.tdf_naturaleza='FF' then '${lbl:b_factura_fija}'
	when smn_comercial.smn_tipo_documentos_fact.tdf_naturaleza='FP' then '${lbl:b_factura_pedido}'
	when smn_comercial.smn_tipo_documentos_fact.tdf_naturaleza='NC' then '${lbl:b_nota_credito}'
	when smn_comercial.smn_tipo_documentos_fact.tdf_naturaleza='ND' then '${lbl:b_nota_debito}'
	end as tdf_naturaleza_combo,
	case
	when smn_comercial.smn_tipo_documentos_fact.tdf_estatus='AC' then '${lbl:b_account_type_active}'
	when smn_comercial.smn_tipo_documentos_fact.tdf_estatus='IN' then '${lbl:b_inactive}'
	end as tdf_estatus_combo,
	smn_comercial.smn_tipo_documentos_fact.tdf_codigo,
	smn_comercial.smn_tipo_documentos_fact.tdf_nombre,
	smn_comercial.smn_tipo_documentos_fact.tdf_naturaleza,
	smn_comercial.smn_tipo_documentos_fact.tdf_vigencia,
	smn_comercial.smn_tipo_documentos_fact.tdf_estatus,
	smn_comercial.smn_tipo_documentos_fact.tdf_idioma,
	smn_comercial.smn_tipo_documentos_fact.tdf_usuario,
	smn_comercial.smn_tipo_documentos_fact.tdf_fecha_registro,
	smn_comercial.smn_tipo_documentos_fact.tdf_hora,
		smn_comercial.smn_tipo_documentos_fact.smn_tipo_documentos_fact_id
	
from
	smn_comercial.smn_tipo_documentos_fact
order by
		smn_tipo_documentos_fact_id
