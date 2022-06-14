select smn_base.smn_componentes.smn_componentes_id as id, smn_base.smn_componentes.cmp_codigo ||' - '|| smn_base.smn_componentes.cmp_descripcion as item from smn_base.smn_componentes
inner join smn_base.smn_grupo_componente on smn_base.smn_grupo_componente.smn_grupo_componente_id = smn_base.smn_componentes.smn_grupo_componente_rf
where 
smn_base.smn_componentes.smn_grupo_componente_rf=${fld:id}