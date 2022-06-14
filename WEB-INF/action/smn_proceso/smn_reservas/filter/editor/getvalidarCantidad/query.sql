select DISTINCT smn_comercial.smn_control_cupo.ccu_saldo as saldo_evento, smn_comercial.smn_control_cupo_afiliado.cca_saldo as saldo_afiliacion, smn_comercial.smn_evento.eve_reservas_por_afiliado as reserva_afiliado from smn_comercial.smn_afiliados 
inner join smn_comercial.smn_control_cupo_afiliado on smn_comercial.smn_control_cupo_afiliado.smn_afiliados_id=${fld:id_afiliado}
inner join smn_comercial.smn_control_cupo on smn_comercial.smn_control_cupo.smn_evento_id=${fld:id_evento}
inner join smn_comercial.smn_evento on smn_comercial.smn_evento.smn_evento_id=${fld:id_evento}