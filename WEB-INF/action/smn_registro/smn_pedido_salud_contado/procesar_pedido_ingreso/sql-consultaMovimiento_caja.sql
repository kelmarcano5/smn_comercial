SELECT  smn_caja.smn_mov_caja_cabecera.*, 
		smn_base.smn_auxiliar.aux_codigo, 
		(select case when smn_base.smn_tipo_doc_oficial.tdo_codigo = 'DI' then 'C'
					 when smn_base.smn_tipo_doc_oficial.tdo_codigo = 'PA' then 'P'
					 else 'C'
				end as tdo_codigo 
		from smn_base.smn_tipo_doc_oficial where smn_base.smn_tipo_doc_oficial.smn_tipo_doc_oficial_id = smn_base.smn_auxiliar.aux_tipo_doc_oficial_rf),
		smn_base.smn_auxiliar.aux_num_doc_oficial,
		smn_base.smn_auxiliar.aux_apellidos || '^' || replace( smn_base.smn_auxiliar.aux_nombres, ' ', '_') || '^^^^' as nombre,
		smn_base.smn_auxiliar.aux_apellidos,
		smn_base.smn_auxiliar.aux_nombres,
		smn_base.smn_auxiliar.aux_fecha_nac,
		TO_CHAR(smn_base.smn_auxiliar.aux_fecha_nac, 'dd/MM/yyyy') as aux_fecha_nac2,
		case
			when smn_base.smn_auxiliar.aux_sexo = 'FE' THEN 'F' --else 'FE' 
			when smn_base.smn_auxiliar.aux_sexo = 'MA' THEN 'M' --else 'MA'
			when smn_base.smn_auxiliar.aux_sexo is null then '' else smn_base.smn_auxiliar.aux_sexo
		end as aux_sexo,
		case 
			when smn_base.smn_auxiliar.aux_peso is null then 0.0 
			else smn_base.smn_auxiliar.aux_peso 
		end as aux_peso, 
		case
			when smn_base.smn_auxiliar.aux_numero_historia is null then smn_base.smn_auxiliar.aux_codigo
			else CAST(smn_base.smn_auxiliar.aux_numero_historia AS VARCHAR(50))
		end as aux_numero_historia,
		 case when smn_base.smn_direccion.dir_descripcion is null then '' else smn_base.smn_direccion.dir_descripcion end as aux_direccion_rf,
		(select case when smn_base.smn_contactos.cnt_descripcion1 is null then '' else smn_base.smn_contactos.cnt_descripcion1 end
		 from smn_base.smn_contactos
		 join smn_base.smn_tipo_contactos on smn_base.smn_tipo_contactos.smn_tipo_contactos_id = smn_base.smn_contactos.smn_tipo_contactos_rf1
		 where smn_base.smn_tipo_contactos.tco_codigo = '02' AND
		 	smn_base.smn_contactos.smn_auxiliar_id = smn_base.smn_auxiliar.smn_auxiliar_id
		 limit 1		 
		) as telefono,		
		(select case when smn_base.smn_contactos.cnt_descripcion1 is null then '' else smn_base.smn_contactos.cnt_descripcion1 end
		 from smn_base.smn_contactos
		 join smn_base.smn_tipo_contactos on smn_base.smn_tipo_contactos.smn_tipo_contactos_id = smn_base.smn_contactos.smn_tipo_contactos_rf1
		 where smn_base.smn_tipo_contactos.tco_codigo = '02' AND
		 	smn_base.smn_contactos.smn_auxiliar_id = smn_base.smn_auxiliar.smn_auxiliar_id
		 limit 1		 
		) as telef,		
		(select case when smn_base.smn_contactos.cnt_descripcion1 is null then '' else smn_base.smn_contactos.cnt_descripcion1 end
		 from smn_base.smn_contactos
		 join smn_base.smn_tipo_contactos on smn_base.smn_tipo_contactos.smn_tipo_contactos_id = smn_base.smn_contactos.smn_tipo_contactos_rf1
		 where smn_base.smn_tipo_contactos.tco_codigo = '02' AND
		 	smn_base.smn_contactos.smn_auxiliar_id = smn_base.smn_auxiliar.smn_auxiliar_id
		 limit 1		 
		) as celular,		
		(select case when smn_base.smn_contactos.cnt_email is null then '' else smn_base.smn_contactos.cnt_email end
		 from smn_base.smn_contactos WHERE
		 	smn_base.smn_contactos.smn_auxiliar_id = smn_base.smn_auxiliar.smn_auxiliar_id
		 limit 1		 
		) as correo,
		smn_base.smn_auxiliar.aux_numero_historia as aux_numero_historia2,
		(select smn_base.smn_auxiliar.aux_descripcion from smn_base.smn_auxiliar where smn_base.smn_auxiliar.smn_auxiliar_id =  smn_caja.smn_mov_caja_cabecera.smn_auxiliar_pagador_rf ) as contratante_des,
		(select smn_base.smn_auxiliar.aux_descripcion from smn_base.smn_auxiliar where smn_base.smn_auxiliar.smn_auxiliar_id =  smn_caja.smn_mov_caja_cabecera.smn_auxiliar_pagador_rf ) as contratante,
		(select smn_base.smn_auxiliar.aux_codigo from smn_base.smn_auxiliar where smn_base.smn_auxiliar.smn_auxiliar_id =  smn_caja.smn_mov_caja_cabecera.smn_auxiliar_pagador_rf ) as contratante_cod,
		smn_caja.smn_tipo_documento.tdo_tipo_movimiento as tipo_doc,
		1 as convenio_id,
		case
			when smn_salud.smn_tipo_documento.tdc_codigo = 'IN' then 'APS'
			when smn_salud.smn_tipo_documento.tdc_codigo = 'HO' then 'HO'
			when smn_salud.smn_tipo_documento.tdc_codigo = 'EM' then 'EM'
		end as tipo_ingreso,
		case
			when smn_salud.smn_tipo_documento.tdc_codigo = 'IN' then smn_salud.smn_ingresos.igs_num_ingreso||'99999'
			when smn_salud.smn_tipo_documento.tdc_codigo = 'HO' then smn_salud.smn_ingresos.igs_num_ingreso||'99999'||smn_salud.smn_ordenes_medicas.omd_numero_orden
			when smn_salud.smn_tipo_documento.tdc_codigo = 'EM' then smn_salud.smn_ingresos.igs_num_ingreso||'99999'||smn_salud.smn_ordenes_medicas.omd_numero_orden
		end as numero,
		'LABORATORIO SIMONE' as des_convenio
FROM smn_caja.smn_mov_caja_cabecera
inner join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_caja.smn_mov_caja_cabecera.smn_auxiliar_rf
inner join smn_caja.smn_documento on smn_caja.smn_documento.smn_documento_id = smn_caja.smn_mov_caja_cabecera.smn_documento_id
inner join smn_caja.smn_tipo_documento on smn_caja.smn_tipo_documento.smn_tipo_documento_id = smn_caja.smn_documento.smn_tipo_documento_id
inner join smn_salud.smn_ingresos on smn_salud.smn_ingresos.igs_num_ingreso = smn_caja.smn_mov_caja_cabecera.smn_num_doc_origen_rf
inner join smn_salud.smn_documento on smn_salud.smn_documento.smn_documento_id = smn_salud.smn_ingresos.smn_documento_id
inner join smn_salud.smn_tipo_documento on smn_salud.smn_tipo_documento.smn_tipo_documento_id = smn_salud.smn_documento.smn_tipo_documento_id
left join smn_salud.smn_ordenes_medicas on smn_salud.smn_ordenes_medicas.smn_ingreso_id = smn_salud.smn_ingresos.smn_ingresos_id
left join smn_base.smn_direccion on smn_base.smn_direccion.smn_direccion_id = smn_base.smn_auxiliar.aux_direccion_rf
inner join smn_base.smn_unidades_servicios on smn_base.smn_unidades_servicios.smn_unidades_servicios_id = smn_salud.smn_ingresos.smn_unidades_servicios_rf
WHERE smn_caja.smn_mov_caja_cabecera.smn_mov_caja_cabecera_id = (select smn_mov_caja_cabecera_id from smn_comercial.smn_pedido_cabecera where smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id=${fld:smn_pedido_cabecera_id}) limit 1