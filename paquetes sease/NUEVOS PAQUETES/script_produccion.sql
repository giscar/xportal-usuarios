--creacion de la pagina padre
INSERT INTO [dbportal20081].[dbo].[Page] (
      [portalid]
      ,[typeid]
      ,[locid]
      ,[usuario]
      ,[estado]
      ,[orden]
      ,[mostrarenmenu]
      ,[mostrardescripcion]
      ,[useradmin]
      ,[userview]
      ,[fastcode])
VALUES (41, '1', 3, 'GESTOR', 'S', 41, 'S', 'S', 'desarrollo,', 'ADM_PLATSEACE,', '1201.00000');




  INSERT INTO [dbportal20081].[dbo].[pageidoma] (
       [pageid]
      ,[idiomaid]
      ,[descripcion]
      ,[fracesclave]
      ,[contenido]
      ,[estado]
      ,[portletid])
      VALUES (1201, 'ES', 'Usuarios 2.9', 'usuarios', '{%mod_UsuarioGeneral_gestor%}', 'P', 'mod_UsuarioGeneral_gestor');
	  
	  
	  
	  
	  
	  
--creacion de paginas hijos

--insert table page

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
VALUES (41, 1201, '1', 4, 'GESTOR', 'S', 1, 'S', 'S', 'desarrollo,', 'ADM_PLATSEACE,');

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
VALUES (41, 1201, '1', 4, 'GESTOR', 'S', 2, 'S', 'S', 'desarrollo,', 'ADM_PLATSEACE,');

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
VALUES (41, 1201, '1', 4, 'GESTOR', 'S', 3, 'S', 'S', 'desarrollo,', 'ADM_PLATSEACE,');

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
VALUES (41, 1201, '1', 4, 'GESTOR', 'S', 4, 'S', 'S', 'desarrollo,', 'ADM_PLATSEACE,');

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
VALUES (41, 1201, '1', 4, 'GESTOR', 'S', 5, 'S', 'S', 'desarrollo,', 'ADM_PLATSEACE,');

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
VALUES (41, 1201, '1', 4, 'GESTOR', 'S', 6, 'S', 'S', 'desarrollo,', 'ADM_PLATSEACE,');

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
VALUES (41, 1201, '1', 4, 'GESTOR', 'S', 7, 'S', 'S', 'desarrollo,', 'ADM_PLATSEACE,');

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



--insert table pageidoma

INSERT INTO [dbportal20081].[dbo].[pageidoma] (
       [pageid]
      ,[idiomaid]
      ,[descripcion]
      ,[fracesclave]
      ,[contenido]
      ,[estado]
      ,[portletid])
      VALUES (1202, 'ES', 'Crear Usuario', 'Crear Usuario', '{%mod_UsuarioCrear_gestor%}', 'P', 'mod_UsuarioCrear_gestor');
	  
INSERT INTO [dbportal20081].[dbo].[pageidoma] (
       [pageid]
      ,[idiomaid]
      ,[descripcion]
      ,[fracesclave]
      ,[contenido]
      ,[estado]
      ,[portletid])
      VALUES (1203, 'ES', 'Modificar/Desactivar Usuario', 'Modificar/Desactivar Usuario', '{%mod_UsuarioModificar_gestor%}', 'P', 'mod_UsuarioModificar_gestor');	  
	  
INSERT INTO [dbportal20081].[dbo].[pageidoma] (
       [pageid]
      ,[idiomaid]
      ,[descripcion]
      ,[fracesclave]
      ,[contenido]
      ,[estado]
      ,[portletid])
      VALUES (1204, 'ES', 'Reportes', 'Reportes', '{%mod_administrar_user_gestor%}', 'P', 'mod_administrar_user_gestor');

INSERT INTO [dbportal20081].[dbo].[pageidoma] (
       [pageid]
      ,[idiomaid]
      ,[descripcion]
      ,[fracesclave]
      ,[contenido]
      ,[estado]
      ,[portletid])
      VALUES (1205, 'ES', 'Administrar Grupos', 'Administrar Grupos', '{%mod_UsuarioGrupos_gestor%}', 'P', 'mod_UsuarioGrupos_gestor');

INSERT INTO [dbportal20081].[dbo].[pageidoma] (
       [pageid]
      ,[idiomaid]
      ,[descripcion]
      ,[fracesclave]
      ,[contenido]
      ,[estado]
      ,[portletid])
      VALUES (1206, 'ES', 'Cambio de Contraseña', 'Cambio de Contraseña', '{%mod_UsuarioGeneral_gestor%}', 'P', 'mod_UsuarioGeneral_gestor');

INSERT INTO [dbportal20081].[dbo].[pageidoma] (
       [pageid]
      ,[idiomaid]
      ,[descripcion]
      ,[fracesclave]
      ,[contenido]
      ,[estado]
      ,[portletid])
      VALUES (1207, 'ES', 'Modificacion de Datos ', 'Modificacion de Datos ', '{%mod_UsuarioGeneral2_gestor%}', 'P', 'mod_UsuarioGeneral2_gestor');

INSERT INTO [dbportal20081].[dbo].[pageidoma] (
       [pageid]
      ,[idiomaid]
      ,[descripcion]
      ,[fracesclave]
      ,[contenido]
      ,[estado]
      ,[portletid])
      VALUES (1208, 'ES', 'Envío Mensajes ', 'Envío Mensajes ', '{%mod_envio_mensajes_gestor%}', 'P', 'mod_envio_mensajes_gestor');

INSERT INTO [dbportal20081].[dbo].[pageidoma] (
       [pageid]
      ,[idiomaid]
      ,[descripcion]
      ,[fracesclave]
      ,[contenido]
      ,[estado]
      ,[portletid])
      VALUES (1209, 'ES', 'Reportes Entidad', 'Reportes Entidad', '{%mod_reportesentidad_gestor%}', 'P', 'mod_reportesentidad_gestor');



--CREACION DE LOS PORTLET PARA LAS PAGINAS PADRES 

INSERT INTO [dbportal20081].[dbo].[portlet] (
      [portletid]
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
      'Página de Configuración de Usuarios',
      'GESTOR',
      'N',
      'Cambio de Contraseña',
      'S',
      'S',
      'S',
      'text/html'
  );
  
  
INSERT INTO [dbportal20081].[dbo].[portletevent] (
      [portletid]
      ,[eventid]
      ,[connectid]
      ,[scriptdo]
      ,[ptype]
      ,[usuario]
      ,[userexec]
      ,[params]
  ) VALUES (
      'mod_UsuarioGeneral_gestor',
      'dograbarContrasenia',
      'CONSUDES_SEASE',
      'PKU_GESTOR_ADMINISTRAR_USERS.dograbarContrasenia',
      1,
      'GESTOR',
      'USUARIO_SEACE,desarrollo,',
      'SESSION__USERID,200,2000;AG_PASWD,200,2000;AG_USUFUN,200,2000;AG_OPCION,200,2000;IISENV__REMOTE_HOST,200,2000;'
  );
  
INSERT INTO [dbportal20081].[dbo].[portletevent] (
      [portletid]
      ,[eventid]
      ,[connectid]
      ,[scriptdo]
      ,[ptype]
      ,[usuario]
      ,[userexec]
      ,[params]
  ) VALUES (
      'mod_UsuarioGeneral_gestor',
      'doView',
      'CONSUDES_SEASE',
      'PKU_GESTOR_ADMINISTRAR_USERS.doViewContrasenia',
      1,
      'GESTOR',
      'USUARIO_SEACE,desarrollo,',
      'PORTLET__TITULO,200,2000;SESSION__USERID,200,2000;'
  );

--ACTUALIZAR PORTLETID 
UPDATE [dbportal20081].[dbo].[portlet] SET eventid = 'doView' WHERE portletid = 'mod_UsuarioGeneral_gestor';
	  
	  
	  
--	CREACION DE LOS PORTLET DE LAS PAGINAS HIJAS

INSERT INTO [dbportal20081].[dbo].[portlet] (
      [portletid]
      --,[eventid]
      ,[descripcion]
      ,[usuario]
      ,[usacache]
      ,[titulo]
      ,[showtitle]
      ,[showhelp]
      ,[showrefresh]
      ,[contentype]
  ) VALUES (
      'mod_UsuarioCrear_gestor',
     -- 'doSelectPerfil',
      'Modulo para crear usuarios',
      'GESTOR',
      'N',
      'Cambio de Contraseña',
      'S',
      'S',
      'S',
      'text/html'
  );
  
  
 INSERT INTO [dbportal20081].[dbo].[portletevent] (
      [portletid]
      ,[eventid]
      ,[connectid]
      ,[scriptdo]
      ,[ptype]
      ,[usuario]
      ,[userexec]
  ) VALUES (
      'mod_UsuarioCrear_gestor',
      'doAutoGeneraUsuarioAjax',
      'CONSUDES_SEASE',
      'PKU_GESTOR_ADMINISTRAR_USERS.doautogenerausuarioajax',
      1,
      'GESTOR',
      'USUARIO_SEACE,desarrollo,'
  );
  
 INSERT INTO [dbportal20081].[dbo].[portletevent] (
      [portletid]
      ,[eventid]
      ,[connectid]
      ,[scriptdo]
      ,[ptype]
      ,[usuario]
      ,[userexec]
  ) VALUES (
      'mod_UsuarioCrear_gestor',
      'doBuscarEntidad',
      'CONSUDES_SEASE',
      'PKU_GESTOR_BUSCADORES_MOD.BuscaEntidad',
      1,
      'GESTOR',
      'USUARIO_SEACE,desarrollo,'
  );
  
  INSERT INTO [dbportal20081].[dbo].[portletevent] (
      [portletid]
      ,[eventid]
      ,[connectid]
      ,[scriptdo]
      ,[ptype]
      ,[usuario]
      ,[userexec]
  ) VALUES (
      'mod_UsuarioCrear_gestor',
      'doFormArbitro',
      'CONSUDES_SEASE',
      'PKU_GESTOR_ADMINISTRAR_USERS.formArbitro',
      1,
      'GESTOR',
      'USUARIO_SEACE,desarrollo,'
  );
 
INSERT INTO [dbportal20081].[dbo].[portletevent] (
      [portletid]
      ,[eventid]
      ,[connectid]
      ,[scriptdo]
      ,[ptype]
      ,[usuario]
      ,[userexec]
  ) VALUES (
      'mod_UsuarioCrear_gestor',
      'dograbarnuevousuario',
      'CONSUDES_SEASE',
      'PKU_GESTOR_ADMINISTRAR_USERS.dograbarnuevousuario',
      1,
      'GESTOR',
      'ADM_PLATSEACE,desarrollo,'
  );
  
 INSERT INTO [dbportal20081].[dbo].[portletevent] (
      [portletid]
      ,[eventid]
      ,[connectid]
      ,[scriptdo]
      ,[ptype]
      ,[usuario]
      ,[userexec]
  ) VALUES (
      'mod_UsuarioCrear_gestor',
      'dolistardistritos',
      'CONSUDES_SEASE',
      'PKU_GESTOR_ADMINISTRAR_USERS.f_lista_dis',
      1,
      'GESTOR',
      'todos,'
  ); 
  
  INSERT INTO [dbportal20081].[dbo].[portletevent] (
      [portletid]
      ,[eventid]
      ,[connectid]
      ,[scriptdo]
      ,[ptype]
      ,[usuario]
      ,[userexec]
  ) VALUES (
      'mod_UsuarioCrear_gestor',
      'dolistarprovincias',
      'CONSUDES_SEASE',
      'PKU_GESTOR_ADMINISTRAR_USERS.f_lista_prov',
      1,
      'GESTOR',
      'todos,'
  );

INSERT INTO [dbportal20081].[dbo].[portletevent] (
      [portletid]
      ,[eventid]
      ,[connectid]
      ,[scriptdo]
      ,[ptype]
      ,[usuario]
      ,[userexec]
  ) VALUES (
      'mod_UsuarioCrear_gestor',
      'doListarUsuarios',
      'CONSUDES_SEASE',
      'PKU_GESTOR_ADMINISTRAR_USERS.doviewBuscarUsuarios',
      1,
      'GESTOR',
      'todos,'
  );

 INSERT INTO [dbportal20081].[dbo].[portletevent] (
      [portletid]
      ,[eventid]
      ,[connectid]
      ,[scriptdo]
      ,[ptype]
      ,[usuario]
      ,[userexec]
  ) VALUES (
      'mod_UsuarioCrear_gestor',
      'doNotificarUsuario',
      'CONSUDES_SEASE',
      'PKU_GESTOR_ADMINISTRAR_USERS.donotificarusuario',
      1,
      'GESTOR',
      'ADM_PLATSEACE,desarrollo,'
  ); 
  
  INSERT INTO [dbportal20081].[dbo].[portletevent] (
      [portletid]
      ,[eventid]
      ,[connectid]
      ,[scriptdo]
      ,[ptype]
      ,[usuario]
      ,[userexec]
  ) VALUES (
      'mod_UsuarioCrear_gestor',
      'doSaveArbitro',
      'CONSUDES_SEASE',
      'PKU_GESTOR_ADMINISTRAR_USERS.dograbarnuevoarbitro',
      1,
      'GESTOR',
      'ADM_PLATSEACE,desarrollo,'
  );

  INSERT INTO [dbportal20081].[dbo].[portletevent] (
      [portletid]
      ,[eventid]
      ,[connectid]
      ,[scriptdo]
      ,[ptype]
      ,[usuario]
      ,[userexec]
  ) VALUES (
      'mod_UsuarioCrear_gestor',
      'doSelectPerfil',
      'CONSUDES_SEASE',
      'PKU_GESTOR_ADMINISTRAR_USERS.seleccionarPerfil',
      1,
      'GESTOR',
      'ADM_PLATSEACE,desarrollo,'
  );


 INSERT INTO [dbportal20081].[dbo].[portletevent] (
      [portletid]
      ,[eventid]
      ,[connectid]
      ,[scriptdo]
      ,[ptype]
      ,[usuario]
      ,[userexec]
  ) VALUES (
      'mod_UsuarioCrear_gestor',
      'doVerPerfilesAjax',
      'CONSUDES_SEASE',
      'PKU_GESTOR_ADMINISTRAR_USERS.f_lista_perfiles',
      1,
      'GESTOR',
      'todos,'
  );

 INSERT INTO [dbportal20081].[dbo].[portletevent] (
      [portletid]
      ,[eventid]
      ,[connectid]
      ,[scriptdo]
      ,[ptype]
      ,[usuario]
      ,[userexec]
  ) VALUES (
      'mod_UsuarioCrear_gestor',
      'doVerUsuarioExisteAjax',
      'CONSUDES_SEASE',
      'PKU_GESTOR_ADMINISTRAR_USERS.doVerUsuarioExisteAjax',
      1,
      'GESTOR',
      'todos,'
  );

  INSERT INTO [dbportal20081].[dbo].[portletevent] (
      [portletid]
      ,[eventid]
      ,[connectid]
      ,[scriptdo]
      ,[ptype]
      ,[usuario]
      ,[userexec]
  ) VALUES (
      'mod_UsuarioCrear_gestor',
      'doView',
      'CONSUDES_SEASE',
      'PKU_GESTOR_ADMINISTRAR_USERS.doviewCrearUsuario',
      1,
      'GESTOR',
      'ADM_PLATSEACE,desarrollo,'
  );


  INSERT INTO [dbportal20081].[dbo].[portletevent] (
      [portletid]
      ,[eventid]
      ,[connectid]
      ,[scriptdo]
      ,[ptype]
      ,[usuario]
      ,[userexec]
  ) VALUES (
      'mod_UsuarioCrear_gestor',
      'validaUsuArbitro',
      'CONSUDES_SEASE',
      'PKU_GESTOR_ADMINISTRAR_USERS.usp_ValidarRUC',
      1,
      'GESTOR',
      'todos,'
  );  
  
--UPDATE
UPDATE [dbportal20081].[dbo].[portlet] SET eventid = 'doView' WHERE portletid = 'mod_UsuarioCrear_gestor';  
  
  
  
  


INSERT INTO [dbportal20081].[dbo].[portlet] (
      [portletid]
      --,[eventid]
      ,[descripcion]
      ,[usuario]
      ,[usacache]
      ,[titulo]
      ,[showtitle]
      ,[showhelp]
      ,[showrefresh]
      ,[contentype]
  ) VALUES (
      'mod_UsuarioReportes_gestor',
     -- 'doSelectPerfil',
      'Reportes de Usuario',
      'GESTOR',
      'N',
      'Reportes de Usuario',
      'S',
      'S',
      'S',
      'text/html'
  ); 
  
  
  
  
  
  
  
  
  
  
  
	  