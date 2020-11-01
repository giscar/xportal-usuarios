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
and dbo.validgroup (a.userview, 'ADM_PLATSEACE,') > 0 order by a.orden;

--menu hijo
select a.pageid, isnull(a.parentpageid, 0) parentpageid, isnull(a.parentpageid, a.pageid) ordenar1, a.locid nivel, a.orden, b.descripcion, isnull(b.contenido,'') contenido, 
isnull(b.portletid,'') portletid 
from dbo.page a 
inner join dbo.pageidoma b on a.pageid = b.pageid and b.idiomaid = 'ES' 
where a.parentpageid = 411 and PORTLETID IS NOT NULL and a.estado = 'S' 
and dbo.validgroup (a.userview, 'todos,ADM_PLATSEACE,PROVEEDOR_ELECTRONICA,ADM_CM_CATALOGO,ADM_CATALOGO_BSO,CONTRATOS_ENTIDAD,PROCESOS_ENTIDAD,PAAC_ENTIDAD,NOTIFICACION_ENTIDAD,CONTRALORIA,ADM_PRONUNCIA,ADM_NOTIFICACIONES,ADM_RESOLUCION,SUPERVISOR_OSCE,OCI,CONVENIO_ENTIDAD,PROCESOS_CONSULTA,PE_ENTIDAD,PE_CONSULTA,PAC_CONSULTA,CONTRATO_CONSULTA,ADM_EXCEPTUADOS,INAPLICA_ENTIDAD,GESTION_FICHAS,GESTION_CONSULTA,ADM_ACC_SUPER,ADM_REC_ENTIDAD,ADM_REC,CONVENIO_PROCESOS,MSI_OPERADOR,MSI_ADMINISTRADOR,CUBSO_ENTIDAD, CUBSO_ESPECIALISTA,CUBSO_SUPERVISOR,ADM_ARBITROS,LOGREC_OPE,LOGREC_ADM,LOGREC_CONV,LOGREC_ROCS,ARB_SECRETARIA,ARB_ESPECIALISTA,ARB_ARCHIVO,ARB_SUPERVISOR,cont_dest_pago,LOGREC_SCONV,INFOPI_SUP,ADM_CARD') > 0 order by a.orden;


--menu hijo
select a.pageid, isnull(a.parentpageid, 0) parentpageid, isnull(a.parentpageid, a.pageid) ordenar1, a.locid nivel, a.orden, b.descripcion, isnull(b.contenido,'') contenido, 
isnull(b.portletid,'') portletid 
from dbo.page a 
inner join dbo.pageidoma b on a.pageid = b.pageid and b.idiomaid = 'ES' 
where a.parentpageid = 1201 and PORTLETID IS NOT NULL and a.estado = 'S' 
and dbo.validgroup (a.userview, 'todos,ADM_PLATSEACE,PROVEEDOR_ELECTRONICA,ADM_CM_CATALOGO,ADM_CATALOGO_BSO,CONTRATOS_ENTIDAD,PROCESOS_ENTIDAD,PAAC_ENTIDAD,NOTIFICACION_ENTIDAD,CONTRALORIA,ADM_PRONUNCIA,ADM_NOTIFICACIONES,ADM_RESOLUCION,SUPERVISOR_OSCE,OCI,CONVENIO_ENTIDAD,PROCESOS_CONSULTA,PE_ENTIDAD,PE_CONSULTA,PAC_CONSULTA,CONTRATO_CONSULTA,ADM_EXCEPTUADOS,INAPLICA_ENTIDAD,GESTION_FICHAS,GESTION_CONSULTA,ADM_ACC_SUPER,ADM_REC_ENTIDAD,ADM_REC,CONVENIO_PROCESOS,MSI_OPERADOR,MSI_ADMINISTRADOR,CUBSO_ENTIDAD, CUBSO_ESPECIALISTA,CUBSO_SUPERVISOR,ADM_ARBITROS,LOGREC_OPE,LOGREC_ADM,LOGREC_CONV,LOGREC_ROCS,ARB_SECRETARIA,ARB_ESPECIALISTA,ARB_ARCHIVO,ARB_SUPERVISOR,cont_dest_pago,LOGREC_SCONV,INFOPI_SUP,ADM_CARD') > 0 order by a.orden;



select * from dbo.page a where pageid in (411,1201);

select * from dbo.page a where parentpageid = 411;
select * from dbo.page a where parentpageid = 1201;


INSERT INTO [dbportal20081].[dbo].[Page] (
      [portalid]
      ,[parentpageid]
      ,[typeid]
      ,[locid]
      ,[usuario]
      ,[estado]
      ,[orden]
      ,[mostrarenmenu]
      ,[mostrardescripcion]
      ,[useradmin]
      ,[userview])
VALUES (41, 1201, '1', 4, 'GESTOR', 'S', 8, 'S', 'S', 'desarrollo,', 'ADM_PLATSEACE,');




SELECT  [pageid]
      ,[idiomaid]
      ,[pag_pageid]
      ,[pag_idiomaid]
      ,[descripcion]
      ,[fracesclave]
      ,[contenido]
      ,[estado]
      ,[portletid]
  FROM [dbportal20081].[dbo].[pageidoma] WHERE [pageid] = 411


INSERT INTO [dbportal20081].[dbo].[pageidoma] (
       [pageid]
      ,[idiomaid]
      ,[descripcion]
      ,[fracesclave]
      ,[contenido]
      ,[estado]
      ,[portletid])
      VALUES (1209, 'ES', 'Reportes Entidad', 'Reportes Entidad', '{%mod_reportesentidad_gestor%}', 'P', 'mod_reportesentidad_gestor');



select * from dbo.page a where pageid = 411;

select * from dbo.page a where parentpageid = 411;


SELECT  [portletid]
      ,[gpid]
      ,[eventid]
      ,[descripcion]
      ,[usuario]
      ,[usacache]
      ,[titulo]
      ,[showtitle]
      ,[showhelp]
      ,[showrefresh]
      ,[contentype]
      ,[idsistema]
  FROM [dbportal20081].[dbo].[portlet] where portletid = 'mod_UsuarioGeneral';


  INSERT INTO [dbportal20081].[dbo].[portlet] (
      [portletid]
      ,[eventid]
      ,[descripcion]
      ,[usuario]
      ,[usacache]
      ,[titulo]
      ,[showtitle]
      ,[showhelp]
      ,[showrefresh]
      ,[contentype]
  ) VALUES (
      'mod_UsuarioGeneral_gestor',
      'doView',
      'Página de Configuración de Usuarios',
      'GESTOR',
      'N',
      'Cambio de Contraseña',
      'S',
      'S',
      'S',
      'text/html'
  );












select a.pageid, isnull(a.parentpageid, 0) parentpageid, isnull(a.parentpageid, a.pageid) ordenar1, a.locid nivel, a.orden, b.descripcion, isnull(b.contenido,'') contenido, 
isnull(b.portletid,'') portletid 
from dbo.page a 
inner join dbo.pageidoma b on a.pageid = b.pageid and b.idiomaid = 'ES' and b.descripcion like '%Reportes%'



--doviewreporteGen
INSERT INTO dbo.portletevent (portletid, eventid, connectid, scriptdo, ptype, usuario, userexec) VALUES ('mod_procesos_PA',	'doBuscaEntidadExcel',	'CONSUDES_SEASE',	'PKU_GESTOR_BUSCADORES.doBuscaEntidadExcel',	1,	'coliveros',	'todos,')
