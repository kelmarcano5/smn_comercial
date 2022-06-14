insert into ${schema}s_user 
(
	user_id,
	userlogin,
	passwd,
	lname,
	fname,
	email,
	enabled,
	pwd_policy,
	force_newpass,
	locale
) 
values 
(
	${seq:currval@${schema}seq_user},
	${fld:userlogin},
	${fld:passwd},
	${fld:lname},
	${fld:fname},
	${fld:email},
	1,
	-2,
	null,
	'es'
);




