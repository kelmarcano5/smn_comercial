select
	smn_comercial.smn_rel_grp_promotor_vendedor_rol.smn_rel_grp_promotor_vendedor_rol_id,
	smn_comercial.smn_grupo_promotores_vendedores.gpv_descripcion as smn_grupo_promotores_vendedores_id,
	case
		when smn_comercial.smn_rol.rol_tipo='SO' then '${lbl:b_applicants}' ||' - '|| smn_base.smn_v_auxiliar.smn_item
		when smn_comercial.smn_rol.rol_tipo='AP' then '${lbl:b_approver}' ||' - '|| smn_base.smn_v_auxiliar.smn_item
		when smn_comercial.smn_rol.rol_tipo='FC' then '${lbl:b_billing}' ||' - '|| smn_base.smn_v_auxiliar.smn_item
		when smn_comercial.smn_rol.rol_tipo='VD' then '${lbl:b_seller}' ||' - '|| smn_base.smn_v_auxiliar.smn_item
		when smn_comercial.smn_rol.rol_tipo='PR' then '${lbl:b_promoter}' ||' - '|| smn_base.smn_v_auxiliar.smn_item
		when smn_comercial.smn_rol.rol_tipo='EC' then '${lbl:b_call_executive}'||' - '|| smn_base.smn_v_auxiliar.smn_item 
		when smn_comercial.smn_rol.rol_tipo='CO' then 'Contralor' ||' - '|| smn_base.smn_v_auxiliar.smn_item
		when smn_comercial.smn_rol.rol_tipo='EC' then 'Prestador' ||' - '|| smn_base.smn_v_auxiliar.smn_item
	end as smn_rol_id
		
from
	smn_comercial.smn_rel_grp_promotor_vendedor_rol
	inner join smn_comercial.smn_grupo_promotores_vendedores on smn_comercial.smn_grupo_promotores_vendedores.smn_grupo_promotores_vendedores_id = smn_comercial.smn_rel_grp_promotor_vendedor_rol.smn_grupo_promotores_vendedores_id
	inner join smn_comercial.smn_rol on smn_comercial.smn_rol.smn_rol_id = smn_comercial.smn_rel_grp_promotor_vendedor_rol.smn_rol_id
	inner join smn_base.smn_v_usuarios on smn_base.smn_v_usuarios.smn_usuarios_id = smn_comercial.smn_rol.smn_usuarios_rf
	inner join smn_base.smn_v_auxiliar on smn_base.smn_v_auxiliar.smn_v_auxiliar_id = smn_base.smn_v_usuarios.smn_auxiliar_rf 
where
	smn_comercial.smn_grupo_promotores_vendedores.smn_grupo_promotores_vendedores_id=smn_comercial.smn_rel_grp_promotor_vendedor_rol.smn_grupo_promotores_vendedores_id and
	smn_comercial.smn_rol.smn_rol_id=smn_comercial.smn_rel_grp_promotor_vendedor_rol.smn_rol_id
	and
	smn_rel_grp_promotor_vendedor_rol_id = ${fld:id}
