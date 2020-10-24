select a.* from  dbo.portletevent a 
inner join dbo.connections b on a.connectid = b.connectid 
where portletid = 'mod_UsuarioCrear' and eventid = 'validaUsuArbitro' and dbo.validgroup (a.userexec, :grupos) > 0 



select a.portletid, a.eventid, a.scriptdo, b.datasource, b.tipobd from  dbo.portletevent a 
inner join dbo.connections b on a.connectid = b.connectid 
where portletid = :portletid and eventid = :eventid and dbo.validgroup (a.userexec, :grupos) > 0 

select a.* from  dbo.portletevent a 
inner join dbo.connections b on a.connectid = b.connectid 
where portletid = 'mod_procesos_PA' and eventid = 'doBuscaEntidadExcel' and dbo.validgroup (a.userexec, :grupos) > 0
--doBuscaEntidadExcel
--mod_procesos_PA	doBuscarUbigeo	CONSUDES_SEASE	PKU_GESTOR_BUSCADORES.uspBuscaUbigeo	1	coliveros	todos,	NULL	NULL

INSERT INTO dbo.portletevent (portletid, eventid, connectid, scriptdo, ptype, usuario, userexec) VALUES ('mod_procesos_PA',	'doBuscaEntidadExcel',	'CONSUDES_SEASE',	'PKU_GESTOR_BUSCADORES.doBuscaEntidadExcel',	1,	'coliveros',	'todos,')
INSERT INTO dbo.portletevent (portletid, eventid, connectid, scriptdo, ptype, usuario, userexec) VALUES ('mod_procesos_PA',	'doBCExcel',	'CONSUDES_SEASE',	'PKU_GESTOR_BUSCADORES.doBCExcel',	1,	'coliveros',	'todos,')

select a.* from  dbo.portletevent a 
inner join dbo.connections b on a.connectid = b.connectid 
where portletid = 'mod_procesos_PA' and eventid = 'doBCExcel' and dbo.validgroup (a.userexec, :grupos) > 0


select * from portlet where descripcion like '%grupos%'
--mod_UsuarioGrupos

select * from portlet where portletid = 'mod_UsuarioGrupos'
select * from portlet where portletid = 'mod_UsuarioCrear'


select a.* from  dbo.portletevent a 
inner join dbo.connections b on a.connectid = b.connectid 
where portletid = 'mod_UsuarioGrupos' and eventid = 'doBCExcel' and dbo.validgroup (a.userexec, :grupos) > 0


--menu padre
select a.pageid, isnull(a.parentpageid, 0) parentpageid, isnull(a.parentpageid, a.pageid) ordenar1, a.locid nivel, a.orden, b.descripcion, isnull(b.contenido,'') contenido, 
isnull(b.portletid,'') portletid 
from dbo.page a 
inner join dbo.pageidoma b on a.pageid = b.pageid and b.idiomaid = 'ES' 
where a.portalid = 41 and a.parentpageid is null and locid = 3 and a.estado = 'S' 
and dbo.validgroup (a.userview, 'CONTRATO_CONSULTA,PE_CONSULTA,LOGREC_SCONV,LOGREC_ROCS,PROCESOS_CONSULTA,PAC_CONSULTA,ADM_PLATSEACE,USUARIO_SEACE,todos,') > 0 order by a.orden;

--menu hijo
select a.pageid, isnull(a.parentpageid, 0) parentpageid, isnull(a.parentpageid, a.pageid) ordenar1, a.locid nivel, a.orden, b.descripcion, isnull(b.contenido,'') contenido, 
isnull(b.portletid,'') portletid 
from dbo.page a 
inner join dbo.pageidoma b on a.pageid = b.pageid and b.idiomaid = 'ES' 
where a.parentpageid = 271 and PORTLETID IS NOT NULL and a.estado = 'S' 
and dbo.validgroup (a.userview, 'CONTRATO_CONSULTA,PE_CONSULTA,LOGREC_SCONV,LOGREC_ROCS,PROCESOS_CONSULTA,PAC_CONSULTA,ADM_PLATSEACE,USUARIO_SEACE,todos,') > 0 order by a.orden;