select smn_comercial.smn_afiliados.smn_afiliados_id as id, afi.aux_nombres ||' - '|| afi.aux_apellidos  ||'=>Disponibilidad='|| smn_comercial.smn_control_cupo_afiliado.cca_saldo  as item from smn_comercial.smn_afiliados
	left join smn_base.smn_auxiliar afi on afi.smn_auxiliar_id = smn_comercial.smn_afiliados.afi_auxiliar_rf
	inner join smn_comercial.smn_control_cupo_afiliado on smn_comercial.smn_control_cupo_afiliado.smn_afiliados_id = smn_comercial.smn_afiliados.smn_afiliados_id
	where smn_comercial.smn_afiliados.afi_estatus='AP' and smn_comercial.smn_control_cupo_afiliado.cca_saldo > 0 