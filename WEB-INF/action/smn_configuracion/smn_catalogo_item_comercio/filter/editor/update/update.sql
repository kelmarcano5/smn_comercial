UPDATE smn_comercial.smn_catalogo_item_comercio SET
	cic_origen=${fld:cic_origen},
	smn_cliente_rf=${fld:smn_cliente_rf},
	cic_maneja_ingredientes=${fld:cic_maneja_ingredientes},
	smn_item_rf=${fld:smn_item_rf},
	smn_unidad_medida_rf=${fld:smn_unidad_medida_rf},
	cic_tiempo_sug_preparacion=${fld:cic_tiempo_sug_preparacion},
	smn_categoria_menu_id=${fld:smn_categoria_menu_id},
	smn_categoria_item_id_a=${fld:smn_categoria_item_id_a},
	smn_categoria_item_id_b=${fld:smn_categoria_item_id_b},
	smn_baremos_rf=${fld:smn_baremos_rf},
	cic_idioma='${def:locale}',
	cic_usuario='${def:user}',
	cic_fecha_registro={d '${def:date}'},
	cic_hora='${def:time}',
	cic_descripcion=${fld:cic_descripcion}

WHERE
	smn_catalogo_item_comercio_id=${fld:id}

