select smn_comercial.smn_afiliados.smn_afiliados_id as id, afi.aux_nombres ||' - '|| afi.aux_apellidos as item from smn_comercial.smn_afiliados
	left join smn_base.smn_auxiliar afi on afi.smn_auxiliar_id = smn_comercial.smn_afiliados.afi_auxiliar_rf