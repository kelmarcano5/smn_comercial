update smn_comercial.smn_presupuesto set smn_estado_presupuesto_id = 2 where
smn_comercial.smn_presupuesto.smn_presupuesto_id=${fld:id};

UPDATE smn_comercial.smn_presupuesto_detalle SET prd_estatus='GE' where smn_comercial.smn_presupuesto_detalle.smn_presupuesto_id=${fld:id} and smn_comercial.smn_presupuesto_detalle.prd_estatus='RE';
