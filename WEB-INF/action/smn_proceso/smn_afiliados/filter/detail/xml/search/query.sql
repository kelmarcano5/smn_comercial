select
select
select
	smn_base.smn_auxiliar.aux_descripcion,
	inner join smn_base.smn_usuarios on smn_base.smn_usuarios.smn_usuarios_id = smn_comercial.smn_rol.smn_usuarios_rf
where
select
	case
	smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_afiliados.afi_auxiliar_rf and
	case
	when smn_comercial.smn_afiliados.afi_estatus='AC' then '{lbl:b_active}'
	when smn_comercial.smn_afiliados.afi_estatus='AC' then '{lbl:b_active}'
	when smn_comercial.smn_afiliados.afi_estatus='VE' then '{lbl:b_expired}'
	when smn_comercial.smn_afiliados.afi_estatus='VE' then '{lbl:b_expired}'
	when smn_comercial.smn_afiliados.afi_estatus='DA' then '{lbl:b_desafiliado}'
	when smn_comercial.smn_afiliados.afi_estatus='DA' then '{lbl:b_desafiliado}'
	end as afi_estatus,
	end as afi_estatus,
	smn_comercial.smn_afiliados.*
	smn_comercial.smn_afiliados.*
from
	smn_comercial.smn_afiliados
	smn_comercial.smn_afiliados
where
	smn_afiliados_id = ${fld:id}
