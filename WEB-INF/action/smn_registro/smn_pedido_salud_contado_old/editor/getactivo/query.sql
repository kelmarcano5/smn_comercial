select smn_base.smn_activo_fijo.smn_afijo_id as id, smn_base.smn_activo_fijo.acf_codigo|| ' - ' || smn_base.smn_activo_fijo.acf_nombre as item from smn_base.smn_activo_fijo
inner join smn_comercial.smn_rel_linea_comercial_afijo on smn_comercial.smn_rel_linea_comercial_afijo.smn_activo_rf = smn_base.smn_activo_fijo.smn_afijo_id
where
smn_comercial.smn_rel_linea_comercial_afijo.smn_linea_comercial_id=${fld:id}