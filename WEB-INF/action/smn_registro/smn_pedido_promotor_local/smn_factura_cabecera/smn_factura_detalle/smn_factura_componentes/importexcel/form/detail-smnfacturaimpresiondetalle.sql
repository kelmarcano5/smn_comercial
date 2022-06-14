select	
	smn_comercial.smn_factura_cabecera.smn_factura_cabecera_id, 
	smn_comercial.smn_factura_cabecera.fca_rif as fca_rif_pl0,
	smn_comercial.smn_factura_detalle.smn_factura_detalle_id, 
	smn_comercial.smn_factura_detalle.fde_naturaleza as fde_naturaleza_pl1,
	(select smn_base.smn_grupo_titulo_impresion.gti_codigo ||' - '|| smn_base.smn_grupo_titulo_impresion.gti_descripcion from  smn_base.smn_grupo_titulo_impresion where smn_base.smn_grupo_titulo_impresion.smn_grupo_titulo_impresion_id is not null  and smn_base.smn_grupo_titulo_impresion.smn_grupo_titulo_impresion_id=smn_comercial.smn_factura_componentes.smn_grupo_titulo_impresion_rf) as smn_grupo_titulo_impresion_rf,
	(select smn_base.smn_monedas.mon_codigo|| ' - ' || smn_base.smn_monedas.mon_nombre from  smn_base.smn_monedas where smn_base.smn_monedas.smn_monedas_id is not null  and smn_base.smn_monedas.smn_monedas_id=smn_comercial.smn_factura_componentes.smn_moneda_rf) as smn_moneda_rf,
	(select smn_base.smn_monedas.mon_codigo ||' - '|| smn_base.smn_monedas.mon_nombre from  smn_base.smn_tasas_de_cambio left outer join smn_base.smn_monedas on smn_base.smn_monedas.smn_monedas_id = smn_base.smn_tasas_de_cambio.smn_monedas_id where smn_base.smn_tasas_de_cambio.smn_tasas_de_cambio_id is not null  and smn_base.smn_tasas_de_cambio.smn_tasas_de_cambio_id=smn_comercial.smn_factura_componentes.smn_tasa_rf) as smn_tasa_rf,
	smn_comercial.smn_factura_impresion_detalle.*
from
	smn_comercial.smn_factura_componentes ,
	smn_comercial.smn_factura_cabecera,
	smn_comercial.smn_factura_detalle,
	smn_comercial.smn_factura_impresion_detalle
where
	smn_comercial.smn_factura_impresion_detalle.smn_factura_componente_id=smn_comercial.smn_factura_componentes.smn_factura_componente_id and 
	smn_comercial.smn_factura_componentes.smn_factura_componente_id=${fld:id}  and 
	smn_comercial.smn_factura_cabecera.smn_factura_cabecera_id=smn_comercial.smn_factura_impresion_detalle.smn_factura_cabecera_id and
	smn_comercial.smn_factura_detalle.smn_factura_detalle_id=smn_comercial.smn_factura_impresion_detalle.smn_factura_detalle_id 

