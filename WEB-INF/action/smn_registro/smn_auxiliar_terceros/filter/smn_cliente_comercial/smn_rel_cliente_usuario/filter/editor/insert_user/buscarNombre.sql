select
		smn_seguridad.s_user.fname
from		smn_seguridad.s_user
where
		upper(smn_seguridad.s_user.fname) = upper(${fld:fname})
