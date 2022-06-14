insert into ${schema}s_user_role
(
	user_role_id,
	user_id,
	role_id
)
values 
(
	${seq:nextval@${schema}seq_user_role},
	${seq:currval@${schema}seq_user},
	${fld:role_id}
)


