select DISTINCT
	smn_base.smn_componentes.cmp_grupo_prestador as smn_grupo_prestador_rf, 
	smn_base.smn_componentes.cmp_visible as smn_visible_rf, 
	smn_base.smn_componentes.cmp_tipo_componente as smn_tipo_componente,
	smn_base.smn_componentes.cmp_forma_calculo as smn_forma_calculo_rf,
	case 
		when smn_base.smn_componentes.cmp_porcentaje is null then 0 else smn_base.smn_componentes.cmp_porcentaje
	end as porcentaje
from smn_base.smn_componentes 
	inner join smn_base.smn_servicios_componentes on smn_base.smn_servicios_componentes.smn_componentes_id = smn_base.smn_componentes.smn_componentes_id
where 
	smn_base.smn_componentes.cmp_tipo_componente='IT' and smn_base.smn_componentes.smn_componentes_id=${fld:id}
