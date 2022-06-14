INSERT INTO smn_comercial.smn_control_fiscal_documento
(
	smn_control_fiscal_documento_id,
	smn_documento_id,
	cfd_numero_documento_fiscal_inicial,
	cfd_numero_documento_fiscal_final,
	cfd_ultimo_numero_fiscal_usado,
	smn_proveedor_rf,
	cfd_fecha_solicitud,
	cfd_fecha_recepcion,
	cfd_serie,
	cfd_estatus,
	cfd_fecha_registro
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_control_fiscal_documento},
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	{d '${def:date}'}
)
