select distinct
	smn_base.smn_grupo_titulo_impresion.smn_grupo_titulo_impresion_id,
	smn_base.smn_grupo_titulo_impresion.gti_descripcion as grupo_titulo
from 
	smn_comercial.smn_pedido_cabecera
	INNER JOIN 
		smn_comercial.smn_pedido_detalle on smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id = smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id
	INNER JOIN
		smn_base.smn_servicios on smn_comercial.smn_pedido_detalle.smn_servicios_rf = smn_base.smn_servicios.smn_servicios_id
	INNER JOIN
		smn_base.smn_componentes on smn_base.smn_componentes.smn_servicios_rf = smn_base.smn_servicios.smn_servicios_id
	INNER JOIN
		smn_base.smn_grupo_titulo_impresion on smn_base.smn_componentes.smn_grupo_titulo_impresion_rf = smn_base.smn_grupo_titulo_impresion.smn_grupo_titulo_impresion_id
	INNER JOIN 
        smn_comercial.smn_rel_pedido_factura on smn_comercial.smn_rel_pedido_factura.smn_pedido_cabecera_id = smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id
    INNER JOIN 
        smn_comercial.smn_factura_cabecera on smn_comercial.smn_rel_pedido_factura.smn_factura_cabecera_id = smn_comercial.smn_factura_cabecera.smn_factura_cabecera_id
where
    smn_comercial.smn_factura_cabecera.smn_factura_cabecera_id = ${fld:id}
	