Select 
smn_base.smn_entidades.smn_entidades_id as id,
smn_base.smn_entidades.ent_codigo||'-'||smn_base.smn_entidades.ent_descripcion_larga as item
from smn_base.smn_entidades
where smn_base.smn_entidades.ent_corporacion = ${fld:id}