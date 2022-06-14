INSERT INTO smn_caja.smn_rel_deposito_dist_pago_det
(
	smn_rel_deposito_dist_pago_det_id,
	smn_deposito_id,
	smn_dist_pago_detalle_id
)
VALUES
(
	${seq:nextval@smn_caja.seq_smn_rel_deposito_dist_pago_det},
	${fld:smn_deposito_id},
	${fld:smn_dist_pago_detalle_id}
)
