select DISTINCT smn_comercial.smn_presupuesto.smn_presupuesto_id as id,smn_comercial.smn_presupuesto.smn_documento_id || ' - ' || smn_comercial.smn_presupuesto.pre_numero_control as item from  smn_comercial.smn_presupuesto, smn_comercial.smn_presupuesto_detalle  where smn_comercial.smn_presupuesto.smn_presupuesto_id is not null  and smn_comercial.smn_presupuesto.smn_presupuesto_id=smn_comercial.smn_presupuesto_detalle.smn_presupuesto_id 