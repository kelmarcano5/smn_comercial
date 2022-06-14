select	
	(select smn_base.smn_entidades.ent_codigo || ' - ' || smn_base.smn_entidades.ent_descripcion_corta from  smn_base.smn_entidades  where smn_base.smn_entidades.smn_entidades_id is not null  and smn_base.smn_entidades.smn_entidades_id=smn_comercial.smn_presupuesto.smn_entidades_rf  order by smn_base.smn_entidades.ent_descripcion_corta ) as smn_entidades_rf_combo,
	(select smn_base.smn_sucursales.suc_codigo || ' - ' || smn_base.smn_sucursales.suc_nombre from  smn_base.smn_sucursales  where smn_base.smn_sucursales.smn_sucursales_id is not null  and smn_base.smn_sucursales.smn_sucursales_id=smn_comercial.smn_presupuesto.smn_sucursales_rf  order by smn_base.smn_sucursales.suc_nombre ) as smn_sucursales_rf_combo,	
	smn_comercial.smn_documento.dcf_descripcion as  smn_documento_id,
	smn_comercial.smn_presupuesto.smn_baremo_rf,
	smn_comercial.smn_presupuesto.pre_numero_control,
	smn_comercial.smn_presupuesto.smn_entidades_rf,
	smn_comercial.smn_presupuesto.smn_sucursales_rf,
	smn_comercial.smn_presupuesto.smn_auxiliar_rf,
	smn_comercial.smn_presupuesto.pre_fecha_registro,
	smn_comercial.smn_presupuesto.pre_monto_ml,
	smn_comercial.smn_presupuesto.pre_monto_ma,
	smn_comercial.smn_presupuesto.smn_presupuesto_id,
	case
		when smn_comercial.smn_presupuesto.smn_estado_presupuesto_id = 1 then 'Registrado'
		when smn_comercial.smn_presupuesto.smn_estado_presupuesto_id = 2 then 'Generado' 
		when smn_comercial.smn_presupuesto.smn_estado_presupuesto_id = 3 then 'Enviado/Entregado'
		when smn_comercial.smn_presupuesto.smn_estado_presupuesto_id = 4 then 'Aprobado'
		when smn_comercial.smn_presupuesto.smn_estado_presupuesto_id = 5 then 'Rechazado'
	end as status_combo,
	smn_comercial.smn_presupuesto.smn_estado_presupuesto_id as status,
	cl.aux_descripcion as cliente
		
from
	smn_comercial.smn_presupuesto
	inner join smn_comercial.smn_orden_servicio on 	smn_comercial.smn_orden_servicio.smn_orden_servicio_id = smn_comercial.smn_presupuesto.smn_orden_servicio_id
	inner join smn_comercial.smn_cliente on smn_comercial.smn_cliente.smn_cliente_id = smn_comercial.smn_orden_servicio.smn_cliente_id
	inner join smn_base.smn_auxiliar cl on cl.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf 
	inner join smn_comercial.smn_rel_cliente_usuario on smn_comercial.smn_rel_cliente_usuario.smn_cliente_id = 
	smn_comercial.smn_cliente.smn_cliente_id
	inner join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_presupuesto.smn_auxiliar_rf
	inner join smn_comercial.smn_documento on smn_comercial.smn_documento.smn_documento_id = smn_comercial.smn_presupuesto.smn_documento_id
where
	smn_comercial.smn_presupuesto.smn_presupuesto_id is not null and smn_comercial.smn_presupuesto.smn_estado_presupuesto_id in (1,2,3,4)
	and smn_comercial.smn_presupuesto.smn_presupuesto_id=${fld:id} 
 	 
order by 
	smn_presupuesto_id desc