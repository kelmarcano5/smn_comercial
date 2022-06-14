select
	smn_base.smn_auxiliar.aux_descripcion,
		smn_comercial.smn_relacionado.smn_relacionado_id,
	case
	when smn_comercial.smn_relacionado.rel_estatus='AC' then '${lbl:b_active}'
	when smn_comercial.smn_relacionado.rel_estatus='VE' then '${lbl:b_expired}'
	when smn_comercial.smn_relacionado.rel_estatus='DA' then '${lbl:b_desafiliado}'
	end as rel_estatus,
	smn_comercial.smn_relacionado.smn_afiliados_id,
	smn_comercial.smn_relacionado.rel_auxiliar_rf,
	smn_comercial.smn_relacionado.rel_fecha_inicio,
	smn_comercial.smn_relacionado.rel_fecha_final,
	smn_comercial.smn_relacionado.rel_fecha_desafiliado,
	smn_comercial.smn_relacionado.rel_estatus,
	smn_comercial.smn_relacionado.rel_fecha_registro
	
from

	smn_base.smn_auxiliar,
	smn_comercial.smn_relacionado
where
	smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_relacionado.rel_auxiliar_rf
