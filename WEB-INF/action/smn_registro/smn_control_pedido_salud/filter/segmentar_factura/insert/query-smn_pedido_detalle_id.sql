select
	*
from
	smn_caja.smn_mov_caja_detalle, smn_base.smn_servicios
where smn_caja.smn_mov_caja_detalle.smn_id_rf =smn_base.smn_servicios.smn_servicios_id and
	  smn_caja.smn_mov_caja_detalle.smn_mov_caja_cabecera_id=${fld:smn_mov_caja_cabecera_id} and
	  smn_caja.smn_mov_caja_detalle.mcd_saldo_pago_ml != 0 
order by smn_mov_caja_detalle.smn_mov_caja_detalle_id asc