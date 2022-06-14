select
		smn_comercial.smn_clasificacion_cliente.ccl_descripcion
from
		smn_comercial.smn_clasificacion_cliente
where
		upper(smn_comercial.smn_clasificacion_cliente.ccl_descripcion) = upper(${fld:ccl_descripcion})
