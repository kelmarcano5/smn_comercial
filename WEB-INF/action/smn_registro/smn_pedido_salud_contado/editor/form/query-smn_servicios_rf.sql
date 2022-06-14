select  DISTINCT smn_base.smn_servicios.smn_servicios_id as id, smn_base.smn_servicios.svc_descripcion as item from smn_base.smn_servicios
inner join smn_comercial.smn_rel_linea_comercial_servicio on smn_comercial.smn_rel_linea_comercial_servicio.smn_servicio_rf = smn_base.smn_servicios.smn_servicios_id
inner join smn_base.smn_baremos_detalle on smn_base.smn_baremos_detalle.smn_servicios_rf = smn_base.smn_servicios.smn_servicios_id
where smn_base.smn_baremos_detalle.bad_estatus='A' ORDER BY smn_base.smn_servicios.smn_servicios_id  ASC