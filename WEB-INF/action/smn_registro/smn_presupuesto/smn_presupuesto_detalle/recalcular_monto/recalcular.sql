WITH rows as (
select 
SUM(smn_comercial.smn_presupuesto_detalle.prd_monto_moneda_local+smn_comercial.smn_presupuesto_detalle.prd_monto_incremento_ml-smn_comercial.smn_presupuesto_detalle.prd_monto_descuento_ml) as monto_ml,
SUM(smn_comercial.smn_presupuesto_detalle.prd_moneda_alterna+smn_comercial.smn_presupuesto_detalle.prd_monto_incremento_ma-smn_comercial.smn_presupuesto_detalle.prd_monto_descuento_ma) as monto_ma,
SUM(smn_comercial.smn_presupuesto_detalle.prd_monto_descuento_ml) as monto_descuento_ml,
SUM(smn_comercial.smn_presupuesto_detalle.prd_monto_descuento_ma) as monto_descuento_ma,
SUM(smn_comercial.smn_presupuesto_detalle.prd_monto_incremento_ml) as monto_incremento_ml,
SUM(smn_comercial.smn_presupuesto_detalle.prd_monto_incremento_ma) as monto_incremento_ma,
SUM(smn_comercial.smn_presupuesto_detalle.prd_monto_neto_ml) as monto_neto_ml,
SUM(smn_comercial.smn_presupuesto_detalle.prd_monto_neto_ma) as monto_neto_ma
from smn_comercial.smn_presupuesto_detalle
where
smn_comercial.smn_presupuesto_detalle.smn_presupuesto_id=${fld:id2} and smn_comercial.smn_presupuesto_detalle.prd_estatus<>'RZ' and smn_comercial.smn_presupuesto_detalle.smn_tipo_componentes_rf in('SE','IT')
) 
update smn_comercial.smn_presupuesto
set
pre_monto_ml=rows.monto_ml,
pre_monto_ma=rows.monto_ma,
pre_monto_descuento=rows.monto_descuento_ml,
pre_monto_descuento_moneda_alterna=rows.monto_descuento_ma,
pre_monto_neto_moneda_local=rows.monto_neto_ml,
pre_monto_neto_moneda_alterna=rows.monto_neto_ma
from rows
where
smn_comercial.smn_presupuesto.smn_presupuesto_id = ${fld:id2};

-------OBTIENE EL PRECIO Y LO ACTUALIZA CON EL PRECIO DEL SERVICIO-----------------
with rows as (
select smn_comercial.smn_presupuesto_detalle.smn_presupuesto_id as idp, smn_comercial.smn_presupuesto_detalle.smn_presupuesto_detalle_id as idd, smn_comercial.smn_presupuesto_detalle.smn_servicios_rf as servicio, smn_comercial.smn_presupuesto_detalle.prd_monto_neto_ml as monto_honorario_ml,
smn_comercial.smn_presupuesto_detalle.prd_monto_neto_ma as monto_honorario_ma 
from smn_comercial.smn_presupuesto_detalle where smn_comercial.smn_presupuesto_detalle.smn_presupuesto_id=${fld:id2} and smn_comercial.smn_presupuesto_detalle.smn_tipo_componentes_rf='SE'
) UPDATE smn_comercial.smn_presupuesto_detalle SET 
		prd_precio = rows.monto_honorario_ml,
		prd_precio_ma = rows.monto_honorario_ma
from rows
where smn_comercial.smn_presupuesto_detalle.smn_presupuesto_id=${fld:id2} and smn_comercial.smn_presupuesto_detalle.smn_tipo_componentes_rf='HO' and smn_comercial.smn_presupuesto_detalle.smn_servicios_rf=rows.servicio;


-------ACTUALIZA LOS PRECIO MONTO MONEDA LOCAL Y MONTO MONEDA ALTERNA-----------------
with rows as (
	select 
	smn_comercial.smn_presupuesto_detalle.smn_presupuesto_detalle_id as idp,
	case 
		when smn_comercial.smn_presupuesto_detalle.smn_tipo_componentes_rf='HO' then smn_comercial.smn_presupuesto_detalle.prd_precio
	end as precio, 
	case 
		when smn_comercial.smn_presupuesto_detalle.smn_tipo_componentes_rf='HO' THEN smn_comercial.smn_presupuesto_detalle.prd_porcentaje_prestador	
	end as porcentaje,
		case 
		when smn_comercial.smn_presupuesto_detalle.smn_tipo_componentes_rf='HO' then smn_comercial.smn_presupuesto_detalle.prd_precio_ma 	
	end as precio_ma
	from smn_comercial.smn_presupuesto_detalle where smn_comercial.smn_presupuesto_detalle.smn_presupuesto_id= ${fld:id2} and smn_comercial.smn_presupuesto_detalle.smn_tipo_componentes_rf='HO' and smn_comercial.smn_presupuesto_detalle.prd_estatus<>'RZ'
)
UPDATE smn_comercial.smn_presupuesto_detalle SET 
		--prd_precio = rows.precio, 
		prd_monto_moneda_local = rows.precio * rows.porcentaje/100, 
		prd_monto_neto_ml = rows.precio * rows.porcentaje/100, 
		--prd_precio_ma = rows.precio_ma,
		prd_moneda_alterna = rows.precio_ma * rows.porcentaje/100,
		prd_monto_neto_ma = rows.precio_ma * rows.porcentaje/100
from rows
where smn_comercial.smn_presupuesto_detalle.smn_presupuesto_id=${fld:id2} and smn_comercial.smn_presupuesto_detalle.smn_presupuesto_detalle_id =rows.idp and smn_comercial.smn_presupuesto_detalle.smn_tipo_componentes_rf='HO' and smn_comercial.smn_presupuesto_detalle.prd_estatus<>'RZ';


-- UPDATE smn_comercial.smn_ingresos set 
-- igs_monto_moneda_local = (select smn_comercial.smn_presupuesto.pre_monto_neto_moneda_local from smn_comercial.smn_presupuesto where smn_comercial.smn_presupuesto.smn_presupuesto_id=${fld:id2}),
-- igs_monto_moneda_alterna = (select smn_comercial.smn_presupuesto.pre_monto_neto_moneda_alterna from smn_comercial.smn_presupuesto where smn_comercial.smn_presupuesto.smn_presupuesto_id=${fld:id2}),
-- smn_moneda_rf=(select smn_comercial.smn_presupuesto.smn_moneda_rf from smn_comercial.smn_presupuesto where smn_comercial.smn_presupuesto.smn_presupuesto_id=${fld:id2})
-- where smn_comercial.smn_ingresos.smn_ingresos_id = (select smn_comercial.smn_presupuesto.smn_ingresos_id from smn_comercial.smn_presupuesto where smn_comercial.smn_presupuesto.smn_presupuesto_id=${fld:id2})


