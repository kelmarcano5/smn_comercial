select distinct
	s.service_id,
	--s.description,
	pt.pat_description as description,
	s.path,
	p.icon_path,
	p.orden
from
	${schema}s_service_role sr,
	${schema}s_user u,
	${schema}s_user_role ur,
	${schema}s_panel p,
	${schema}s_service s,
	${schema}s_role r,
	${schema}s_menu m,
	${schema}s_menu_item mi,
	smn_base.smn_panel_traduccion pt
where
	u.userlogin = '${def:user}'
and
	sr.service_id = s.service_id
and
	ur.role_id = sr.role_id
and
	ur.user_id = u.user_id
and
	s.service_id = p.service_id
and
	p.app_id = (select app_id from ${schema}s_application where app_alias = '${def:alias}')
and
    r.role_id = sr.role_id
and
    r.app_id = p.app_id 
and
    r.rolename = 'smn_admin'
and	
	mi.service_id = s.service_id
and
	mi.menu_id = m.menu_id
and
	upper(m.title) = upper('Monitores')
and
    pt.pat_panel = p.panel_id
and
    pt.pat_locale = '${def:locale}' 
order by 
    p.orden asc