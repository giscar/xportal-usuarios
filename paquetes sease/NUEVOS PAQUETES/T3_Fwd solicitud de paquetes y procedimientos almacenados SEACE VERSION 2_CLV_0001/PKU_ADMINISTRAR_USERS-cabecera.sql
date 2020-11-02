--------------------------------------------------------
-- Archivo creado  - domingo-noviembre-01-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Package PKU_ADMINISTRAR_USERS
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "SEASE"."PKU_ADMINISTRAR_USERS" 
/*
|| Author:           Cristina Zenteno Garcia
|| Purpose:         Funciones y procedimientos requeridos en el XPortal
|| Modification History: (when, by whom, what)
||          26/06/2009  - CZG   -   Creaci¿n del paquete
*/
IS
   -- Variables Globales
   gn_user        varchar2(30);   -- Id usuario que ingreso al SEACE.
   gn_entidad     number;         -- Entidad del usuario que ingreso al SEACE.
   gn_ip          varchar2(50);   -- IP de usuario que ingreso al SEACE.
   gs_cod_osce    varchar2(10) default '001952';

   TYPE refcursor IS REF CURSOR;

/*----------------------- Private Variables ---------------------------*/
   ex_nodata           EXCEPTION;
   ex_badsql           EXCEPTION;
   ex_noperacion       EXCEPTION;
   ex_nonotificacion   EXCEPTION;
   ex_noemail   EXCEPTION;

   FUNCTION generaclavealeatoria
      RETURN VARCHAR2;

   FUNCTION listargruposxusuario (
      ag_usufun    IN   VARCHAR2,
      ag_tipousu   IN   VARCHAR2
   )
      RETURN VARCHAR2;

   FUNCTION returnentidad (ag_usufun IN VARCHAR2)
      RETURN VARCHAR2;

   FUNCTION returnnombre (ag_usufun IN VARCHAR2)
      RETURN VARCHAR2;

   FUNCTION returnemail (ag_usufun IN VARCHAR2)
      RETURN VARCHAR2;

   FUNCTION returnpasschanged (ag_usufun IN VARCHAR2)
      RETURN DATE;

   FUNCTION returnestado (ag_usufun IN VARCHAR2)
      RETURN INTEGER;

   FUNCTION returnlastaccess (ag_usufun IN VARCHAR2)
      RETURN DATE;

   FUNCTION returngrupos (ag_usufun IN VARCHAR2)
      RETURN VARCHAR2;


   PROCEDURE doverusuarioexisteajax (
      ag_codent      IN   VARCHAR2,
      ag_usudni      IN   VARCHAR2,
      ag_usunombre   IN   VARCHAR2,
      ag_usuemail    IN   VARCHAR2
   );

   PROCEDURE doautogenerausuarioajax (
      ag_codent   IN   VARCHAR2,
      ag_usudni   IN   VARCHAR2
   );

   PROCEDURE doreenviarcontrasenia (
      session__userid   IN   VARCHAR2,
      ag_usufun         IN   VARCHAR2,
      iisenv__REMOTE_HOST   IN         varchar2  DEFAULT NULL
   );

   PROCEDURE generarmensajenotificacion (
      ag_usufun   IN   VARCHAR2,
      operacion   IN   VARCHAR2,
      msgtemp     IN   VARCHAR2,
      clave       IN   VARCHAR2
   );

   PROCEDURE donotificarusuario (
      usuemail   IN   VARCHAR2,
      asunto     IN   VARCHAR2,
      mensaje    IN   VARCHAR2
   );

   PROCEDURE dojavascriptajax;

   PROCEDURE dojavascriptcomun;

   PROCEDURE dojavascriptusuarios;

   PROCEDURE f_lista_dep(
        v_modulo IN VARCHAR2);

   PROCEDURE f_lista_prov (
        ag_departamento IN VARCHAR2 DEFAULT NULL,
        v_modulo IN VARCHAR2);

   PROCEDURE f_lista_dis (
      ag_departamento IN VARCHAR2,
        ag_provincia IN VARCHAR2,
        v_modulo IN VARCHAR2
   );

   PROCEDURE f_lista_ubigeo(
        v_modulo IN VARCHAR2);

   PROCEDURE f_get_tipoentidad;

   PROCEDURE mostrarAlerta(
      mensaje        IN   VARCHAR2);

/*----------------------- Public Modules ---------------------------*/
   PROCEDURE doviewprincipalusuarios (
      portlet__titulo        IN   VARCHAR2,
      session__anhoentidad   IN   VARCHAR2
   );

   PROCEDURE doviewcrearusuario (
      portlet__titulo        IN   VARCHAR2,
      session__anhoentidad   IN   VARCHAR2,
      session__userid        IN   VARCHAR2 DEFAULT NULL,
      session__eue_codigo    IN   VARCHAR2
   );

   PROCEDURE doviewmodificar_busqueda (
      portlet__titulo      IN VARCHAR2,
      session__anhoentidad IN VARCHAR2);

   PROCEDURE doviewbuscarusuarios (
      portlet__titulo        IN   VARCHAR2,
      session__anhoentidad   IN   VARCHAR2,
      ag_codent              IN   VARCHAR2,
      ag_usunombre           IN   VARCHAR2,
      ag_usudni              IN   VARCHAR2 DEFAULT NULL,
      ag_usuemail            IN   VARCHAR2 DEFAULT NULL,
      ag_opcion              IN   VARCHAR2,
      ag_currentpage         IN   VARCHAR2 := 1
   );

   PROCEDURE doviewmodificarusuario (
      portlet__titulo        IN   VARCHAR2,
      session__anhoentidad   IN   VARCHAR2,
      session__userid        IN   VARCHAR2 DEFAULT NULL,
      session__eue_codigo    IN   VARCHAR2,
      ag_usufun              IN   VARCHAR2,
      ag_codent              IN   VARCHAR2
   );

   PROCEDURE doviewadmgrupo (
      portlet__titulo   IN   VARCHAR2,
      session__userid   IN   VARCHAR2 DEFAULT NULL
   );

   PROCEDURE dolistargrupos (ag_tipousu IN VARCHAR2);

   PROCEDURE doviewcreargrupo (
      portlet__titulo   IN   VARCHAR2,
      session__userid   IN   VARCHAR2 DEFAULT NULL,
      ag_tipousu        IN   VARCHAR2
   );

   PROCEDURE doviewmodificargrupo (
      portlet__titulo   IN   VARCHAR2,
      session__userid   IN   VARCHAR2 DEFAULT NULL,
      ag_usucod         IN   VARCHAR2
   );

   PROCEDURE dograbarnuevogrupo (
      session__userid   IN   VARCHAR2 DEFAULT NULL,
      ag_grupcod        IN   VARCHAR2,
      ag_grupnom        IN   VARCHAR2,
      ag_grupcoment     IN   VARCHAR2,
      ag_tipousu        IN   VARCHAR2,
      iisenv__REMOTE_HOST IN VARCHAR2 DEFAULT NULL
   );

   PROCEDURE dograbarmodificargrupo (
      session__userid   IN   VARCHAR2 DEFAULT NULL,
      ag_grupcod        IN   VARCHAR2,
      ag_grupnom        IN   VARCHAR2,
      ag_grupcoment     IN   VARCHAR2,
      ag_estado         IN   VARCHAR2,
      ag_tipousu        IN   VARCHAR2,
      iisenv__REMOTE_HOST IN VARCHAR2 DEFAULT NULL
   );

   PROCEDURE doviewreporte (portlet__titulo IN VARCHAR2);

   PROCEDURE doviewdetareporte (
      portlet__titulo        IN   VARCHAR2,
      session__anhoentidad   IN   VARCHAR2,
      ag_tiporeporte         IN   VARCHAR2,
      ag_tipoent             IN   VARCHAR2
   )
    /*
    ||    Author:         Cristina Zenteno Garcia
    ||    Overview:     Procedimiento que escribe en html la pagina con los parametros del reporte
    ||                         seleccionado
    ||    Modificaciones:
    ||      02/07/2009  - CZG   -   Creacin del procedimiento
    ||      19/03/2012 - Martn Zanelli - Configuracin de cambios solicitados para reporte 5 -
    ||                   Memo 98-2012/SDP-ECC - punto 4
    */;

   PROCEDURE doviewReporte1(
     portlet__titulo        IN   VARCHAR2,
     ag_estado IN VARCHAR2,
     ag_fecini IN VARCHAR2,
     ag_fecfin IN VARCHAR2,
     ag_currentpage         IN   VARCHAR2 := 1
   );

   PROCEDURE doviewReporte2(
     portlet__titulo        IN   VARCHAR2,
     ag_departamento IN   VARCHAR2,
     ag_provincia IN   VARCHAR2,
     ag_distrito IN   VARCHAR2,
     ag_currentpage         IN   VARCHAR2 := 1
   );

   PROCEDURE doviewReporte3(
     portlet__titulo  IN   VARCHAR2,
     ag_perfil        IN   VARCHAR2,
     ag_codent        in   varchar2,
     ag_currentpage   IN   VARCHAR2 := 1
   );

   PROCEDURE doviewReporte4(
     portlet__titulo   IN   VARCHAR2,
     ag_codent         IN   VARCHAR2,
     ag_estado         in   varchar2,
     ag_currentpage    IN   VARCHAR2 := 1
   );

   PROCEDURE doviewcontrasenia (
      portlet__titulo   IN   VARCHAR2,
      session__userid   IN   VARCHAR2
   );


   PROCEDURE doviewactualizardatosusuario(
      portlet__titulo   IN   VARCHAR2,
      session__userid   IN   VARCHAR2
    );

  function f_get_ubigeo_ue(  v_dep_codigo_vb          varchar2,
                              v_pro_codigo_vb          varchar2,
                              v_dis_codigo_vb          varchar2 )
        return varchar2;

  PROCEDURE dograbarnuevousuario (
      session__userid       IN   VARCHAR2 DEFAULT NULL,
      ag_codent             IN   VARCHAR2,
      ag_descuniope         in   varchar2,
      ag_descdomicilio      in   varchar2,
      ag_solnombre          IN   VARCHAR2,
      ag_solcargo           IN   VARCHAR2,
      ag_usufun             IN   VARCHAR2,
      ag_usunombre          IN   VARCHAR2,
      ag_usudni             IN   VARCHAR2,
      ag_usucargo           IN   VARCHAR2,
      ag_usuemail           IN   VARCHAR2,
      ag_usufono            IN   VARCHAR2,
      ag_fecrecep           IN   VARCHAR2,
      ag_tipousu            IN   VARCHAR2,
      ag_miembros           IN   VARCHAR2,
      v_dep_codigo_vb       in   varchar2,
      v_pro_codigo_vb       in   varchar2,
      v_dis_codigo_vb       in   varchar2,
      iisenv__remote_host   IN   VARCHAR2 DEFAULT NULL
   )
/*
||    Author:         Cristina Zenteno Garcia
||    Overview:    Procedimiento para grabar los datos del usuario
||    Modificaciones:
||            16/07/2009  - CZG   -   Creaci¿n del procedimiento
*/;


  function f_read_ubigeo_ue(v_dep_codigo_vb   varchar2,
                             v_pro_codigo_vb   varchar2,
                             v_dis_codigo_vb   varchar2 )
     return varchar2;

  PROCEDURE doviewreporte6 (portlet__titulo IN VARCHAR2,
                             ag_usufun       IN VARCHAR2,
                             ag_parametro1   in varchar2,
                             ag_parametro2   in varchar2,
                             ag_parametro3   in varchar2,
                             ag_parametro4   in varchar2,
                             ag_tipo         in varchar2);


  PROCEDURE f_lista_perfiles (ag_usufun IN VARCHAR2, ag_tipousu IN VARCHAR2, ag_Enti in VARCHAR2)
/*
||     Author:         Cristina Zenteno Garcia
||    Overview:    Procedimiento que escribe en html la lista de perfiles
||    Modificaciones:
||            30/06/2009  - CZG   -   Creaci¿n de la funci¿n
*/;

  PROCEDURE dograbarExceptuado (
      session__userid       IN   VARCHAR2 DEFAULT NULL,
      ag_codent             IN   VARCHAR2,
      ag_descuniope         in   varchar2,
      ag_descdomicilio      in   varchar2,
      ag_solnombre          IN   VARCHAR2,
      ag_solcargo           IN   VARCHAR2,
      ag_usufun             IN   VARCHAR2,
      ag_usunombre          IN   VARCHAR2,
      ag_usudni             IN   VARCHAR2,
      ag_usucargo           IN   VARCHAR2,
      ag_usuemail           IN   VARCHAR2,
      ag_usufono            IN   VARCHAR2,
      ag_fecrecep           IN   VARCHAR2,
      ag_tipousu            IN   VARCHAR2,
      ag_miembros           IN   VARCHAR2,
      v_dep_codigo_vb       in   varchar2,
      v_pro_codigo_vb       in   varchar2,
      v_dis_codigo_vb       in   varchar2,
      iisenv__remote_host   IN   VARCHAR2 DEFAULT NULL
   )
/*
||    Overview:     Procedimiento para grabar los datos del usuario para Exceptuados
||    Modificaciones:
||    15/08/2010 - Modif - JMD
*/;

  PROCEDURE doviewreporte7 (
      portlet__titulo   IN   VARCHAR2,
      ag_codent         IN   VARCHAR2,
      ag_estado         in   varchar2,
      ag_currentpage    IN   VARCHAR2 := 1
   )
/*
||    Author:       Cristina Zenteno Garcia
||    Overview:     Reporte 4              Usuarios por Entidad Contratante
||    Modificaciones:
||            05/08/2009  - CZG   -   Creaci¿n del procedimiento
*/;


  PROCEDURE doviewreporteGen (
      portlet__titulo         IN   VARCHAR2,
      session__anhoentidad    IN   VARCHAR2,
      session__eue_codigo     in   VARCHAR2,
      session__entdescripcion in   VARCHAR2
   )
/*
||    Author:         Cristina Zenteno Garcia
||    Overview:     Procedimiento que escribe en html la pagina para seleccionar los reportes
||    Modificaciones:
||            02/07/2009  - CZG   -   Creaci¿n del procedimiento
*/;

  PROCEDURE dograbaractualizacionusuario (
      session__userid       IN   VARCHAR2,
      ag_usufun             IN   VARCHAR2,
      ag_usunombre          IN   VARCHAR2,
      ag_usucargo           IN   VARCHAR2,
      ag_usudni             IN   VARCHAR2,
      ag_usuemail           IN   VARCHAR2,
      ag_usufono            IN   VARCHAR2,
      --ag_descdomicilio      IN   VARCHAR2,
      ag_descuniope         IN   VARCHAR2,
      ag_descdomicilio      IN   VARCHAR2,
      --ag_departamento       IN   VARCHAR2,
      --ag_provincia          IN   VARCHAR2,
      --ag_distrito           IN   VARCHAR2,
      v_dep_codigo_vb       in   varchar2,
      v_pro_codigo_vb       in   varchar2,
      v_dis_codigo_vb       in   varchar2,
      iisenv__remote_host        VARCHAR2 DEFAULT NULL
   )
/*
||    Author:      Cristina Zenteno Garcia
||    Overview:    Procedimiento para grabar los datos que el propio usuario ingresa
||    Modificaciones:
||            04/08/2009  - CZG   -   Creaci¿n del procedimiento
*/;



     PROCEDURE dograbarmodificarusuario (
        session__userid       IN   VARCHAR2 DEFAULT NULL,
        ag_descuniope         in   varchar2,
        ag_descdomicilio      in   varchar2,
        ag_solnombre          IN   VARCHAR2,
        ag_solcargo           IN   VARCHAR2,
        ag_usufun             IN   VARCHAR2,
        ag_usunombre          IN   VARCHAR2,
        ag_usudni             IN   VARCHAR2,
        ag_estado             IN   VARCHAR2,
        ag_estado_old         IN   VARCHAR2,
        ag_usucargo           IN   VARCHAR2,
        ag_usuemail           IN   VARCHAR2,
        ag_usufono            IN   VARCHAR2,
        ag_fecrecep           IN   VARCHAR2,
        ag_tipousu            IN   VARCHAR2,
        ag_miembros           IN   VARCHAR2,
        ag_obs                IN   VARCHAR2 DEFAULT NULL,
        mensaje               IN   VARCHAR2,
        v_dep_codigo_vb       in   varchar2,
        v_pro_codigo_vb       in   varchar2,
        v_dis_codigo_vb       in   varchar2,
        iisenv__remote_host   IN   VARCHAR2 DEFAULT NULL
     )
  /*
  ||    Author:         Cristina Zenteno Garcia
  ||    Overview:    Procedimiento para grabar la modificacion de un usuario
  ||    Modificaciones:
  ||            22/07/2009  - CZG   -   Creaci¿n del procedimiento
  */;

  PROCEDURE doviewHistorial (
          ag_usufun             IN   VARCHAR2,
          session__userid       IN   VARCHAR2,
          iisenv__remote_host        VARCHAR2 DEFAULT NULL
       )
    /*
    ||    Author:      JMD
    ||    Overview:    Procedimiento para listar Historial de Cambios
    ||    Modificaciones:
    ||    30/05/2011  - JMD   -   Creaci¿n del procedimiento
    */;
   PROCEDURE USP_GET_SUBTIPO_ENTIDAD_ACTUAL(
        ag_tipoent varchar2);



     PROCEDURE showpaginacion (
        currentpage   IN   VARCHAR2,
        num_users     IN   NUMBER,
        enlace        IN   VARCHAR2,
        modulo        IN   VARCHAR2,
        pagesize      IN   NUMBER
     );


     PROCEDURE doviewdetareporteGen (
        portlet__titulo         IN   VARCHAR2,
        session__anhoentidad    IN   VARCHAR2,
        session__eue_codigo     in   VARCHAR2,
        session__entdescripcion in   VARCHAR2,
        ag_tiporeporte          IN   VARCHAR2
     )
  /*
  ||    Author:         Cristina Zenteno Garcia
  ||    Overview:     Procedimiento que escribe en html la pagina con los parametros del reporte
  ||                         seleccionado
  ||    Modificaciones:
  ||            02/07/2009  - CZG   -   Creaci¿n del procedimiento
  */;

     FUNCTION generaMensajesCrearUsuario(
              usuario    VARCHAR2,
              password   VARCHAR2   ) RETURN VARCHAR2;

PROCEDURE doviewreporte5 (
        portlet__titulo   IN   VARCHAR2,
        ag_tipoent        IN   VARCHAR2,
        ag_subtipoent     IN   VARCHAR2,
        ag_tipoent_des    IN   VARCHAR2,
        ag_subtipoent_des IN   VARCHAR2,
        ag_currentpage    IN   VARCHAR2 := 1
    );
PROCEDURE USP_GENERA_NUEVA_CLAVE_FORM(
        v_parametro1 varchar2);

    PROCEDURE USP_GENERA_NUEVA_CLAVE_DML(
        v_usuario           varchar2,
        v_correo            varchar2,
        iisenv__remote_host varchar2 DEFAULT NULL);
      PROCEDURE USP_GENERA_NUEVA_CLAVE_RES(
          v_mensaje1  varchar2,
          v_mensaje2  varchar2,
          v_return    number);
  PROCEDURE USP_JOB_NOTIFICA_VENCIM_CLAVE;
      PROCEDURE USP_GET_TIPO_ENTIDAD_ACTUAL(
         ag_tipoent varchar2);


     PROCEDURE dograbarcontrasenia (
          session__userid       IN   VARCHAR2,
          ag_paswd              IN   VARCHAR2,
          ag_usufun             IN   VARCHAR2,
          ag_opcion             IN   VARCHAR2,
          iisenv__remote_host   IN   VARCHAR2 DEFAULT NULL,
          ag_return             IN OUT  NUMBER)
      /*
      ||    Author: Cristina Zenteno Garcia
      ||    Overview: Procedimiento para grabar la contrasea
      ||    Modificaciones:
      ||      04/08/2009 - Cristina Zenteno Garcia - Creacin del procedimiento
      ||      16/03/2012 - Martn Zanelli Mendoza - Se adiciona el ag_opcion = 'O' (cambio de clave x olvido del usuario)
      ||                   Asimismo, se agrega variable de salida para el control del procedimiento - Memo 98-2012/SDP-ECC - punto 1.
      */;

  PROCEDURE dograbarcontrasenia1 (
        session__userid       IN   VARCHAR2,
        ag_paswd              IN   VARCHAR2,
        ag_usufun             IN   VARCHAR2,
        ag_opcion             IN   VARCHAR2,
        iisenv__remote_host   IN   VARCHAR2 DEFAULT NULL)
    /*
    ||    Author: Cristina Zenteno Garcia
    ||    Overview: Procedimiento para grabar la contrase¿a
    ||    Modificaciones:
    ||      04/08/2009 - Cristina Zenteno Garcia - Creaci¿n del procedimiento
    */;
--cambios arbitro nueva ley
   PROCEDURE seleccionarPerfil (care varchar2 default null);
     PROCEDURE formArbitro (
                          cRuc varchar2 default null,
                          v_nombre varchar2 default null,
                          v_aPaterno varchar2 default null,
                          v_aMaterno varchar2 default null,
                          v_razSoc varchar2 default null 
                          );
PROCEDURE dograbarnuevoarbitro (
        session__userid          VARCHAR2 DEFAULT NULL,
        cColegio                 VARCHAR2,
        cColegiatura             number,
        cDoc                     varchar2,
        ag_fecrecep              varchar2,
        cRuc                     VARCHAR2,
        cCorreo                  VARCHAR2,
        cTelefono                VARCHAR2,
    --  ag_tipousu              VARCHAR2,
        ag_miembros             VARCHAR2,
        iisenv__remote_host      VARCHAR2 DEFAULT NULL,
        cNombre                    varchar2,
        cApellidoPat               varchar2,
        cApellidoMat               varchar2,
        v_razSoc                    varchar2
   );
   
 PROCEDURE doEditaArbitro (
      cRuc                varchar2,
      cColegio            varchar2,
      cEmail              varchar2,
      cTelefono           varchar2,
      cColegiatura        number,
      ag_fecrecep         varchar2,
      cDoc                varchar2,
      cEstado             number,
      cObservaciones      varchar2,
      ag_miembros         varchar2,
      iisenv__remote_host varchar2,
      session__userid     varchar2);   
      
PROCEDURE doNotificaArbitro (cRuc                 varchar2,
                             session__userid      varchar2,
                             iisenv__remote_host  varchar2
                            );
                            
                            
                            
 PROCEDURE usp_ValidarRUC (
  session__cod_contrato    VARCHAR2 DEFAULT NULL,
  session__filesingedhttp  VARCHAR2 DEFAULT NULL,
  cRuc                      VARCHAR2 DEFAULT NULL,
  v_razSoc                VARCHAR2 DEFAULT NULL 
  );                            
                            
                            
END;

/
