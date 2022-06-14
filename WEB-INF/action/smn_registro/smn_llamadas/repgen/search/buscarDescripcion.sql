select
		smn_comercial.smn_llamadas.lla_descripcion
from
		smn_comercial.smn_llamadas
where
		upper(smn_comercial.smn_llamadas.lla_descripcion) = upper(${fld:lla_descripcion})
