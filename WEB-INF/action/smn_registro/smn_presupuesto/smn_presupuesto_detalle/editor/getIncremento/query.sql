select smn_base.smn_incrementos.inc_porcentaje_incremento as porinc, smn_base.smn_incrementos.inc_porcentaje_base as porbase from smn_base.smn_incrementos
where smn_base.smn_incrementos.smn_incrementos_id=${fld:id}
order by smn_base.smn_incrementos.inc_descripcion asc