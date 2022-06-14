select
		smn_comercial.smn_pago_servicio.pas_nombre_pagador
from
		smn_comercial.smn_pago_servicio
where
		upper(smn_comercial.smn_pago_servicio.pas_nombre_pagador) = upper(${fld:pas_nombre_pagador})
