select smn_base.smn_sub_tipo_gasto.smn_tipo_gasto_id as id, 
smn_base.smn_sub_tipo_gasto.stg_codigo ||'-'|| 
smn_base.smn_sub_tipo_gasto.stg_descripcion as item 
from smn_base.smn_sub_tipo_gasto 
left outer join smn_base.smn_tipo_gasto on smn_base.smn_tipo_gasto.smn_tipo_gasto_id=smn_base.smn_sub_tipo_gasto.smn_tipo_gasto_id
where smn_base.smn_tipo_gasto.tig_descripcion=upper(${fld:id})