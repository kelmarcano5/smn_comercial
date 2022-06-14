select smn_comercial.smn_rol.smn_rol_id as id, 
	CASE
			when smn_comercial.smn_rol.rol_tipo = 'SO' then 'SOLICITANTE'
			when smn_comercial.smn_rol.rol_tipo = 'AP' then 'APROBADOR'
			when smn_comercial.smn_rol.rol_tipo = 'FC' then 'FACTURADOR'
			when smn_comercial.smn_rol.rol_tipo = 'VD' then 'VENDEDOR'
			when smn_comercial.smn_rol.rol_tipo = 'PR' then 'PROMOTOR'
			when smn_comercial.smn_rol.rol_tipo = 'EC' then 'EJECUTIVO CALL'
	end as item from smn_comercial.smn_rol