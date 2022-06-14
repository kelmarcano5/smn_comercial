select smn_comercial.smn_evento.smn_evento_id as id, smn_comercial.smn_evento.eve_codigo||' - '|| smn_comercial.smn_evento.eve_descripcion_corta ||' =>Disponibilidad='|| smn_comercial.smn_control_cupo.ccu_saldo as item from smn_comercial.smn_evento 
inner join smn_comercial.smn_control_cupo on smn_comercial.smn_control_cupo.smn_evento_id = smn_comercial.smn_evento.smn_evento_id
where
smn_comercial.smn_evento.eve_estatus='AP' AND smn_comercial.smn_control_cupo.ccu_saldo>0