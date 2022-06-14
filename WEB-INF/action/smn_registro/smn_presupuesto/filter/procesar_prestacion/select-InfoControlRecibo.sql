SELECT smn_control_recibo_id, rcr_serie || ' ' || rcr_numero_control_final as rcr_numero_control_final
FROM smn_caja.smn_control_recibo
WHERE smn_caja_id = ${fld:smn_caja_id}
LIMIT 1;
