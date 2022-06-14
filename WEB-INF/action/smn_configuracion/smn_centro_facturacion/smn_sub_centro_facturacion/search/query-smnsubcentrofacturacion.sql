select
	smn_comercial.smn_sub_centro_facturacion.smn_sub_centro_facturacion_id,
	smn_comercial.smn_centro_facturacion.cfc_codigo as cfc_codigo_pl0,
	case
	when smn_comercial.smn_sub_centro_facturacion.scf_estatus='AC' then '${lbl:b_account_type_active}'
	when smn_comercial.smn_sub_centro_facturacion.scf_estatus='IN' then '${lbl:b_inactive}'
	end as scf_estatus,
	smn_comercial.smn_centro_facturacion.cfc_codigo ||' - '|| smn_comercial.smn_centro_facturacion.cfc_nombre as smn_centro_facturacion_id,
	smn_comercial.smn_sub_centro_facturacion.scf_codigo,
	smn_comercial.smn_sub_centro_facturacion.scf_nombre,
	smn_comercial.smn_sub_centro_facturacion.scf_vigencia,
	smn_comercial.smn_sub_centro_facturacion.scf_fecha_registro
	
from
	smn_comercial.smn_sub_centro_facturacion
	inner join smn_comercial.smn_centro_facturacion on smn_comercial.smn_centro_facturacion.smn_centro_facturacion_id=smn_comercial.smn_sub_centro_facturacion.smn_centro_facturacion_id
where
	smn_comercial.smn_sub_centro_facturacion.smn_centro_facturacion_id=${fld:id2}
