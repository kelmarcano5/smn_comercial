WITH rows as (
select 
	case
		when SUM(smn_comercial.smn_pedido_detalle.pde_monto) is null then 0 else SUM(smn_comercial.smn_pedido_detalle.pde_monto) 
	end as monto_ml,
		case
		when SUM(smn_comercial.smn_pedido_detalle.pde_monto_moneda_alterna) is null then 0 else SUM(smn_comercial.smn_pedido_detalle.pde_monto_moneda_alterna) 
	end as monto_ma,
			case
		when SUM(smn_comercial.smn_pedido_detalle.pde_descuento_ml) is null then 0 else SUM(smn_comercial.smn_pedido_detalle.pde_descuento_ml) 
	end as pde_descuento_ml,
			case
		when SUM(smn_comercial.smn_pedido_detalle.pde_monto_descuento_ma) is null then 0 else SUM(smn_comercial.smn_pedido_detalle.pde_monto_descuento_ma)
	end as pde_monto_descuento_ma,
			case
		when 	SUM(smn_comercial.smn_pedido_detalle.pde_monto_impuesto_ml) is null then 0 else SUM(smn_comercial.smn_pedido_detalle.pde_monto_impuesto_ml)
	end as pde_monto_impuesto_ml,
			case
		when SUM(smn_comercial.smn_pedido_detalle.pde_monto_impuesto_ma) is null then 0 else SUM(smn_comercial.smn_pedido_detalle.pde_monto_impuesto_ma) 
	end as pde_monto_impuesto_ma,
	case
		when 	SUM(smn_comercial.smn_pedido_detalle.pde_incremento_ml) is null then 0 else SUM(smn_comercial.smn_pedido_detalle.pde_incremento_ml)
	end as pde_incremento_ml,
	case
		when SUM(smn_comercial.smn_pedido_detalle.pde_monto_incremento_ma) is null then 0 else SUM(smn_comercial.smn_pedido_detalle.pde_monto_incremento_ma) 
	end as pde_monto_incremento_ma
from 
	smn_comercial.smn_pedido_detalle
where
smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id=(select last_value from smn_comercial.seq_smn_pedido_cabecera)
) 
update smn_comercial.smn_pedido_cabecera
set
pca_monto_pedido_ml=rows.monto_ml,
pca_monto_pedido_ma=rows.monto_ma,
pca_monto_neto_ml=rows.monto_ml-rows.pde_descuento_ml+rows.pde_monto_impuesto_ml+rows.pde_incremento_ml,
pca_monto_neto_ma=rows.monto_ma-rows.pde_monto_descuento_ma+rows.pde_monto_impuesto_ma+rows.pde_monto_incremento_ma
from rows
where
smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id = (select last_value from smn_comercial.seq_smn_pedido_cabecera)