SELECT 
smn_base.smn_auxiliar_sucursales.smn_auxiliar_sucursales_id as id,
smn_base.smn_auxiliar_sucursales.trs_codigo||'-'||smn_base.smn_auxiliar_sucursales.trs_nombre as item 
from smn_base.smn_auxiliar_sucursales 
where smn_base.smn_auxiliar_sucursales.trs_auxiliar_unidad_negocio=(SELECT smn_base.smn_auxiliar_unidades_negocios.smn_auxiliar_unidades_negocios_id
from smn_base.smn_auxiliar_unidades_negocios
where
upper(smn_base.smn_auxiliar_unidades_negocios.tun_nombre)=upper(${fld:id})) 