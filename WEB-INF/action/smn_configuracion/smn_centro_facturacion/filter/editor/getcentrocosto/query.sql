SELECT 
smn_base.smn_centro_costo.smn_centro_costo_id as id,
smn_base.smn_centro_costo.cco_codigo||'-'||smn_base.smn_centro_costo.cco_descripcion_corta as item
, * 
from smn_base.smn_centro_costo
inner join smn_base.smn_entidades on smn_base.smn_entidades.smn_entidades_id = smn_base.smn_centro_costo.cco_empresa
where smn_base.smn_centro_costo.cco_empresa= ${fld:id1}