INSERT INTO smn_compras.smn_requisicion_cabecera (
	smn_requisicion_cabecera_id,
  	req_numero,
  	req_estatus,
  	smn_tipo_documento_id,
  	smn_documento_id,
 	  req_descripcion,
  	req_fecha_requerido,
  	req_estatus_ruta,
  	smn_entidad_id,
  	smn_sucursal_id,
  	req_idioma,
  	req_usuario,
  	req_fecha_registro,
 	  req_hora,
  	req_cabecera_version,
    smn_modulo_rf,
    smn_doc_orig,
    igs_doc_origen
)VALUES(
	nextval('smn_compras.seq_smn_requisicion_cabecera'),
	(SELECT dcc_secuencia+1 AS numero FROM smn_compras.smn_documentos WHERE smn_documentos_id = (select smn_compras.smn_documentos.smn_documentos_id from smn_compras.smn_documentos inner join smn_compras.smn_tipo_documento on smn_compras.smn_tipo_documento.smn_tipo_documento_id = smn_compras.smn_documentos.smn_tipo_documento_id
where smn_compras.smn_tipo_documento.tdc_naturaleza='RE' and smn_compras.smn_documentos.dcc_codigo like '%RQS_04%')),
	'SO',
	(select smn_compras.smn_tipo_documento.smn_tipo_documento_id from smn_compras.smn_tipo_documento where smn_compras.smn_tipo_documento.tdc_naturaleza='RE'),
	(select smn_compras.smn_documentos.smn_documentos_id from smn_compras.smn_documentos inner join smn_compras.smn_tipo_documento on smn_compras.smn_tipo_documento.smn_tipo_documento_id = smn_compras.smn_documentos.smn_tipo_documento_id
where smn_compras.smn_tipo_documento.tdc_naturaleza='RE' and smn_compras.smn_documentos.dcc_codigo like '%RQS_04%'),
	(select 'Requisicion Originada segun presupuesto:'||' '||smn_comercial.smn_presupuesto.pre_numero_control ||' Aprobada en Fecha: '|| to_char(pre_fecha_registro, 'YYYY-MM-DD') as descripcion from smn_comercial.smn_presupuesto where smn_comercial.smn_presupuesto.smn_presupuesto_id=${fld:smn_presupuesto_id}),
	{d '${def:date}'},
	'GE',
	${fld:smn_entidades_rf},
	${fld:smn_sucursales_rf},
	'${def:locale}',
    '${def:user}',
    {d '${def:date}'},
    '${def:time}',
   '',
    (select smn_base.smn_modulos.smn_modulos_id from smn_base.smn_modulos where smn_base.smn_modulos.mod_codigo='AUT'),
    ${fld:smn_doc_orig},
    ${fld:igs_doc_origen}
);

update smn_comercial.smn_presupuesto set smn_estado_presupuesto_id = 4 where
smn_comercial.smn_presupuesto.smn_presupuesto_id=${fld:smn_presupuesto_id};
