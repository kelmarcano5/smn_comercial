select
	smn_comercial.smn_factura_cabecera.smn_factura_cabecera_id,
	smn_comercial.smn_factura_cabecera.fca_rif as fca_rif_pl0,
	smn_comercial.smn_factura_detalle.smn_factura_detalle_id,
	smn_comercial.smn_factura_detalle.fde_naturaleza as fde_naturaleza_pl1,
select
select
select
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
	
