UPDATE ${schema}s_user SET
	passwd=${fld:passwd},
	lname=${fld:lname},
	fname=${fld:fname},
	email=${fld:email},
	enabled=1,
	pwd_policy=-2,
	force_newpass=null,
	locale='es'
where 
	${schema}s_user.user_id=${fld:smn_user_rf}