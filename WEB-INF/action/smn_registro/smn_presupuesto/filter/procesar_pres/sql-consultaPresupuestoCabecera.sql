SELECT * 
FROM smn_comercial.smn_presupuesto
inner join smn_comercial.smn_ingresos on smn_comercial.smn_ingresos.igs_doc_origen = smn_comercial.smn_presupuesto.smn_presupuesto_id 
WHERE smn_presupuesto_id = ${fld:smn_presupuesto_id}