select
		smn_comercial.smn_pedido_cabecera.pca_descripcion
from
		smn_comercial.smn_pedido_cabecera
where
		upper(smn_comercial.smn_pedido_cabecera.pca_descripcion) = upper(${fld:pca_descripcion})
