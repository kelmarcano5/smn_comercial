select * from smn_comercial.smn_rel_reserva_relacionado 
inner join smn_comercial.smn_relacionado on smn_comercial.smn_relacionado.smn_relacionado_id = smn_comercial.smn_rel_reserva_relacionado.smn_relacionado_id
inner join smn_comercial.smn_reservas on smn_comercial.smn_reservas.smn_reservas_id = smn_comercial.smn_rel_reserva_relacionado.smn_reservas_id
inner join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_relacionado.rel_auxiliar_rf
--where smn_comercial.smn_rel_reserva_relacionado.smn_reservas_id=