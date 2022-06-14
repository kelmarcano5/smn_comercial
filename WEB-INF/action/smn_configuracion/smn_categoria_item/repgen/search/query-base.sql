select
		smn_comercial.smn_categoria_item.smn_categoria_item_id,
	${field}
from
	smn_comercial.smn_categoria_item
where
		smn_comercial.smn_categoria_item.smn_categoria_item_id is not null
	${filter}
	
	
