select smn_base.smn_auxiliar_unidades_negocios.smn_auxiliar_unidades_negocios_id as id, 
smn_base.smn_auxiliar_unidades_negocios.tun_codigo || ' - ' || smn_base.smn_auxiliar_unidades_negocios.tun_nombre as item 
from smn_base.smn_auxiliar_unidades_negocios