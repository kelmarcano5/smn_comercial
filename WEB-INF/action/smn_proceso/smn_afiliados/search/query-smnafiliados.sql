select
	smn_comercial.smn_afiliados.smn_afiliados_id,
	case
		when smn_comercial.smn_afiliados.afi_estatus='AC' then '${lbl:b_active}'
		when smn_comercial.smn_afiliados.afi_estatus='VE' then '${lbl:b_expired}'
		when smn_comercial.smn_afiliados.afi_estatus='DA' then '${lbl:b_desafiliado}'
		when smn_comercial.smn_afiliados.afi_estatus='AP' then 'Aprobado'
		when smn_comercial.smn_afiliados.afi_estatus='RZ' then 'Rechazado'
	end as afi_estatus,
	smn_base.smn_auxiliar.aux_descripcion as afi_auxiliar_rf,
	smn_comercial.smn_afiliados.afi_fecha_inicio,
	smn_comercial.smn_afiliados.afi_fecha_final,
	smn_comercial.smn_afiliados.afi_fecha_desafiliacion,
	comp.aux_descripcion as smn_rol_id,
	smn_comercial.smn_control_cupo_afiliado.cca_saldo,
	smn_base.smn_servicios.svc_codigo ||' - '|| smn_base.smn_servicios.svc_descripcion as smn_servicio_id,
	smn_comercial.smn_afiliados.afi_fecha_registro	
from
	smn_comercial.smn_afiliados
	inner join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_afiliados.afi_auxiliar_rf
	inner join smn_comercial.smn_rol on smn_comercial.smn_rol.smn_rol_id = smn_comercial.smn_afiliados.smn_rol_id
	inner join smn_base.smn_servicios on smn_base.smn_servicios.smn_servicios_id = smn_comercial.smn_afiliados.smn_servicio_id
	inner join smn_base.smn_usuarios on smn_base.smn_usuarios.smn_usuarios_id = smn_comercial.smn_rol.smn_usuarios_rf
	inner join smn_base.smn_auxiliar comp on comp.smn_auxiliar_id = smn_base.smn_usuarios.smn_auxiliar_rf
	inner join smn_comercial.smn_control_cupo_afiliado on smn_comercial.smn_control_cupo_afiliado.smn_afiliados_id = smn_comercial.smn_afiliados.smn_afiliados_id