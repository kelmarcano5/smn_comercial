select
		smn_comercial.smn_clasificacion_cliente.ccl_codigo
from
		smn_comercial.smn_clasificacion_cliente
where
		upper(smn_comercial.smn_clasificacion_cliente.ccl_codigo) = upper(${fld:ccl_codigo})
