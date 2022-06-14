select
	smn_comercial.smn_linea_comercial.smn_linea_comercial_id, 
	smn_comercial.smn_linea_comercial.lco_codigo as lco_codigo_pl0,
	(select smn_comercial.smn_linea_comercial.lco_codigo|| ' - ' || smn_comercial.smn_linea_comercial.lco_nombre from  smn_comercial.smn_linea_comercial  where smn_comercial.smn_linea_comercial.smn_linea_comercial_id is not null and smn_comercial.smn_linea_comercial.smn_linea_comercial_id=smn_comercial.smn_rel_linea_comercial_item.smn_linea_comercial_id  order by lco_nombre ) as smn_linea_comercial_id_combo,
	(select smn_base.smn_item.itm_codigo|| ' - ' || smn_base.smn_item.itm_nombre from  smn_base.smn_item  where smn_base.smn_item.smn_item_id is not null  and smn_base.smn_item.smn_item_id=smn_comercial.smn_rel_linea_comercial_item.smn_item_rf  order by itm_nombre ) as smn_item_rf_combo,
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
and smn_comercial.smn_linea_comercial.smn_linea_comercial_id=${fld:id2}	
order by
		smn_rel_linea_comercial_item_id
