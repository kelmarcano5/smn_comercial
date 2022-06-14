SELECT * 
FROM smn_comercial.smn_presupuesto
inner join smn_comercial.smn_ingresos on smn_comercial.smn_ingresos.igs_num_ingreso = smn_comercial.smn_presupuesto.smn_ingresos_id 
WHERE smn_presupuesto_id =  ${fld:smn_presupuesto_id}