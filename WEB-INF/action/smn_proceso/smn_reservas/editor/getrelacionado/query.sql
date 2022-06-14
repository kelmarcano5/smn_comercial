select smn_comercial.smn_relacionado.smn_relacionado_id as smn_relacionado_id, smn_base.smn_auxiliar.aux_nombres ||' '|| smn_base.smn_auxiliar.aux_apellidos as item from smn_comercial.smn_relacionado
inner join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_relacionado.rel_auxiliar_rf 
where smn_comercial.smn_relacionado.smn_afiliados_id=${fld:id}