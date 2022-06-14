SELECT
	case when smn_caja.smn_documento.smn_documento_id is null then 0 else smn_caja.smn_documento.smn_documento_id end as smn_documento_id
FROM
	smn_caja.smn_rel_documento_forma_pago
	INNER JOIN
	smn_caja.smn_documento ON smn_caja.smn_documento.smn_documento_id=smn_caja.smn_rel_documento_forma_pago.smn_documento_id
	INNER JOIN
	smn_caja.smn_tipo_documento ON smn_caja.smn_tipo_documento.smn_tipo_documento_id=smn_caja.smn_documento.smn_tipo_documento_id
WHERE
	smn_caja.smn_rel_documento_forma_pago.smn_forma_pago_rf=${fld:id}
	AND
	smn_caja.smn_tipo_documento.tdo_tipo_movimiento='DP'