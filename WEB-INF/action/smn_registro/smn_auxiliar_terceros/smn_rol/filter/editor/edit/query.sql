select	
	*
from 
	smn_entrega.smn_rol
	left outer join smn_base.smn_corporaciones on smn_base.smn_corporaciones.smn_corporaciones_id = smn_entrega.smn_rol.smn_corporacion_rf
	left outer join smn_base.smn_entidades on smn_base.smn_entidades.smn_entidades_id = smn_entrega.smn_rol.smn_entidad_rf
	left outer join smn_base.smn_sucursales on smn_base.smn_sucursales.smn_sucursales_id = smn_entrega.smn_rol.smn_sucursal_rf
	left outer join smn_base.smn_estructura_organizacional on smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id = smn_entrega.smn_rol.smn_posicion_estructura_rf
	inner join smn_base.smn_v_usuarios on smn_base.smn_v_usuarios.smn_usuarios_id = smn_entrega.smn_rol.smn_usuario_rf
	inner join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_entrega.smn_rol.smn_auxiliar_rf
	inner join smn_base.smn_clase_auxiliar on smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id = smn_entrega.smn_rol.smn_clase_auxiliar_rf
where 
	smn_rol_id = ${fld:id}


