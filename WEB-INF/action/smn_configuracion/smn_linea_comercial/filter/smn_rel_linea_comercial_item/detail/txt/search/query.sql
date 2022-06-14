select
	smn_comercial.smn_linea_comercial.smn_linea_comercial_id,
	smn_comercial.smn_linea_comercial.lco_codigo as lco_codigo_pl0,
select
select
	case
	when smn_comercial.smn_rel_linea_comercial_Item.rli_estatus='AC' then '${lbl:b_account_type_active}'
	when smn_comercial.smn_rel_linea_comercial_Item.rli_estatus='IN' then '${lbl:b_inactive}'
	end as rli_estatus_combo,
	smn_comercial.smn_rel_linea_comercial_item.smn_linea_comercial_id,
	smn_comercial.smn_rel_linea_comercial_item.smn_item_rf,
	smn_comercial.smn_rel_linea_comercial_item.rli_estatus,
	smn_comercial.smn_rel_linea_comercial_item.rli_vigencia,
	smn_comercial.smn_rel_linea_comercial_item.rli_idioma,
	smn_comercial.smn_rel_linea_comercial_item.rli_usuario,
	smn_comercial.smn_rel_linea_comercial_item.rli_fecha_registro,
	smn_comercial.smn_rel_linea_comercial_item.rli_hora,
		smn_comercial.smn_rel_linea_comercial_item.smn_rel_linea_comercial_item_id
from
	smn_comercial.smn_linea_comercial,
	smn_comercial.smn_rel_linea_comercial_item
where
	smn_comercial.smn_linea_comercial.smn_linea_comercial_id=smn_comercial.smn_rel_linea_comercial_item.smn_linea_comercial_id
	and
	smn_rel_linea_comercial_item_id = ${fld:id}
