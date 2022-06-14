SELECT 
smn_base.smn_almacen.smn_almacen_id as id,
smn_base.smn_almacen.alm_codigo||'-'||smn_base.smn_almacen.alm_nombre as item
, * 
from smn_base.smn_almacen
inner join smn_base.smn_entidades on smn_base.smn_entidades.smn_entidades_id = smn_base.smn_almacen.alm_empresa
where smn_base.smn_almacen.alm_empresa = ${fld:id1}