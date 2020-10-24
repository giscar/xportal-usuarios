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