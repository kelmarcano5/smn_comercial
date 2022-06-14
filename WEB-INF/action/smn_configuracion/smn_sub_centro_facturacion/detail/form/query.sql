select
	smn_comercial.smn_sub_centro_facturacion.smn_sub_centro_facturacion_id,
	case
	when smn_comercial.smn_sub_centro_facturacion.scf_estatus='AC' then '${lbl:b_account_type_active}'
	when smn_comercial.smn_sub_centro_facturacion.scf_estatus='IN' then '${lbl:b_inactive}'
	end as scf_estatus_combo,
	smn_comercial.smn_rol.rol_tipo as smn_rol_id,
	smn_comercial.smn_sub_centro_facturacion.smn_usuario_rf,
	smn_base.smn_corporaciones.crp_nombre as smn_corporacion_rf,
	smn_comercial.smn_sub_centro_facturacion.scf_estatus,
	smn_comercial.smn_sub_centro_facturacion.scf_vigencia,
	smn_comercial.smn_sub_centro_facturacion.scf_fecha_registro
	
from
	smn_comercial.smn_sub_centro_facturacion
	inner join smn_comercial.smn_rol on smn_comercial.smn_rol.smn_rol_id = smn_comercial.smn_sub_centro_facturacion.smn_rol_id
	inner join smn_base.smn_corporaciones on smn_base.smn_corporaciones.smn_corporaciones_id = smn_comercial.smn_sub_centro_facturacion.smn_corporacion_rf
	inner join smn_base.smn_usuarios on smn_base.smn_usuarios.smn_usuarios_id = smn_comercial.smn_sub_centro_facturacion.smn_usuario_rf

where
	smn_sub_centro_facturacion_id = ${fld:id}
