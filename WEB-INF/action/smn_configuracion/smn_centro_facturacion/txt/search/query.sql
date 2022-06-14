select
	case
	when smn_comercial.smn_centro_facturacion.cfc_estatus='AC' then '${lbl:b_account_type_active}'
	when smn_comercial.smn_centro_facturacion.cfc_estatus='IN' then '${lbl:b_inactive}'
	end as cfc_estatus,
	smn_comercial.smn_centro_facturacion.smn_centro_facturacion_id,
	smn_comercial.smn_centro_facturacion.cfc_codigo,
	smn_comercial.smn_centro_facturacion.cfc_nombre,
	smn_base.smn_entidades.ent_descripcion_corta as smn_entidades_rf,
	smn_base.smn_sucursales.suc_nombre as smn_sucursales_rf,
	smn_base.smn_areas_servicios.ase_descripcion as smn_areas_servicios_rf,
	smn_base.smn_unidades_servicios.smn_unidades_servicios_id as smn_unidades_servicios_rf,
	smn_comercial.smn_centro_facturacion.cfc_numero_identificacion,
	smn_comercial.smn_centro_facturacion.cfc_control_fiscal_1,
	smn_comercial.smn_centro_facturacion.cfc_control_fiscal_2,
	smn_comercial.smn_centro_facturacion.cfc_vigencia,
	smn_comercial.smn_centro_facturacion.cfc_fecha_registro	
from
	smn_comercial.smn_centro_facturacion
	inner join smn_base.smn_entidades on smn_base.smn_entidades.smn_entidades_id = smn_comercial.smn_centro_facturacion.smn_entidades_rf
	inner join smn_base.smn_sucursales on smn_base.smn_sucursales.smn_sucursales_id = smn_comercial.smn_centro_facturacion.smn_sucursales_rf
	inner join smn_base.smn_areas_servicios on smn_base.smn_areas_servicios.smn_areas_servicios_id = smn_comercial.smn_centro_facturacion.smn_areas_servicios_rf
	inner join smn_base.smn_unidades_servicios on smn_base.smn_unidades_servicios.smn_unidades_servicios_id = smn_comercial.smn_centro_facturacion.smn_unidades_servicios_rf

