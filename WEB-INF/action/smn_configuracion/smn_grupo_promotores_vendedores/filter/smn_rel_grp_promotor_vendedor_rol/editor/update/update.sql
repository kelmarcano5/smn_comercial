UPDATE smn_comercial.smn_rel_grp_promotor_vendedor_rol SET
	smn_grupo_promotores_vendedores_id=${fld:smn_grupo_promotores_vendedores_id},
	smn_rol_id=${fld:smn_rol_id}

WHERE
	smn_rel_grp_promotor_vendedor_rol_id=${fld:id}

