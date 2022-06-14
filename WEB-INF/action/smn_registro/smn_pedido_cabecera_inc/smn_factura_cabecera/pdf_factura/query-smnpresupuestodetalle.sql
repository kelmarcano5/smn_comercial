select
smn_base.smn_grupo_titulo_impresion.smn_grupo_titulo_impresion_id AS titulo_id,
smn_base.smn_componentes.cmp_codigo	||' - '|| smn_base.smn_componentes.cmp_descripcion as componentes,
smn_base.smn_servicios.svc_codigo ||' - '|| smn_base.smn_servicios.svc_descripcion as servicio,
smn_salud.smn_presupuesto_componente.prc_monto_neto_ml
from smn_salud.smn_presupuesto_componente
inner join smn_base.smn_componentes on smn_base.smn_componentes.smn_componentes_id = smn_salud.smn_presupuesto_componente.smn_componentes_rf
inner join smn_base.smn_grupo_titulo_impresion on smn_base.smn_grupo_titulo_impresion.smn_grupo_titulo_impresion_id = smn_base.smn_componentes.smn_grupo_titulo_impresion_rf
inner join smn_base.smn_servicios on smn_base.smn_servicios.smn_servicios_id = smn_salud.smn_presupuesto_componente.smn_servicios_rf
where smn_salud.smn_presupuesto_componente.smn_presupuesto_id = ${fld:id} and smn_base.smn_grupo_titulo_impresion.smn_grupo_titulo_impresion_id = smn_base.smn_componentes.smn_grupo_titulo_impresion_rf
order by smn_base.smn_grupo_titulo_impresion.gti_orden asc