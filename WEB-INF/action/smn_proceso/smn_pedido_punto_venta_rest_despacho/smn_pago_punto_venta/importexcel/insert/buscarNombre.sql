select
		smn_comercial.smn_pago_punto_venta.ppv_nombre_pagador
from
		smn_comercial.smn_pago_punto_venta
where
		upper(smn_comercial.smn_pago_punto_venta.ppv_nombre_pagador) = upper(${fld:ppv_nombre_pagador})
