INSERT INTO smn_comercial.smn_catalogo_item_comercio
(
	smn_catalogo_item_comercio_id,
	cic_origen,
	smn_cliente_rf,
	smn_item_rf,
	smn_clasificacion_abc_rf_a,
	smn_clasificacion_abc_rf_b,
	smn_clasificacion_abc_rf_c,
	smn_baremos_rf,
	cic_fecha_registro
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_catalogo_item_comercio},
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	{d '${def:date}'}
)
