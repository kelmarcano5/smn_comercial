select 
	role_id 
from 
	${schema}s_role 
where 
	rolename = 'smn_admin' and 
	app_id in 
	(
	select
		app_id
	from
		${schema}s_application
	where
		app_alias = '${def:alias}'
	)