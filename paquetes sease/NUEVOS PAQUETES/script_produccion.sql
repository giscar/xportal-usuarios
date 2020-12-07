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
VALUES (41, '1', 3, 'GESTOR', 'S', 41, 'S', 'S', 'GESTOR,', 'ADM_PLATSEACE,', '1197.00000');




  INSERT INTO [dbportal20081].[dbo].[pageidoma] (
       [pageid]
      ,[idiomaid]
      ,[descripcion]
      ,[fracesclave]
      ,[contenido]
      ,[estado]
      ,[portletid])
      VALUES (1200, 'ES', 'Usuarios 2.9', 'usuarios', '{%mod_UsuarioGeneral_gestor%}', 'P', 'mod_UsuarioGeneral_gestor');
	  
	  
	  
	  
	  
	  
--creacion del menu

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
VALUES (41, 1200, '1', 4, 'GESTOR', 'S', 1, 'S', 'S', 'desarrollo,', 'ADM_PLATSEACE,');

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
VALUES (41, 1200, '1', 4, 'GESTOR', 'S', 2, 'S', 'S', 'desarrollo,', 'ADM_PLATSEACE,');

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
VALUES (41, 1200, '1', 4, 'GESTOR', 'S', 3, 'S', 'S', 'desarrollo,', 'ADM_PLATSEACE,');

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
VALUES (41, 1200, '1', 4, 'GESTOR', 'S', 4, 'S', 'S', 'desarrollo,', 'ADM_PLATSEACE,');

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
VALUES (41, 1200, '1', 4, 'GESTOR', 'S', 5, 'S', 'S', 'desarrollo,', 'ADM_PLATSEACE,');

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
VALUES (41, 1200, '1', 4, 'GESTOR', 'S', 6, 'S', 'S', 'desarrollo,', 'ADM_PLATSEACE,');

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
VALUES (41, 1200, '1', 4, 'GESTOR', 'S', 7, 'S', 'S', 'desarrollo,', 'ADM_PLATSEACE,');

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
VALUES (41, 1200, '1', 4, 'GESTOR', 'S', 8, 'S', 'S', 'desarrollo,', 'ADM_PLATSEACE,');



--insert menu pageidoma

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
      VALUES (1204, 'ES', 'Reportes', 'Reportes', '{%mod_UsuarioReportes_gestor%}', 'P', 'mod_UsuarioReportes_gestor');

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

--pagina 1

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
  
  

--pagina 2

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
      'mod_UsuarioModificar_gestor',
     -- 'doSelectPerfil',
      'Modificar datos del usuario',
      'GESTOR',
      'N',
      'Modificar datos del usuario',
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
      'mod_UsuarioModificar_gestor',
      'doBuscarEntidad',
      'CONSUDES_SEASE',
      'PKU_GESTOR_BUSCADORES_MOD.BuscaEntidad',
      1,
      'GESTOR',
      'ADM_PLATSEACE,'
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
      'mod_UsuarioModificar_gestor',
      'doBuscarUsuarios',
      'CONSUDES_SEASE',
      'PKU_GESTOR_ADMINISTRAR_USERS.doviewBuscarUsuarios',
      1,
      'GESTOR',
      'ADM_PLATSEACE,'
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
      'mod_UsuarioModificar_gestor',
      'dograbarmodificarusuario',
      'CONSUDES_SEASE',
      'PKU_GESTOR_ADMINISTRAR_USERS.dograbarmodificarusuario',
      1,
      'GESTOR',
      'ADM_PLATSEACE,'
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
      'mod_UsuarioModificar_gestor',
      'doModificarUsuario',
      'CONSUDES_SEASE',
      'PKU_GESTOR_ADMINISTRAR_USERS.doviewModificarUsuario',
      1,
      'GESTOR',
      'ADM_PLATSEACE,'
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
      'mod_UsuarioModificar_gestor',
      'donotificarusuario',
      'CONSUDES_SEASE',
      'PKU_GESTOR_ADMINISTRAR_USERS.donotificarusuario',
      1,
      'GESTOR',
      'ADM_PLATSEACE,'
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
      'mod_UsuarioModificar_gestor',
      'doreenviarcontrasenia',
      'CONSUDES_SEASE',
      'PKU_GESTOR_ADMINISTRAR_USERS.doreenviarcontrasenia',
      1,
      'GESTOR',
      'ADM_PLATSEACE,'
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
      'mod_UsuarioModificar_gestor',
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
      'mod_UsuarioModificar_gestor',
      'doView',
      'CONSUDES_SEASE',
      'PKU_GESTOR_ADMINISTRAR_USERS.doviewModificar_Busqueda',
      1,
      'GESTOR',
      'ADM_PLATSEACE,'
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
      'mod_UsuarioModificar_gestor',
      'doviewHistorial',
      'CONSUDES_SEASE',
      'PKU_GESTOR_ADMINISTRAR_USERS.doviewHistorial',
      1,
      'GESTOR',
      'ADM_PLATSEACE,'
  ); 
  
  
--UPDATE
UPDATE [dbportal20081].[dbo].[portlet] SET eventid = 'doView' WHERE portletid = 'mod_UsuarioModificar_gestor';


  
  

--pagina 3
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
  

  INSERT INTO [dbportal20081].[dbo].[portletevent] (
      [portletid]
      ,[eventid]
      ,[connectid]
      ,[scriptdo]
      ,[ptype]
      ,[usuario]
      ,[userexec]
  ) VALUES (
      'mod_usuarioReportes_gestor',
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
      'mod_usuarioReportes_gestor',
      'doBuscarEntidad',
      'CONSUDES_SEASE',
      'PKU_GESTOR_BUSCADORES_MOD.BuscaEntidad',
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
      'mod_usuarioReportes_gestor',
      'doview',
      'CONSUDES_SEASE',
      'PKU_GESTOR_ADMINISTRAR_USERS.doviewreporte',
      1,
      'GESTOR',
      'ADM_PLATSEACE,'
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
      'mod_usuarioReportes_gestor',
      'doviewdetareporte',
      'CONSUDES_SEASE',
      'PKU_GESTOR_ADMINISTRAR_USERS.doviewdetareporte',
      1,
      'GESTOR',
      'ADM_PLATSEACE,'
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
      'mod_usuarioReportes_gestor',
      'doviewReporte',
      'CONSUDES_SEASE',
      'PKU_GESTOR_ADMINISTRAR_USERS.doviewReporte',
      1,
      'GESTOR',
      'ADM_PLATSEACE,'
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
      'mod_usuarioReportes_gestor',
      'doviewReporte1',
      'CONSUDES_SEASE',
      'PKU_GESTOR_ADMINISTRAR_USERS.doviewReporte1',
      1,
      'GESTOR',
      'ADM_PLATSEACE,'
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
      'mod_usuarioReportes_gestor',
      'doviewReporte2',
      'CONSUDES_SEASE',
      'PKU_GESTOR_ADMINISTRAR_USERS.doviewReporte2',
      1,
      'GESTOR',
      'ADM_PLATSEACE,'
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
      'mod_usuarioReportes_gestor',
      'doviewReporte3',
      'CONSUDES_SEASE',
      'PKU_GESTOR_ADMINISTRAR_USERS.doviewReporte3',
      1,
      'GESTOR',
      'ADM_PLATSEACE,'
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
      'mod_usuarioReportes_gestor',
      'doviewReporte4',
      'CONSUDES_SEASE',
      'PKU_GESTOR_ADMINISTRAR_USERS.doviewReporte4',
      1,
      'GESTOR',
      'ADM_PLATSEACE,'
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
      'mod_usuarioReportes_gestor',
      'doviewReporte5',
      'CONSUDES_SEASE',
      'PKU_GESTOR_ADMINISTRAR_USERS.doviewReporte5',
      1,
      'GESTOR',
      'ADM_PLATSEACE,'
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
      'mod_usuarioReportes_gestor',
      'doviewreporte6',
      'CONSUDES_SEASE',
      'PKU_GESTOR_ADMINISTRAR_USERS.doviewReporte6',
      1,
      'GESTOR',
      'ADM_PLATSEACE,'
  );


--UPDATE
UPDATE [dbportal20081].[dbo].[portlet] SET eventid = 'doView' WHERE portletid = 'mod_usuarioReportes_gestor';

 
	  
	  
	  
--pagina 4
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
      'mod_UsuarioGrupos_gestor',
     -- 'doSelectPerfil',
      'Administración de Grupos',
      'GESTOR',
      'N',
      'Administración de Grupos',
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
      'mod_UsuarioGrupos_gestor',
      'dograbarmodificargrupo',
      'CONSUDES_SEASE',
      'PKU_GESTOR_ADMINISTRAR_USERS.dograbarmodificargrupo',
      1,
      'GESTOR',
      'ADM_PLATSEACE,'
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
      'mod_UsuarioGrupos_gestor',
      'dograbarnuevogrupo',
      'CONSUDES_SEASE',
      'PKU_GESTOR_ADMINISTRAR_USERS.dograbarnuevogrupo',
      1,
      'GESTOR',
      'ADM_PLATSEACE,'
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
      'mod_UsuarioGrupos_gestor',
      'doListarGruposAjax',
      'CONSUDES_SEASE',
      'PKU_GESTOR_ADMINISTRAR_USERS.dolistargrupos',
      1,
      'GESTOR',
      'ADM_PLATSEACE,'
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
      'mod_UsuarioGrupos_gestor',
      'doview',
      'CONSUDES_SEASE',
      'PKU_GESTOR_ADMINISTRAR_USERS.doviewadmgrupo',
      1,
      'GESTOR',
      'ADM_PLATSEACE,'
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
      'mod_UsuarioGrupos_gestor',
      'doviewcreargrupo',
      'CONSUDES_SEASE',
      'PKU_GESTOR_ADMINISTRAR_USERS.doviewcreargrupo',
      1,
      'GESTOR',
      'ADM_PLATSEACE,'
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
      'mod_UsuarioGrupos_gestor',
      'doviewmodificargrupo',
      'CONSUDES_SEASE',
      'PKU_GESTOR_ADMINISTRAR_USERS.doviewmodificargrupo',
      1,
      'GESTOR',
      'ADM_PLATSEACE,'
  );


--UPDATE
UPDATE [dbportal20081].[dbo].[portlet] SET eventid = 'doView' WHERE portletid = 'mod_UsuarioGrupos_gestor';


--pagina 6
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
      'mod_UsuarioGeneral2_gestor',
     -- 'doSelectPerfil',
      'Actualizacion de datos del usuario',
      'GESTOR',
      'N',
      'Actualizacion de datos del usuario',
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
      'mod_UsuarioGeneral2_gestor',
      'dograbaractualizacionusuario',
      'CONSUDES_SEASE',
      'PKU_GESTOR_ADMINISTRAR_USERS.dograbaractualizacionusuario',
      1,
      'GESTOR',
      'ADM_PLATSEACE,'
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
      'mod_UsuarioGeneral2_gestor',
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
      'mod_UsuarioGeneral2_gestor',
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
      'mod_UsuarioGeneral2_gestor',
      'doView',
      'CONSUDES_SEASE',
      'PKU_GESTOR_ADMINISTRAR_USERS.doviewactualizardatosusuario',
      1,
      'GESTOR',
      'todos,'
  ); 
  
  
  --UPDATE
UPDATE [dbportal20081].[dbo].[portlet] SET eventid = 'doView' WHERE portletid = 'mod_UsuarioGeneral2_gestor';



--pagina 7
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
      'mod_envio_mensajes_gestor',
     -- 'doSelectPerfil',
      'Opción que permitirá al administrador de usuarios enviar mensajes a los usuarios del SEACE.',
      'GESTOR',
      'N',
      'Opción que permitirá al administrador de usuarios enviar mensajes a los usuarios del SEACE.',
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
      'mod_envio_mensajes_gestor',
      'doActualizaEstadoEnvio',
      'CONSUDES_REG_PROCESOS',
      'USP_EM_ACTUALIZA_ESTADO_ENVIO',
      1,
      'GESTOR',
      'ADM_PLATSEACE,'
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
      'mod_envio_mensajes_gestor',
      'doEdit',
      'CONSUDES_REG_PROCESOS',
      'USP_GESTOR_EM_MENSAJES_DOVIEW',
      1,
      'GESTOR',
      'ADM_PLATSEACE,'
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
      'mod_envio_mensajes_gestor',
      'doEditarMensaje',
      'CONSUDES_REG_PROCESOS',
      'USP_EM_MENSAJE_UPDATE',
      1,
      'GESTOR',
      'ADM_PLATSEACE,'
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
      'mod_envio_mensajes_gestor',
      'doEnvioMensajePrueba',
      'CONSUDES_REG_PROCESOS',
      'USP_EM_ENVIO_MENSAJE_PRUEBA',
      1,
      'GESTOR',
      'ADM_PLATSEACE,'
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
      'mod_envio_mensajes_gestor',
      'doGrabarMensaje',
      'CONSUDES_REG_PROCESOS',
      'USP_EM_MENSAJE_INSERT',
      1,
      'GESTOR',
      'ADM_PLATSEACE,'
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
      'mod_envio_mensajes_gestor',
      'doView',
      'CONSUDES_REG_PROCESOS',
      'USP_GESTOR_EM_MENSAJES_DOVIEW',
      1,
      'GESTOR',
      'ADM_PLATSEACE,'
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
      'mod_envio_mensajes_gestor',
      'doViewPrevio',
      'CONSUDES_REG_PROCESOS',
      'USP_GESTOR_EM_PREVIO_DOVIEW',
      1,
      'GESTOR',
      'ADM_PLATSEACE,'
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
      'mod_envio_mensajes_gestor',
      'doViewProvincias',
      'CONSUDES_REG_PROCESOS',
      'USP_GEN_GET_UBIGEO_PRO_DOVIEW',
      1,
      'GESTOR',
      'ADM_PLATSEACE,'
  );

--UPDATE
UPDATE [dbportal20081].[dbo].[portlet] SET eventid = 'doView' WHERE portletid = 'mod_envio_mensajes_gestor';


--pagina 8

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
      'mod_reportesentidad_gestor',
     -- 'doSelectPerfil',
      'Reporte entidad.',
      'GESTOR',
      'N',
      'Reporte entidad.',
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
      'mod_reportesentidad_gestor',
      'doView',
      'CONSUDES_SEASE',
      'PKU_GESTOR_ADMINISTRAR_USERS.doviewreporteGen',
      1,
      'GESTOR',
      'ADM_PLATSEACE,'
  );
  
  
  
--UPDATE
UPDATE [dbportal20081].[dbo].[portlet] SET eventid = 'doView' WHERE portletid = 'mod_reportesentidad_gestor';



 INSERT INTO [dbportal20081].[dbo].[portletevent] (
      [portletid]
      ,[eventid]
      ,[connectid]
      ,[scriptdo]
      ,[ptype]
      ,[usuario]
      ,[userexec]
  ) VALUES (
      'mod_reportesentidad_gestor',
      'doviewReporte7',
      'CONSUDES_SEASE',
      'PKU_GESTOR_ADMINISTRAR_USERS.doviewReporte7',
      1,
      'GESTOR',
      'ADM_PLATSEACE,'
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
      'mod_reportesentidad_gestor',
      'doviewreporte6',
      'CONSUDES_SEASE',
      'PKU_GESTOR_ADMINISTRAR_USERS.doviewreporte6',
      1,
      'GESTOR',
      'ADM_PLATSEACE,'
  );


























  