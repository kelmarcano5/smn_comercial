select
		smn_comercial.smn_sub_centro_facturacion.smn_sub_centro_facturacion_id,
select
		smn_comercial.smn_sub_centro_facturacion.smn_sub_centro_facturacion_id,
	case
	when smn_comercial.smn_sub_centro_facturacion.scf_estatus='AC' then '${lbl:b_account_type_active}'
	when smn_comercial.smn_sub_centro_facturacion.scf_estatus='IN' then '${lbl:b_inactive}'
	end as scf_estatus,
	smn_comercial.smn_sub_centro_facturacion.smn_centro_facturacion_id,
	smn_comercial.smn_sub_centro_facturacion.scf_codigo,
	smn_comercial.smn_sub_centro_facturacion.scf_nombre,
	smn_comercial.smn_sub_centro_facturacion.scf_estatus,
	smn_comercial.smn_sub_centro_facturacion.scf_vigencia,
	smn_comercial.smn_sub_centro_facturacion.scf_fecha_registro
	
from
	smn_comercial.smn_sub_centro_facturacion
