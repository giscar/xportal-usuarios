create or replace PACKAGE BODY         "PKU_ADMINISTRAR_USERS" 
IS
/*----------------------- Private Modules ---------------------------*/
   FUNCTION generaclavealeatoria
      RETURN VARCHAR2
/*
||    Author:         Cristina Zenteno Garcia
||    Overview:    Devuelve una clave aleatoria
||    Modificaciones:
||            16/07/2009  - CZG   -   Creaci¿n de la funci¿n
*/
   IS
      v_random   VARCHAR2 (30);
      v_clave    VARCHAR2 (10);
   BEGIN
      /*    u - uppercase alphabetic characters; no numbers, e.g. 'ABCZ'
      ||    l - lowercase alphabetic characters; no numbers, e.g. 'abcz'
      ||    a - mixed case alphabetic characters; not numbers, e.g. 'AbCz';
      ||    x - uppercase alpha-numeric characters, e.g. 'A1B4X'
      ||    p - any printable characters, e.g. 'svO}>,&=RZ'
      */
      v_random := DBMS_RANDOM.STRING ('a', 30);
      v_clave := SUBSTR (v_random, 4, 10);
      RETURN v_clave;
   END generaclavealeatoria;

   FUNCTION listargruposxusuario (ag_usufun IN VARCHAR2, ag_tipousu IN VARCHAR2)
      RETURN VARCHAR2
/*
||     Author:         Cristina Zenteno Garcia
||    Overview:    Funcion que devuelve el listado de grupos del usuario
||    Modificaciones:
||            21/07/2009  - CZG   -   Creaci¿n de la funci¿n
*/
   IS
      miembros   sease.usuario.usu_miembros%TYPE;
   BEGIN
      SELECT usu_miembros
        INTO miembros
        FROM sease.usuario
       WHERE usu_activo = 1
         AND apl_codigo = 1
         AND usu_codigo = RPAD (ag_usufun, 30)
         AND usu_tipo = ag_tipousu
         AND eue_codigo IS NOT NULL;

      RETURN miembros;
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         RETURN '';
   END listargruposxusuario;

   FUNCTION returnentidad (ag_usufun IN VARCHAR2)
      RETURN VARCHAR2
/*
||    Author:         Cristina Zenteno Garcia
||    Overview:    Devuelve la descripcion de la entidad del usuario
||    Modificaciones:
||            04/08/2009  - CZG   -   Creaci¿n de la funci¿n
*/
   IS
      lv_entidad   VARCHAR2 (100) := '';
   BEGIN
      SELECT ent.eue_desc
        INTO lv_entidad
        FROM sease.entidadue_anho ent, sease.usuario usu
       WHERE ent.eue_codigo = usu.eue_codigo
         AND ent.eue_anho = TO_CHAR (SYSDATE, 'yyyy')
         AND usu.usu_codigo = RPAD (ag_usufun, 30);

      RETURN lv_entidad;
   END returnentidad;

   FUNCTION returnnombre (ag_usufun IN VARCHAR2)
      RETURN VARCHAR2
/*
||    Author:         Cristina Zenteno Garcia
||    Overview:    Devuelve el nombre del usuario
||    Modificaciones:
||            04/08/2009  - CZG   -   Creaci¿n de la funci¿n
*/
   IS
      lv_nombre   VARCHAR2 (100) := '';
   BEGIN
      SELECT usu.usu_nombre
        INTO lv_nombre
        FROM sease.usuario usu
       WHERE usu.usu_codigo = RPAD (ag_usufun, 30);

      RETURN lv_nombre;
   EXCEPTION
    WHEN NO_DATA_FOUND THEN
        lv_nombre := '';
        RETURN lv_nombre;
   END returnnombre;

   FUNCTION returnemail (ag_usufun IN VARCHAR2)
      RETURN VARCHAR2
/*
||    Author:         Cristina Zenteno Garcia
||    Overview:    Devuelve el email del usuario
||    Modificaciones:
||            04/08/2009  - CZG   -   Creaci¿n de la funci¿n
*/
   IS
      lv_email   VARCHAR2 (60) := '';
   BEGIN
      SELECT TRIM(usu.usu_email) --MMAUTINO: EL DIA 01.07.2015 SE AGREGA TRIM AL CAMPO USU_EMAIL      
        INTO lv_email
        FROM sease.usuario usu
       WHERE usu.usu_codigo = RPAD (ag_usufun, 30);

      RETURN lv_email;
   END returnemail;

   FUNCTION returnpasschanged (ag_usufun IN VARCHAR2)
      RETURN DATE
/*
||    Author:         Cristina Zenteno Garcia
||    Overview:    Devuelve la fecha del ultimo cambio de la contrase¿a del usuario
||    Modificaciones:
||            04/08/2009  - CZG   -   Creaci¿n de la funci¿n
*/
   IS
      ld_date   DATE;
   BEGIN
      SELECT usu_fecult
        INTO ld_date
        FROM sease.usuario
       WHERE usu_codigo = RPAD (ag_usufun, 30);

      RETURN ld_date;
   END returnpasschanged;

   FUNCTION returnestado (ag_usufun IN VARCHAR2)
      RETURN INTEGER
/*
||    Author:         Cristina Zenteno Garcia
||    Overview:    Devuelve el estado del usuario
||    Modificaciones:
||            04/08/2009  - CZG   -   Creaci¿n de la funci¿n
*/
   IS
      li_estado   INTEGER;
   BEGIN
      SELECT usu_activo
        INTO li_estado
        FROM sease.usuario
       WHERE usu_codigo = RPAD (ag_usufun, 30);

      RETURN li_estado;
   END returnestado;

   FUNCTION returnlastaccess (ag_usufun IN VARCHAR2)
      RETURN DATE
/*
||    Author:         Cristina Zenteno Garcia
||    Overview:    Devuelve la fecha del ultimo acceso del usuario
||    Modificaciones:
||            04/08/2009  - CZG   -   Creaci¿n de la funci¿n
*/
   IS
      ld_date   DATE;
   BEGIN
      SELECT usu_fecacc
        INTO ld_date
        FROM sease.usuario
       WHERE usu_codigo = RPAD (ag_usufun, 30);

      RETURN ld_date;
   END;

   FUNCTION returngrupos (ag_usufun IN VARCHAR2)
      RETURN VARCHAR2
   IS
      lv_grupos   VARCHAR2 (1000);
   BEGIN
      SELECT usu_miembros
        INTO lv_grupos
        FROM sease.usuario
       WHERE usu_codigo = RPAD (ag_usufun, 30);

      RETURN lv_grupos;
   END;


   PROCEDURE showpaginacion (
      currentpage   IN   VARCHAR2,
      num_users     IN   NUMBER,
      enlace        IN   VARCHAR2,
      modulo        IN   VARCHAR2,
      pagesize      IN   NUMBER
   )
   IS
      lv_num             NUMBER;
      lv_num_users       NUMBER;
      lv_iterador        NUMBER  NOT NULL DEFAULT 0;
      lv_numeropaginas   INTEGER NOT NULL DEFAULT 0;
   BEGIN
      usp_print
         ('<table class="Data" cellSpacing="0" cellPadding="4" width="100%" align="center">
            <tr>
                <td width="30%" align="left"><b>Registros:</b>&nbsp'
          || TO_CHAR (pagesize * (currentpage - 1) + 1 * SIGN (num_users))
          || '&nbsp-&nbsp'
          || (CASE currentpage
                 WHEN CEIL (num_users / pagesize)
                      THEN num_users
                 ELSE pagesize * currentpage * SIGN (num_users)
              END
             )
          || ' de '
          || num_users
          || '</td>
              <td width="50%" align="right">'
         );
      ------------ Paginacion ---------------
      lv_numeropaginas := CEIL (num_users / pagesize);
      lv_iterador := 1;
      usp_print ('<b>P&aacute;gina :</b>');

      LOOP
         IF lv_iterador = currentpage
         THEN
            usp_print
               (   '&nbsp<font color="#FFFFFF"><b><span style="background-color: #111111">&nbsp;'
                || lv_iterador
                || '&nbsp;</span></b></font>'
               );
         ELSE
            usp_print
            (' '|| makea(enlace || '&ag_currentpage=' || lv_iterador || modulo, '' || lv_iterador || '') || '');
         END IF;

         lv_iterador := lv_iterador + 1;
         EXIT WHEN lv_numeropaginas < lv_iterador;
      END LOOP;

      -------- Campos de Cabecera -----------------
      usp_print ('
            </td>
        </tr>
    </table>');
   END;

   PROCEDURE doverusuarioexisteajax (
      ag_codent      IN   VARCHAR2,
      ag_usudni      IN   VARCHAR2,
      ag_usunombre   IN   VARCHAR2,
      ag_usuemail    IN   VARCHAR2
   )
/*
||    Author:         Cristina Zenteno Garcia
||    Overview:     Procedimiento que revisa si el usuario ya existe
||    Modificaciones:
||            13/07/2009  - CZG   -   Creaci¿n del procedimiento
*/
   IS
      CURSOR cantidad_users
      IS
         SELECT DISTINCT 1
                    FROM sease.usuario
                   WHERE (usuario.usu_dni = ag_usudni
                          AND ag_usudni IS NOT NULL
                         )
                      OR (    TRIM (usuario.usu_email) = TRIM (ag_usuemail)
                          AND ag_usuemail IS NOT NULL
                         )
                      OR (    reg_procesos.f_replace_tildes
                                                           (usuario.usu_nombre) LIKE
                                    '%'
                                 || reg_procesos.f_replace_tildes
                                                                 (ag_usunombre)
                                 || '%'
                          AND ag_usunombre IS NOT NULL
                         );

      v_cantusu   NUMBER (1);
   BEGIN
      OPEN cantidad_users;

      FETCH cantidad_users
       INTO v_cantusu;

      IF v_cantusu = 1
      THEN
         usp_print
            (   '<table border="0" width=100% align=center class=tableform cellpadding=0 cellspacing=0>
                        <tr><td>Existen usuarios similares.
                        Para ver el listado haga click <a href=#
                        onclick="abrir(''mod_UsuarioCrear'',''dolistarusuarios'',
                        ''&ag_codent='
             || ag_codent
             || '&ag_usunombre='
             || ag_usunombre
             || '&ag_usudni='
             || ag_usudni
             || '&ag_usuemail='
             || ag_usuemail
             || '&ag_opcion=L'',''wlistaUsuario'');">aqu&iacute;</a>
                                    </td></tr></table> '
            );
      ELSE
         usp_print
            (' <table border="0" width=100% align=center class=tableform cellpadding=0 cellspacing=0>
                                <tr><td>No existe un usuario en esta u otra entidad con estos datos</td></tr></table>'
            );
      END IF;

      CLOSE cantidad_users;
   EXCEPTION
      WHEN OTHERS
      THEN
         usp_print ('Ocurrio el siguiente error: ' || SQLERRM || ' - '
                    || SQLCODE
                   );
   END doverusuarioexisteajax;

   PROCEDURE doautogenerausuarioajax (
      ag_codent   IN   VARCHAR2,
      ag_usudni   IN   VARCHAR2
   )
/*
||    Author:         Cristina Zenteno Garcia
||    Overview:     Procedimiento que genera el codigo de usuario
||    Modificaciones:
||            17/07/2009  - CZG   -   Creaci¿n del procedimiento
*/
   IS
      lv_usuario    VARCHAR2 (30);
      lv_cantidad   NUMBER (2);
   BEGIN
      SELECT DISTINCT 1
                 INTO lv_cantidad
                 FROM sease.usuario
                WHERE eue_codigo = ag_codent AND usu_dni = ag_usudni
             ORDER BY 1;

      usp_print
         ('<input readonly name="ag_usufun" maxlength="20" style="width:98%;background-color:#F5F5F5;"
                value=""/>
            El usuario ya existe, use la opci&oacute;n Modificar/Desactivar Usuario.'
         );
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         lv_usuario := ag_codent || ag_usudni;
         usp_print
            (   '
            <input readonly name="ag_usufun" maxlength="20" style="width:98%;background-color:#F5F5F5;" value="'
             || lv_usuario
             || '"/>'
            );
      WHEN OTHERS
      THEN
         usp_print ('Ocurrio el siguiente error: ' || SQLERRM || ' - '
                    || SQLCODE
                   );
   END doautogenerausuarioajax;

       PROCEDURE doreenviarcontrasenia (
        session__userid       IN   VARCHAR2,
        ag_usufun             IN   VARCHAR2,
        iisenv__remote_host   IN   VARCHAR2 DEFAULT NULL)
    /*
    ||    Author: Cristina Zenteno Garcia
    ||    Overview: Procedimiento para reenviar una contrasea aleatoria
    ||    Modificaciones:
    ||      24/07/2009 - Cristina Zenteno - Creacin del procedimiento
    ||      15/03/2012 - Martn Zanelli - Se adiciona una variable al procedimiento dograbarcontrasenia
    ||                   Memo 98-2012/SDP-ECC
    */
    IS
        lv_clavealeatoria   VARCHAR2 (30);
        lv_return number;
    BEGIN
        lv_return := 0;
        lv_clavealeatoria := generaclavealeatoria ();
        dograbarcontrasenia(session__userid, lv_clavealeatoria, ag_usufun,
                           'R', iisenv__remote_host, lv_return);
    EXCEPTION
        WHEN OTHERS
        THEN
            usp_print ('Ocurrio el siguiente error: ' || SQLERRM || ' - '
                        || SQLCODE );
    END doreenviarcontrasenia;

   FUNCTION generaMensajesCrearUsuario(
            usuario    VARCHAR2,
            password   VARCHAR2   ) RETURN VARCHAR2
   IS
             msg VARCHAR2(4000);
   BEGIN

    msg := '<tr><td><center><h3>Bienvenido al Sistema Electr&oacute;nico de Contrataciones del Estado - SEACE</h3>';

    msg := msg || '<p>Aqu&iacute; podr&aacute; registrar la informaci&oacute;n sobre sus Procesos de Contrataci&oacute;n</p>';

    msg := msg || '<b>Usuario :' || usuario;
    msg := msg || '<br>Contrase&ntilde;a : ' ||password || '</b>';

    msg := msg || '<p><b>Puede ingresar al SEACE a trav&eacute;s de los siguientes enlances:</b></p>';

    msg := msg || '<p><b>Acceso para registrar informaci&oacute;n bajo el D.S. N&ordm; 083-2004-PCM<br>';
    msg := msg || '<a href="Https://app.seace.gob.pe/mon/Login.jsp"  target="_blank">Https://app.seace.gob.pe/mon/Login.jsp</a></b></p>';

    msg := msg || '<p><b>Acceso para registrar informaci&oacute;n bajo el D.L. N&ordm; 1017<br>';
    msg := msg || '<a href="https://zonasegura.seace.gob.pe/paac/default.asp" target="_blank">https://zonasegura.seace.gob.pe/paac/default.asp</a></b></p>';

    msg := msg || '<p><b>No olvide que este usuario y contrase&ntilde;a (Certificado SEACE) es el medio de identificaci&oacute;n ante el sistema, por lo tanto deben permanecer en secreto.</b></p>';

    msg := msg || '<p>Ante cualquier duda o consulta s&iacute;rvase comunicarse al correo:</p>';

    msg := msg || '<p>seaceusuarios@osce.gob.pe</p></center></td></tr>';

      RETURN msg;
   END;

       PROCEDURE generarmensajenotificacion (
        ag_usufun   IN   VARCHAR2,
        operacion   IN   VARCHAR2,
        msgtemp     IN   VARCHAR2,
        clave       IN   VARCHAR2 )
    /*
    ||    Author: Cristina Zenteno Garcia
    ||    Overview: Procedimiento que genera el mensaje de la notificacin del usuario
    ||    Modificaciones:
    ||      24/07/2009 - CZG - Creacin del procedimiento
    ||      15/03/2012 - Martn Zanelli - Se adiciona la condicin "O" [Cambio de clave por olvido de contrasea]
    ||                   para el envo de mensajes - Memo 98-2012/SDP-ECC - punto 1
    */
    IS
--cambios arbitro nueva ley
        cursor cNotificaArb is
        select count(usu_codigo) contCod from sease.usuario where
        trim(usu_codigo) = trim(ag_usufun)
        and usu_tipo = 3;   
    
 
        msg   VARCHAR2 (4000) := '';
        msg_crearUsuario varchar2(4000) := '';
        lv_asunto        varchar2(1000) := '';
        n_contCod        number;
    BEGIN
    for xrowArb in cNotificaArb loop
      n_contCod := xrowArb.Contcod;
    end loop;
        --JMD--msg_crearUsuario := generaMensajesCrearUsuario(ag_usufun, clave); --Formato JAVA 06/07/2010
        msg := '
        <tr>
            <th colspan="2">
                <font color="#1E5D9B" size=4>' || msg || '</font>
            </th>
        </tr>
        <tr><td colspan="2"><hr></td>'
         || '
        <tr>
            <td><b>Fecha:</b></td>
            <td>'|| TO_CHAR (SYSDATE, 'dd/MM/yyyy')|| '</td>
        </tr>
        <tr>
            <td><b>Usuario:</b></td>
            <td>'|| ag_usufun|| '</td>
        </tr>
        '--cambios arbitro nueva ley
        ||case n_contCod when 0 then 
        '<tr>
            <td><b>Entidad:</b></td>
            <td>'|| returnentidad (ag_usufun)|| '</td>
        <tr>'
         else '' end||'
            <td><b>Nombre del Usuario:</b></td>
            <td>'|| returnnombre (ag_usufun)||'</td>
        </tr>';

        msg := msg || msgtemp;

        IF operacion in ('N','R','C','O') THEN
            msg := msg || '<tr>
            <td colspan="2"><br><br><font color="#B40404">Ud. puede modificar su contrase&ntilde;a ingresando al M&oacute;dulo Usuarios, secci&oacute;n "Cambio de Contrase&ntilde;a".
            Por motivos de seguridad Ud. debe modificar su contrase&ntilde;a cada cuatro (04) meses, de lo contrario caducar&aacute;.</font>
            </td></tr>';
        ELSE
            msg := msg || '';
        END IF;

        --JMD 163-2011-SPLA  -- 26/05/2011
        msg := msg || '
        <tr><td colspan="2"><font color="#253D54">
            <br><br><br>Para un mejor manejo del SEACE Ud. ingresar&aacute; a los
            <u><a uncontrol=true href="http://'||reg_procesos.f_get_conexiones(7)||'/?_pageid_=21&_contentid_=85">Manuales de Usuario y Videos Tutoriales.</a></u>
        </td>
        </tr>';

        msg := msg || ' 
        <tr><td colspan="2"><font color="#253D54">
            <br><br><br>El Certificado SEACE emitido por el OSCE es de car&aacute;cter personal e intransferible. Los
            usuarios son responsables de la informaci&oacute;n que bajo el Certificado SEACE ingresen al sistema.<br>
            <br>Esta notificaci&oacute;n ha sido enviada autom&aacute;ticamente. Por favor, no responda a este correo.</td>
        </tr>';

        -- N: Nuevo Usuario                 M: Modificar Usuario
        -- C: Modificar Contrasea          R: Reenviar Contrasea

        IF operacion = 'N'         THEN
        --msg := 'REPORTE DEL USUARIO-FUNCIONARIO DEL SEACE';
        --msg := msg_crearUsuario;                                  JMD 06/07/2010
            msg := '<tr><td colspan="2"><center><h4>Bienvenido al Sistema Electr&oacute;nico de Contrataciones del Estado (SEACE)<br>
                REPORTE DEL FUNCIONARIO - USUARIO DEL SEACE</h4><br><b>
                <font size="4">CERTIFICADO SEACE PARA EL USO DEL SEACE v2.0<br>
                <font size="2">(Art.286&deg; del D.S. N&deg;184-2008-EF modificado por D.S. N&deg;138-2012-EF)</font></b></center></td></tr>'||msg;
            LV_ASUNTO :=  'OSCE - Certificado SEACE - Nuevo v2.0 Usuario';
        ELSIF OPERACION = 'M'      then
            MSG := '<tr><td colspan="2"><center><h4>REPORTE DE MODIFICACI&Oacute;N DE DATOS DEL FUNCIONARIO-USUARIO DEL SEACE<br/>PARA EL USO DEL SEACE v2.0</h4></center></td></tr>'|| MSG;
            lv_asunto :=  'Notificacion Certificado SEACE v2.0';
        ELSIF OPERACION = 'C'      then
            MSG := '<tr><td colspan="2"><center><h4>MODIFICACI&Oacute;N DE CONTRASE&Ntilde;A PARA EL USO DEL SEACE v2.0</h4></center></td></tr>' || MSG;
            lv_asunto :=  'Notificacion Certificado SEACE v2.0';
        ELSIF OPERACION = 'R'      then
            msg := '<tr><td colspan="2"><center><h4>REENVIO DE CONTRASE&Ntilde;A PARA EL USO DEL SEACE v2.0</h4></center></td></tr>' || msg;
            lv_asunto :=  'Notificacion Certificado SEACE v2.0';
        ELSIF OPERACION = 'O'      then
            MSG := '<tr><td colspan="2"><center><h4>MODIFICACI&Oacute;N DE CONTRASE&Ntilde;A PARA EL USO DEL SEACE v2.0</h4></center></td></tr>' || MSG;
            lv_asunto :=  'Notificacion Certificado SEACE v2.0';
        END IF;

        donotificarusuario (returnemail (ag_usufun),
                          lv_asunto,
                          '<table width="70%" border=1 bordercolor="#FFFFFF">
                            <tr align="center">
                                <td align="center"  bgcolor="#FAFAFA" bordercolor="#74DF00" BORDERCOLORLIGHT="#F5FBEF" BORDERCOLORDARK="#E6E6E6">
                                    <table style="font-family: Verdana; font-size:12px;" width="100%" >'
                                    ||msg||'</table>
                                </td>
                            </tr>
                          </table>'
                         );
    EXCEPTION
        WHEN OTHERS THEN
            usp_print ('<script>alert("AVISO: ' || SQLERRM || '");</script>');
    END generarmensajenotificacion;


   PROCEDURE donotificarusuario (
      usuemail   IN   VARCHAR2,
      asunto     IN   VARCHAR2,
      mensaje    IN   VARCHAR2
   )
/*
||    Author:         Cristina Zenteno Garcia
||    Overview:     Procedimiento que envia la notificacion al correo electronico
||                         del usuario
||    Modificaciones:
||            24/07/2009  - CZG   -   Creaci¿n del procedimiento
*/
   IS
   BEGIN
      IF TRIM (usuemail) IS NULL OR TRIM (usuemail) = ''
      THEN
         RAISE ex_noemail;
      ELSE
        reg_procesos.sp_send_mail_html(usuemail, asunto, mensaje);
      END IF;
   EXCEPTION
      WHEN ex_noemail
      THEN
         raise_application_error
            (-20001,
             'No se pudo enviar la notificacion. No se ha registrado el correo electronico de este usuario'
            );
      WHEN OTHERS
      THEN
         raise_application_error
            (-20002,
                sqlerrm
            );
   END donotificarusuario;

   PROCEDURE dojavascriptajax
/*
||    Author:         Cristina Zenteno Garcia
||    Overview:    Funciones javascript para ejecutar funciones tipo ajax
||    Modificaciones:
||            26/06/2009  - CZG   -   Creaci¿n de la funci¿n
*/
   IS
   BEGIN
      usp_print
         ('
      <script>
        function llamarAjax(vobject, vpid, vsdo, vargs)
            {   var obj = document.getElementById(vobject);

                    obj.innerHTML = getPortletAjax("portlet5openAjax.asp?_portletid_="+vpid+"&scriptdo="+vsdo+vargs);
            }
      </script>'
         );
   END dojavascriptajax;

   PROCEDURE dojavascriptcomun
/*
||      Author:         Cristina Zenteno Garcia
||      Overview:    Funciones javascript generales
||     Modificaciones:
||            26/06/2009  - CZG   -   Creaci¿n de la funci¿n
*/
   IS
   BEGIN
      usp_print
         (   '
    <script>
        var newWindow;

        function regresar()
            {   window.history.back();
            }
        function accion( evento )
            {   thisform.scriptdo.value = evento;
                thisform.submit();
            }
        function abrir( pID, sDO, param, nventana)
            {  newWindow = window.open("portlet5open.asp?_portletid_="+pID+"&scriptdo="+sDO+param,nventana,"toolbar=no,Width=700,Height=400,scrollbars=yes,modal=yes,dependent,alwaysRaised")
               newWindow.creator=self;
            }
        function inicio()
            {   thisform.scriptdo.value = "doView";
                thisform.submit();
            }
        function cancelar()
            {   thisform.scriptdo.value = "doView";
                thisform.submit();
            }
        function cerrar()
            {   window.close();
            }
        function validarEmail(s)
            {   var flag = 0;
                var valido= "ABCDEFGHIJKLMNOPQRSTUVWYXZ0123456789abcdefghijklmnopqrstuvwxyz-_.";
                for (i = 0; i < s.length; i++)
                {
                    var c = s.charAt(i);
                    if (c == " ") {flag = 1;}
                }
                if (flag == 0)
                {   var i = 1;
                     var sLength = s.length;
                     var dot = 0;
                     var arr = 0;
                     var nam = 0;
                     while ((i < sLength) && (s.charAt(i) != "@") && (valido.indexOf(s.charAt(i)) != -1))
                     { nam = 1; i=i+1; }
                     if (i < sLength &&  s.charAt(i) == "@")
                     {  arr = 1; i = i + 1;}
                     i = i +1;
                     while ((i < sLength) && (valido.indexOf(s.charAt(i)) != -1))
                     { var c = s.charAt(i);
                        if (c == ".") {dot = dot +1;}
                        i = i+1; }

                     if ((dot < 1 && dot > 2 )|| arr != 1 || nam != 1 ) {flag = 1;}
                }
                if (flag == 1){return false;}
                else {return true;}
        }
        function cadenaValida(ls_msg)
        {   var strCadena = ls_msg;
            var valido= " ABCDEFGHIJKLMNOPQRSTUVWYXZ0123456789abcdefghijklmnopqrstuvwxyz#()+}{-_:,.;¿¿¿¿¿¿¿¿¿¿¿¿!&/";

            for (i = 0 ; i < strCadena.length; i++)
            {    if (valido.indexOf (strCadena.substr(i,1)) == -1)
                    {   return false; }
            }
            return true;
        }
        function vacio(ls_cadena) {
            if (ls_cadena == " " || ls_cadena == null || ls_cadena.length == 0)
                {return true;}
            else {return false;}
        }
        function isNumber (ls_cadena)
        {   var i;
            for (i = 0; i < ls_cadena.length; i++)
            {    if (!isDigito(ls_cadena.charAt(i)))
                     return false;
            }
            return true;
        }
        function isDigito (ls_car)
        {   return ((ls_car >="0") && (ls_car<="9"))
        }
        function validarFecha(ls_cadena)
        {  var flag = false;
            var anio = "'
          || TO_CHAR (SYSDATE, 'yyyy')
          || '";
            var mes = "'
          || TO_CHAR (SYSDATE, 'MM')
          || '";
            var dia = "'
          || TO_CHAR (SYSDATE, 'dd')
          || '";

            if(ls_cadena.length == 10)
            {   if (ls_cadena.substr(6,4) == anio)
                {   if (ls_cadena.substr(3,2) == mes)
                    {   if (ls_cadena.substr(0,2) >= "01" &&
                                ls_cadena.substr(0,2) <= dia )
                                   { flag=true;}
                    }
                    else if (ls_cadena.substr(3,2) < mes )
                    {   if (ls_cadena.substr(0,2) >= "01" &&
                                ls_cadena.substr(0,2) <= "31")
                                    {   flag=true;}
                    }
                }
                else if(ls_cadena.substr(6,4) < "'
          || TO_CHAR (SYSDATE, 'yyyy')
          || '")
                {   if (ls_cadena.substr(3,2) >= "01" && ls_cadena.substr(3,2) >= "12")
                    {   if (ls_cadena.substr(0,2) >= "01" &&
                                ls_cadena.substr(0,2) <= "31" )
                                   {   flag=true;}
                    }
                }
            }
            return flag;
        }
        function deshabilita_ck(control) {
          var elementos = thisform.elements.length;
          var name;
          for (j = 0 ; j< elementos ; j++){
            name = thisform.elements[j].name;
            if( name.indexOf(control) >= 0) {
              thisform.elements[j].checked = false;
              thisform.elements[j].disabled = true;
            }
          }
        }
        function habilita_ck(control) {
          var elementos = thisform.elements.length;
          var name;
          for (j = 0 ; j< elementos ; j++){
            name = thisform.elements[j].name;
            if( name.indexOf(control) >= 0) {
              thisform.elements[j].disabled = false;
            }
          }
       }

       function BuscaUbigeo(tipo) {
         thisform.tipo_ubi.value=tipo;
         OpenBrowser( null, "portlet5open.asp?_portletid_=BuscadorUbigeo", "600", "400" )
       }

       function RtnUbigeo(dep_codigo,pro_codigo,dis_codigo,dep_desc,pro_desc,dis_desc,lugar_ejec) {
         if (thisform.tipo_ubi.value==1) {
            thisform.dep_codigo.value=dep_codigo;
            thisform.pro_codigo.value=pro_codigo;
            thisform.dis_codigo.value=dis_codigo;
            thisform.lugar_ejec.value=dep_desc+"/"+pro_desc+"/"+dis_desc;
         }
         if (thisform.tipo_ubi.value==2) {
            thisform.v_dep_codigo_vb.value=dep_codigo;
            thisform.v_pro_codigo_vb.value=pro_codigo;
            thisform.v_dis_codigo_vb.value=dis_codigo;
            thisform.lugar_ejec_vb.value=dep_desc+"/"+pro_desc+"/"+dis_desc;
         }
       }
    </script> '
         );
   END dojavascriptcomun;

   PROCEDURE dojavascriptusuarios
   IS
   BEGIN
      usp_print
         ('
        <script>
            function refrescarPerfiles(vpid, vsdo, vobject, vsEnti)
            {   var tipo = thisform.ag_tipousu.value;
                var nombre = thisform.ag_usufun.value;
                var args;
                if (tipo == "0")
                {   alert("Seleccione el tipo de usuario");
                }
                args = "&ag_usufun="+nombre+"&ag_tipousu="+tipo+"&ag_Enti="+vsEnti;
                llamarAjax(vobject, vpid, vsdo, args);
            }
            function evalua(obj)
             {  var check = document.getElementById("ck"+obj);

                if (check.checked){
                    add(obj);
                }
                else {
                    del(obj);
                }
             }
             function add(cadena)
             {  var grupos = thisform.ag_miembros.value;
                 if (cadena == "OCI" || cadena == "CONTRALORIA" || cadena == "PROVEEDOR_ENTIDAD" || cadena == "SUPERVISOR_OSCE" || cadena == "PROVEEDOR_ELECTRONICA")
                 {  var obj;
                     deshabilita_ck("ck");
                     habilita_ck("ck"+cadena);
                     obj = document.getElementById("ck"+cadena);
                     obj.checked=true;
                     thisform.ag_miembros.value = cadena + ",";
                 }
                 else
                 {  var pos = grupos.indexOf(cadena);
                     if (pos < 0) {thisform.ag_miembros.value = grupos + cadena  + ",";}
                 }
             }

             function del(cadena)
             {  var grupos = thisform.ag_miembros.value;
                if (cadena == "OCI" || cadena == "CONTRALORIA" || cadena == "PROVEEDOR_ENTIDAD" || cadena == "SUPERVISOR_OSCE"  || cadena == "PROVEEDOR_ELECTRONICA")
                {   var obj;
                     habilita_ck("ck");
                     thisform.ag_miembros.value = "";
                }
                else
                {
                     var temp1 = "";
                     var temp2 = "";
                     var pos = grupos.indexOf(cadena)
                     if (pos >= 0)
                     {  temp1 = grupos.substr(0, pos);
                         temp2 = grupos.substr(pos + cadena.length + 1, grupos.length - (pos + cadena.length));
                         thisform.ag_miembros.value = temp1 + temp2;
                     }
                 }
             }
             function verifica(){
                var texto = document.getElementById("ag_usufun");
                var obj = document.getElementById("btnGuardar");
                if (texto.value == "")
                {   obj.disabled = true;
                }
                else
                {   obj.disabled = false;
                }
             }
        </script>
    '
         );
   END;

   PROCEDURE f_lista_perfiles (ag_usufun IN VARCHAR2, ag_tipousu IN VARCHAR2, ag_Enti in VARCHAR2)
/*
||     Author:         Cristina Zenteno Garcia
||    Overview:    Procedimiento que escribe en html la lista de perfiles
||    Modificaciones:
||            30/06/2009  - CZG   -   Creaci¿n de la funci¿n
*/
   IS
      CURSOR c_perfiles
      IS
         SELECT   a.usu_codigo, a.usu_nombre, a.usu_coment, flag
             FROM (SELECT TRIM (usu.usu_codigo) usu_codigo, usu.usu_nombre, usu.usu_coment,
                          CASE
                             WHEN INSTR
                                    (sease.pku_administrar_users.listargruposxusuario(ag_usufun, ag_tipousu),
                                     TRIM (usu.usu_codigo)
                                     ) >= 1
                             THEN '1'
                             ELSE '0'
                          END flag
                     FROM sease.usuario usu
                    WHERE usu.usu_activo = 1
                      AND usu.apl_codigo = 1
                      AND usu.usu_tipo = ag_tipousu
                      AND usu.eue_codigo IS NULL) a
         ORDER BY TRIM (a.usu_nombre) ASC;

      r_perfil   c_perfiles%ROWTYPE;
   BEGIN
   --usp_print('Entidad: '||ag_Enti||'<br>');
      usp_print
         (   '
    <table border="0" width=80% align=center class=tableform cellpadding=1 cellspacing=0>
        <tr>
            <td class=c1 align=center colspan="2"><h4>Perfiles</h4>
            <input name="ag_miembros" type="hidden"
                value="'
          || TRIM
                 (sease.pku_administrar_users.listargruposxusuario (ag_usufun, ag_tipousu) )
          || '" /></td>
        </tr>
         '
         );

      IF c_perfiles%ISOPEN
      THEN
         CLOSE c_perfiles;

         OPEN c_perfiles;
      ELSE
         OPEN c_perfiles;
      END IF;

      LOOP
         FETCH c_perfiles
          INTO r_perfil;

         EXIT WHEN c_perfiles%NOTFOUND;
         --if to_number('1952') <> to_number(gs_cod_osce) OR  ag_Enti is null then

         if ag_tipousu = '2'  then
           if to_number(nvl(ag_Enti,0)) = to_number(gs_cod_osce) then
             /*
           if r_perfil.usu_codigo not in ('ADM_CATALOGO_BSO',
             'ADM_CM_CATALOGO','ADM_NOTIFICACIONES','ADM_PLATSEACE','ADM_PRONUNCIA','SUPERVISOR_OSCE',
             'TRIBUNAL') then */

            usp_print (   '
            <tr>
            <td class=c1>
                <input name="op'
             || r_perfil.usu_codigo
             || '" type="hidden" value="'
             || r_perfil.usu_codigo
             || '"/>
                <input type="checkbox" name="ck'
             || r_perfil.usu_codigo
             || '" id="ck'
             || r_perfil.usu_codigo
             || '" onclick="evalua('''
             || r_perfil.usu_codigo
             || ''');"'
            );

           IF (r_perfil.flag = 1)
           THEN
              usp_print (' checked = true ');
           END IF;

           usp_print (   '>
                </input>'
                 || r_perfil.usu_nombre
                 || '
            </td>
            <td class=c3>'
                 || r_perfil.usu_coment
                 || '</td>
            </td> </tr>'
                );

           end if;

--cambios arbitro nueva ley
         end if;
         
         if ag_tipousu = '1' then
            usp_print (   '
            <tr>
            <td class=c1>
                <input name="op'
             || r_perfil.usu_codigo
             || '" type="hidden" value="'
             || r_perfil.usu_codigo
             || '"/>
                <input type="checkbox" name="ck'
             || r_perfil.usu_codigo
             || '" id="ck'
             || r_perfil.usu_codigo
             || '" onclick="evalua('''
             || r_perfil.usu_codigo
             || ''');"'
            );

           IF (r_perfil.flag = 1)
           THEN
              usp_print (' checked = true ');
           END IF;

           usp_print
                (   '>
                </input>'
                 || r_perfil.usu_nombre
                 || '
            </td>
            <td class=c3>'
                 || r_perfil.usu_coment
                 || '</td>
            </td> </tr>'
                );
         end if;

         /*

         if to_number(nvl(ag_Enti,0)) <> to_number(gs_cod_osce) OR  ag_Enti is null then
           if r_perfil.usu_codigo not in ('ADM_CATALOGO_BSO',
             'ADM_CM_CATALOGO','ADM_NOTIFICACIONES','ADM_PLATSEACE','ADM_PRONUNCIA','SUPERVISOR_OSCE',
             'TRIBUNAL') then

            usp_print (   '
            <tr>
            <td class=c1>
                <input name="op'
             || r_perfil.usu_codigo
             || '" type="hidden" value="'
             || r_perfil.usu_codigo
             || '"/>
                <input type="checkbox" name="ck'
             || r_perfil.usu_codigo
             || '" id="ck'
             || r_perfil.usu_codigo
             || '" onclick="evalua('''
             || r_perfil.usu_codigo
             || ''');"'
            );

           IF (r_perfil.flag = 1)
           THEN
              usp_print (' checked = true ');
           END IF;

           usp_print (   '>
                </input>'
                 || r_perfil.usu_nombre
                 || '
            </td>
            <td class=c3>'
                 || r_perfil.usu_coment
                 || '</td>
            </td> </tr>'
                );

           end if;
         else
            usp_print (   '
            <tr>
            <td class=c1>
                <input name="op'
             || r_perfil.usu_codigo
             || '" type="hidden" value="'
             || r_perfil.usu_codigo
             || '"/>
                <input type="checkbox" name="ck'
             || r_perfil.usu_codigo
             || '" id="ck'
             || r_perfil.usu_codigo
             || '" onclick="evalua('''
             || r_perfil.usu_codigo
             || ''');"'
            );

           IF (r_perfil.flag = 1)
           THEN
              usp_print (' checked = true ');
           END IF;

           usp_print
                (   '>
                </input>'
                 || r_perfil.usu_nombre
                 || '
            </td>
            <td class=c3>'
                 || r_perfil.usu_coment
                 || '</td>
            </td> </tr>'
                );
         end if; */
      END LOOP;

      CLOSE c_perfiles;

      usp_print (' </table>');
   EXCEPTION
      WHEN OTHERS
      THEN
         usp_print ('Ocurrio el siguiente error: ' || SQLERRM || ' - '
                    || SQLCODE
                   );
   END f_lista_perfiles;

   PROCEDURE f_lista_dep (v_modulo IN VARCHAR2)
/*
||     Author:         Cristina Zenteno Garcia
||    Overview:    Procedimiento que escribe en html el combobox con los departamentos
||    Modificaciones:
||            03/07/2009  - CZG   -   Creaci¿n del procedimiento
*/
   IS
      CURSOR c_dep
      IS
         SELECT   dep_codigo, dep_desc
             FROM sease.dep_ubigeo
            WHERE dep_activo = 1
         ORDER BY 2;

      r_dep   c_dep%ROWTYPE;
   BEGIN
      usp_print
         (   '<select name="ag_departamento" style="width:98%"
                onchange="refrescarProvincias('''
          || v_modulo
          || ''',''dolistarprovincias'',''divProvincias'');
                        refrescarDistritos('''
          || v_modulo
          || ''',''dolistardistritos'',''divDistritos'');">'
         );

      IF c_dep%ISOPEN
      THEN
         CLOSE c_dep;

         OPEN c_dep;
      ELSE
         OPEN c_dep;
      END IF;

      LOOP
         FETCH c_dep
          INTO r_dep;

         EXIT WHEN c_dep%NOTFOUND;
         usp_print (   '<option value="'
                    || r_dep.dep_codigo
                    || '">'
                    || r_dep.dep_desc
                    || '</option>'
                   );
      END LOOP;

      CLOSE c_dep;

      usp_print ('</select>');
   EXCEPTION
      WHEN OTHERS
      THEN
         usp_print ('Ocurrio el siguiente error: ' || SQLERRM || ' - '
                    || SQLCODE
                   );
   END f_lista_dep;

   PROCEDURE f_lista_prov (
      ag_departamento   IN   VARCHAR2 DEFAULT NULL,
      v_modulo          IN   VARCHAR2
   )
/*
||    Author:         Cristina Zenteno Garcia
||    Overview:    Procedimiento que escribe en html el combobox con las provincias
||    Modificaciones:
||            03/07/2009  - CZG   -   Creaci¿n del procedimiento
*/
   IS
      CURSOR c_pro
      IS
         SELECT   pro_codigo, pro_desc
             FROM sease.prov_ubigeo
            WHERE pro_activo = 1 AND dep_codigo = ag_departamento
         ORDER BY 2;

      r_pro   c_pro%ROWTYPE;
   BEGIN
      usp_print
         (   '<select name="ag_provincia" style="width:98%" onchange="refrescarDistritos('''
          || v_modulo
          || ''',''dolistardistritos'',''divDistritos'');">'
         );

      IF (ag_departamento < 0)
      THEN
         usp_print (' disabled ');
      ELSE
         usp_print ('>');

         IF c_pro%ISOPEN
         THEN
            CLOSE c_pro;

            OPEN c_pro;
         ELSE
            OPEN c_pro;
         END IF;

         LOOP
            FETCH c_pro
             INTO r_pro;

            EXIT WHEN c_pro%NOTFOUND;
            usp_print (   '<option value="'
                       || r_pro.pro_codigo
                       || '">'
                       || r_pro.pro_desc
                       || '</option>'
                      );
         END LOOP;

         CLOSE c_pro;
      END IF;

      usp_print ('</select>');
   EXCEPTION
      WHEN OTHERS
      THEN
         usp_print ('Ocurrio el siguiente error: ' || SQLERRM || ' - '
                    || SQLCODE
                   );
   END f_lista_prov;

   PROCEDURE f_lista_dis (
      ag_departamento   IN   VARCHAR2,
      ag_provincia      IN   VARCHAR2,
      v_modulo          IN   VARCHAR2
   )
/*
||     Author:         Cristina Zenteno Garcia
||    Overview:    Procedimiento que escribe en html el combobox con los distritos
||    Modificaciones:
||            03/07/2009  - CZG   -   Creaci¿n del procedimiento
*/
   IS
      CURSOR c_dis
      IS
         SELECT   dis_codigo, dis_desc
             FROM sease.dist_ubigeo
            WHERE dep_codigo = ag_departamento
              AND pro_codigo = ag_provincia
              AND dis_activo = 1
         ORDER BY 2;

      r_dis   c_dis%ROWTYPE;
   BEGIN
      usp_print ('<select name="ag_distrito" style="width:98%"');

      IF (ag_provincia < 0)
      THEN
         usp_print ('  disabled="true"');
      ELSE
         usp_print ('>');

         IF c_dis%ISOPEN
         THEN
            CLOSE c_dis;

            OPEN c_dis;
         ELSE
            OPEN c_dis;
         END IF;

         LOOP
            FETCH c_dis
             INTO r_dis;

            EXIT WHEN c_dis%NOTFOUND;
            usp_print (   '<option value="'
                       || r_dis.dis_codigo
                       || '">'
                       || r_dis.dis_desc
                       || '</option>'
                      );
         END LOOP;

         CLOSE c_dis;
      END IF;

      usp_print (' </select>');
   EXCEPTION
      WHEN OTHERS
      THEN
         usp_print ('Ocurrio el siguiente error: ' || SQLERRM || ' - '
                    || SQLCODE
                   );
   END f_lista_dis;

   PROCEDURE f_lista_ubigeo (v_modulo IN VARCHAR2)
/*
||    Author:         Cristina Zenteno Garcia
||    Overview:    Procedimiento que escribe en html las secciones de
||                        departamentos, provincias y distritos
||    Modificaciones:
||            03/07/2009  - CZG   -   Creaci¿n del procedimiento
*/
   IS
   BEGIN
      usp_print
         ('
       <script>
        function refrescarProvincias(vpid, vsdo, vobject)
            {   var dep = document.getElementById("ag_departamento").value;
                 var modulo = document.getElementById("v_modulo").value;
                 var args;
                 args = "&ag_departamento="+dep+"&v_modulo="+modulo;
                 llamarAjax(vobject, vpid, vsdo, args);
            }
        function refrescarDistritos(vpid, vsdo, vobject)
            {   var dep = document.getElementById("ag_departamento").value;
                var pro = document.getElementById("ag_provincia").value;
                var modulo = document.getElementById("v_modulo").value;
                var args;
                args = "&ag_departamento="+dep+"&ag_provincia="+pro+"&v_modulo="+modulo;
                llamarAjax(vobject, vpid, vsdo, args);
            }
      </script>'
         );
      usp_print
         ('
        <tr>
            <td class=c1>Departamento
            </td>
            <td class=c2>'
         );
      pku_administrar_users.f_lista_dep (v_modulo);
      usp_print
         ('
            </td>
            <td class=c3>Seleccione el departamento
            </td>
        </tr>
        </tr>
        <tr>
            <td class=c1>Provincia
            </td>
            <td class=c2>
                <div name="divProvincias" id="divProvincias" >
                </div>
            </td>
            <td class=c3>Seleccione la provincia
            </td>
        </tr>
        <tr>
            <td class=c1>Distrito
            </td>
            <td class=c2>
                <div name="divDistritos" id="divDistritos">
                </div>
            </td>
            <td class=c3>Seleccione el distrito
            </td>
        </tr>'
         );
   END f_lista_ubigeo;

   PROCEDURE f_get_tipoentidad
/*
||    Author:         Cristina Zenteno Garcia
||    Overview:    Procedimiento que lista los tipos de entidad
||    Modificaciones:
||            03/07/2009  - CZG   -   Creaci¿n del procedimiento
*/
   IS
      CURSOR c_tipent
      IS
         SELECT ROWNUM orden, tipo_desc
           FROM (SELECT DISTINCT (CASE TRIM
                                         (   UPPER
                                                (sease.entidadue_anho.act_ccodigo
                                                )
                                          || sease.entidadue_anho.ins_ccodigo
                                          || sease.entidadue_anho.amb_ccodigo
                                         )
                                     WHEN 'A1'
                                        THEN 'Gobierno Central'
                                     WHEN 'A61'
                                        THEN 'Gobierno Central'
                                     WHEN 'A62'
                                        THEN 'Gobierno Central'
                                     WHEN 'A2'
                                        THEN 'Instancia Descentralizada'
                                     WHEN 'A31'
                                        THEN 'Gobierno Distrital'
                                     WHEN 'A32'
                                        THEN 'Gobierno Provincial'
                                     WHEN 'A4'
                                        THEN 'Sociedad de Beneficencia P&uacute;blica'
                                     WHEN 'A5'
                                        THEN 'Gobierno Regional'
                                     WHEN 'B1'
                                        THEN 'Entidad de Tratamiento Empresarial'
                                     WHEN 'B2'
                                        THEN 'Entidades del FONAFE'
                                     ELSE TRIM
                                            (   UPPER
                                                   (sease.entidadue_anho.act_ccodigo
                                                   )
                                             || sease.entidadue_anho.ins_ccodigo
                                             || sease.entidadue_anho.amb_ccodigo
                                            )
                                  END
                                 ) tipo_desc
                            FROM sease.entidadue_anho
                           WHERE entidadue_anho.eue_anho =
                                                     TO_CHAR (SYSDATE, 'yyyy')
                             AND entidadue_anho.eue_activo = 1
                        ORDER BY 1);

      r_tipent   c_tipent%ROWTYPE;
   BEGIN
      usp_print ('<select name="ag_tipoent" style="width:98%">');

      IF c_tipent%ISOPEN
      THEN
         CLOSE c_tipent;

         OPEN c_tipent;
      ELSE
         OPEN c_tipent;
      END IF;

      LOOP
         FETCH c_tipent
          INTO r_tipent;

         EXIT WHEN c_tipent%NOTFOUND;
         usp_print (   '<option value="'
                    || r_tipent.tipo_desc
                    || '">'
                    || r_tipent.tipo_desc
                    || '</option>'
                   );
      END LOOP;

      CLOSE c_tipent;

      usp_print ('</select>');
   EXCEPTION
      WHEN OTHERS
      THEN
         usp_print ('Ocurrio el siguiente error: ' || SQLERRM || ' - '
                    || SQLCODE
                   );
   END f_get_tipoentidad;

   PROCEDURE mostraralerta (mensaje IN VARCHAR2)
   IS
   BEGIN
      usp_print ('<script>alert("' || mensaje || '");</script>');
   END;

/*----------------------- Public Modules ---------------------------*/
   PROCEDURE doviewprincipalusuarios (
      portlet__titulo        IN   VARCHAR2,
      session__anhoentidad   IN   VARCHAR2
   )
/*
||    Author:         Cristina Zenteno Garcia
||    Overview:    Procedimiento que escribe en html el cuadro de usuarios y
||                        entidades de la opcion principal del Modulo de Usuarios
||    Modificaciones:
||            01/07/2009  - CZG   -   Creaci¿n del procedimiento
*/
   IS
      vc_anho   VARCHAR2 (4);

      CURSOR c_usuarios (vc_anho VARCHAR2)
      IS
         SELECT   DECODE
                     (TRIM (   UPPER (sease.entidadue_anho.act_ccodigo)
                            || sease.entidadue_anho.ins_ccodigo
                            || sease.entidadue_anho.amb_ccodigo
                           ),
                      'A1', 'Gobierno Central',
                      'A61', 'Gobierno Central',
                      'A62', 'Gobierno Central',
                      'A2', 'Instancia Descentralizada',
                      'A31', 'Gobierno Distrital',
                      'A32', 'Gobierno Provincial',
                      'A4', 'Sociedad de Beneficencia P&uacute;blica',
                      'A5', 'Gobierno Regional',
                      'B1', 'Entidad de Tratamiento Empresarial',
                      'B2', 'Entidades del FONAFE',
                      TRIM (   UPPER (sease.entidadue_anho.act_ccodigo)
                            || sease.entidadue_anho.ins_ccodigo
                            || sease.entidadue_anho.amb_ccodigo
                           )
                     ) tipo_desc,
                  COUNT (DISTINCT sease.entidadue_anho.eue_codigo)
                                                                 num_ent_tot,
                  COUNT (DISTINCT sease.usuario.eue_codigo) num_ent_con_user,
                  SUM (DECODE (sease.usuario.usu_codigo, NULL, 0, 1)
                      ) num_user_x_ent
             FROM sease.entidadue_anho LEFT OUTER JOIN sease.usuario
                  ON apl_codigo = 1
                AND usu_activo = 1
                AND entidadue_anho.eue_codigo = usuario.eue_codigo
            WHERE entidadue_anho.eue_anho = vc_anho
              AND entidadue_anho.eue_activo = 1
         GROUP BY DECODE (TRIM (   UPPER (sease.entidadue_anho.act_ccodigo)
                                || sease.entidadue_anho.ins_ccodigo
                                || sease.entidadue_anho.amb_ccodigo
                               ),
                          'A1', 'Gobierno Central',
                          'A61', 'Gobierno Central',
                          'A62', 'Gobierno Central',
                          'A2', 'Instancia Descentralizada',
                          'A31', 'Gobierno Distrital',
                          'A32', 'Gobierno Provincial',
                          'A4', 'Sociedad de Beneficencia P&uacute;blica',
                          'A5', 'Gobierno Regional',
                          'B1', 'Entidad de Tratamiento Empresarial',
                          'B2', 'Entidades del FONAFE',
                          TRIM (   UPPER (sease.entidadue_anho.act_ccodigo)
                                || sease.entidadue_anho.ins_ccodigo
                                || sease.entidadue_anho.amb_ccodigo
                               )
                         );
   BEGIN
      vc_anho := session__anhoentidad;
      usp_print
         ('
    <table border="0" width=100% align=center class=tableform cellpadding=3 cellspacing=0>
        <tr>
            <th class="th1">Tipo de Entidad</b></th>
            <th class="th1">Total de Entidades</b></th>
            <th class="th1">Nro de Entidades con usuario</b></th>
            <th class="th1">Nro de Usuarios</b></th>
        </tr>'
         );

      FOR i_usr IN c_usuarios (vc_anho)
      LOOP
         usp_print
             (   '
        <tr>
            <td valign="top" align="left">'
              || i_usr.tipo_desc
              || '</td>
            <td valign="top" align="center">'
              || i_usr.num_ent_tot
              || '</td>
            <td valign="top" align="center">'
              || i_usr.num_ent_con_user
              || '</td>
            <td valign="top" align="center">'
              || i_usr.num_user_x_ent
              || '</td>
        '
             );
      END LOOP;

      usp_print ('
        </tr>
    </table>');
   EXCEPTION
      WHEN OTHERS
      THEN
         usp_print ('Ocurrio el siguiente error: ' || SQLERRM || ' - '
                    || SQLCODE
                   );
   END doviewprincipalusuarios;

   PROCEDURE doviewcrearusuario (
      portlet__titulo        IN   VARCHAR2,
      session__anhoentidad   IN   VARCHAR2,
      session__userid        IN   VARCHAR2 DEFAULT NULL,
      session__eue_codigo    IN   VARCHAR2
   )
/*
||    Author:         Cristina Zenteno Garcia
||    Overview:    Procedimiento que escribe en html el formulario para crear usuarios
||    Modificaciones:
||    01/07/2009  - CZG   -   Creaci¿n del procedimiento
*/
   IS
   BEGIN
      pku_administrar_users.dojavascriptajax;
      pku_administrar_users.dojavascriptcomun;
      pku_administrar_users.dojavascriptusuarios;

      usp_print
         ('<script>
         function comparaFechaHoy(fec1)
        {
            var fec2 = new Date();
            var Anio = (fec1).substr(6,4)
            var Mes = ((fec1).substr(3,2))*1 - 1
            var Dia = (fec1).substr(0,2)
            var Fecha_Inicio = new Date(Anio,Mes,Dia);
            var Anio2 = fec2.getFullYear();
            var Mes2 = fec2.getMonth();
            var Dia2 = fec2.getDate();
            var Fecha_Hoy = new Date(Anio2,Mes2,Dia2);
            if(Fecha_Inicio > Fecha_Hoy)
                return 1;
            else
            {
                if(Fecha_Inicio < Fecha_Hoy)
                    return 2;
                else
                    return 0;
            }
        }

            function RtnEntidad(codEnt,desc) {
              thisform.ag_codent.value=codEnt;
              thisform.ag_descent.value=desc;
              thisform.ag_usufun.focus();
            }
            function validarCampos() {
                var mensaje="";
                var correo = thisform.ag_usuemail.value;
                if (thisform.ag_usufun.value != "") {
                    if (vacio(thisform.ag_miembros.value)) {
                      mensaje="Debe seleccionar las opciones a las que el usuario tendra acceso";
                    }
                    if (thisform.ag_tipousu.selectedIndex == 0) {
                      mensaje="Seleccione el tipo de usuario";
                    }
                    if (vacio(thisform.ag_fecrecep.value) || comparaFechaHoy(thisform.ag_fecrecep.value) == 1) {
                      mensaje="El formato de la fecha de recepcion de la solicitud es incorrecto. No puede ser mayor a la fecha de hoy.";
                    }
                    if (vacio(thisform.ag_usufono.value)) //|| isNumber(thisform.ag_usufono.value)==false)
                    {   mensaje="No ha ingresado el telefono del usuario"; //. Debe tener solo d\xedgitos";  Memo 163-2011-SPLA
                    }
                    if (vacio(thisform.ag_usuemail.value) || validarEmail(correo)==false) {
                      mensaje="No ha ingresado el correo electr\xf3nico o el formato es incorrecto";
                    }
                    if (vacio(thisform.ag_usucargo.value) || cadenaValida(thisform.ag_usucargo.value)==false) {
                      mensaje="No ha ingresado el cargo del usuario o tiene caracteres invalidos";
                    }
                    if (vacio(thisform.ag_usunombre.value) || cadenaValida(thisform.ag_usunombre.value)==false) {
                      mensaje="No ha ingresado el nombre del usuario o tiene caracteres invalidos";
                    }
                    if ( vacio(thisform.ag_usudni.value) || (isNumber(thisform.ag_usudni.value)==false) || (thisform.ag_usudni.value.length!=8)) {
                      mensaje="No ha ingresado el DNI o no es valido ";
                    }
                    if (vacio(thisform.ag_solcargo.value) || cadenaValida(thisform.ag_solcargo.value)==false) {
                      mensaje="No ha ingresado el cargo del solicitante o tiene caracteres invalidos";
                    }
                    if (vacio(thisform.ag_solnombre.value) || cadenaValida(thisform.ag_solnombre.value)==false) {
                      mensaje="No ha ingresado el nombre del solicitante o tiene caracteres invalidos";
                    }
                    if (vacio(thisform.v_dis_codigo_vb.value))  {
                      mensaje="Seleccione la ubicacion Geografica del Organo Desconcentrado o Unidad Operativa";
                    }
                    if (vacio(thisform.ag_descdomicilio.value)) {
                      mensaje="No ha ingresado el domicilio del Organo Desconcentrado o Unidad Operativa";
                    }
                    if (vacio(thisform.ag_descuniope.value) || cadenaValida(thisform.ag_descuniope.value)==false) {
                      mensaje="No ha ingresado el Organo Desconcentrado o Unidad Operativa";
                    }
                    if (vacio(thisform.ag_codent.value)) {
                      mensaje="No ha seleccionado la Entidad";
                    }

                    if (mensaje == "") {
                    
                    if ( document.getElementById( "btnGuardar" )) {  
                          thisform.btnGuardar.disabled = true;
                       }
                    
                       accion(''dograbarnuevousuario'');
                       return true;}
                    else {
                      alert(mensaje);
                      return false; }
                }
                else {
                  alert("El campo Usuario-Funcionario esta vacio, esto puede deberse a dos motivos: (1) Le falta seleccionar la Entidad o ingresar el numero de DNI. (2) El Usuario ya existe y debe usar la opcion Modificar/Desactivar");
                }
            }
            function verUsuarioExiste( ) {
                var codent = thisform.ag_codent.value;
                var email = thisform.ag_usuemail.value;
                var nombre = thisform.ag_usunombre.value;
                var dni = thisform.ag_usudni.value;
                if ( email=="" && nombre == "" && dni =="" ) {
                  alert("Debe ingresar alguno de los siguientes datos: DNI, nombre o  correo electr\xf3nico del funcionario");
                }
                else {
                  llamarAjax("divListadoUsuarios",''mod_UsuarioCrear'',''doVerUsuarioExisteAjax'',
                    "&ag_codent="+codent+"&ag_usudni="+dni+"&ag_usunombre="+nombre+"&ag_usuemail="+email+"&ag_opcion=L");
                }
            }
            function generaUsuFun(objeto) {
                var codent = thisform.ag_codent.value;
                var dni = thisform.ag_usudni.value;

                if (objeto == "dni" && dni.length != 8) {
                    alert("El DNI debe tener 8 d\xedgitos");
                    return false;
                }
                if (dni != "" && codent != "") {
                   llamarAjax("divGeneraUsuario",''mod_UsuarioCrear'',''doAutoGeneraUsuarioAjax'',
                                "&ag_codent="+codent+"&ag_usudni="+dni);

                    var obj = document.getElementById("divListadoUsuarios");
                     obj.innerHTML = "";
                }
             }
           </script>');

      usp_print
         (' <script>
            function validaParametros() {
              var flag = false;
              if ( (thisform.ag_departamento.value == "99" || thisform.ag_departamento.value == "00") &&
                 (thisform.ag_provincia.value == "99" || thisform.ag_provincia.value == "00") &&
                 (thisform.ag_distrito.value == "99" || thisform.ag_distrito.value == "00")) {
                 alert("Seleccione la ubicaci\xf3n geogr\xe1fica");
              }
            }
           </script>' );


   usp_print('<INPUT name="tipo_ubi" type="hidden"/> ');

      usp_print
         (   '
    <table border="0" width=100% align=center class=tableform cellpadding=0 cellspacing=0>
        <tr>
            <td>
                <h3>'
          || portlet__titulo
          || '</h3>
            </td>
            <td align="right" valign=top width="50%">
                <div name="divBotones" id="divBotones">
                    <input type="button" name="btnVerUsuarios" value="Ver Usuarios Similares" onclick="verUsuarioExiste();" />
                    &nbsp;
                    <input type="button" name="btnGuardar"  id="btnGuardar" value="Guardar" OnClick="validarCampos()"/>
                </div>
            </td>
        </tr>
    </table>
    <br>
    <table border="0" width=100% align=center class=tableform cellpadding=3 cellspacing=0>
        <tr>
            <td colspan="3"><h4>Datos de la Entidad</h4></td>
        </tr>
        <tr>
            <td class=c1>Entidad</td>
            <td class=c2>
                <input name="ag_descent" type="text" style="width:91%"
                    class=ViewSelect onclick="abrir(''mod_UsuarioCrear'',''doBuscarEntidad'','''',''wbuscaEntidad'')" value="" readonly="true" onblur="generaUsuFun(''entidad'');"/>
                <input name="ag_codent" type="hidden" value="" /></td>
            <td class=c3>Seleccione la entidad.</td>
        </tr>
        <tr>
            <td class=c1>Organo Desconcentrado o Unidad Operativa</td>
            <td class=c2>
                <input type="text" name="ag_descuniope" maxlength="100" style="width:98%"/></td>
            <td class=c3>Ingrese el Organo Desconcentrado o Unidad Operativa al que pertence el usuario, si corresponde.</td>
        </tr>
        <tr>
            <td class=c1>Domicilio</td>
            <td class=c2>
                <input type="text" name="ag_descdomicilio" maxlength="100" style="width:98%"/></td>
            <td class=c3>Ingrese el domicilio del &oacute;rgano Desconcentrado o de la Unidad Operativa, de no tenerla ser&aacute; de la Sede Central.</td>
        </tr>
        <tr>
            <td colspan="3"><h4>Ubicaci&oacute;n Geogr&aacute;fica de &oacute;rgano Desconcentrado o Unidad Operativa</h4></td>
        </tr>
       ' );
--    pku_administrar_users.f_lista_ubigeo ('mod_UsuarioCrear');

    usp_print (f_get_ubigeo_ue(null,null,null));

    usp_print
         ( '
        <tr>
            <td colspan="3"><h4>Datos del Solicitante</h4></td>
        </tr>
        <tr>
            <td class=c1>Nombre</td>
            <td class=c2>
                <input type="text" name="ag_solnombre" maxlength="60" style="width:98%"/></td>
            <td class=c3>Ingrese el nombre del solicitante.</td>
        </tr>
        <tr>
            <td class=c1>Cargo</td>
            <td class=c2>
                <input type="text" name="ag_solcargo" maxlength="60" style="width:98%"/></td>
            <td class=c3>Ingrese el cargo del solicitante.</td>
        </tr>
        <tr>
            <td colspan="3"><h4>Datos del Funcionario - Usuario</h4></td>
        </tr>
        <tr>
            <td class=c1>DNI</td>
            <td class=c2>
                <input type="text" name="ag_usudni" maxlength="8" style="width:98%" onblur="generaUsuFun(''dni'');"/></td>
            <td class=c3>Ingrese el DNI.</td>
        </tr>
        <tr>
            <td class=c1>Funcionario - Usuario</td>
            <td class=c2>
                <div name="divGeneraUsuario" id="divGeneraUsuario" onchange="verifica();">
                    <input readonly name="ag_usufun" maxlength="20" style="width:98%;background-color:#F5F5F5;"/></div>
                <div name="divListadoUsuarios" id="divListadoUsuarios">&nbsp;</div>
             </td>
            <td class=c3>
                El usuario se genera autom&aacute;ticamente al seleccionar la Entidad e ingresar el DNI del funcionario.
        </tr>
        <tr>
            <td class=c1>Nombre</td>
            <td class=c2>
                <input type="text" name="ag_usunombre" maxlength="100" style="width:98%"/></td>
            <td class=c3>Ingrese el nombre.</td>
        </tr>
        <tr>
            <td class=c1>Cargo</td>
            <td class=c2>
                <input type="text" name="ag_usucargo" maxlength="60" style="width:98%"/></td>
            <td class=c3>Ingrese el cargo.</td>
        </tr>
        <tr>
            <td class=c1>Correo Electr&oacute;nico</td>
            <td class=c2>
                <input type="text" name="ag_usuemail" maxlength="60" style="width:98%"/></td>
            <td class=c3>Ingrese el correo electr&oacute;nico.</td>
        </tr>
        <tr>
            <td class=c1>Tel&eacute;fono</td>
            <td class=c2>
                <input type="text" name="ag_usufono" maxlength="50" style="width:98%"/></td>
            <td class=c3>Ingrese el tel&eacute;fono</td>
        </tr>
        <tr>
            <td class=c1>Estado</td>
            <td class=c2>
                <select name="ag_estado" style="width:98%" disabled>
                        <option value="1" selected>Activo</option>
                        <option value="0">Inactivo</option>
                </select></td>
            <td class=c3>Seleccione el estado.</td>
        </tr>
        <tr>
            <td class=c1>Fecha de recepci&oacute;n de solicitud</td>
            <td class=c2>
                <input readonly name="ag_fecrecep" style="width:90%" class=CalSelect  onclick="calendario(this)"></td>
            <td class=c3>Ingrese la fecha de recepci&oacute;n de la solicitud.</td>
        </tr>
        <tr>
            <td class=c1>Fecha de creaci&oacute;n</td>
            <td class=c2>
                <input readonly name="ag_feccre" style="width:98%;background-color:#F5F5F5;" value="'
          || TO_CHAR (SYSDATE, 'dd/MM/yyyy')
          || '"></td>
            <td class=c3>La fecha de creaci&oacute;n se obtiene por defecto.</td>
        </tr>
        <tr>
            <td class=c1>Funcionario - Usuario</td>
            <td class=c2>
                <select name="ag_tipousu" style="width:98%" onChange="refrescarPerfiles(''mod_UsuarioCrear'',''doVerPerfilesAjax'',''divPerfiles'',thisform.ag_codent.value);" >
                        <option value="0">Seleccione tipo de usuario</option>
                        <option value="1">Funcionario-Usuario Entidades</option>
                        <option value="2">Funcionario-Usuario OSCE</option>
                 </select></td>
            <td class=c3>Seleccione el tipo de usuario funcionario</td>
        </tr>
        <tr>
            <td colspan="3"><div name="divPerfiles" id="divPerfiles">
                <input name="ag_miembros" type="hidden" value=""/></div>
            </td>
        </tr>
    </table>
    <br>'
         );

  /*usp_print('
    <script>
        document.getElementById(''ag_departamento'').value = "15";
        refrescarProvincias(''mod_UsuarioCrear'',''dolistarprovincias'',''divProvincias'');
        document.getElementById(''ag_provincia'').value = "01";
        refrescarDistritos(''mod_UsuarioCrear'',''dolistardistritos'',''divDistritos'');
        document.getElementById(''ag_distrito'').value = "01";
    </script>'
            );*/

   EXCEPTION
      WHEN OTHERS
      THEN
         usp_print ('Ocurrio el siguiente error: ' || SQLERRM || ' - '
                    || SQLCODE
                   );
   END doviewcrearusuario;

   PROCEDURE doviewmodificar_busqueda (
       portlet__titulo        IN VARCHAR2,
       session__anhoentidad   IN VARCHAR2
       )
/*
||    Author:         Cristina Zenteno Garcia
||    Overview:    Procedimiento que escribe en html la pagina con los parametros para
||                        buscar usuarios
||    Modificaciones:
||            01/07/2009  - CZG   -   Creaci¿n del procedimiento
*/
   IS
   BEGIN

      --usp_print('A¿o Entidad: '||session__anhoentidad||'<br>');

      pku_administrar_users.dojavascriptcomun;
      usp_print ('
      <script>
            function RtnEntidad(codEnt,desc)
            {   thisform.ag_codent.value=codEnt;
                thisform.ag_descent.value=desc;
            }
            function buscarUsuario()
            {   if (thisform.ag_codent.value != "" || thisform.ag_usunombre.value != "")
                {   thisform.scriptdo.value="doBuscarUsuarios";
                    thisform.submit();
                }
                else
                {   alert("Debe seleccionar la entidad o ingresar el nombre del usuario a buscar");
                    return;
                }
            }
      </script> ');

      usp_print('
    <table border="0" width=100% align=center class=tableform cellpadding=3 cellspacing=0>
        <tr>
            <td colspan ="3">
              <h3>Busqueda de Usuarios</h3>
                <input name="ag_opcion" type="hidden" value="B"/>
              </br>
            </td>
        </tr>
        <tr>
            <td class=c1>Entidad</td>
            <td class=c2>
                <input name="ag_descent" type="text" style="width:300px"
                    class=ViewSelect onclick="abrir(''mod_UsuarioCrear'',''doBuscarEntidad'','''',''wbuscaEntidad'')" value="" readonly="true"/>
                <input name="ag_codent" type="hidden" value=""/></td>
            <td class=c3>Seleccione la entidad.</td>
        </tr>
        <tr>
            <td class=c1>Nombre</td>
            <td class=c2>
                <input type="text" name="ag_usunombre" maxlength="100" style="width:95%"/></td>
            <td class=c3>Ingrese el nombre del usuario</td>
        </tr>
        <tr>
            <td class=c1>&nbsp;</td>
            <td class=c2 align=center>
                <input type="button" name="btnBuscar" style="width:20%" value="Buscar" OnClick="buscarUsuario();"/></td>
            <td class=c3>&nbsp;</td>
        </tr>
    </table>
    ' );
   END doviewmodificar_busqueda;

   PROCEDURE doviewbuscarusuarios (
      portlet__titulo        IN   VARCHAR2,
      session__anhoentidad   IN   VARCHAR2,
      ag_codent              IN   VARCHAR2,
      ag_usunombre           IN   VARCHAR2,
      ag_usudni              IN   VARCHAR2 DEFAULT NULL,
      ag_usuemail            IN   VARCHAR2 DEFAULT NULL,
      ag_opcion              IN   VARCHAR2,
      ag_currentpage         IN   VARCHAR2 := 1
   )
/*
||    Author:         Cristina Zenteno Garcia
||    Overview:    Procedimiento que escribe en html la pagina el resultado de la busqueda
||                        de usuarios
||    Modificaciones:
||            30/06/2009  - CZG   -   Creaci¿n del procedimiento
*/
   IS
      lv_currentpage   NUMBER;
      lv_num_users     NUMBER;
      lv_num           NUMBER;
      lv_iterador      NUMBER                    NOT NULL DEFAULT 0;

      CURSOR c_listausuarios (
         v_opcion        IN   VARCHAR2,
         v_anhoentidad   IN   VARCHAR2,
         v_codent        IN   VARCHAR2,
         v_nomusu        IN   VARCHAR2,
         v_usudni        IN   VARCHAR2,
         v_usuemail      IN   VARCHAR2,
         v_currentpage   IN   VARCHAR2
      )
      IS
         SELECT *
           FROM (SELECT ROWNUM num, a.*
                   FROM (  SELECT TRIM (usuario.usu_codigo) usu_codigo,
                                  usuario.usu_nombre,
                                  usuario.eue_codigo,
                   --modificacion memo 402
                                  usuario.usu_fecacc,
                                  (SELECT e.eue_desc
                                     FROM sease.entidadue_anho e
                                    WHERE e.eue_codigo = usuario.eue_codigo
                                      AND e.eue_anho = TO_CHAR (SYSDATE, 'yyyy')) eue_desc,
                                   usuario.usu_dni,
                                   TRIM(usuario.usu_email) usu_email, ----MMAUTINO: EL DIA 01.07.2015 SE AGREGA TRIM AL CAMPO USU_EMAIL
                                  (CASE usuario.usu_activo WHEN 1 THEN 'Activo' ELSE 'Inactivo' END) usu_activo,
                                  TO_CHAR (usu_frecepciondcto, 'dd/MM/yyyy') usu_frecepciondcto,
                                  TO_CHAR (usu_fcreacion, 'dd/MM/yyyy') usu_fcreacion,
                                  usu_creacion,
                                  TO_CHAR (fec_ult_modi, 'dd/MM/yyyy') fec_ulti_modi
                             FROM sease.usuario
                            WHERE (    ( usuario.eue_codigo = v_codent OR v_codent IS NULL )
                                   AND ( (UPPER (TRIM (usuario.usu_nombre)) LIKE '%' || UPPER (TRIM (v_nomusu)) ||'%' )
                                        OR (TRIM (usuario.usu_codigo) LIKE  '%' || TRIM (v_nomusu) || '%' ) )
                                   AND v_opcion = 'B' )
                               OR (   (  usuario.usu_dni = v_usudni
                                       AND v_usudni IS NOT NULL
                                      )
                                   OR (  TRIM (usuario.usu_email) = TRIM (v_usuemail)
                                       AND v_usuemail IS NOT NULL
                                      )
                                   OR     (    UPPER (TRIM (usuario.usu_nombre)) LIKE  '%' || UPPER (TRIM (v_nomusu)) || '%'
                                           AND v_nomusu IS NOT NULL
                                          )
                                      AND v_opcion = 'L'
                                  )
                         ORDER BY usuario.usu_codigo) a) b
          WHERE b.num BETWEEN 15 * (TO_NUMBER (v_currentpage) - 1) + 1
                          AND 15 * TO_NUMBER (v_currentpage);

      r_usuario        c_listausuarios%ROWTYPE;
   BEGIN
     usp_print('
      <script>
        function verHistorial(codigo) {
          abrir(''mod_UsuarioModificar'',''doviewHistorial'',''&ag_usufun=''+codigo,''wModificarGrupo'');
        }
      </script>
      '
      );

      IF ag_currentpage IS NULL
      THEN
         lv_currentpage := 1;
      ELSE
         lv_currentpage := ag_currentpage;
      END IF;

      IF ag_opcion = 'B'
      THEN
         SELECT COUNT (*)
           INTO lv_num_users
           FROM sease.usuario
          WHERE (usuario.eue_codigo = ag_codent OR ag_codent IS NULL)
            AND ( (UPPER (TRIM (usuario.usu_nombre)) LIKE '%' || UPPER (TRIM (ag_usunombre)) || '%' )
                 OR (TRIM (usuario.usu_codigo) LIKE  '%' || TRIM (ag_usunombre) || '%'  ) );
      ELSIF ag_opcion = 'L'
      THEN
         SELECT COUNT (*)
           INTO lv_num_users
           FROM sease.usuario
          WHERE (usuario.usu_dni = ag_usudni AND ag_usudni IS NOT NULL)
             OR (   TRIM (usuario.usu_email) = TRIM (ag_usuemail)
                 AND ag_usuemail IS NOT NULL )
             OR (   UPPER (TRIM (usuario.usu_nombre)) LIKE '%' || UPPER (TRIM (ag_usunombre)) || '%'
                 AND ag_usunombre IS NOT NULL );
      END IF;

     --usp_print('A¿o Entidad: '||session__anhoentidad||'<br>');

      pku_administrar_users.dojavascriptcomun;
      usp_print
         ('
        <table border="0" width=100% align=center class=tableform cellpadding=3 cellspacing=0>
            <tr>
                <td width="100%"><h3>' );

      IF ag_opcion = 'L'
      THEN
         usp_print ('Listar Usuarios');
      ELSIF ag_opcion = 'B'
      THEN
         usp_print ('Resultado de B&uacute;squeda de Usuarios');
      END IF;

      usp_print
         (   '</h3></td>
                <td align="right" valign=top width="50%">
                    '
          || CASE ag_opcion
                WHEN 'B'
                   THEN '<input type="button" name="l" value="Volver" OnClick="inicio()"/>'
                WHEN 'L'
                   THEN '<input type="button" name="c" value="Cerrar" OnClick="cerrar()"/>'
             END
          || '
            </td>
            </tr>');

      IF ag_opcion = 'L'
      THEN
         usp_print ('
        <tr>
            <td colspan="2" >
                <br><b>
                <h4>Se encontraron resultados por:</h4><br>' ||
                CASE WHEN ag_usunombre IS NOT NULL THEN 'Nombre de Usuario: ' ||ag_usunombre ||'<br>' ELSE '' END ||
                CASE WHEN ag_usudni IS NOT NULL THEN 'DNI: ' || ag_usudni ||' <br>' ELSE '' END ||
                CASE WHEN ag_usuemail IS NOT NULL THEN 'Correo Electr&oacute;nico: ' || ag_usuemail  ELSE '' END ||
            '</b></td>
        </tr>');
      END IF;

       usp_print( '</table>
        <br>' );
      showpaginacion (lv_currentpage,
                      lv_num_users,
                         'ag_codent='
                      || ag_codent
                      || '&ag_usunombre='
                      || ag_usunombre
                      || '&ag_usudni='
                      || ag_usudni
                      || '&ag_usuemail='
                      || ag_usuemail
                      || '&ag_opcion='
                      || ag_opcion,
                      '&scriptdo=doBuscarUsuarios',
                      15
                     );
      usp_print
         ('
    <table border="0" width=100% align=center class=tableform cellpadding=3 cellspacing=0>
        <tr>
            <th class="th1">Usuario</b></th>
            <th class="th1">Nombre</b></th>
            <th class="th1">Entidad</b></th>
            <th class="th1">DNI</b></th>
            <th class="th1">E-mail</b></th>
            <th class="th1">Fecha<br>Creaci&oacute;n</b></th>
            <th class="th1">Fecha<br>Modifi.</b></th>
            <th class="th1">Estado</b></th>
            <th class="th1">Adm.<br>Usuario</b></th>
<!--modificacion memo 402-->
            <th class="th1">Ult. Fecha<br/>Ingreso al<br/>Sistema</b></th>
            <th class="th1">Ver<br>Historial</b></th>
         '
         );
      lv_num := 0;

      IF c_listausuarios%ISOPEN
      THEN
         CLOSE c_listausuarios;

         OPEN c_listausuarios (ag_opcion,
                               session__anhoentidad,
                               ag_codent,
                               ag_usunombre,
                               ag_usudni,
                               ag_usuemail,
                               lv_currentpage
                              );
      ELSE
         OPEN c_listausuarios (ag_opcion,
                               session__anhoentidad,
                               ag_codent,
                               ag_usunombre,
                               ag_usudni,
                               ag_usuemail,
                               lv_currentpage
                              );
      END IF;

      LOOP
         FETCH c_listausuarios
          INTO r_usuario;

         EXIT WHEN c_listausuarios%NOTFOUND;
         lv_num := lv_num + 1;

         IF MOD (lv_num, 2) = 0
         THEN
            usp_print ('
        <tr bgcolor="#ECE9D8">');
         ELSE
            usp_print ('
        <tr>');
         END IF;

         usp_print ('
            <td valign="top" align="center">');

         IF ag_opcion = 'L'
         THEN
            usp_print (r_usuario.usu_codigo);
         ELSIF ag_opcion = 'B'
         THEN
            usp_print (makea (   'ag_usufun='
                              || r_usuario.usu_codigo
                              || '&ag_codent='
                              || r_usuario.eue_codigo
                              || '&scriptdo=doModificarUsuario',
                              '' || r_usuario.usu_codigo || ''
                             )
                      );
         END IF;

/*
            <td valign="top" align="center">'
             || usu_frecepciondcto --r_usuario.usu_fcreacion
             || '</td>
            <!--td valign="top" align="center">'
             --|| r_usuario.fec_ulti_modi
             --|| '</td-->
            <td valign="top" align="center">'
             || r_usuario.usu_activo
             || '</td>'
*/
         usp_print
            (   '</td>
            <td valign="top" align="left">'
             || r_usuario.usu_nombre
             || '</td>
            <td valign="top" align="left">'
             || r_usuario.eue_desc
             || '</td>
            <td valign="top" align="center">'
             || r_usuario.usu_dni
             || '</td>
            <td valign="top" align="left">'
             || r_usuario.usu_email
             || '</td>
            <td valign="top" align="center">'
             || r_usuario.usu_fcreacion
             || '</td>
            <td valign="top" align="center">'
             || r_usuario.fec_ulti_modi
             || '</td>
            <td valign="top" align="center">'
             || r_usuario.usu_activo
             || '</td>
            <td valign="top" align="center">'
             || r_usuario.usu_creacion
             ||--modificacion memo 402 
             '</td> 
             <td valign="top" align="center">'
             || r_usuario.usu_fecacc
             || '</td>
            <td valign="top" align="center">
              <input type="button" name="btnVer" value="..." onclick="verHistorial('''
             || r_usuario.usu_codigo
             || ''');">
             </td>'
            );
      END LOOP;

      IF c_listausuarios%ISOPEN
      THEN
         CLOSE c_listausuarios;
      END IF;

      usp_print
              ('
        </tr>
    </table>');
      showpaginacion (lv_currentpage,
                      lv_num_users,
                         'ag_codent='
                      || ag_codent
                      || '&ag_usunombre='
                      || ag_usunombre
                      || '&ag_usudni='
                      || ag_usudni
                      || '&ag_usuemail='
                      || ag_usuemail
                      || '&ag_opcion='
                      || ag_opcion,
                      '&scriptdo=doBuscarUsuarios',
                      15
                     );
   EXCEPTION
      WHEN OTHERS
      THEN
         usp_print ('Ocurrio el siguiente error: ' || SQLERRM || ' - ' || SQLCODE );
   END doviewbuscarusuarios;

   PROCEDURE doviewmodificarusuario (
      portlet__titulo        IN   VARCHAR2,
      session__anhoentidad   IN   VARCHAR2,
      session__userid        IN   VARCHAR2 DEFAULT NULL,
      session__eue_codigo    IN   VARCHAR2,
      ag_usufun              IN   VARCHAR2,
      ag_codent              IN   VARCHAR2
   )
/*
||    Author:         Cristina Zenteno Garcia
||    Overview:    Procedimiento que escribe en html el formulario para modificar usuarios
||    Modificaciones:
||            02/07/2009  - CZG   -   Creaci¿n del procedimiento
*/
   IS
      lv_tipousu   sease.usuario.usu_tipo%TYPE;

      --cambio arbitro nueva ley
      cTipousu sease.usuario.usu_tipo%TYPE;
      CURSOR c_modificar
      IS
         SELECT u.usu_codigo      , u.usu_nombre        , u.usu_obs         , u.eue_codigo,
                e.eue_desc        , u.usu_activo        , TRIM(u.usu_email) usu_email       ,    --MMAUTINO: EL DIA 01.07.2015 SE AGREGA TRIM AL CAMPO USU_EMAIL
                u.usu_instraprobacion,
                u.usu_nomaprobador, u.usu_cargoaprobador, u.usu_telefono    , u.usu_fax,
                u.usu_direccion   , u.usu_dni           , u.usu_cargousuario, u.usu_frecepciondcto,
                TO_CHAR (u.usu_fcreacion, 'dd/MM/yyyy') usu_fcreacion,
                usu_tipo          , u.eue_descripcion   , u.eue_direccion   ,
                u.dep_codigo,
                u.pro_codigo      , u.dis_codigo
           FROM sease.usuario u LEFT OUTER JOIN sease.entidadue_anho e
                ON u.eue_codigo = e.eue_codigo AND e.eue_codigo = ag_codent
          WHERE usu_codigo = RPAD (ag_usufun, 30)
            AND e.eue_anho = session__anhoentidad;
--cambio arbitro nueva ley
CURSOR c_modificar_arb
      IS
         select a.usu_codigo, a.usu_nombre, TRIM(a.usu_email) usu_email , ----MMAUTINO: EL DIA 01.07.2015 SE AGREGA TRIM AL CAMPO USU_EMAIL 
                a.usu_telefono, b.c_ruc, b.v_nombre, b.v_apellido_pat, a.usu_miembros,
                b.v_apellido_mat, b.c_cod_colegiatura, b.n_num_colegiatura, c.dep_desc, a.usu_fcreacion, a.usu_activo  
         from sease.usuario a
          inner join sease.tbl_usu_arbitro b
            on a.usu_codigo = b.c_usu and a.apl_codigo = b.n_aplcodigo
          left join sease.dep_ubigeo c on b.c_cod_colegiatura = c.dep_codigo
         where /*a.usu_activo = 1
           and*/ a.usu_tipo = '3'
           and trim(b.c_usu) = trim(ag_usufun);
           
           
        CURSOR c_perfiles
      IS
         SELECT   a.usu_codigo, a.usu_nombre, a.usu_coment, flag
             FROM (SELECT TRIM (usu.usu_codigo) usu_codigo, usu.usu_nombre, usu.usu_coment,
                          CASE
                             WHEN INSTR
                                    ((select a1.usu_miembros from sease.usuario a1 where trim(usu_codigo) = trim(ag_usufun)),
                                     TRIM (usu.usu_codigo)
                                     ) >= 1
                             THEN '1'
                             ELSE '0'
                          END flag
                     FROM sease.usuario usu
                    WHERE usu.usu_activo = 1
                      AND usu.apl_codigo = 1
                      AND usu.usu_tipo = 3
                      and usu_coment is not null
                      AND usu.eue_codigo IS NULL) a
         ORDER BY TRIM (a.usu_nombre) ASC;
         
         
   cursor cColegioAbogados is 
   select a.n_id_maestro, a.c_descripcion, a.c_comentario 
   from arbitraje.tbl_arb_maestro a where a.n_id_tipomaestro = 24;
   
   cursor cEstadoUsuario is
   select n_id_maestro, n_id_tipo_maestro, c_descripcion   
   from sease.tbl_usuario_maestro where n_id_maestro = 1;


      r_perfil      c_perfiles%ROWTYPE; 
      r_usuario    c_modificar%ROWTYPE;
   BEGIN
      pku_administrar_users.dojavascriptajax;
      pku_administrar_users.dojavascriptcomun;

      SELECT usu_tipo
        INTO lv_tipousu
        FROM sease.usuario
       WHERE usu_codigo = RPAD (session__userid, 30)
         AND eue_codigo = session__eue_codigo
         AND usu_activo = 1;
--cambios arbitro nueva ley
         SELECT usu_tipo
        INTO cTipousu
        FROM sease.usuario
       WHERE trim(usu_codigo) = trim(ag_usufun);         
         
         if cTipousu = 3 then
           
usp_print('<style type="text/css">
   .c1, .c2 {text-align: left}
   
   </style>');
         
usp_print('<script type="text/javascript">

   function deshabilita_ck(control) {
          var elementos = thisform.elements.length;
          var name;
          for (j = 0 ; j< elementos ; j++){
            name = thisform.elements[j].name;
            if( name.indexOf(control) >= 0) {
              thisform.elements[j].checked = false;
              thisform.elements[j].disabled = true;
            }
          }
        }
   function habilita_ck(control) {
          var elementos = thisform.elements.length;
          var name;
          for (j = 0 ; j< elementos ; j++){
            name = thisform.elements[j].name;
            if( name.indexOf(control) >= 0) {
              thisform.elements[j].disabled = false;
            }
          }
       }

   function evalua(obj)
              {
             var check = document.getElementById("ck"+obj);

                if (check.checked){
                    add(obj);
                }
                else {
                    del(obj);
                }
             }
   function add(cadena)
             {  var grupos = thisform.ag_miembros.value;
                 if (cadena == "OCI" || cadena == "CONTRALORIA" || cadena == "PROVEEDOR_ENTIDAD" || cadena == "SUPERVISOR_OSCE" || cadena == "PROVEEDOR_ELECTRONICA")
                 {  var obj;
                     deshabilita_ck("ck");
                     habilita_ck("ck"+cadena);
                     obj = document.getElementById("ck"+cadena);
                     obj.checked=true;
                     thisform.ag_miembros.value = cadena + ",";
                 }
                 else
                 {  var pos = grupos.indexOf(cadena);
                     if (pos < 0) {thisform.ag_miembros.value = grupos + cadena  + ",";}
                 }
             }

   function del(cadena)
             {  var grupos = thisform.ag_miembros.value;
                if (cadena == "OCI" || cadena == "CONTRALORIA" || cadena == "PROVEEDOR_ENTIDAD" || cadena == "SUPERVISOR_OSCE"  || cadena == "PROVEEDOR_ELECTRONICA")
                {   var obj;
                     habilita_ck("ck");
                     thisform.ag_miembros.value = "";
                }
                else
                {
                     var temp1 = "";
                     var temp2 = "";
                     var pos = grupos.indexOf(cadena)
                     if (pos >= 0)
                     {  temp1 = grupos.substr(0, pos);
                         temp2 = grupos.substr(pos + cadena.length + 1, grupos.length - (pos + cadena.length));
                         thisform.ag_miembros.value = temp1 + temp2;
                     }
                 }
             }  
             
    function isEmail(s)
        {
           // alert(s)
            for (i = 0; i < s.length; i++)
            {
                var c = s.charAt(i);
            if (c == " ") return false;
            }
            var i = 1;
            var sLength = s.length;

            while ((i < sLength) && (s.charAt(i) != "@"))
            { i++ }

            if ((i >= sLength) || (s.charAt(i) != "@")) return false;
            else i += 2;

            var cont = 0
            while (i < sLength)
            {
               var c = s.charAt(i);
               if (c == ".") cont++
             i++
            }
           // alert("termino");
         if ((cont == 0) || (cont > 2)) return false
         else return true
        }         
         
    function editaArbitro(){
      
    if(thisform.cColegio.value.length == 0){
    alert("No ha seleccionado el colegio");
    thisform.cColegio.style.border = "solid #C50103 1px";
    thisform.cColegio.focus();
    return false;    
    }else{
    thisform.cColegio.style.border="solid #7F9DB9 1px";
    }
    
    if(thisform.cColegiatura.value.length == 0){
    alert("No ha ingresado el n\xfamero de colegiatura");
    thisform.cColegiatura.style.border = "solid #C50103 1px";
    thisform.cColegiatura.focus();
    return false;    
    }else{
    thisform.cColegiatura.style.border="solid #7F9DB9 1px";
    }
    
    if(thisform.cCorreo.value.length == 0){
    alert("No ha ingresado el correo electr\xf3nico");
    thisform.cCorreo.style.border = "solid #C50103 1px";
    thisform.cCorreo.focus();
    return false;    
    }else{
    thisform.cCorreo.style.border="solid #7F9DB9 1px";    
    if (!(isEmail(thisform.cCorreo.value)))
            {
              alert("Ingrese un formato correcto para el correo del usuario");
              thisform.cCorreo.style.border = "solid #C50103 1px";
              thisform.cCorreo.focus();
              return false;
              }
    }
    
    if(thisform.cTelefono.value.length == 0){
    alert("No ha ingresado el n\xfamero telef\xf3nico");
    thisform.cTelefono.style.border = "solid #C50103 1px";
    thisform.cTelefono.focus();
    return false;    
    }else{
    thisform.cTelefono.style.border="solid #7F9DB9 1px";
    }
    
    if(thisform.cDoc.value.length == 0){
    alert("No ha ingresado el documento");
    thisform.cDoc.style.border = "solid #C50103 1px";
    thisform.cDoc.focus();
    return false;    
    }else{
    thisform.cDoc.style.border="solid #7F9DB9 1px";
    }
    
    if(thisform.ag_fecrecep.value.length == 0){
    alert("No ha ingresado la fecha de recepci\xf3n");
    thisform.ag_fecrecep.style.border = "solid #C50103 1px";
    thisform.ag_fecrecep.focus();
    return false;    
    }else{
    thisform.ag_fecrecep.style.border="solid #7F9DB9 1px";
    }
    
    if(thisform.cObservaciones.value.length == 0){
    alert("No ha ingresado la observaci\xf3n");
    thisform.cObservaciones.style.border = "solid #C50103 1px";
    thisform.cObservaciones.focus();
    return false;    
    }else{
    thisform.cObservaciones.style.border="solid #7F9DB9 1px";
    }
    
    if (confirm("¿Est\xe1 seguro que desea Modificar el usuario? ")) {
          thisform.scriptdo.value = "doEditaArbitro";
          thisform.submit();
         }
    }
           
   function reenviarPaswdArb()
        {   thisform.scriptdo.value = "doNotificaArbitro";
                thisform.submit();
        }  
         
         </script>');
           
    for xrow_arb in  c_modificar_arb loop    
    
    --campos ocultos
    usp_print('<input type="hidden" value="'||xrow_arb.usu_email||'" name="cCorreo" id="cCorreo"/>');  
    
    
         
         usp_print('<div align="center">
   <table border="0" class=tableform cellpadding="3" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="85%">
        <tr>
            <td align="left" >
                <h3>Modificar Usuario</h3>
            </td>
            <td></td>
            <td width="40%">
                    <input type="button" name="btnReenviar" value="Nueva contrase&ntilde;a / Enviar" OnClick="reenviarPaswdArb()"/>
                    &nbsp;
                    <input type="button" name="btnGuardar" value="Guardar" OnClick="editaArbitro()"/>
            </td>
        </tr>    
   
        <tr>
           <td align="left"><h4>Datos del Presidente Arbitral o &Aacute;rbitro &Uacute;nico</h4></td>
           <td></td>
           <td></td>
        </tr>
  
         <tr>
            <td class=c1 align="left">RUC</td>
            <td class=c1><input type="text" style="background-color:#D2D2D2; border:solid #6C6C6C 1px;" readOnly=readOnly   value="'||xrow_arb.c_ruc||'" name="cRuc" id="cRuc" size="46"/></td>
            <td class=c1></td>
        </tr>
       
       <tr>
          <td class=c1>Nombre(s)</td>
          <td class=c1><b><input type="text" style="background-color:#D2D2D2; border:solid #6C6C6C 1px;" readOnly=readOnly  value="'||xrow_arb.v_nombre||'" name="cNombre" id="cNombre" size="46"/></td>
          <td class=c1></td>
       </tr>
       
       <tr>
          <td class=c1>Apellido Paterno</td>
          <td class=c1><b><input type="text" style="background-color:#D2D2D2; border:solid #6C6C6C 1px;" readOnly=readOnly  value="'||xrow_arb.v_apellido_pat||'" name="cApellidoPat" id="cNombre" size="46"/></td>
          <td class=c1></td>
       </tr>
       
       <tr>
          <td class=c1>Apellido Materno</td>
          <td class=c1><b><input type="text" style="background-color:#D2D2D2; border:solid #6C6C6C 1px;" readOnly=readOnly  value="'||xrow_arb.v_apellido_mat||'" name="cApellidoMat" id="cNombre" size="46"/></td>
          <td class=c1></td>
       </tr>
       
        <tr>
          <td class=c1>Colegio de Abogados</td>
          <td class=c1>
          <select style="width:99%" name="cColegio" id="cColegio">
          <option value="">-Seleccionar-</option>');
              
        for xrow in cColegioAbogados loop
          usp_print('<option '||case xrow.n_id_maestro when xrow_arb.c_cod_colegiatura  then 'selected = "selected"' else '' end||' value="'||xrow.n_id_maestro||'">'||xrow.c_descripcion||'</option>');
        end loop;    
                
     usp_print('</select>
          </td>
          <td class=c2>Ingrese el Colegio de Abogados</td>
       </tr>
       
       <tr>
          <td class=c1>N&uacute;mero de Colegiatura</td>
          <td class=c1><b><input type="text" value="'||xrow_arb.n_num_colegiatura||'" name="cColegiatura" id="cColegiatura" size="46"/></td>
          <td class=c2>Ingrese el n&uacute;mero de Colegiatura.</td>
       </tr>
     
       <tr>
          <td class=c1>Correo Electr&oacute;nico</td>
          <td class=c1><input type="text" value="'||xrow_arb.usu_email||'" name="cEmail" id="cEmail" size="46"/></td>
          <td class=c2>Ingrese el correo electr&oacute;nico.</td>
       </tr> 
       
       <tr>
          <td class=c1>Tel&eacute;fono</td>
          <td class=c1><input type="text" value="'||xrow_arb.usu_telefono||'" name="cTelefono" id="cTelefono" size="46"/></td>
          <td class=c2>Ingrese el n&uacute;mero de tel&eacute;fono.</td>
       </tr>
       
       <tr>
           <td  align="left"><h4>Datos de la Solicitud</h4></td>
           <td></td>
           <td></td>
       </tr>
       
       <tr>
           <td class=c1>Documento</td>
           <td class=c1><input type="text" value="" name="cDoc" id="cDoc" size="46"/></td>
           <td class=c2>Ingrese la nomenclatura del documento de solicitud.</td>
       </tr> 
       
       <tr>
           <td class=c1>Fecha de recepci&oacute;n de documentos</td>
           <td class=c1><input readonly name="ag_fecrecep" style="width:90%" class=CalSelect  onclick="calendario(this)"></td>
           <td class=c2>Seleccione la fecha de recepci&oacute;n del documento.</td>
       </tr> 
       
       <tr>
           <td align="left"><h4>Datos de Acceso</h4></td>
           <td></td>
           <td></td>
       </tr>
       
       <tr>
           <td class=c1>Estado</td>
           <td class=c1><select style="width:98%" name="cEstado" id="cEstado">
                               <option value="">-Seleccionar-</option>');
        for rowEstado in cEstadoUsuario loop
          usp_print('<option '||case rowEstado.n_Id_Tipo_Maestro when xrow_arb.usu_activo then 'selected = "selected"' 
            else '' end||' value="'||rowEstado.n_Id_Tipo_Maestro||'">'||rowEstado.c_Descripcion||'</option>');
        end loop;     
     usp_print('</select>
          </td>
          <td class=c2>Seleccione el estado</td>
       </tr>

       <tr>
            <td class=c1>Observaciones</td>
            <td class=c2>
                <textarea name="cObservaciones" rows="4" columns = "150" style="width:98%"></textarea>
                </td>
            <td class=c2>Describa el detalle de la modificaci&oacute;n.</td>
        </tr>
        <tr>
            <td class=c1>Fecha de creaci&oacute;n</td>
            <td class=c2>
                <input type="text" name="ag_feccre" style="background-color:#D2D2D2; border:solid #6C6C6C 1px; width:98%;" value="'|| to_char(xrow_arb.usu_fcreacion, 'dd/mm/yyyy')|| '"/></td>
            <td class=c2>Corresponde a la fecha de creaci&oacute;n se obtiene por defecto.</td>
        </tr>
        <tr>
            <td class=c1>Fecha de modificaci&oacute;n</td>
            <td class=c2><input readonly type="text" name="ag_fecmod" style="background-color:#D2D2D2; border:solid #6C6C6C 1px; width:98%;" value="'|| TO_CHAR (SYSDATE, 'dd/MM/yyyy')|| '"/></td>
            <td class=c2>Corresponde a la fecha de modificaci&oacute;n se obtiene por defecto.</td>
        </tr>
       
        <tr>
           <td class=c1>Funcionario-Usuario</td>
           <td class=c1><select style="width:98%"><option>Funcionario-Usuario &Aacute;rbitros</option></select></td>
           <td class=c2>Corresponde al tipo de Funcionario-Usuario</td>
       </tr>           
       </table>
       </div>
       <br/>');
       
       usp_print
         (   '
    <table border="0" width="85%" align=center class=tableform cellpadding=1 cellspacing=0>
        <tr>
            <td class="c1" style="text-align: center" colspan="2"><h4>Perfiles</h4>
              <input name="ag_miembros" type="hidden" value="'||xrow_arb.usu_miembros||'" />
            </td>
        </tr>
         '
         );
         
      if xrow_arb.usu_activo = 1 then   

      IF c_perfiles%ISOPEN
      THEN
         CLOSE c_perfiles;

         OPEN c_perfiles;
      ELSE
         OPEN c_perfiles;
      END IF;

      LOOP
         FETCH c_perfiles
          INTO r_perfil;

         EXIT WHEN c_perfiles%NOTFOUND;

            usp_print (   '
            <tr>
            <td class=c1>
                <input name="op'
             || r_perfil.usu_codigo
             || '" type="hidden" value="'
             || r_perfil.usu_codigo
             || '"/>
                <input type="checkbox" name="ck'
             || r_perfil.usu_codigo
             || '" id="ck'
             || r_perfil.usu_codigo
             || '" onclick="evalua('''
             || r_perfil.usu_codigo
             || ''');"'
            );

           IF (r_perfil.flag = 1)
           THEN
              usp_print (' checked = true ');
           END IF;

           usp_print (   '>
                </input>'
                 || r_perfil.usu_nombre
                 || '
            </td>
            <td class=c3>'
                 || r_perfil.usu_coment
                 || '</td>
            </td> </tr>'
                );
           
         
      END LOOP;

      CLOSE c_perfiles;
      
      end if;
       
       END LOOP;
      
      usp_print('</table>');
      
     
         
         else
      pku_administrar_users.dojavascriptusuarios;
      usp_print
         ('
      <script>

        function comparaFechaHoy(fec1)
        {
            var fec2 = new Date();
            var Anio = (fec1).substr(6,4)
            var Mes = ((fec1).substr(3,2))*1 - 1
            var Dia = (fec1).substr(0,2)
            var Fecha_Inicio = new Date(Anio,Mes,Dia);
            var Anio2 = fec2.getFullYear();
            var Mes2 = fec2.getMonth();
            var Dia2 = fec2.getDate();
            var Fecha_Hoy = new Date(Anio2,Mes2,Dia2);
            if(Fecha_Inicio > Fecha_Hoy)
                return 1;
            else
            {
                if(Fecha_Inicio < Fecha_Hoy)
                    return 2;
                else
                    return 0;
            }
        }


        function reenviarPaswd()
        {   var usu = thisform.ag_usufun.value;
            abrir( ''mod_UsuarioModificar'', ''doreenviarcontrasenia'',''&ag_usufun='' + usu , ''wRenvioPaswd'');
        }
        function validarCampos()
            {   var mensaje="";
                 var correo = thisform.ag_usuemail.value;
                if (thisform.ag_tipousu.selectedIndex == 0)
                {   mensaje="Seleccione el tipo de usuario";
                }
                if (vacio(thisform.ag_fecrecep.value) || comparaFechaHoy(thisform.ag_fecrecep.value) == 1)
                {   mensaje="El formato de la fecha de recepcion de la solicitud es incorrecto. No puede ser mayor a la fecha de hoy.";
                }
                if (vacio(thisform.ag_obs.value))
                {   mensaje="No ha ingresado la observaci\xf3n o tiene caracteres invalidos";
                }
                if (vacio(thisform.ag_usufono.value)) //|| isNumber(thisform.ag_usufono.value)==false)
                {   mensaje="No ha ingresado el telefono del usuario"; //. Debe tener solo d\xedgitos";  Memo 163-2011-SPLA
                }
                if (vacio(thisform.ag_usuemail.value) || validarEmail(correo)==false)
                {   mensaje="No ha ingresado el correo electr\xf3nico o el formato es incorrecto";
                }
                if (vacio(thisform.ag_usucargo.value) || cadenaValida(thisform.ag_usucargo.value)==false)
                {   mensaje="No ha ingresado el cargo del usuario o tiene caracteres invalidos";
                }
                if (vacio(thisform.ag_usudni.value) || isNumber(thisform.ag_usudni.value) && (thisform.ag_usudni.value.length!=8))
                {   mensaje="No ha ingresado el DNI o no es valido ";
                }
                if (vacio(thisform.ag_usunombre.value) || cadenaValida(thisform.ag_usunombre.value)==false)
                {   mensaje="No ha ingresado el nombre del usuario o tiene caracteres invalidos";
                }
                if (vacio(thisform.ag_solcargo.value) || cadenaValida(thisform.ag_solcargo.value)==false)
                {   mensaje="No ha ingresado el cargo del solicitante o tiene caracteres invalidos";
                }
                if (vacio(thisform.ag_solnombre.value) || cadenaValida(thisform.ag_solnombre.value)==false)
                {   mensaje="No ha ingresado el nombre del solicitante o tiene caracteres invalidos";
                }
                if (vacio(thisform.ag_descdomicilio.value)) {
                  mensaje="No ha ingresado el domicilio de la Unidad Ejecutora u Operativa";
                }
                if (vacio(thisform.ag_descuniope.value) || cadenaValida(thisform.ag_descuniope.value)==false) {
                   mensaje="No ha ingresado la Unidad Ejecutora u Operativa";
                }
                if (mensaje == "")
                {    accion(''dograbarmodificarusuario'');
                      return true;}
                else
                {  alert(mensaje);
                    return false;}
            }
        </script> '
         );

   usp_print('<INPUT name="tipo_ubi" type="hidden"/> ');

      usp_print
         (   '
    <table border="0" width=100% align=center class=tableform cellpadding=0 cellspacing=0>
        <tr>
            <td>
                <h3>'
          || portlet__titulo
          || '</h3>
            </td>
            <td align="right" valign=top width="50%">
                <input type="button" name="btnReenviar" value="Nueva contrase&ntilde;a / Enviar" OnClick="reenviarPaswd()"/>
                &nbsp;
                <input type="button" name="btnGuardar" value="Guardar" OnClick="validarCampos()"/>
                &nbsp;
                <input type="button" name="btnCancelar" value="Cancelar" OnClick="cancelar()"/>
                &nbsp;
                <!--input type="button" name="btnVolver" value="Volver" OnClick="regresar()"/-->
            </td>
        </tr>
    </table>
    <br>
    <table border="0" width=100% align=center class=tableform cellpadding=3 cellspacing=0>'
         );

      IF c_modificar%ISOPEN
      THEN
         CLOSE c_modificar;

         OPEN c_modificar;
      ELSE
         OPEN c_modificar;
      END IF;

      LOOP
         FETCH c_modificar
          INTO r_usuario;

         EXIT WHEN c_modificar%NOTFOUND;
         usp_print
            (   '
        <tr>
            <td colspan="3"><h4>Datos de la Entidad</h4></td>
        </tr>
        <tr>
            <td class=c1>Entidad</td>
            <td class=c2>
                <input name="ag_descent" type="text" style="width:310px;background-color:#F5F5F5;"
                    class=ViewSelect
                    value="'|| nvl(r_usuario.eue_desc,'')|| '" readonly="true"/>
                <input name="ag_codent" type="hidden" value="'|| nvl(r_usuario.eue_codigo,'0')|| '" /></td>
                <input name="ag_opcion" type="hidden" value="M"/>
                </td>
            <td class=c3>Seleccione la entidad.</td>
        </tr>
        <tr>
            <td class=c1>Organo Desconcentrado o Unidad Operativa</td>
            <td class=c2>
                <input type="text" name="ag_descuniope" maxlength="100" style="width:98%"
                value="'|| nvl(r_usuario.eue_descripcion,'') || '"></td>
            <td class=c3>Ingresa la Unidad Operativa al que pertence el usuario, si corresponde.</td>
        </tr>
        <tr>
            <td class=c1>Domicilio</td>
            <td class=c2>
                <input type="text" name="ag_descdomicilio" maxlength="100" style="width:98%"
                value="'|| nvl(r_usuario.eue_direccion,'') || '"></td>
            <td class=c3>Ingrese domicilio de la U.E o U.O. seg&uacute;n corresponda.</td>
        </tr>  ');

 usp_print( '
        <tr>
            <td colspan="3"><h4>Ubicaci&oacute;n Geografica de la Unidad Ejecutora o Unidad Operativa</h4></td>
        </tr> ' );

    usp_print (f_get_ubigeo_ue(r_usuario.dep_codigo,r_usuario.pro_codigo,r_usuario.dis_codigo));

 usp_print( '
        <tr>
            <td colspan="3"><h4>Datos del Solicitante</h4></td>
        </tr>
        <tr>
            <td class=c1>Nombre</td>
            <td class=c2>
                <input type="text" name="ag_solnombre" maxlength="60" style="width:98%"
                 value="'||nvl(r_usuario.usu_nomaprobador,'')||'"/></td>
            <td class=c3>Ingrese el nombre del solicitante de la modificaci&oacute;n</td>
        </tr>
        <tr>
            <td class=c1>Cargo</td>
            <td class=c2>
                <input type="text" name="ag_solcargo" maxlength="60" style="width:98%"
                value="'||nvl(r_usuario.usu_cargoaprobador,'')||'"/></td>
            <td class=c3>Ingrese el cargo del solicitante de la modificaci&oacute;n</td>
        </tr>
        <tr>
            <td colspan="3"><h4>Datos del Funcionario - Usuario</h4></td>
        </tr>
        <tr>
            <td class=c1>Funcionario - Usuario</td>
            <td class=c2>
                <input readonly name="ag_usufun" maxlength="20" style="width:98%;background-color:#F5F5F5;"
                value="'
             || r_usuario.usu_codigo
             || '"/></td>
            <td class=c3>Se genera al seleccionar la entidad y el DNI del usuario.</td>
        </tr>
        <tr>
            <td class=c1>Nombre</td>
            <td class=c2>
                <input type="text" name="ag_usunombre" maxlength="100" style="width:98%"
                value="'
             || nvl(r_usuario.usu_nombre,'')
             || '"/></td>
            <td class=c3>Ingrese el nombre.</td>
        </tr>
        <tr>
            <td class=c1>DNI</td>
            <td class=c2>
                <input style="width:98%; '
            );

         IF r_usuario.usu_tipo IS NOT NULL
         THEN
            usp_print (' background-color:#F5F5F5;" readonly ');
         ELSE
            usp_print ('"');
         END IF;

         usp_print
            (   ' name="ag_usudni" maxlength="8"  value="'
             || nvl(r_usuario.usu_dni,'')
             || '"/></td>
            <td class=c3>DNI del usuario</td>
        </tr>
        <tr>
            <td class=c1>Cargo</td>
            <td class=c2>
                <input type="text" name="ag_usucargo" maxlength="60" style="width:98%" value="'
             || nvl(r_usuario.usu_cargousuario,'')
             || '"/></td>
            <td class=c3>Cargo del usuario</td>
        </tr>
        <tr>
            <td class=c1>Correo Electr&oacute;nico</td>
            <td class=c2>
                <input type="text" name="ag_usuemail" maxlength="60" style="width:98%" value="'
             || r_usuario.usu_email
             || '"/></td>
            <td class=c3>Correo Electr&oacute;nico del usuario</td>
        </tr>
        <tr>
            <td class=c1>Tel&eacute;fono</td>
            <td class=c2>
                <input type="text" name="ag_usufono" maxlength="50" style="width:98%" value="'
             || r_usuario.usu_telefono
             || '"/></td>
            <td class=c3>N&uacute;mero telef&oacute;nico del usuario</td>
        </tr>
        <tr>
            <td class=c1>Estado</td>
            <td class=c2>
                <select name="ag_estado" style="width:98%" value="'
             || r_usuario.usu_activo
             || '"/>
                        <option value="1"'
             || CASE r_usuario.usu_activo
                   WHEN '1'
                      THEN ' selected '
                   ELSE ''
                END
             || '>Activo</option>
                        <option value="0"'
             || CASE r_usuario.usu_activo
                   WHEN '0'
                      THEN ' selected '
                   ELSE ''
                END
             || '>Inactivo</option>
                </select></td>
            <td class=c3>&nbsp;</td>
        </tr>
        <tr>
            <td class=c1>Observaciones</td>
            <td class=c2>
                <textarea name="ag_obs" rows="4" columns = "150" style="width:98%"></textarea>
                </td>
            <td class=c3>Ingrese la observaci&oacute;n.</td>
        </tr>
        <tr>
            <td class=c1>Fecha de recepci&oacute;n de solicitud</td>
            <td class=c2>
                <input readonly  name="ag_fecrecep" style="width:90%" class=CalSelect  onclick="calendario(this)"></td>
            <td class=c3>Ingrese la fecha de recepci&oacute;n de la solicitud.</td>
        </tr>
        <tr>
            <td class=c1>Fecha de creaci&oacute;n</td>
            <td class=c2>
                <input type="text" name="ag_feccre"  style="width:98%;background-color:#F5F5F5;" value="'
             || r_usuario.usu_fcreacion
             || '"/></td>
            <td class=c3>La fecha de creaci&oacute;n se obtiene por defecto.</td>
        </tr>
        <tr>
            <td class=c1>Fecha de modificaci&oacute;n</td>
            <td class=c2>
                <input readonly type="text" name="ag_fecmod" style="width:98%;background-color:#F5F5F5;" value="'
             || TO_CHAR (SYSDATE, 'dd/MM/yyyy')
             || '"/></td>
            <td class=c3>La fecha de modificaci&oacute;n se obtiene por defecto.</td>
        </tr>
        <tr>
            <td class=c1>Funcionario - Usuario</td>
            <td class=c2>
                <select name="ag_tipousu" style="width:98%" onChange="refrescarPerfiles(''mod_UsuarioModificar'',''doVerPerfilesAjax'',''divPerfiles'',thisform.ag_codent.value);">
                        <option value="0">Seleccione tipo de usuario</option>
                        <option value="1"'
             || CASE r_usuario.usu_tipo
                   WHEN '1'
                      THEN ' selected '
                END
             || ' >Funcionario-Usuario Entidades</option>
                        <option value="2" '
             || CASE r_usuario.usu_tipo
                   WHEN '2'
                      THEN ' selected '
                END
             || '>Funcionario-Usuario OSCE</option>
                 </select>
                 </td> '
            );
         usp_print
            ('</select></td>
            <td class=c3>Seleccione el tipo de usuario funcionario</td>
        </tr>
        <tr>
            <td colspan="3"><div name="divPerfiles" id="divPerfiles">&nbsp;</div>
            </td>
        </tr>
    </table>'
            );

         IF r_usuario.usu_tipo IS NOT NULL
         THEN
            usp_print
               ('
    <script>
        refrescarPerfiles(''mod_UsuarioModificar'',''doVerPerfilesAjax'',''divPerfiles'',thisform.ag_codent.value);
    </script>'
               );
         END IF;
      END LOOP;

      CLOSE c_modificar;
--cambios arbitro nueva ley      
      END IF;
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
        --usp_print (' entidad: ' || ag_codent || '<br>');
        --usp_print (' usuario: ' || ag_usufun || '<br>');
        --usp_print (' session__anhoentidad: ' || session__anhoentidad || '<br>');

        usp_print ('No se encontro registro...');

      WHEN OTHERS
      THEN
         usp_print ('Ocurrio el siguiente error: ' || SQLERRM || ' - '
                    || SQLCODE
                   );
   END doviewmodificarusuario;

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
||    Author:       Cristina Zenteno Garcia
||    Overview:     Procedimiento para grabar los datos del usuario
||    Modificaciones:
||    16/07/2009 - CZG - Creaci¿n del procedimiento
||    15/08/2010 - Modif - JMD
*/
   IS
      lv_clavealeatoria   VARCHAR2 (10);
      lv_notificacion     VARCHAR2 (3000);
      lv_temp             VARCHAR2 (3000) := '';
      lv_nrow             NUMBER (3);
      lv_nombre           VARCHAR2 (100);

      CURSOR c_grupos (grupos VARCHAR2)
      IS
         SELECT ROWNUM nrow, usu.usu_nombre
           FROM sease.usuario usu
          WHERE usu.usu_activo = 1
            AND usu.apl_codigo = 1
            AND INSTR (grupos, TRIM (usu.usu_codigo)||',') >= 1 -- Modificado por incidencia 92
            AND usu.eue_codigo IS NULL
            AND usu.usu_tipo IS NOT NULL;
   BEGIN
      lv_clavealeatoria := generaclavealeatoria ();

      INSERT INTO sease.usuario
                  (usu_codigo               , usu_nombre,
                   eue_codigo               , usu_c_user,
                   usu_c_pass               , usu_dni,
                   usu_cargousuario         , usu_email,
                   usu_telefono             , usu_tipo,
                   usu_miembros             , usu_nomaprobador,
                   usu_cargoaprobador       , usu_frecepciondcto,
                   usu_fecult               , apl_codigo,
                   usu_ult_modi             , usu_ip ,
                   dep_codigo               , pro_codigo,
                   dis_codigo               , eue_descripcion,
                   eue_direccion            , usu_creacion)
           VALUES (ag_usufun                , ag_usunombre,
                   ag_codent                , crypt (ag_usufun),
                   crypt (lv_clavealeatoria), ag_usudni,
                   ag_usucargo              , TRIM(ag_usuemail),   ----MMAUTINO: EL DIA 01.07.2015 SE AGREGA TRIM AL CAMPO USU_EMAIL
                   ag_usufono               , ag_tipousu,
                   ag_miembros              , ag_solnombre,
                   ag_solcargo              , ag_fecrecep,
                   SYSDATE                  , 1,
                   session__userid          , iisenv__remote_host,
                   v_dep_codigo_vb          , v_pro_codigo_vb,
                   v_dis_codigo_vb          , ag_descuniope,
                   ag_descdomicilio         , session__userid);

      --  Inserta javascripts
      pku_administrar_users.dojavascriptcomun;

      -- Fin de insercion de javascripts
      OPEN c_grupos (ag_miembros);
      LOOP
         FETCH c_grupos INTO lv_nrow, lv_nombre;
         EXIT WHEN c_grupos%NOTFOUND;
         lv_temp := lv_temp || ' <br> ' ||lv_nrow || '.   ' || lv_nombre;
      END LOOP;
      CLOSE c_grupos;

      lv_notificacion :=
      ' <tr>
            <td><b>Nombre del Solicitante:</b></td>
            <td>'|| ag_solnombre|| '</td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2"><font color="#B40404"><b><u>DATOS DEL USUARIO</u></b></font></td>
        </tr>
        <tr>
            <td><b>Contrase&ntilde;a:</b></td>
            <td>'|| lv_clavealeatoria|| '</td>
        </tr>
        <tr>
            <td><b>Perfiles Asignados:</b></td>
            <td>'|| lv_temp||'</td>
        </tr>';

      generarmensajenotificacion (ag_usufun, 'N', lv_notificacion, lv_clavealeatoria);
      --Auditoria
      insert into sease.usuario_historial
             (tablename, id_registro , cod_evento, usu_registro   , ip_registro        , obs_registro)
      values ('USUARIO', ag_usufun   , 'N'       , session__userid, iisenv__remote_host, '');
      --
      commit;
      --
      usp_print ('<script>alert("Grabaci\xf3n exitosa"); inicio();</script>');
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
        usp_print ('No se encontr\xf3 el ubigeo de la Entidad');
      WHEN OTHERS
      THEN
        usp_print ( 'Ocurrio el siguiente error al grabar: '
                    || SQLERRM || ' - ' || SQLCODE );

   END dograbarnuevousuario;

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
*/
   IS
      lv_clavealeatoria   VARCHAR2 (10);
      lv_notificacion     VARCHAR2 (3000);
      lv_temp             VARCHAR2 (3000) := '';
      lv_nrow             NUMBER (3);
      lv_nombre           VARCHAR2 (100);

      msg_mail         varchar2(4000) := '';
      msg_crearUsuario varchar2(4000) := '';
      lv_asunto        varchar2(1000) := '';
      texto_msg        varchar2(4000) := '';

      CURSOR c_grupos (grupos VARCHAR2)
      IS
         SELECT ROWNUM nrow, usu.usu_nombre
           FROM sease.usuario usu
          WHERE usu.usu_activo = 1
            AND usu.apl_codigo = 1
            AND INSTR (grupos, TRIM (usu.usu_codigo)||',') >= 1 -- Modificado por incidencia 92
            AND usu.eue_codigo IS NULL
            AND usu.usu_tipo IS NOT NULL;
   BEGIN
      lv_clavealeatoria := generaclavealeatoria ();

      INSERT INTO sease.usuario
                  (usu_codigo               , usu_nombre,
                   eue_codigo               , usu_c_user,
                   usu_c_pass               , usu_dni,
                   usu_cargousuario         , usu_email,
                   usu_telefono             , usu_tipo,
                   usu_miembros             , usu_nomaprobador,
                   usu_cargoaprobador       , usu_frecepciondcto,
                   usu_fecult               , apl_codigo,
                   usu_ult_modi             , usu_ip ,
                   dep_codigo               , pro_codigo,
                   dis_codigo               , eue_descripcion,
                   eue_direccion)
           VALUES (ag_usufun                , ag_usunombre,
                   ag_codent                , crypt (ag_usufun),
                   crypt (lv_clavealeatoria), ag_usudni,
                   ag_usucargo              , TRIM(ag_usuemail),   ----MMAUTINO: EL DIA 01.07.2015 SE AGREGA TRIM AL CAMPO USU_EMAIL
                   ag_usufono               , ag_tipousu,
                   ag_miembros              , ag_solnombre,
                   ag_solcargo              , ag_fecrecep,
                   SYSDATE                  , 1,
                   session__userid          , iisenv__remote_host,
                   v_dep_codigo_vb          , v_pro_codigo_vb,
                   v_dis_codigo_vb          , ag_descuniope,
                   ag_descdomicilio);

      --  Inserta javascripts
      /*  pku_administrar_users.dojavascriptcomun; */
      -- Fin de insercion de javascripts

      OPEN c_grupos (ag_miembros);
      LOOP
         FETCH c_grupos INTO lv_nrow, lv_nombre;
         EXIT WHEN c_grupos%NOTFOUND;
         lv_temp := lv_temp || ' <br> ' ||lv_nrow || '.   ' || lv_nombre;
      END LOOP;
      CLOSE c_grupos;

      lv_notificacion :=
      ' <tr>
            <td><b>Nombre del Solicitante:</b></td>
            <td>'|| nvl(ag_solnombre,'')|| '</td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2"><font color="#B40404"><b><u>DATOS DEL USUARIO</u></b></font></td>
        </tr>
        <tr>
            <td><b>Contrase&ntilde;a:</b></td>
            <td>'|| lv_clavealeatoria|| '</td>
        </tr>
        <tr>
            <td><b>Perfiles Asignados:</b></td>
            <td>'|| lv_temp||'</td>
        </tr>';

      msg_mail := '
        <tr><td colspan="2"><hr></td>'
         || '
        <tr>
            <td><b>Fecha:</b></td>
            <td>'|| TO_CHAR (SYSDATE, 'dd/MM/yyyy')|| '</td>
        </tr>
        <tr>
            <td><b>Usuario:</b></td>
            <td>'|| nvl(ag_usufun,'')|| '</td>
        </tr>
        <tr>
            <td><b>Nombre del Usuario:</b></td>
            <td>'|| nvl(ag_usunombre,'') ||'</td>
        </tr>';

      msg_mail := msg_mail || lv_notificacion;
      msg_mail := msg_mail || '
        <tr><td colspan="2"><font color="#253D54">
            <br><br><br>El Certificado SEACE emitido por el OSCE es de car&aacute;cter personal e instrasferible. Los
            usuarios son responsables de la informaci&oacute;n que bajo el Certificado SEACE ingresen al sistema.<br>
            <br>Esta notificaci&oacute;n ha sido enviada autom&aacute;ticamente. Por favor, no responda a este correo.</td>
        </tr>';
      msg_mail := '<tr><td colspan="2"><center><h4>Bienvenido al Sistema Electr&oacute;nico de Contrataciones del Estado (SEACE)
      </h4></center></td></tr>'||msg_mail;
      lv_asunto :=  'OSCE - Certificado SEACE - Nuevo Usuario';

     texto_msg := '<table width="70%" border=1 bordercolor="#FFFFFF">
                            <tr align="center">
                                <td align="center"  bgcolor="#FAFAFA" bordercolor="#74DF00" BORDERCOLORLIGHT="#F5FBEF" BORDERCOLORDARK="#E6E6E6">
                                    <table style="font-family: Verdana; font-size:12px;" width="100%" >'
                                    ||msg_mail||'</table>
                                </td>
                            </tr>
                          </table>';

     reg_procesos.sp_send_mail_html(ag_usuemail, lv_asunto, texto_msg);

  /* EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
        --raise_application_error(-20002, 'No se encontr¿ informacion' );
         dbms_output.put_line('prueba ');
      WHEN OTHERS
      THEN
        --dbms_output.put_line('prueba ');
        raise_application_error(-20010, sqlerrm ); --sqlerrm || ' - ' || sqlcode);

*/   END dograbarExceptuado;

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
    ||      22/07/2009 - CZG - Creacin del procedimiento
    ||      19/03/2012 - Martn Zanelli - Se agrega la observacin al historial de cambios -
    ||                   Memo 98-2012/SDP-ECC - punto 3
    */
   IS
      r_usuario         sease.usuario%ROWTYPE;
      sql_query         VARCHAR2 (2000)         := '';
      lv_notificacion   VARCHAR2 (4000)         := '';
      lv_temp           VARCHAR2 (2000)         := '';
      lv_nrow           NUMBER (3);
      lv_nombre         VARCHAR2 (100);

      CURSOR c_grupos (grupos VARCHAR2)
      IS
         SELECT ROWNUM nrow, usu.usu_nombre
           FROM sease.usuario usu
          WHERE usu.usu_activo = 1
            AND usu.apl_codigo = 1
            AND INSTR (grupos, TRIM (usu.usu_codigo)||',') >= 1 -- Modificado por incidencia 92
            AND usu.eue_codigo IS NULL
            AND usu.usu_tipo IS NOT NULL;
   BEGIN
      SELECT *
        INTO r_usuario
        FROM sease.usuario
       WHERE usu_codigo = RPAD (ag_usufun, 30);

      pku_administrar_users.dojavascriptcomun;

      IF NOT NULLIF (ag_descuniope, r_usuario.eue_descripcion) IS NULL   -- JMD 08/07/2010
      THEN
         sql_query := sql_query || ' eue_descripcion = ''' || ag_descuniope || ''',';
         lv_notificacion := lv_notificacion || '
        <tr>
            <td><b>Unidad Ejecutora:</b></td>
            <td> ' ||ag_descuniope||'</td>
        </tr>';
      END IF;

      IF NOT NULLIF (ag_descdomicilio, r_usuario.eue_direccion) IS NULL   -- JMD 08/07/2010
      THEN
         sql_query := sql_query || ' eue_direccion = ''' || ag_descdomicilio || ''',';
         lv_notificacion := lv_notificacion || '
        <tr>
            <td><b>Direccion Unidad Ejecutora:</b></td>
            <td> ' ||ag_descdomicilio||'</td>
        </tr>';
      END IF;

      IF NOT NULLIF (v_dep_codigo_vb, r_usuario.dep_codigo) IS NULL   -- JMD 08/07/2010
      THEN
         sql_query := sql_query || ' dep_codigo = ''' || v_dep_codigo_vb || ''',';
         lv_notificacion := lv_notificacion || '
        <tr>
            <td><b>Departamento:</b></td>
            <td> ' ||v_dep_codigo_vb||'</td>
        </tr>';
      END IF;

      IF NOT NULLIF (v_pro_codigo_vb, r_usuario.pro_codigo) IS NULL   -- JMD 08/07/2010
      THEN
         sql_query := sql_query || ' pro_codigo = ''' || v_pro_codigo_vb || ''',';
         lv_notificacion := lv_notificacion || '
        <tr>
            <td><b>Provincia:</b></td>
            <td> ' ||v_pro_codigo_vb||'</td>
        </tr>';
      END IF;

      IF NOT NULLIF (v_dis_codigo_vb, r_usuario.dis_codigo) IS NULL   -- JMD 08/07/2010
      THEN
         sql_query := sql_query || ' dis_codigo = ''' || v_dis_codigo_vb || ''',';
         lv_notificacion := lv_notificacion || '
        <tr>
            <td><b>Distrito:</b></td>
            <td> ' ||v_dis_codigo_vb||'</td>
        </tr>';
      END IF;

      IF NOT NULLIF (ag_usunombre, r_usuario.usu_nombre) IS NULL
      THEN
         sql_query := sql_query || ' usu_nombre = ''' || ag_usunombre || ''',';
         lv_notificacion := lv_notificacion || '
        <tr>
            <td><b>Nombre:</b></td>
            <td> ' ||ag_usunombre||'</td>
        </tr>';
      END IF;

      IF NOT NULLIF (ag_usudni, r_usuario.usu_dni) IS NULL
      THEN
         sql_query := sql_query || ' usu_dni = ''' || ag_usudni || ''',';
         lv_notificacion := lv_notificacion || '
        <tr>
            <td><b>DNI:</b></td>
            <td> ' ||ag_usudni||'</td>
        </tr>';
      END IF;

      IF NOT NULLIF (ag_estado, r_usuario.usu_activo) IS NULL
      THEN
         sql_query := sql_query || ' usu_activo = ''' || ag_estado || ''',';
         lv_notificacion := lv_notificacion || '
        <tr>
            <td><b>Estado:</b></td>
            <td> '
            || CASE ag_estado
                  WHEN '0'
                     THEN 'Inactivo'
                  WHEN '1'
                     THEN 'Activo'
               END
            || '</td>
        </tr>';
      END IF;

      IF NOT NULLIF (ag_usucargo, r_usuario.usu_cargousuario) IS NULL
      THEN
         sql_query := sql_query || ' usu_cargousuario = ''' || ag_usucargo || ''',';
         lv_notificacion := lv_notificacion || '
        <tr>
            <td><b>Cargo:</b></td>
            <td>' ||ag_usucargo||'</td>
        </tr>';
      END IF;

      IF NOT NULLIF (ag_usuemail, r_usuario.usu_email) IS NULL
      THEN
         sql_query := sql_query || ' usu_email = ''' || ag_usuemail || ''',';
         lv_notificacion := lv_notificacion || '
        <tr>
            <td><b>Correo Electr&oacute;nico:</b></td>
            <td> ' || ag_usuemail ||'</td>
        </tr>';
      END IF;

      IF NOT NULLIF (ag_usufono, r_usuario.usu_telefono) IS NULL
      THEN
         sql_query := sql_query || ' usu_telefono = ''' || ag_usufono || ''',';
         lv_notificacion := lv_notificacion || '
        <tr>
            <td><b>Tel&eacute;fono:</b></td>
            <td> ' ||ag_usufono||'</td>
        </tr>';
      END IF;

      IF NOT NULLIF (ag_fecrecep, r_usuario.usu_frecepciondcto) IS NULL
      THEN
         sql_query := sql_query || ' usu_frecepciondcto = ''' || ag_fecrecep || ''',';
      END IF;

      IF NOT NULLIF (ag_tipousu, r_usuario.usu_tipo) IS NULL
      THEN
         sql_query := sql_query || ' usu_tipo = ''' || ag_tipousu || ''',';
      END IF;

      IF NOT NULLIF (ag_miembros, r_usuario.usu_miembros) IS NULL
      THEN
         sql_query := sql_query || ' usu_miembros = ''' || ag_miembros || ''',';

         OPEN c_grupos (ag_miembros);
         LOOP
            FETCH c_grupos
             INTO lv_nrow, lv_nombre;

            EXIT WHEN c_grupos%NOTFOUND;
            lv_temp := lv_temp || '<br> ' ||lv_nrow || '.   ' || lv_nombre;
         END LOOP;
         CLOSE c_grupos;

         lv_notificacion := lv_notificacion || '
        <tr>
            <td><b>Perfiles Asignados:</b></td>
            <td>' ||lv_temp ||'</td>
        </tr>';
      END IF;

      IF NOT NULLIF (ag_obs, r_usuario.usu_obs) IS NULL
      THEN
         sql_query := sql_query || ' usu_obs = ''' || ag_obs || ''',';
      END IF;

      IF NOT NULLIF (sql_query, NULL) IS NULL
      THEN
         sql_query := sql_query
            || ' usu_nomaprobador = '''
            || ag_solnombre
            || ''', usu_cargoaprobador = '''
            || ag_solcargo
            || ''', fec_ult_modi = '''
            || sysdate
            || ''', usu_ult_modi = '''
            || session__userid
            || ''', usu_ip = '''
            || iisenv__remote_host
            || '''';

         sql_query := 'UPDATE sease.usuario SET '
            || sql_query
            || ' WHERE usu_codigo = rpad('''
            || ag_usufun
            || ''',30)';

         lv_notificacion := '
        <tr>
            <td><b>Nombre del Solicitante:</b></td>
            <td> '|| ag_solnombre|| '</td>
        </tr>
        <tr>
            <td><b>Cargo del Solicitante:</b></td>
            <td>'|| ag_solcargo ||'</td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <!--td colspan="2"><font color="#B40404"><b><u>CONTRASE&Ntilde;A MODIFICADA</u></b></font></td-->
            <td colspan="2">&nbsp;</td>
        </tr>'
            || lv_notificacion;

         BEGIN
            EXECUTE IMMEDIATE sql_query;
         EXCEPTION
            WHEN OTHERS
            THEN
               RAISE ex_badsql;
         END;

         /*  Inserta javascripts */
         dojavascriptcomun;
         /* Fin de insercion de javascripts*/

         generarmensajenotificacion (ag_usufun, 'M', lv_notificacion, null);
         --Auditoria
         if (ag_estado <> ag_estado_old) then
           if (ag_estado = '0') then
             insert into sease.usuario_historial
                    (tablename, id_registro , cod_evento, usu_registro   , ip_registro        , obs_registro)
             values ('USUARIO', ag_usufun   , 'A'       , session__userid, iisenv__remote_host, 'Inactiva User');
           else
             insert into sease.usuario_historial
                    (tablename, id_registro , cod_evento, usu_registro   , ip_registro        , obs_registro)
             values ('USUARIO', ag_usufun   , 'A'       , session__userid, iisenv__remote_host, 'Activa User');
           end if;
         else
           insert into sease.usuario_historial
                  (tablename, id_registro , cod_evento, usu_registro   , ip_registro        , obs_registro)
           --values ('USUARIO', ag_usufun   , 'M'       , session__userid, iisenv__remote_host, '');
           values ('USUARIO', ag_usufun   , 'M'       , session__userid, iisenv__remote_host, ag_obs);
         end if;
         --

         commit;
         --
         usp_print ('<script>alert("Grabaci\xf3n exitosa"); inicio();</script>');
      END IF;
   EXCEPTION
      WHEN ex_badsql
      THEN
         usp_print
            ('Sentencia mal formada, no se pudo grabar la modificaci&oacute;n del usuario'
            );
      WHEN OTHERS
      THEN
         usp_print ('Ocurrio el siguiente error: ' || SQLERRM || ' - '
                    || SQLCODE
                   );
   END dograbarmodificarusuario;


   PROCEDURE doviewadmgrupo (
      portlet__titulo   IN   VARCHAR2,
      session__userid   IN   VARCHAR2 DEFAULT NULL
   )
/*
||    Author:         Cristina Zenteno Garcia
||    Overview:    Procedimiento que escribe en html el formulario para crear grupos
||    Modificaciones:
||            17/07/2009  - CZG   -   Creaci¿n del procedimiento
*/
   IS
   BEGIN
      pku_administrar_users.dojavascriptajax;
      pku_administrar_users.dojavascriptcomun;
      usp_print
         ('
      <script>
         function refrescarGrupos()
            {  var par = thisform.ag_tipousu.value;
                llamarAjax(''divGrupos'',''mod_UsuarioGrupos'',''doListarGruposAjax'',''&ag_tipousu=''+par);
            }
        function crear()
            {   var tipo = thisform.ag_tipousu.value;
                if (tipo != "0")
                {   abrir(''mod_UsuarioGrupos'',''doviewcreargrupo'',''&ag_tipousu=''+tipo,''wCrearGrupo'');
                }
                else
                {   alert("Debe seleccionar un tipo de usuario");
                }
            }
        function modificar(codigo)
            {   abrir(''mod_UsuarioGrupos'',''doviewmodificargrupo'',''&ag_usucod=''+codigo,''wModificarGrupo'');
            }
      </script>
      '
         );
      usp_print
         (   '
    <table border="0" width=100% align=center class=tableform cellpadding=3 cellspacing=0>
        <tr>
            <td colspan="3">
                <h3>'
          || portlet__titulo
          || '</h3>
            <br>
            </td>
        </tr>
        <tr>
            <td class=c1>Tipo de Usuario</td>
            <td class=c1>
                <select name="ag_tipousu" style="width:98%" onChange="refrescarGrupos();">
                        <option value="0">Seleccione tipo de usuario</option>
                        <option value="1">Funcionario-Usuario Entidades</option>
                        <option value="2">Funcionario-Usuario OSCE</option>
                 </select></td>
            <td class=c1 align="center">
                <input type="button" name="btnCrear" value="Crear" onclick="crear();" /></td>
        </tr>
        <tr>
            <td colspan="3"><div name="divGrupos" id="divGrupos">&nbsp;</div>
            </td>
        </tr>
    </table> '
         );
   END doviewadmgrupo;

   PROCEDURE dolistargrupos (ag_tipousu IN VARCHAR2)
/*
||    Author:         Cristina Zenteno Garcia
||    Overview:    Procedimiento para listar los grupos segun el tipo de usuario
||                        seleccionado en el combo
||    Modificaciones:
||            17/07/2009  - CZG   -   Creaci¿n del procedimiento
*/
   IS
      CURSOR c_grupos
      IS
         SELECT   usu_codigo, usu_nombre, usu_coment, usu_tipo,
                  DECODE (usu_activo,
                          '1', 'Activo',
                          '0', 'Inactivo'
                         ) usu_activo
             FROM sease.usuario
            WHERE eue_codigo IS NULL AND usu_tipo = ag_tipousu
         ORDER BY usu_nombre;

      r_grupo   c_grupos%ROWTYPE;
   BEGIN
      usp_print
         ('
    <table border="0" width=100% align=center class=tableform cellpadding=3 cellspacing=0>
        <tr>
            <th class="th1" width="120px">C&oacute;digo</b></th>
            <th class="th1" width="180px">Nombre</b></th>
            <th class="th1" >Descripci&oacute;n</b></th>
            <th class="th1" >Estado</b></th>
            <th class="th1" width="100px">&nbsp; </b></th>
        </tr>
        '
         );

      IF c_grupos%ISOPEN
      THEN
         CLOSE c_grupos;

         OPEN c_grupos;
      ELSE
         OPEN c_grupos;
      END IF;

      LOOP
         FETCH c_grupos
          INTO r_grupo;

         EXIT WHEN c_grupos%NOTFOUND;
         usp_print
            (   '
        <tr>
            <td align="center"><input name="ag_usucod" type="hidden" value="'
             || r_grupo.usu_codigo
             || '" />'
             || r_grupo.usu_codigo
             || '</td>
             <td>'
             || r_grupo.usu_nombre
             || '</td>
            <td>'
             || r_grupo.usu_coment
             || '</td>
            <td>'
             || r_grupo.usu_activo
             || '</td>
            <td align="center">
                <input type="button" name="btnModificar" value="Modificar" onclick="modificar('''
             || r_grupo.usu_codigo
             || ''');" style="width:90px"/>
                    </td>
        </tr>
        '
            );
      END LOOP;

      CLOSE c_grupos;

      usp_print ('
    <table>
      ');
   END;

   PROCEDURE doviewcreargrupo (
      portlet__titulo   IN   VARCHAR2,
      session__userid   IN   VARCHAR2 DEFAULT NULL,
      ag_tipousu        IN   VARCHAR2
   )
   IS
   BEGIN
      pku_administrar_users.dojavascriptcomun;
      usp_print
         ('
      <script>
        function limpiar(){
            thisform.ag_grupcod.value="";
            thisform.ag_grupnom.value="";
            thisform.ag_grupcoment.value="";
        }
      </script>
      '
         );
      usp_print
         (   '
    <table border="0" width=100% align=center class=tableform cellpadding=3 cellspacing=0>
        <tr>
            <td><h4>Datos del Grupo</h4></td>
        </tr>
    </table>
    <hr>
    <table border="0" width=100% align=center class=tableform cellpadding=3 cellspacing=0>
        <tr>
            <td class=c1>C&oacute;digo</td>
            <td class=c2>
                <input type="text" name="ag_grupcod" maxlength="30" style="width:98%"/></td>
            <td class=c3>Ingrese el c&oacute;digo del grupo.</td>
        </tr>
        <tr>
            <td class=c1>Nombre</td>
            <td class=c2>
                <input type="text" name="ag_grupnom" maxlength="100" style="width:98%"/></td>
            <td class=c3>Ingrese el nombre del grupo.</td>
        </tr>
        <tr>
            <td class=c1>Descripci&oacute;n</td>
            <td class=c2>
                <textarea name="ag_grupcoment" rows="8" columns = "180" style="width:250px"></textarea>
            <td class=c3>Descripci&oacute;n del grupo.</td>
        </tr>
        <tr>
            <td class=c1>Tipo de Usuario</td>
            <td class=c2>
                <input name="ag_tipousu" type="hidden" value="'
          || ag_tipousu
          || '" />
                <select name="ag_tipousu" style="width:98%" disabled>
                        <option value="0">Seleccione tipo de usuario</option>
                        <option value="1"'
          || CASE ag_tipousu
                WHEN '1'
                   THEN ' selected '
                ELSE ''
             END
          || ' >Funcionario-Usuario Entidades</option>
                        <option value="2" '
          || CASE ag_tipousu
                WHEN '2'
                   THEN ' selected '
                ELSE ''
             END
          || '>Funcionario-Usuario OSCE</option>
                 </select></td>
            <td class=c3>Seleccione el tipo de usuario que tendra acceso al grupo</td>
        </tr>
        <tr>
            <td align="center" colspan="3" valign=top>
                <input type="button" name="g" value="Guardar" OnClick="accion(''dograbarnuevogrupo'')"/>
                &nbsp;
                <input type="button" name="l" value="Limpiar" OnClick="limpiar()"/>
                &nbsp;
                <input type="button" name="c" value="Cancelar" OnClick="cerrar()"/>
            </td>
        </tr>
    </table>
    <hr>'
         );
   EXCEPTION
      WHEN OTHERS
      THEN
         usp_print ('Ocurrio el siguiente error: ' || SQLERRM || ' - '
                    || SQLCODE
                   );
   END doviewcreargrupo;

   PROCEDURE doviewmodificargrupo (
      portlet__titulo   IN   VARCHAR2,
      session__userid   IN   VARCHAR2 DEFAULT NULL,
      ag_usucod         IN   VARCHAR2
   )
   IS
      CURSOR c_grupos
      IS
         SELECT usu_codigo, usu_nombre, usu_coment, usu_tipo,
                DECODE (usu_activo,
                        '1', 'Activo',
                        '0', 'Inactivo'
                       ) usu_activo
           FROM sease.usuario
          WHERE usu_codigo = RPAD (ag_usucod, 30);

      r_grupo   c_grupos%ROWTYPE;
      li_flag   INTEGER            := 1;
   BEGIN
      pku_administrar_users.dojavascriptcomun;

      SELECT SUM (CASE
                       WHEN INSTR (usu_miembros, ag_usucod) > 0
                          THEN 1
                       ELSE 0
                    END)
        INTO li_flag
        FROM sease.usuario
       WHERE usu_tipo IS NOT NULL AND eue_codigo IS NOT NULL;

      IF c_grupos%ISOPEN
      THEN
         CLOSE c_grupos;

         OPEN c_grupos;
      ELSE
         OPEN c_grupos;
      END IF;

      usp_print
         ('
    <table border="0" width=100% align=center class=tableform cellpadding=3 cellspacing=0>
        <tr>
            <td><h4>Datos del Grupo</h4></td>
        </tr>
    </table>
    <hr>
    <table border="0" width=100% align=center class=tableform cellpadding=3 cellspacing=0>
        <tr>'
         );

      LOOP
         FETCH c_grupos
          INTO r_grupo;

         EXIT WHEN c_grupos%NOTFOUND;
         usp_print
            (   '
        <tr>
            <td class=c1>C&oacute;digo</td>
            <td class=c2>'
            || CASE
                WHEN li_flag > 0 THEN '
                <input readonly name="ag_grupcod" maxlength="30" style="width:98%;background-color:#F5F5F5;" value="'|| r_grupo.usu_codigo || '"/>'
                ELSE  '<input type="text" name="ag_grupcod" maxlength="30" style="width:98%" value="'|| r_grupo.usu_codigo|| '"/>'  END ||'</td>
            <td class=c3>C&oacute;digo del grupo.</td>
        </tr>
        <tr>
            <td class=c1>Nombre</td>
            <td class=c2>
                <input type="text" name="ag_grupnom" maxlength="100" style="width:98%" value="'
             || r_grupo.usu_nombre
             || '"/></td>
            <td class=c3>Nombre del grupo.</td>
        </tr>
        <tr>
            <td class=c1>Descripci&oacute;n</td>
            <td class=c2>
                <textarea name="ag_grupcoment" rows="8" columns="180" style="width:98%" >'
             || r_grupo.usu_coment
             || '</textarea></td>
            <td class=c3>Descripci&oacute;n del grupo.</td>
        </tr>
        <tr>
            <td class=c1>Estado</td>
            <td class=c2>
                <select name="ag_estado" style="width:98%">
                        <option value="1"'
             || CASE r_grupo.usu_activo
                   WHEN 'Activo'
                      THEN ' selected '
                   ELSE ''
                END
             || ' >Activo</option>
                        <option value="0" '
             || CASE r_grupo.usu_activo
                   WHEN 'Inactivo'
                      THEN ' selected '
                   ELSE ''
                END
             || '>Inactivo</option>
                 </select>
            <td class=c3>Estado del grupo</td>
        </tr>
        <tr>
            <td class=c1>Tipo de Usuario</td>
            <td class=c2>'
             || CASE
                   WHEN li_flag > 0
                      THEN    '<select name="ag_tipousu" style="width:98%;background-color:#F5F5F5;" disabled >'
                           || CASE r_grupo.usu_tipo
                                 WHEN '1'
                                    THEN '<option value="1">Funcionario-Usuario Entidades</option>'
                                 WHEN '2'
                                    THEN '<option value="2">Funcionario-Usuario OSCE</option>'
                              END
                   ELSE    '<select name="ag_tipousu" style="width:98%;" >
                            <option value="0">Seleccione tipo de usuario</option>
                            <option value="1"'
                        || CASE r_grupo.usu_tipo
                              WHEN '1'
                                 THEN ' selected '
                              ELSE ''
                           END
                        || ' >Funcionario-Usuario Entidades</option>
                                    <option value="2" '
                        || CASE r_grupo.usu_tipo
                              WHEN '2'
                                 THEN ' selected '
                              ELSE ''
                           END
                        || '>Funcionario-Usuario OSCE</option>'
                END
             || '</select></td>
            <td class=c3>Seleccione el tipo de usuario que tendra acceso al grupo</td>'
            );
      END LOOP;

      usp_print
         ('</tr>
        <tr>
            <td align="center" colspan="3" valign=top>
                <input type="button" name="btnGuardar" value="Guardar" OnClick="accion(''dograbarmodificargrupo'')"/>
                &nbsp;
                <input type="button" name="btnCerrar" value="Cancelar" OnClick="cerrar()"/>
            </td>
        </tr>
    </table>
    <hr>'
         );
   EXCEPTION
      WHEN OTHERS
      THEN
         usp_print ('Ocurrio el siguiente error: ' || SQLERRM || ' - '
                    || SQLCODE
                   );
   END doviewmodificargrupo;

   PROCEDURE dograbarnuevogrupo (
      session__userid       IN   VARCHAR2 DEFAULT NULL,
      ag_grupcod            IN   VARCHAR2,
      ag_grupnom            IN   VARCHAR2,
      ag_grupcoment         IN   VARCHAR2,
      ag_tipousu            IN   VARCHAR2,
      iisenv__remote_host   IN   VARCHAR2 DEFAULT NULL
   )
/*
||    Author:         Cristina Zenteno Garcia
||    Overview:    Procedimiento para crear grupos
||    Modificaciones:
||            16/07/2009  - CZG   -   Creaci¿n del procedimiento
*/
   IS
   BEGIN
      INSERT INTO sease.usuario
                  (usu_codigo, usu_nombre         , usu_tipo       , usu_coment,
                   apl_codigo, usu_ip             , usu_ult_modi   )
           VALUES (ag_grupcod, ag_grupnom         , ag_tipousu     , ag_grupcoment,
                   1         , iisenv__remote_host, session__userid);

      usp_print
         ('<script>
                    var par = window.opener;
                    par.refrescarGrupos();
                    window.close(); </script>'
         );
   EXCEPTION
      WHEN OTHERS
      THEN
         usp_print ('Ocurrio el siguiente error: ' || SQLERRM || ' - '
                    || SQLCODE
                   );
   END;

   PROCEDURE dograbarmodificargrupo (
      session__userid       IN   VARCHAR2 DEFAULT NULL,
      ag_grupcod            IN   VARCHAR2,
      ag_grupnom            IN   VARCHAR2,
      ag_grupcoment         IN   VARCHAR2,
      ag_estado             IN   VARCHAR2,
      ag_tipousu            IN   VARCHAR2,
      iisenv__remote_host   IN   VARCHAR2 DEFAULT NULL
   )
/*
||    Author:         Cristina Zenteno Garcia
||    Overview:    Procedimiento para crear grupos
||    Modificaciones:
||            16/07/2009  - CZG   -   Creaci¿n del procedimiento
*/
   IS
   BEGIN
      UPDATE sease.usuario
         SET usu_nombre = ag_grupnom,
             --usu_tipo = ag_tipousu,   --JMD
             usu_coment = ag_grupcoment,
             apl_codigo = 1,
             usu_activo = ag_estado,
             usu_ult_modi = session__userid,
             usu_ip = iisenv__remote_host,
             fec_ult_modi = sysdate
       WHERE usu_codigo = RPAD (ag_grupcod, 30);

      usp_print
         ('<script>
                    var par = window.opener;
                    par.refrescarGrupos();
                    window.close(); </script>'
         );
   EXCEPTION
      WHEN OTHERS
      THEN
         usp_print ('Ocurrio el siguiente error: ' || SQLERRM || ' - '
                    || SQLCODE
                   );
   END;

   PROCEDURE doviewreporte (portlet__titulo IN VARCHAR2)
/*
||    Author:         Cristina Zenteno Garcia
||    Overview:     Procedimiento que escribe en html la pagina para seleccionar los reportes
||    Modificaciones:
||            02/07/2009  - CZG   -   Creaci¿n del procedimiento
*/
   IS
   BEGIN
      usp_print
         (   '
    <table border="0" width=100% align=center class=tableform cellpadding=3 cellspacing=0>
        <tr>
            <td colspan ="3">
              <h3>'
          || portlet__titulo
          || '</h3>
              </br>
            </td>
        </tr>
        <tr>
            <td class=c1 align=right>1. </td>
            <td class=c1>'
          || makea ('ag_tiporeporte=1&scriptdo=doViewDetaReporte',
                    'Usuarios activos/inactivos seg&uacute;n rango de fechas'
                   )
          || '
            </td>
            <td class=c1>&nbsp;</td>
        </tr>
        <tr>
            <td class=c1 align=right>2. </td>
            <td class=c1>'
          || makea
                ('ag_tiporeporte=2&scriptdo=doViewDetaReporte',
                 'Usuarios registrados por ubicaci&oacute;n geogr&aacute;fica'
                )
          || '
            </td>
            <td class=c1>&nbsp;</td>
        </tr>
        <tr>
            <td class=c1 align=right>3. </td>
            <td class=c1>'
          || makea ('ag_tiporeporte=3&scriptdo=doViewDetaReporte',
                    'Usuarios registrados seg&uacute;n perfiles'
                   )
          || '
            </td>
            <td class=c1>&nbsp;</td>
        </tr>
        <tr>
            <td class=c1 align=right>4. </td>
            <td class=c1>'
          || makea
                ('ag_tiporeporte=4&scriptdo=doViewDetaReporte',
                 'Usuarios por cada entidad registrada en el Registro de Entidades Contratantes (REC)'
                )
          || '
            </td>
            <td class=c1>&nbsp;</td>
        </tr>
        <tr>
            <td class=c1 align=right>5. </td>
            <td class=c1>'
          || makea ('ag_tiporeporte=5&scriptdo=doViewDetaReporte',
                    'Usuarios registrados seg&uacute;n tipo de entidades'
                   )
          || '
            </td>
            <td class=c1>&nbsp;</td>
        </tr>
    </table>'
         );
   END doviewreporte;

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
*/
   IS
   BEGIN
      usp_print
         (   '
      <table border="0" width=100% align=center class=tableform cellpadding=3 cellspacing=0>
        <tr>
            <td colspan ="3">
              <h3>'
          || portlet__titulo
          || '</h3>
              </br>
            </td>
        </tr>
        <tr>
            <td class=c1 align=right>1. </td>');
/*
      usp_print ('
            <td class=c1>'
          || makea
                ('ag_tiporeporte=7&scriptdo=doViewDetaReporteGen',
                 'Usuarios registrados en la Entidad'
                )
          || '
            </td>');
*/
      usp_print ('
            <td class=c1>'
          || makea
                ('ag_codent='||session__eue_codigo||'&ag_estado=1&scriptdo=doviewReporte7',
                 'Usuarios registrados en la Entidad')
          || '
            </td>
            <td class=c1>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
      </table>'
         );
   END doviewreporteGen;

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
    */
   IS
      v_orden    NUMBER (2);
      v_tipent   VARCHAR2 (50);

      CURSOR c_perfiles IS
      SELECT TRIM (usu.usu_codigo) usu_codigo, usu.usu_nombre
        FROM sease.usuario usu
       WHERE usu.usu_activo = 1
         AND usu.apl_codigo = 1
         AND usu.eue_codigo IS NULL
         AND usu.usu_tipo IS NOT NULL
    ORDER BY TRIM (usu.usu_nombre) ASC;

    r_perfil c_perfiles%ROWTYPE;
   BEGIN
      pku_administrar_users.dojavascriptajax;
      pku_administrar_users.dojavascriptcomun;
      usp_print
         (' <script>
            function RtnEntidad(codEnt,desc)
            {   thisform.ag_codent.value=codEnt;
                thisform.ag_descent.value=desc;
            }
            function validaParametros()
            {  var flag = false; '
         );

      IF (ag_tiporeporte = '1')
      THEN
         usp_print
            ('
            if (vacio(thisform.ag_fecini.value) || vacio(thisform.ag_fecfin.value))
            {   alert("Debe seleccionar las fechas de inicio y fin");
            }
         '
            );
      ELSIF (ag_tiporeporte = '2')
      THEN
         usp_print
            ('
            if ( (thisform.ag_departamento.value == "99" || thisform.ag_departamento.value == "00") &&
                 (thisform.ag_provincia.value == "99" || thisform.ag_provincia.value == "00") &&
                 (thisform.ag_distrito.value == "99" || thisform.ag_distrito.value == "00"))
            {   alert("Seleccione la ubicacin geogrfica");  }
        '
            );
      ELSIF (ag_tiporeporte = '3')
      THEN
         usp_print
            ('
            if (thisform.ag_perfil.value == "")
            {   alert("Seleccione el perfil");}
            if (vacio(thisform.ag_codent.value))
            {   alert("Seleccione una entidad");}
        '
            );
      ELSIF (ag_tiporeporte = '4')
      THEN
         usp_print
            ('
            if (vacio(thisform.ag_codent.value))
            {   alert("Seleccione una entidad");}
        '
            );
      ELSIF (ag_tiporeporte = '5')
      THEN
         usp_print
            ('
            thisform.ag_tipoent_des.value = thisform.ag_tipoent.options[thisform.ag_tipoent.selectedIndex].text;
            thisform.ag_subtipoent_des.value = thisform.ag_subtipoent.options[thisform.ag_subtipoent.selectedIndex].text;
            if (thisform.ag_tipoent.value == "0")
            {   alert("Seleccione el tipo de entidad");
            }
            ');
      END IF;

      usp_print
         (   '
            else
            { flag = true;}
            if (flag == true)
            {   accion(''doviewReporte'
          || ag_tiporeporte
          || '''); }
         }');

      if (ag_tiporeporte = '5') then
        usp_print('
        function cargarSubTipoEntidad()
        {
            thisform.scriptdo.value = "doviewdetareporte";
            thisform.submit();
        }
        ');
      end if;
      usp_print('
        </script>'
         );


     usp_print('
      <script>
      function volver_listado() {
        thisform.scriptdo.value="doviewreporte";
        thisform.submit();
      }
      </script>');


      usp_print (   '
    <table border="0" width=100% align=center class=tableform cellpadding=3 cellspacing=0>
        <tr>
            <td colspan ="2">
              <h3>'
          || portlet__titulo
          || '</h3>
            </td>
            <td align="right" valign=top width="50%">
                <!--input type="button" name="c" value="Volver" OnClick="regresar()"/-->
                <input type="button" name="c" value="Volver" OnClick="volver_listado()"/>
            </td>
        </tr> ');

      IF (ag_tiporeporte = '1')
      THEN
         usp_print
            ('
        <tr>
            <td colspan="3" align=center>
                <h4>
                Usuarios Activos/ Inactivos seg&uacute;n rango de fecha
                </br></br>
                </h4>
            </td>
        </tr>
        <tr>
            <td class=c1>Estado</td>
            <td class=c2>
                <select name="ag_estado" style="width:98%">
                    <option value="1">Activo</option>
                    <option value="0">Inactivo</option>
                    <option value="T">Todos</option>
                </select></td>
            <td class=c3>Seleccione el estado.</td>
        </tr>
        <tr>
            <td class=c1>Fecha Inicial
            </td>
            <td class=c2>
                <input readonly name="ag_fecini" style="width:90%" class=CalSelect  onclick="calendario(this)"></td>
            </td>
            <td class=c3>Seleccione la fecha de inicio
            </td>
        </tr>
        <tr>
            <td class=c1>Fecha Fin
            </td>
            <td class=c2>
                <input readonly name="ag_fecfin" style="width:90%" class=CalSelect  onclick="calendario(this)"></td>
            </td>
            <td class=c3>Seleccione la fecha de fin
            </td>
        </tr> ');
      ELSIF (ag_tiporeporte = '2')
      THEN
         usp_print
            ('
         <tr>
            <td colspan="3" align=center>
                <h4>
                Usuarios Registrados por Ubicaci&oacute;n Geogr&aacute;fica
                </br></br>
                </h4>
            </td>
        </tr>
        <tr>
            <td class=c1 colspan="3">Ubicaci&oacute;n Geogr&aacute;fica
            </td>
        </tr>   ');
         pku_administrar_users.f_lista_ubigeo ('mod_usuarioReportes');
      ELSIF (ag_tiporeporte = '3')
      THEN
         usp_print
            ('
        <tr>
            <td colspan="3" align=center>
                <h4>
                Usuarios Registrados seg&uacute;n perfiles
                </br></br>
                </h4>
            </td>
        </tr>
        <tr>
            <td class=c1>Entidad</td>
            <td class=c2>
                <input name="ag_descent" type="text" style="width:300px"
                    class=ViewSelect onclick="abrir(''mod_usuarioReportes'',''doBuscarEntidad'','''',''wbuscaEntidad'')" value="" readonly="true"/>
                <input name="ag_codent" type="hidden" value=""/></td>
            <td class=c3>Seleccione la entidad.</td>
        </tr>
        <tr>
            <td class=c1>Perfil</td>
            <td class=c2>
                <select name="ag_perfil" style="width:98%">
                        <option value="">Seleccione el perfil</option>');

         OPEN c_perfiles;
         LOOP
            FETCH c_perfiles INTO r_perfil;
            EXIT WHEN c_perfiles%NOTFOUND;

                usp_print('<option value="'||r_perfil.usu_codigo||'">'||r_perfil.usu_nombre||'</option>');
         END LOOP;
         CLOSE c_perfiles;

         usp_print('</select></td>
            <td class=c3>Seleccione el tipo de usuario funcionario</td>
        </tr>' );
      ELSIF (ag_tiporeporte = '4')
      THEN
         usp_print
            ('
        <tr>
            <td colspan="3" align=center>
                <h4>Usuarios por cada entidad registra en el REC
                </br></br>
                </h4>
            </td>
        </tr>
        <tr>
            <td class=c1>Entidad</td>
            <td class=c2>
                <input name="ag_descent" type="text" style="width:300px"
                    class=ViewSelect onclick="abrir(''mod_usuarioReportes'',''doBuscarEntidad'','''',''wbuscaEntidad'')" value="" readonly="true"/>
                <input name="ag_codent" type="hidden" value=""/></td>
            <td class=c3>Seleccione la entidad.</td>
        </tr>
        <tr>
            <td class=c1>Estado</td>
            <td class=c2>
                <select name="ag_estado" style="width:95%">
                    <option value="1">Activo</option>
                    <option value="0">Inactivo</option>
                    <option value="">Todos</option>
                </select></td>
            <td class=c3>Seleccione el estado.</td>
        </tr>
        ');
      ELSIF (ag_tiporeporte = '5')
      THEN
         usp_print
            ('
        <tr>
            <td colspan="3" align=center>
                <h4>Usuarios seg&uacute;n tipo de entidades
                </br></br>
                </h4>
            </td>
        </tr>
        <tr>
            <td class=c1>Tipo de Entidad</td>
            <td class=c2>
                <div name="divTipoEntidad" id="divTipoEntidad" >'
            );
        USP_GET_TIPO_ENTIDAD_ACTUAL(ag_tipoent);
        -- pku_administrar_users.f_get_tipoentidad;
        usp_print ('
                    <input type="hidden" name="ag_tiporeporte" value="'||ag_tiporeporte||'"/>
                    <input type="hidden" name="ag_tipoent_des" value=""/>
                    <input type="hidden" name="ag_subtipoent_des" value=""/>
                </div>');
         usp_print
            ('
               </td>
            <td class=c3>Seleccione el tipo de entidad.</td>
        </tr>
        <tr>
            <td class=c1>Subtipo de Entidad</td>
            <td class=c2>
                <div name="divSubtipoEntidad" id="divSubtipoEntidad">'
            );
        USP_GET_SUBTIPO_ENTIDAD_ACTUAL(ag_tipoent);
        usp_print ('
                </div>');
        usp_print
            ('
            </td>
            <td class=c3>Seleccione el subtipo de entidad.</td>
        </tr>'
            );
      END IF;

      usp_print
         ('
        <tr>
            <td class=c1>&nbsp;
            </td>
            <td class=c2 align=center>
                <input type="button" name="btnBuscar" style="width:20%"
                        value="Buscar" OnClick="validaParametros();"/>
                <input name="v_modulo" type="hidden" value="mod_usuarioReportes"/>
            </td>
            <td class=c3>&nbsp;
            </td>
        </tr>
    </table>'
         );

      IF (ag_tiporeporte = '2')
      THEN
         usp_print
            ('
    <script>
        document.getElementById(''ag_departamento'').value = "15";
        refrescarProvincias(''mod_usuarioReportes'',''dolistarprovincias'',''divProvincias'');
        document.getElementById(''ag_provincia'').value = "01";
        refrescarDistritos(''mod_usuarioReportes'',''dolistardistritos'',''divDistritos'');
        document.getElementById(''ag_distrito'').value = "01";
    </script>'
            );
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         usp_print ('Ocurrio el siguiente error: ' || SQLERRM || ' - '
                    || SQLCODE
                   );
   END doviewdetareporte;

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
*/
   IS
      v_orden    NUMBER (2);
      v_tipent   VARCHAR2 (50);

      CURSOR c_perfiles IS
      SELECT TRIM (usu.usu_codigo) usu_codigo, usu.usu_nombre
        FROM sease.usuario usu
       WHERE usu.usu_activo = 1
         AND usu.apl_codigo = 1
         AND usu.eue_codigo IS NULL
         AND usu.usu_tipo IS NOT NULL
    ORDER BY TRIM (usu.usu_nombre) ASC;

    r_perfil c_perfiles%ROWTYPE;
   BEGIN
      pku_administrar_users.dojavascriptajax;
      pku_administrar_users.dojavascriptcomun;
      usp_print
         (' <script>
            function RtnEntidad(codEnt,desc)
            {   thisform.ag_codent.value=codEnt;
                thisform.ag_descent.value=desc;
            }
            function validaParametros()
            {  var flag = false; '
         );

      IF (ag_tiporeporte = '7')
      THEN
         usp_print
            ('
            if (vacio(thisform.ag_codent.value))
            {   alert("Seleccione una entidad");}
        '
            );
      END IF;

      usp_print
         (   '
            else
            { flag = true;}
            if (flag == true)
            {   accion(''doviewReporte'
          || ag_tiporeporte
          || '''); }
         }
        </script>'
         );


     usp_print('
      <script>
      function volver_listado() {
        thisform.scriptdo.value="doviewreporteGen";
        thisform.submit();
      }
      </script>');


      usp_print (   '
    <table border="0" width=100% align=center class=tableform cellpadding=3 cellspacing=0>
        <tr>
            <td colspan ="2">
              <h3>'
          || portlet__titulo
          || '</h3>
            </td>
            <td align="right" valign=top width="50%">
                <!--input type="button" name="c" value="Volver" OnClick="regresar()"/-->
                <input type="button" name="c" value="Volver" OnClick="volver_listado()"/>
            </td>
        </tr> ');

      IF (ag_tiporeporte = '7')
      THEN
         usp_print
            ('
        <tr>
            <td colspan="3" align=center>
                <h4>Usuarios registrados en la Entidad
                </br></br>
                </h4>
            </td>
        </tr>
        <tr>
            <td class=c1>Entidad</td>
            <td class=c2>
                <input name="ag_descent" type="text" style="width:300px" value = "'||session__entdescripcion||'"
                    class=ViewSelect onclick="abrir(''mod_usuarioReportes'',''doBuscarEntidad'','''',''wbuscaEntidad'')" value="" readonly="true"/>
                <input name="ag_codent" type="hidden" value="'||session__eue_codigo||'"/></td>
            <td class=c3>Seleccione la entidad.</td>
        </tr>
        <tr>
            <td class=c1>Estado</td>
            <td class=c2>
                <select name="ag_estado" style="width:95%">
                    <option value="1">Activo</option>
                    <option value="0">Inactivo</option>
                    <!--option value="T">Todos</option-->
                </select></td>
            <td class=c3>Seleccione el estado.</td>
        </tr>
        ');

      END IF;

      usp_print
         ('
        <tr>
            <td class=c1>&nbsp;
            </td>
            <td class=c2 align=center>
                <input type="button" name="btnBuscar" style="width:20%"
                        value="Buscar" OnClick="validaParametros();"/>
                <input name="v_modulo" type="hidden" value="mod_usuarioReportes"/>
            </td>
            <td class=c3>&nbsp;
            </td>
        </tr>
    </table>'
         );

   EXCEPTION
      WHEN OTHERS
      THEN
         usp_print ('Ocurrio el siguiente error: ' || SQLERRM || ' - '
                    || SQLCODE
                   );
   END doviewdetareporteGen;

   PROCEDURE doviewreporte1 (
      portlet__titulo   IN   VARCHAR2,
      ag_estado         IN   VARCHAR2,
      ag_fecini         IN   VARCHAR2,
      ag_fecfin         IN   VARCHAR2,
      ag_currentpage    IN   VARCHAR2 := 1
   )
/*
||    Author:         Cristina Zenteno Garcia
||    Overview:     Reporte 1
//                          Usuarios Activos/Inactivos por rango de fechas
||    Modificaciones:
||            05/08/2009  - CZG   -   Creaci¿n del procedimiento
*/
   IS
      lv_currentpage   NUMBER;
      lv_num           NUMBER;
      lv_num_users     NUMBER;
      lv_iterador      NUMBER               NOT NULL DEFAULT 0;

      CURSOR c_usuarios (v_currentpage VARCHAR2)
      IS
         SELECT *
           FROM (SELECT ROWNUM num, a.*
                   FROM (SELECT usu_codigo, usu_nombre, usu_cargousuario,
                                DECODE(usu_tipo,
                                       1, 'Usuario-Funcionario Entidades',
                                       2, 'Usuario-Funcionario OSCE',
                                       'Pendiente de seleccionar'
                                       ) usu_tipo,
                                TRIM(usu_email) usu_email, ----MMAUTINO: EL DIA 01.07.2015 SE AGREGA TRIM AL CAMPO USU_EMAIL 
                                usu_telefono,
                                returnentidad (usu_codigo) entidad,
                                TO_CHAR(usu_frecepciondcto,'dd/MM/yyyy') usu_frecepciondcto,
                                TO_CHAR(usu_fcreacion,'dd/MM/yyyy') usu_fcreacion,
                                TO_CHAR (fec_ult_modi,'dd/MM/yyyy') usu_fultimodi
                           FROM sease.usuario
                         -- WHERE usu_activo like '%'||ag_estado||'%'

                          WHERE usu_activo = ( case to_char(ag_estado) when '1' then 1 when '0' then 0 when 'T' then usu_activo end  )
                           --WHERE usu_activo = ( case when ag_estado is null then usu_activo else to_number(ag_estado) end  )
                            AND eue_codigo IS NOT NULL
                            AND ( usu_fcreacion >= TO_DATE (ag_fecini, 'dd/MM/yyyy') AND
                                  usu_fcreacion <= TO_DATE (ag_fecfin, 'dd/MM/yyyy') + 1)  --JMD 07/07/2010
                         ORDER BY usu_nombre) a) b
          WHERE b.num BETWEEN 50 * (TO_NUMBER (v_currentpage) - 1) + 1
                          AND 50 * TO_NUMBER (v_currentpage);

      --if ag_estado = 'T' then
      --  r_usuario        c_usuarios2%ROWTYPE;
      --else
        r_usuario        c_usuarios%ROWTYPE;
      --end if;
   BEGIN
      pku_administrar_users.dojavascriptcomun;

      IF ag_currentpage IS NULL
      THEN
         lv_currentpage := 1;
      ELSE
         lv_currentpage := ag_currentpage;
      END IF;

      SELECT COUNT (*)
        INTO lv_num_users
        FROM sease.usuario
       --WHERE usu_activo = ag_estado
       WHERE usu_activo = ( case to_char(ag_estado) when '1' then 1 when '0' then 0 when 'T' then usu_activo end  )
      -- WHERE usu_activo = ( case when ag_estado is null  then usu_activo else to_number(ag_estado) end )
         AND eue_codigo IS NOT NULL
         AND ( usu_fcreacion >= TO_DATE (ag_fecini, 'dd/MM/yyyy') AND
               usu_fcreacion <= TO_DATE (ag_fecfin, 'dd/MM/yyyy') + 1);

     usp_print('<INPUT name="ag_tiporeporte" type="hidden" value="1">');

     usp_print('
      <script>
      function volver_listado() {
        thisform.scriptdo.value="doviewdetareporte";
        thisform.submit();
      }
      </script>');

      usp_print('
    <table border="0" width=100% align=center class=tableform cellpadding=3 cellspacing=0>
        <tr>
            <td colspan="2"><h3>'
          || portlet__titulo
          || '</h3>
            </td>
            <td align="right">
                <!--input type="button" name="c" value="Volver" OnClick="regresar()"-->
                <input type="button" name="c" value="Volver" OnClick="volver_listado()"/>
            </td>
        </tr>
        <tr>
            <td colspan="3"><h4>Par&aacute;metros:</h4>
            </td>
        </tr>
        <tr>
            <td class=c1 align="center">Estado: '
         );

      IF ag_estado = '0'
      THEN
         usp_print ('Inactivo');
      ELSIF ag_estado = '1'
      THEN
         usp_print ('Activo');
      END IF;

      usp_print
           (   '</td>
            <td class=c1 align="center">Fecha Inicio: '
            || ag_fecini
            || '</td>
            <td class=c1 align="center">Fecha Fin: '
            || ag_fecfin
            || '</td>
        </tr>
    </table>
    <br>'
           );
      showpaginacion (lv_currentpage,
                      lv_num_users,
                         'ag_estado='
                      || ag_estado
                      || '&ag_fecini='
                      || ag_fecini
                      || '&ag_fecfin='
                      || ag_fecfin,
                      '&scriptdo=doviewReporte1',
                      50
                     );
      usp_print
         ('
    <table border="0" width=100% align=center class=tableform cellpadding=3 cellspacing=0>
        <tr>
            <th class="th1">Usuario</b></th>
            <th class="th1">Nombre</b></th>
            <th class="th1">Entidad</b></th>
            <th class="th1">Cargo</b></th>
            <th class="th1">Tipo</b></th>
            <th class="th1">E-mail</b></th>
            <th class="th1">Tel&eacute;fono</b></th>
            <th class="th1">Fecha<br>Creacion</b></th>
            <th class="th1">Fecha<br>Ult.Modif.</b></th>
         '
         );

      IF c_usuarios%ISOPEN
      THEN
         CLOSE c_usuarios;

         OPEN c_usuarios (lv_currentpage);
      ELSE
         OPEN c_usuarios (lv_currentpage);
      END IF;

      lv_num := 0;

      LOOP
         FETCH c_usuarios
          INTO r_usuario;

         lv_num := lv_num + 1;
         EXIT WHEN c_usuarios%NOTFOUND;

         IF MOD (lv_num, 2) = 0
         THEN
            usp_print ('
        <tr bgcolor="#ECE9D8">');
         ELSE
            usp_print ('
        <tr>');
         END IF;

         usp_print
            (   '
            <td valign="top" align="center">'
             || makea (   'ag_usufun='
                       || r_usuario.usu_codigo
                       || '&ag_parametro1='
                       || ag_estado
                       || '&ag_parametro2='
                       || ag_fecini
                       || '&ag_parametro3='
                       || ag_fecfin
                       || '&ag_tipo=1'
                       || '&scriptdo=doviewreporte6',
                       '' || r_usuario.usu_codigo || ''
                      )
             || '</td>
            <td valign="top" align="left">'
             || r_usuario.usu_nombre
             || '</td>
            <td valign="top" align="left">'
             || r_usuario.entidad
             || '</td>
            <td valign="top" align="left">'
             || r_usuario.usu_cargousuario
             || '</td>
            <td valign="top" align="left">'
             || r_usuario.usu_tipo
             || '</td>
            <td valign="top" align="left">'
             || r_usuario.usu_email
             || '</td>
            <td valign="top" align="left">'
             || r_usuario.usu_telefono
             || '</td>
            <td valign="top" align="center">'
             || r_usuario.usu_fcreacion    --usu_frecepciondcto
             || '</td>
            <td valign="top" align="center">'
             || r_usuario.usu_fultimodi
             || '</td>'
            );
      END LOOP;

      CLOSE c_usuarios;

      usp_print ('
        </tr>
    </table>');
   EXCEPTION
      WHEN OTHERS
      THEN
         usp_print ('Ocurrio el siguiente error: ' || SQLERRM || ' - '
                    || SQLCODE
                   );
   END doviewreporte1;

   PROCEDURE doviewreporte2 (
      portlet__titulo   IN   VARCHAR2,
      ag_departamento   IN   VARCHAR2,
      ag_provincia      IN   VARCHAR2,
      ag_distrito       IN   VARCHAR2,
      ag_currentpage    IN   VARCHAR2 := 1
   )
/*
||    Author:         Cristina Zenteno Garcia
||    Overview:     Reporte 2
//                          Usuarios por ubicacion geografica
||    Modificaciones:
||            05/08/2009  - CZG   -   Creaci¿n del procedimiento
*/
   IS
      lv_currentpage    NUMBER;
      lv_num_users      NUMBER;
      lv_num            NUMBER;
      lv_iterador       NUMBER               NOT NULL DEFAULT 0;
      lv_departamento   VARCHAR2 (100);
      lv_provincia      VARCHAR2 (100);
      lv_distrito       VARCHAR2 (100);

      CURSOR c_usuarios (v_currentpage VARCHAR2)
      IS
         SELECT *
           FROM (SELECT ROWNUM num, a.*
                   FROM (SELECT   usu_codigo, usu_nombre, usu_cargousuario,
                                  DECODE
                                     (usu_tipo,
                                      1, 'Usuario-Funcionario Entidades',
                                      2, 'Usuario-Funcionario OSCE',
                                      'Pendiente de seleccionar'
                                     ) usu_tipo,
                                  TRIM(usu_email) usu_email, ----MMAUTINO: EL DIA 01.07.2015 SE AGREGA TRIM AL CAMPO USU_EMAIL
                                  usu_telefono,
                                  returnentidad (usu_codigo) entidad,
                                  TO_CHAR
                                      (usu_frecepciondcto,
                                       'dd/MM/yyyy'
                                      ) usu_frecepciondcto,
                                  TO_CHAR (usu_fcreacion,
                                           'dd/MM/yyyy'
                                          ) usu_fcreacion,
                                  TO_CHAR (fec_ult_modi,
                                           'dd/MM/yyyy'
                                          ) usu_fec_modi
                             FROM sease.usuario
                            WHERE usu_activo = 1
                              AND eue_codigo IS NOT NULL
                              AND dep_codigo = ag_departamento
                              AND pro_codigo = ag_provincia
                              AND dis_codigo = ag_distrito
                         ORDER BY usu_nombre) a) b
          WHERE b.num BETWEEN 50 * (TO_NUMBER (v_currentpage) - 1) + 1
                          AND 50 * TO_NUMBER (v_currentpage);

      r_usuario         c_usuarios%ROWTYPE;
   BEGIN
      pku_administrar_users.dojavascriptcomun;

      IF ag_currentpage IS NULL
      THEN
         lv_currentpage := 1;
      ELSE
         lv_currentpage := ag_currentpage;
      END IF;

      SELECT COUNT (*)
        INTO lv_num_users
        FROM sease.usuario
       WHERE usu_activo = 1
         AND eue_codigo IS NOT NULL
         AND dep_codigo = ag_departamento
         AND pro_codigo = ag_provincia
         AND dis_codigo = ag_distrito;

      SELECT DISTINCT dep_desc
                 INTO lv_departamento
                 FROM sease.dep_ubigeo
                WHERE dep_codigo = ag_departamento;

      SELECT DISTINCT pro_desc
                 INTO lv_provincia
                 FROM sease.prov_ubigeo
                WHERE pro_codigo = ag_provincia
                  AND dep_codigo = ag_departamento;

      SELECT dis_desc
        INTO lv_distrito
        FROM sease.dist_ubigeo
       WHERE dis_codigo = ag_distrito
         AND pro_codigo = ag_provincia
         AND dep_codigo = ag_departamento;

     usp_print('<INPUT name="ag_tiporeporte" type="hidden" value="2">');

     usp_print('
      <script>
      function volver_listado() {
        thisform.scriptdo.value="doviewdetareporte";
        thisform.submit();
      }
      </script>');

      usp_print ('
    <table border="0" width=100% align=center class=tableform cellpadding=3 cellspacing=0>
        <tr>
            <td colspan="2"><h3>'
          || portlet__titulo
          || '</h3>
            </td>
            <td align="right">
                <!--input type="button" name="c" value="Volver" OnClick="regresar()"/-->
                <input type="button" name="c" value="Volver" OnClick="volver_listado()"/>
            </td>
        </tr>
        <tr>
            <td colspan="3"><h4>Par&aacute;metros:</h4>
            </td>
        </tr>
        <tr>
            <td class=c1 align="center">Departamento: '
          || lv_departamento
          || ' </td>
            <td class=c1 align="center">Provincia: '
          || lv_provincia
          || '</td>
            <td class=c1 align="center">Distrito: '
          || lv_distrito
          || '</td>
        </tr>
    </table>
    <br> '
         );
      showpaginacion (lv_currentpage,
                      lv_num_users,
                         'ag_departamento='
                      || ag_departamento
                      || '&ag_provincia='
                      || ag_provincia
                      || '&ag_distrito='
                      || ag_distrito,
                      '&scriptdo=doviewReporte2',
                      50
                     );
      usp_print
         ('
    <br>
    <table border="0" width=100% align=center class=tableform cellpadding=3 cellspacing=0>
        <tr>
            <th class="th1">Usuario</b></th>
            <th class="th1">Nombre</b></th>
            <th class="th1">Entidad</b></th>
            <th class="th1">Cargo</b></th>
            <th class="th1">Tipo</b></th>
            <th class="th1">E-mail</b></th>
            <th class="th1">Tel&eacute;fono</b></th>
            <th class="th1">Fecha creacion</b></th>
            <th class="th1">Fecha modificacion</b></th>
         '
         );

      IF c_usuarios%ISOPEN
      THEN
         CLOSE c_usuarios;

         OPEN c_usuarios (lv_currentpage);
      ELSE
         OPEN c_usuarios (lv_currentpage);
      END IF;

      lv_num := 0;

      LOOP
         FETCH c_usuarios
          INTO r_usuario;

         lv_num := lv_num + 1;
         EXIT WHEN c_usuarios%NOTFOUND;

         IF MOD (lv_num, 2) = 0
         THEN
            usp_print ('
        <tr bgcolor="#ECE9D8">');
         ELSE
            usp_print ('
        <tr>');
         END IF;

         usp_print
            (   '
            <td valign="top" align="center">'
             || makea (   'ag_usufun='
                       || r_usuario.usu_codigo
                       || '&ag_parametro1='
                       || ag_departamento
                       || '&ag_parametro2='
                       || ag_provincia
                       || '&ag_parametro3='
                       || ag_distrito
                       || '&ag_tipo=2'
                       || '&scriptdo=doviewreporte6',
                       '' || r_usuario.usu_codigo || '' )
             || '</td>
            <td valign="top" align="left">'
             || r_usuario.usu_nombre
             || '</td>
            <td valign="top" align="left">'
             || r_usuario.entidad
             || '</td>
            <td valign="top" align="left">'
             || r_usuario.usu_cargousuario
             || '</td>
            <td valign="top" align="left">'
             || r_usuario.usu_tipo
             || '</td>
            <td valign="top" align="left">'
             || r_usuario.usu_email
             || '</td>
            <td valign="top" align="center">'
             || r_usuario.usu_telefono
             || '</td>
            <td valign="top" align="center">'
             || r_usuario.usu_fcreacion --usu_frecepciondcto
             || '</td>
            <td valign="top" align="center">'
             || r_usuario.usu_fec_modi --usu_fcreacion
             || '</td>'
            );
      END LOOP;

      CLOSE c_usuarios;

      usp_print ('
        </tr>
    </table>');
   EXCEPTION
      WHEN OTHERS
      THEN
         usp_print ('Ocurrio el siguiente error: ' || SQLERRM || ' - '
                    || SQLCODE
                   );
   END doviewreporte2;

   PROCEDURE doviewreporte3 (
      portlet__titulo  IN  VARCHAR2,
      ag_perfil        IN  VARCHAR2,
      ag_codent        in  varchar2,
      ag_currentpage   IN  VARCHAR2 := 1 )
/*
||    Author:         Cristina Zenteno Garcia
||    Overview:     Reporte 3
//                          Usuarios por perfil
||    Modificaciones:
||            07/08/2009  - CZG   -   Creaci¿n del procedimiento
*/
   IS
      lv_perfil VARCHAR2(100);
      lv_currentpage   NUMBER;
      lv_num_users     NUMBER;
      lv_num           NUMBER;
      lv_iterador      NUMBER               NOT NULL DEFAULT 0;

      CURSOR c_usuarios (v_currentpage VARCHAR2)
      IS
         SELECT *
           FROM (SELECT ROWNUM num, a.*
                   FROM (  SELECT usu_codigo, usu_nombre  , usu_cargousuario,
                                  TRIM(usu_email) usu_email, ----MMAUTINO: EL DIA 01.07.2015 SE AGREGA TRIM AL CAMPO USU_EMAIL 
                                  usu_telefono,
                                  returnentidad (usu_codigo) entidad,
                                  TO_CHAR(usu_frecepciondcto,'dd/MM/yyyy') usu_frecepciondcto,
                                  TO_CHAR(usu_fcreacion,'dd/MM/yyyy') usu_fcreacion,
                                  TO_CHAR(fec_ult_modi,'dd/MM/yyyy') usu_fultimodi,
                                  case usu_activo when 1 then 'Activo'
                                                  when 0 then 'Inactivo'
                                                  else 'S/D' end usu_activo
                             FROM sease.usuario
                            WHERE eue_codigo = ag_codent --IS NOT NULL
                              AND usu_tipo IS NOT NULL
                              AND INSTR (usu_miembros,ag_perfil ) > 0
                         ORDER BY usu_nombre) a) b
          WHERE b.num BETWEEN 50 * (TO_NUMBER (v_currentpage) - 1) + 1
                          AND 50 * TO_NUMBER (v_currentpage);

      r_usuario        c_usuarios%ROWTYPE;
   BEGIN
      pku_administrar_users.dojavascriptcomun;

      IF ag_currentpage IS NULL
      THEN
         lv_currentpage := 1;
      ELSE
         lv_currentpage := ag_currentpage;
      END IF;

      SELECT usu_nombre
        INTO lv_perfil
        FROM sease.usuario
        WHERE usu_codigo = RPAD(ag_perfil,30);

      SELECT COUNT (*)
        INTO lv_num_users
        FROM sease.usuario
        WHERE eue_codigo = ag_codent --IS NOT NULL
          AND usu_tipo IS NOT NULL
          AND INSTR (usu_miembros,ag_perfil ) > 0 ;

     usp_print('<INPUT name="ag_tiporeporte" type="hidden" value="3">');

     usp_print('
      <script>
      function volver_listado() {
        thisform.scriptdo.value="doviewdetareporte";
        thisform.submit();
      }
      </script>');

      usp_print ('
    <table border="0" width=100% align=center class=tableform cellpadding=3 cellspacing=0>
        <tr>
            <td colspan="2"><h3>'
          || portlet__titulo
          || '</h3>
            </td>
            <td align="right">
                <!--input type="button" name="c" value="Volver" OnClick="regresar()"-->
                <input type="button" name="c" value="Volver" OnClick="volver_listado()"/>
            </td>
        </tr>
        <tr>
            <td colspan="3"><h4>Par&aacute;metros:</h4>
            </td>
        </tr>
        <tr>
            <td class=c1 align="center" colspan="3">Perfil: '||lv_perfil||'
            </td>
        </tr>
    </table>
    <br> ');
      showpaginacion (lv_currentpage,
                      lv_num_users,
                      'ag_perfil=' || ag_perfil,
                      '&scriptdo=doviewReporte3',
                      50
                     );
      usp_print
         ('
    <br>
    <table border="0" width=100% align=center class=tableform cellpadding=3 cellspacing=0>
        <tr>
            <th class="th1">Usuario</b></th>
            <th class="th1">Nombre</b></th>
            <th class="th1">Entidad</b></th>
            <th class="th1">Cargo</b></th>
            <th class="th1">E-mail</b></th>
            <th class="th1">Tel&eacute;fono</b></th>
            <th class="th1">Fecha<br>Creacion</b></th>
            <th class="th1">Fecha<br>Ult.Modif.</b></th>
            <th class="th1">Estado</b></th>
         ');

      IF c_usuarios%ISOPEN
      THEN
         CLOSE c_usuarios;

         OPEN c_usuarios (lv_currentpage);
      ELSE
         OPEN c_usuarios (lv_currentpage);
      END IF;

      lv_num := 0;

      LOOP
         FETCH c_usuarios
          INTO r_usuario;

         lv_num := lv_num + 1;
         EXIT WHEN c_usuarios%NOTFOUND;

         IF MOD (lv_num, 2) = 0
         THEN
            usp_print ('
        <tr bgcolor="#ECE9D8">');
         ELSE
            usp_print ('
        <tr>');
         END IF;

         usp_print
            (   '
            <td valign="top" align="center">'
             || makea (   'ag_usufun='
                       || r_usuario.usu_codigo
                       || '&ag_parametro1='
                       || ag_codent
                       || '&ag_parametro2='
                       || ag_perfil
                       || '&ag_tipo=3'
                       || '&scriptdo=doviewreporte6',
                       '' || r_usuario.usu_codigo || '' )
             || '</td>
            <td valign="top" align="left">'
             || r_usuario.usu_nombre
             || '</td>
            <td valign="top" align="left">'
             || r_usuario.entidad
             || '</td>
            <td valign="top" align="left">'
             || r_usuario.usu_cargousuario
             || '</td>
            <td valign="top" align="left">'
             || r_usuario.usu_email
             || '</td>
            <td valign="top" align="left">'
             || r_usuario.usu_telefono
             || '</td>
            <td valign="top" align="center">'
             || r_usuario.usu_fcreacion
             || '</td>
            <td valign="top" align="center">'
             || r_usuario.usu_fultimodi
             || '</td>
            <td valign="top" align="center">'
             || r_usuario.usu_activo
             || '</td>'
            );
      END LOOP;

      CLOSE c_usuarios;

      usp_print ('
        </tr>
    </table>');
   EXCEPTION
      WHEN OTHERS
      THEN
         usp_print ('Ocurrio el siguiente error: ' || SQLERRM || ' - '
                    || SQLCODE
                   );
   END doviewreporte3;

   PROCEDURE doviewreporte4 (
      portlet__titulo   IN   VARCHAR2,
      ag_codent         IN   VARCHAR2,
      ag_estado         in   varchar2,
      ag_currentpage    IN   VARCHAR2 := 1
   )
/*
||    Author:         Cristina Zenteno Garcia
||    Overview:     Reporte 4
//                          Usuarios por Entidad Contratante
||    Modificaciones:
||            05/08/2009  - CZG   -   Creaci¿n del procedimiento
*/
   IS
      lv_currentpage   NUMBER;
      lv_num_users     NUMBER;
      lv_num           NUMBER;
      lv_iterador      NUMBER               NOT NULL DEFAULT 0;
      lv_entidad       VARCHAR2 (100);

      CURSOR c_usuarios (v_currentpage VARCHAR2)
      IS
         SELECT *
           FROM (SELECT ROWNUM num, a.*
                   FROM (SELECT   u.usu_codigo      , u.usu_nombre,
                                  u.usu_cargousuario, TRIM(u.usu_email) usu_email, ----MMAUTINO: EL DIA 01.07.2015 SE AGREGA TRIM AL CAMPO USU_EMAIL
                                  u.usu_telefono,
                                  returnentidad (u.usu_codigo) entidad,
                                  TO_CHAR (u.usu_frecepciondcto,'dd/MM/yyyy') usu_frecepciondcto,
                                  TO_CHAR (u.usu_fcreacion,'dd/MM/yyyy') usu_fcreacion,
                                  TO_CHAR (u.fec_ult_modi,'dd/MM/yyyy') usu_fultimodi,
                                  DECODE (u.usu_activo, 1, 'Activo', 0, 'Inactivo', '') estado
                             FROM sease.usuario u, sease.entidadue_anho e
                            WHERE u.eue_codigo IS NOT NULL
                              AND e.eue_codigo = ag_codent
                              AND u.eue_codigo = e.eue_codigo
                              --and u.usu_activo = ag_estado
                              and u.usu_activo = (case when ag_estado is null  then u.usu_activo else to_number(ag_estado) end)
                              AND e.eue_anho = TO_CHAR (SYSDATE, 'yyyy')
                         ORDER BY u.usu_nombre) a) b
          WHERE b.num BETWEEN 50 * (TO_NUMBER (v_currentpage) - 1) + 1
                          AND 50 * TO_NUMBER (v_currentpage);

      r_usuario        c_usuarios%ROWTYPE;
   BEGIN
      pku_administrar_users.dojavascriptcomun;

      IF ag_currentpage IS NULL
      THEN
         lv_currentpage := 1;
      ELSE
         lv_currentpage := ag_currentpage;
      END IF;

      SELECT COUNT (*)
        INTO lv_num_users
        FROM sease.usuario u, sease.entidadue_anho e
       WHERE u.eue_codigo IS NOT NULL
         AND e.eue_codigo = ag_codent
         AND u.eue_codigo = e.eue_codigo
         --and u.usu_activo = ag_estado
         and u.usu_activo = (case when ag_estado is null  then u.usu_activo else to_number(ag_estado) end)
         AND e.eue_anho = TO_CHAR (SYSDATE, 'yyyy');

      SELECT eue_desc
        INTO lv_entidad
        FROM sease.entidadue_anho
       WHERE eue_codigo = ag_codent AND eue_anho = TO_CHAR (SYSDATE, 'yyyy');

     usp_print('<INPUT name="ag_tiporeporte" type="hidden" value="4">');

     usp_print('
      <script>
      function volver_listado() {
        thisform.scriptdo.value="doviewdetareporte";
        thisform.submit();
      }
      </script>');

      usp_print ( '
    <table border="0" width=100% align=center class=tableform cellpadding=3 cellspacing=0>
        <tr>
            <td colspan="2"><h3>'
          || portlet__titulo
          || '</h3>
            </td>
            <td align="right">
                <!--input type="button" name="c" value="Volver" OnClick="regresar()"/-->
                <input type="button" name="c" value="Volver" OnClick="volver_listado()"/>
            </td>
        </tr>
        <tr>
            <td colspan="3"><h4>Par&aacute;metros:</h4>
            </td>
        </tr>
        <tr>
            <td class=c1 align="center" colspan="3">Entidad Contratante: '
          || lv_entidad
          || '
            </td>
        </tr>
    </table>
    <br> '
         );

     /*
   showpaginacion (lv_currentpage,
                      lv_num_users,
                         'ag_estado='
                      || ag_estado
                      || '&ag_fecini='
                      || ag_fecini
                      || '&ag_fecfin='
                      || ag_fecfin,
                      '&scriptdo=doviewReporte1',
                      50
                     );*/

      showpaginacion (lv_currentpage,
                      lv_num_users,
                      'ag_codent=' || ag_codent
                      ||'&ag_estado=' || ag_estado,
                      '&scriptdo=doviewReporte4',
                      50
                     );
      usp_print
         ('
    <br>
    <table border="0" width=100% align=center class=tableform cellpadding=3 cellspacing=0>
        <tr>
            <th class="th1">Usuario</b></th>
            <th class="th1">Nombre</b></th>
            <th class="th1">Entidad</b></th>
            <th class="th1">Cargo</b></th>
            <th class="th1">E-mail</b></th>
            <th class="th1">Tel&eacute;fono</b></th>
            <th class="th1">Fecha<br>Creacion</b></th>
            <th class="th1">Fecha<br>Ult.Modif.</b></th>
            <th class="th1">Estado</b></th>
         ');

      IF c_usuarios%ISOPEN
      THEN
         CLOSE c_usuarios;

         OPEN c_usuarios (lv_currentpage);
      ELSE
         OPEN c_usuarios (lv_currentpage);
      END IF;

      lv_num := 0;

      LOOP
         FETCH c_usuarios
          INTO r_usuario;

         lv_num := lv_num + 1;
         EXIT WHEN c_usuarios%NOTFOUND;

         IF MOD (lv_num, 2) = 0
         THEN
            usp_print ('
        <tr bgcolor="#ECE9D8">');
         ELSE
            usp_print ('
        <tr>');
         END IF;

         usp_print
            (   '
            <td valign="top" align="center">'
             || makea (   'ag_usufun='
                       || r_usuario.usu_codigo
                       || '&ag_parametro1='
                       || ag_codent
                       || '&ag_parametro2='
                       || ag_estado
                       || '&ag_tipo=4'
                       || '&scriptdo=doviewreporte6',
                       '' || r_usuario.usu_codigo || ''
                      )
             || '</td>
            <td valign="top" align="left">'
             || r_usuario.usu_nombre
             || '</td>
            <td valign="top" align="left">'
             || r_usuario.entidad
             || '</td>
            <td valign="top" align="left">'
             || r_usuario.usu_cargousuario
             || '</td>
            <td valign="top" align="left">'
             || r_usuario.usu_email
             || '</td>
            <td valign="top" align="left">'
             || r_usuario.usu_telefono
             || '</td>
            <td valign="top" align="center">'
             || r_usuario.usu_fcreacion
             || '</td>
            <td valign="top" align="center">'
             || r_usuario.usu_fultimodi
             || '</td>
            <td valign="top" align="left">'
             || r_usuario.estado
             || '</td>'
            );
      END LOOP;

      CLOSE c_usuarios;

      usp_print ('
        </tr>
    </table>');
   EXCEPTION
      WHEN OTHERS
      THEN
         usp_print ('Ocurrio el siguiente error: ' || SQLERRM || ' - '
                    || SQLCODE
                   );
   END doviewreporte4;

           PROCEDURE doviewreporte5 (
        portlet__titulo   IN   VARCHAR2,
        ag_tipoent        IN   VARCHAR2,
        ag_subtipoent     IN   VARCHAR2,
        ag_tipoent_des    IN   VARCHAR2,
        ag_subtipoent_des IN   VARCHAR2,
        ag_currentpage    IN   VARCHAR2 := 1
    )
    IS
    /*
    ||    Author: Cristina Zenteno Garcia
    ||    Overview: Reporte 5 - Usuarios por tipo de entidad
    ||    Modificaciones:
    ||      05/08/2009 - Cristina Zenteno - Creacin del procedimiento
    ||      19/03/2012 - Martin Zanelli - Modificacin del reporte y consulta
    ||                   (se cambian los filtros por los campos actualmente usados en el REC)
    ||                   Memo 98-2012/SDP-CC
    */
        lv_currentpage   NUMBER;
        lv_num_users     NUMBER;
        lv_num           NUMBER;
        lv_iterador      NUMBER NOT NULL DEFAULT 0;

        CURSOR c_totalusu (v_currentpage VARCHAR2)
        IS
            SELECT *
            FROM (
                SELECT ROWNUM num, usutotal.*
                FROM (
                    SELECT   u.eue_codigo, ent.eue_desc,
                        SUM (CASE u.usu_activo WHEN 1 THEN 1 ELSE 0 END ) activos,
                        SUM (CASE u.usu_activo WHEN 0 THEN 1 ELSE 0 END ) inactivos,
                        COUNT (u.usu_codigo) total
                    FROM (
                        SELECT DISTINCT eue_codigo, eue_desc
                        FROM sease.entidadue_anho x
                        WHERE
                            x.eue_anho = TO_CHAR (SYSDATE,'yyyy')
                            AND x.eue_activo = 1
                            AND x.act_ccodigo = ag_tipoent
                            AND (x.ins_ccodigo = ag_subtipoent or ag_subtipoent = 0)
                        ) ent,
                        sease.usuario u
                    WHERE
                        u.eue_codigo = ent.eue_codigo
                        AND u.eue_codigo IS NOT NULL
                    GROUP BY u.eue_codigo, ent.eue_desc
                    ORDER BY ent.eue_desc
                ) usutotal
            ) b
            WHERE
                b.num BETWEEN 50 * (TO_NUMBER (v_currentpage) - 1) + 1
                AND 50 * TO_NUMBER (v_currentpage);

        r_totalusu       c_totalusu%ROWTYPE;
    BEGIN
        pku_administrar_users.dojavascriptcomun;

        IF ag_currentpage IS NULL THEN
            lv_currentpage := 1;
        ELSE
            lv_currentpage := ag_currentpage;
        END IF;

        SELECT COUNT (*)
        INTO lv_num_users
        FROM (
            SELECT
                u.eue_codigo, ent.eue_desc,
                SUM (CASE u.usu_activo WHEN 1 THEN 1 ELSE 0 END) activos,
                SUM (CASE u.usu_activo WHEN 0 THEN 1 ELSE 0 END) inactivos,
                COUNT (u.usu_codigo) total
            FROM (
                SELECT DISTINCT eue_codigo, eue_desc
                FROM sease.entidadue_anho x
                WHERE
                    x.eue_anho = TO_CHAR (SYSDATE,'yyyy')
                    AND x.eue_activo = 1
                    AND x.act_ccodigo = ag_tipoent
                    AND (x.ins_ccodigo = ag_subtipoent or ag_subtipoent = 0)
                ) ent,
                sease.usuario u
            WHERE
                u.eue_codigo = ent.eue_codigo
                AND u.eue_codigo IS NOT NULL
            GROUP BY u.eue_codigo, ent.eue_desc
            ORDER BY ent.eue_desc);

        usp_print('
        <table border="0" width=100% align=center class=tableform cellpadding=3 cellspacing=0>
            <tr>
                <td colspan="2"><h3>'||portlet__titulo||'</h3></td>
                <td align="right"><input type="button" name="c" value="Volver" OnClick="regresar()"/></td>
            </tr>
            <tr>
                <td colspan="3"><h4>Par&aacute;metros:</h4></td>
            </tr>
            <tr><td class=c1 align="center" colspan="3">Tipo de Entidad: '||ag_tipoent_des||'</td><tr>
            <tr><td class=c1 align="center" colspan="3">Subtipo de Entidad: '||case when ag_subtipoent = 0 then 'TODOS' else ag_subtipoent_des end||'</td></tr>
        </table>
        <br> ');
        showpaginacion(
                lv_currentpage,
                lv_num_users,
                'ag_tipoent=' || ag_tipoent,
                '&scriptdo=doviewReporte5',
                50);
        usp_print('
        <br>
        <table border="0" width=100% align=center class=tableform cellpadding=3 cellspacing=0>
            <tr>
                <th class="th1">Entidad</b></th>
                <th class="th1">Usuarios Activos</b></th>
                <th class="th1">Usuarios Inactivos</b></th>
                <th class="th1">Total Usuarios</b></th>');

        IF c_totalusu%ISOPEN
        THEN
            CLOSE c_totalusu;

            OPEN c_totalusu (lv_currentpage);
        ELSE
            OPEN c_totalusu (lv_currentpage);
        END IF;

        lv_num := 0;

        LOOP
            FETCH c_totalusu INTO r_totalusu;
                lv_num := lv_num + 1;
            EXIT WHEN c_totalusu%NOTFOUND;

            IF MOD (lv_num, 2) = 0 THEN
                usp_print('
                <tr bgcolor="#ECE9D8">');
            ELSE
                usp_print('
                <tr>');
            END IF;

            usp_print('
                <td valign="top">'|| r_totalusu.eue_desc||'</td>
                <td valign="top" align="center">'||r_totalusu.activos||'</td>
                <td valign="top" align="center">'||r_totalusu.inactivos||'</td>
                <td valign="top" align="center">'||r_totalusu.total||'</td>');
        END LOOP;

        CLOSE c_totalusu;

        usp_print ('
            </tr>
        </table>');

        EXCEPTION
        WHEN OTHERS THEN
            usp_print ('Ocurrio el siguiente error: ' || SQLERRM ||' - '|| SQLCODE );
   END doviewreporte5;


   PROCEDURE doviewreporte6 (portlet__titulo IN VARCHAR2,
                             ag_usufun       IN VARCHAR2,
                             ag_parametro1   in varchar2,
                             ag_parametro2   in varchar2,
                             ag_parametro3   in varchar2,
                             ag_parametro4   in varchar2,
                             ag_tipo         in varchar2)
   IS
/*
||    Author:         Cristina Zenteno Garcia
||    Overview:     Reporte 6
//                          Detalle del usuario
||    Modificaciones:
||            10/08/2009  - CZG   -   Creaci¿n del procedimiento
*/
      CURSOR c_usuario
      IS
         SELECT u.usu_codigo, u.usu_nombre, u.usu_activo, TRIM(u.usu_email) usu_email,  ----MMAUTINO: EL DIA 01.07.2015 SE AGREGA TRIM AL CAMPO USU_EMAIL
                u.usu_telefono, u.usu_direccion, u.usu_dni,
                u.usu_cargousuario,
                TO_CHAR (u.usu_fcreacion, 'dd/MM/yyyy') usu_fcreacion,
                usu_tipo,
                DECODE (usu_tipo,
                        1, 'Usuario-Funcionario Entidades',
                        2, 'Usuario-Funcionario OSCE',
                        'Pendiente de seleccionar'
                       ) usu_tipo2,
                returnentidad (usu_codigo) entidad
           FROM sease.usuario u
          WHERE usu_codigo = RPAD (ag_usufun, 30);

      CURSOR c_perfiles (lv_usufun VARCHAR2, lv_tipo VARCHAR2)
      IS
         SELECT TRIM (usu.usu_codigo) usu_codigo, usu.usu_nombre
           FROM sease.usuario usu
          WHERE INSTR (listargruposxusuario (TRIM (lv_usufun), lv_tipo),
                       TRIM (usu.usu_codigo)
                      ) >= 1
            AND usu.eue_codigo IS NULL;

      r_usuario   c_usuario%ROWTYPE;
      r_perfil    c_perfiles%ROWTYPE;
   BEGIN
      pku_administrar_users.dojavascriptcomun;
     /*
     usp_print('valor1: '||ag_parametro1||'<br>');
     usp_print('valor2: '||ag_parametro2||'<br>');
     usp_print('valor3: '||ag_parametro3||'<br>');
     usp_print('valor4: '||ag_parametro4||'<br>');
     */

     if ag_tipo = '1' then
       usp_print('<INPUT name="ag_estado" type="hidden" value="'||ag_parametro1||'">
                  <INPUT name="ag_fecini" type="hidden" value="'||ag_parametro2||'">
                  <INPUT name="ag_fecfin" type="hidden" value="'||ag_parametro3||'"> ');
     elsif ag_tipo = '2' then
       usp_print('<INPUT name="ag_departamento" type="hidden" value="'||ag_parametro1||'">
                  <INPUT name="ag_provincia"    type="hidden" value="'||ag_parametro2||'">
                  <INPUT name="ag_distrito"     type="hidden" value="'||ag_parametro3||'"> ');
     elsif ag_tipo = '3' then
       usp_print('<INPUT name="ag_codent" type="hidden" value="'||ag_parametro1||'">
                  <INPUT name="ag_perfil" type="hidden" value="'||ag_parametro2||'"> ');
     elsif ag_tipo = '4' OR ag_tipo = '7' then
       usp_print('<INPUT name="ag_codent" type="hidden" value="'||ag_parametro1||'">
                  <INPUT name="ag_estado" type="hidden" value="'||ag_parametro2||'"> ');
     elsif ag_tipo = '5' then
       usp_print('<INPUT name="ag_tipoent" type="hidden" value="'||ag_parametro1||'">');
     end if;

--     usp_print('<INPUT name="ag_estado" type="hidden" value="'||ag_parametro4||'"> ');

     usp_print('
      <script>
      function volver_listado() {');

      if ag_tipo = '1' then
        usp_print(' thisform.scriptdo.value="doviewreporte1";');
     elsif ag_tipo = '2' then
        usp_print(' thisform.scriptdo.value="doviewreporte2";');
     elsif ag_tipo = '3' then
        usp_print(' thisform.scriptdo.value="doviewreporte3";');
     elsif ag_tipo = '4' then
        usp_print(' thisform.scriptdo.value="doviewreporte4";');
     elsif ag_tipo = '5' then
        usp_print(' thisform.scriptdo.value="doviewreporte5";');
     elsif ag_tipo = '7' then
        usp_print(' thisform.scriptdo.value="doviewreporte7";');
     end if;

     usp_print('
         thisform.submit();
      }
      </script>
      ');

      usp_print
         (   '
    <table border="0" width=100% align=center class=tableform cellpadding=3 cellspacing=0>
        <tr>
            <td colspan="2"><h3>'
          || portlet__titulo
          || '</h3>
            </td>
            <td align="right">
                <!--input type="button" name="c" value="Volver" OnClick="regresar()"-->
                <input type="button" name="c" value="Volver" OnClick="volver_listado()"/>
            </td>
        </tr>
        <tr>
            <td colspan="3"><h4>Par&aacute;metros:</h4>
            </td>
        </tr>
        <tr>
            <td class=c1 align="center" colspan="3">Usuario: '
          || ag_usufun
          || '</td>
        </tr>
    </table>'
         );

      IF c_usuario%ISOPEN
      THEN
         CLOSE c_usuario;

         OPEN c_usuario;
      ELSE
         OPEN c_usuario;
      END IF;

      LOOP
         FETCH c_usuario
          INTO r_usuario;

         EXIT WHEN c_usuario%NOTFOUND;
         usp_print
            (   '
      <table border="0" width=100% align=center class=tableform cellpadding=3 cellspacing=0>
        <tr>
            <td class=c1>Nombre:</td>
            <td class=c2> '
             || r_usuario.usu_nombre
             || '</td>
        </tr>
        <tr>
            <td class=c1>DNI:</td>
            <td class=c2> '
             || r_usuario.usu_dni
             || '</td>
        </tr>
        <tr>
            <td class=c1>Tipo de Usuario:</td>
            <td class=c2> '
             || r_usuario.usu_tipo2
             || '</td>
        </tr>
        <tr>
            <td class=c1>Cargo:</td>
            <td class=c2> '
             || r_usuario.usu_cargousuario
             || '</td>
        </tr>
        <tr>
            <td class=c1>Direcci&oacute;n:</td>
            <td class=c2> '
             || r_usuario.usu_direccion
             || '</td>
        </tr>
        <tr>
            <td class=c1>Tel&eacute;fono:</td>
            <td class=c2> '
             || r_usuario.usu_telefono
             || '</td>
        </tr>
        <tr>
            <td class=c1>Perfiles Asignados:</td>
            <td class=c2>
        '
            );

         OPEN c_perfiles (r_usuario.usu_codigo, r_usuario.usu_tipo);

         LOOP
            FETCH c_perfiles
             INTO r_perfil;

            EXIT WHEN c_perfiles%NOTFOUND;
            usp_print (r_perfil.usu_nombre || '<br>');
         END LOOP;

         usp_print ('</td>
       </tr>
      </table>');
      END LOOP;
   END doviewreporte6;

PROCEDURE doviewreporte7 (
      portlet__titulo   IN   VARCHAR2,
      ag_codent         IN   VARCHAR2,
      ag_estado         in   VARCHAR2,
      ag_currentpage    IN   VARCHAR2 := 1
   )
/*
||    Author:         Cristina Zenteno Garcia
||    Overview:     Reporte 4
//                          Usuarios por Entidad Contratante
||    Modificaciones:
||            05/08/2009  - CZG   -   Creaci¿n del procedimiento
*/
   IS
      lv_currentpage   NUMBER;
      lv_num_users     NUMBER;
      lv_num           NUMBER;
      lv_iterador      NUMBER               NOT NULL DEFAULT 0;
      lv_entidad       VARCHAR2 (100);

      CURSOR c_usuarios (v_currentpage VARCHAR2)
      IS
         SELECT *
           FROM (SELECT ROWNUM num, a.*
                   FROM (SELECT   u.usu_codigo      , u.usu_nombre,
                                  u.usu_cargousuario, TRIM(u.usu_email) usu_email,    ----MMAUTINO: EL DIA 01.07.2015 SE AGREGA TRIM AL CAMPO USU_EMAIL
                                  u.usu_telefono,
                                  returnentidad (u.usu_codigo) entidad,
                                  TO_CHAR (u.usu_frecepciondcto,'dd/MM/yyyy') usu_frecepciondcto,
                                  TO_CHAR (u.usu_fcreacion,'dd/MM/yyyy') usu_fcreacion,
                                  TO_CHAR (u.fec_ult_modi,'dd/MM/yyyy') usu_fultimodi,
                                  DECODE (u.usu_activo, 1, 'Activo', 0, 'Inactivo', '') estado
                             FROM sease.usuario u, sease.entidadue_anho e
                            WHERE u.eue_codigo IS NOT NULL
                              AND e.eue_codigo = ag_codent
                              AND u.eue_codigo = e.eue_codigo
                              --and u.usu_activo = ag_estado
                              AND e.eue_anho = TO_CHAR (SYSDATE, 'yyyy')
                         ORDER BY u.usu_nombre) a) b
          WHERE b.num BETWEEN 50 * (TO_NUMBER (v_currentpage) - 1) + 1
                          AND 50 * TO_NUMBER (v_currentpage);

      r_usuario        c_usuarios%ROWTYPE;
   BEGIN
      pku_administrar_users.dojavascriptcomun;

      IF ag_currentpage IS NULL
      THEN
         lv_currentpage := 1;
      ELSE
         lv_currentpage := ag_currentpage;
      END IF;

      SELECT COUNT (*)
        INTO lv_num_users
        FROM sease.usuario u, sease.entidadue_anho e
       WHERE u.eue_codigo IS NOT NULL
         AND e.eue_codigo = ag_codent
         AND u.eue_codigo = e.eue_codigo
         --and u.usu_activo = ag_estado  Atenci¿n de Incidencia 99
         AND e.eue_anho = TO_CHAR (SYSDATE, 'yyyy');

      SELECT eue_desc
        INTO lv_entidad
        FROM sease.entidadue_anho
       WHERE eue_codigo = ag_codent AND eue_anho = TO_CHAR (SYSDATE, 'yyyy');

     usp_print('<INPUT name="ag_tiporeporte" type="hidden" value="7">');

     usp_print('
      <script>
      function volver_listado() {
        thisform.scriptdo.value="doviewreporteGen";
        thisform.submit();
      }
      </script>');

      usp_print ( '
    <table border="0" width=100% align=center class=tableform cellpadding=3 cellspacing=0>
        <tr>
            <td colspan="2"><h3>'
          || portlet__titulo
          || '</h3>
            </td>
            <td align="right">
                <!--input type="button" name="c" value="Volver" OnClick="regresar()"/-->
                <input type="button" name="c" value="Volver" OnClick="volver_listado()"/>
            </td>
        </tr>
        <tr>
            <td colspan="3"><h4>Par&aacute;metros:</h4>
            </td>
        </tr>
        <tr>
            <td class=c1 align="center" colspan="3">Entidad: '
          || lv_entidad
          || '
            </td>
        </tr>
    </table>
    <br> '
         );

     /*
   showpaginacion (lv_currentpage,
                      lv_num_users,
                         'ag_estado='
                      || ag_estado
                      || '&ag_fecini='
                      || ag_fecini
                      || '&ag_fecfin='
                      || ag_fecfin,
                      '&scriptdo=doviewReporte1',
                      50
                     );*/

      showpaginacion (lv_currentpage,
                      lv_num_users,
                      'ag_codent=' || ag_codent
                      ||'&ag_estado=' || ag_estado,
                      '&scriptdo=doviewReporte7',
                      50
                     );
      usp_print
         ('
    <br>
    <table border="0" width=100% align=center class=tableform cellpadding=3 cellspacing=0>
        <tr>
            <th class="th1">Usuario</b></th>
            <th class="th1">Nombre</b></th>
            <th class="th1">Entidad</b></th>
            <th class="th1">Cargo</b></th>
            <th class="th1">E-mail</b></th>
            <th class="th1">Tel&eacute;fono</b></th>
            <th class="th1">Fecha<br>Creacion</b></th>
            <th class="th1">Fecha<br>Ult.Modif.</b></th>
            <th class="th1">Estado</b></th>
         ');

      IF c_usuarios%ISOPEN
      THEN
         CLOSE c_usuarios;

         OPEN c_usuarios (lv_currentpage);
      ELSE
         OPEN c_usuarios (lv_currentpage);
      END IF;

      lv_num := 0;

      LOOP
         FETCH c_usuarios
          INTO r_usuario;

         lv_num := lv_num + 1;
         EXIT WHEN c_usuarios%NOTFOUND;

         IF MOD (lv_num, 2) = 0
         THEN
            usp_print ('
        <tr bgcolor="#ECE9D8">');
         ELSE
            usp_print ('
        <tr>');
         END IF;

         usp_print
            (   '
            <td valign="top" align="center">'
             || makea (   'ag_usufun='
                       || r_usuario.usu_codigo
                       || '&ag_parametro1='
                       || ag_codent
                       || '&ag_parametro2='
                       || ag_estado
                       || '&ag_tipo=7'
                       || '&scriptdo=doviewreporte6',
                       '' || r_usuario.usu_codigo || ''
                      )
             || '</td>
            <td valign="top" align="left">'
             || r_usuario.usu_nombre
             || '</td>
            <td valign="top" align="left">'
             || r_usuario.entidad
             || '</td>
            <td valign="top" align="left">'
             || r_usuario.usu_cargousuario
             || '</td>
            <td valign="top" align="left">'
             || r_usuario.usu_email
             || '</td>
            <td valign="top" align="left">'
             || r_usuario.usu_telefono
             || '</td>
            <td valign="top" align="center">'
             || r_usuario.usu_fcreacion
             || '</td>
            <td valign="top" align="center">'
             || r_usuario.usu_fultimodi
             || '</td>
            <td valign="top" align="left">'
             || r_usuario.estado
             || '</td>'
            );
      END LOOP;

      CLOSE c_usuarios;

      usp_print ('
        </tr>
    </table>');
   EXCEPTION
      WHEN OTHERS
      THEN
         usp_print ('Ocurrio el siguiente error: ' || SQLERRM || ' - '
                    || SQLCODE
                   );
   END doviewreporte7;

   PROCEDURE doviewcontrasenia (
      portlet__titulo   IN   VARCHAR2,
      session__userid   IN   VARCHAR2
   )
/*
||    Author:         Cristina Zenteno Garcia
||    Overview:    Muestra la pantalla para que el usuario modifique su contrase¿a
||    Modificaciones:
||            03/08/2009  - CZG   -   Creaci¿n del procedimiento
*/
   IS
      CURSOR c_inactivar
   IS
      SELECT DECODE (usu_fecult,
                     NULL, 0,
                      TRUNC(TO_DATE(TO_CHAR (ADD_MONTHS (usu_fecult, 4), 'dd/MM/yyyy'))- TO_DATE(TO_CHAR (sysdate, 'dd/MM/yyyy')))) diferencia
        FROM sease.usuario
       WHERE usu_activo = 1
         AND usu_codigo = RPAD(session__userid,30)
         AND eue_codigo IS NOT NULL
         AND usu_tipo IS NOT NULL
         AND (    usu_fecult IS NOT NULL
                  AND TRUNC(TO_DATE(TO_CHAR (ADD_MONTHS (usu_fecult, 4), 'dd/MM/yyyy')) -
                                             TO_DATE(TO_CHAR (sysdate, 'dd/MM/yyyy')))
                          BETWEEN 0 AND 7
                 );

   r_inactivar        c_inactivar%ROWTYPE;
   BEGIN

      pku_administrar_users.dojavascriptcomun;
      usp_print
         ('
        <script>
            function validar()
            {   var pwd = thisform.ag_paswd.value;
                 var pwd2 = thisform.ag_paswd2.value;
                 if (( pwd.length > 0) && (pwd == pwd2))
                 {  accion(''dograbarContrasenia'');
                 }
            }
        </script>
    '
         );

      usp_print
         (   '<table border="0" width=100% align=center class=tableform cellpadding=3 cellspacing=0>
        <tr>
            <td colspan ="3">
              <h3>'
          || portlet__titulo
          || '</h3>
              <input name="ag_usufun" type="hidden" value="'
          || session__userid
          || '" />
              <input name="ag_opcion" type="hidden" value="C" />
              </br>
            </td>
        </tr>
        <tr>
            <td colspan="3" class=c1 align="center">
                Por motivos de seguridad debe modificar su contrase&ntilde;a cada cuatro meses.
            </td>
        </tr>
         ');
      OPEN c_inactivar;
       LOOP
            FETCH c_inactivar INTO r_inactivar;
            EXIT WHEN c_inactivar%NOTFOUND;
                usp_print('
        <tr>
            <td colspan="3" class=c1 align="center" >
               <font size=3 color=#dd0000><b>Le quedan '|| to_char(r_inactivar.diferencia)  || ' dia(s) para modificar su contrase&ntilde;a, de lo contrario su contrase&ntilde;a caducar&aacute;.</b></font>
            </td>
        </tr>
                ');
       END LOOP;
       CLOSE c_inactivar;
        usp_print('
        <tr>
            <td colspan="3" >
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class=c1 align=right>Nueva Contrase&ntilde;a:</td>
            <td class=c2>
                <input type="password" name="ag_paswd" maxlength="30" style="width:98%"/></td>
            <td class=c3>Escriba la nueva contrase&ntilde;a</td>
        </tr>
        <tr>
            <td class=c1 align=right>Confirme la Contrase&ntilde;a:</td>
            <td class=c2>
                <input type="password" name="ag_paswd2" maxlength="30" style="width:98%"/></td>
            <td class=c3>Confirme la nueva contrase&ntilde;a</td>
        </tr>
        <tr>
            <td align="center" valign=top colspan="3">
                <input type="button" name="g" value="Guardar" OnClick="validar()"/>
            </td>
        </tr>
    </table>'
         );
   EXCEPTION
      WHEN OTHERS
      THEN
         usp_print ('Ocurrio el siguiente error: ' || SQLERRM || ' - '
                    || SQLCODE
                   );
   END doviewcontrasenia;

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
    */
    IS
        lv_notificacion   VARCHAR2 (1000);
    BEGIN
        UPDATE sease.usuario
        SET
            usu_c_pass = crypt (ag_paswd),
            usu_ult_modi = session__userid,
            fec_ult_modi = SYSDATE,
            usu_fecult = SYSDATE,
            usu_ip = iisenv__remote_host
        WHERE usu_codigo = RPAD (ag_usufun, 30);

        lv_notificacion := '
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2"><font color="#B40404"><b><u>NUEVA CONTRASE&Ntilde;A</u></b></font></td>
        </tr>
        <tr>
            <td><b>Nueva Contrase&ntilde;a:</b></td>
            <td> ' || ag_paswd ||'</td>
        </tr>';

        generarmensajenotificacion (ag_usufun, ag_opcion, lv_notificacion, ag_paswd);

        /*  Inserta javascripts */
        pku_administrar_users.dojavascriptcomun;

        /* Fin de insercion de javascripts*/
        IF ag_opcion = 'C' THEN
            --Auditoria
            insert into sease.usuario_historial
                   (tablename, id_registro , cod_evento, usu_registro   , ip_registro        , obs_registro)
            values ('USUARIO', ag_usufun   , 'C'       , session__userid, iisenv__remote_host, 'Cambio de Contrase&ntilde;a');
            --
            commit;
            --
            usp_print
                 ('<script>alert("Se modific\xf3 la contrase\xf1a");inicio();</script>');
        ELSIF ag_opcion = 'R' THEN
            --Auditoria
            insert into sease.usuario_historial
                   (tablename, id_registro , cod_evento, usu_registro   , ip_registro        , obs_registro)
            values ('USUARIO', ag_usufun   , 'R'       , session__userid, iisenv__remote_host, 'Reenvio Contrase&ntilde;a');
            --
            commit;
            --
            usp_print
                 ('<script>alert("Se modific\xf3 y envio la contrase\xf1a");cerrar();</script>');
        ELSIF ag_opcion = 'O' THEN
            --Auditoria
            insert into sease.usuario_historial
            (tablename, id_registro , cod_evento, usu_registro   , ip_registro        , obs_registro)
            values
            ('USUARIO', ag_usufun   , 'O'       , session__userid, iisenv__remote_host, 'Nueva contrase&ntilde;a');
            --
            commit;
        END IF;

        ag_return := 1;
   EXCEPTION
      WHEN ex_nonotificacion THEN
         usp_print (   'No se pudo realizar la notificaci&oacute;n: '
                    || SQLCODE
                    || ' - '
                    || SQLERRM
                   );
         ag_return := 0;
      WHEN OTHERS THEN
         usp_print (   'Ocurrio un error, no se pudo modificar la contrase&ntilde;a'
                    || SQLCODE
                    || ' - '
                    || SQLERRM
                   );
         ag_return := 0;
   END dograbarcontrasenia;

   PROCEDURE doviewactualizardatosusuario (
      portlet__titulo   IN   VARCHAR2,
      session__userid   IN   VARCHAR2
   )
/*
||    Author:         Cristina Zenteno Garcia
||    Overview:    Muestra la pantalla para que el propio usuario actualize sus datos
||    Modificaciones:
||            04/08/2009  - CZG   -   Creaci¿n del procedimiento
*/
   IS
      CURSOR c_datos
      IS
         SELECT usu_codigo     , usu_nombre   , usu_cargousuario, nvl(usu_dni,'') usu_dni, TRIM(usu_email) usu_email,   ----MMAUTINO: EL DIA 01.07.2015 SE AGREGA TRIM AL CAMPO USU_EMAIL
                usu_telefono   , usu_direccion, dep_codigo      , pro_codigo, dis_codigo,
                nvl(eue_descripcion,'') eue_descripcion, nvl(eue_direccion,'') eue_direccion
           FROM sease.usuario
          WHERE usu_codigo = RPAD (session__userid, 30);
--cambios arbitro nueva ley  
  CURSOR cFormArb
      IS
         select a.usu_codigo, a.usu_nombre, TRIM(a.usu_email) usu_email, ----MMAUTINO: EL DIA 01.07.2015 SE AGREGA TRIM AL CAMPO USU_EMAIL
                a.usu_telefono, b.c_ruc, b.v_nombre, b.v_apellido_pat,
                b.v_apellido_mat, b.c_cod_colegiatura, b.n_num_colegiatura, c.c_descripcion, a.usu_fcreacion, a.usu_activo  
         from sease.usuario a
          inner join sease.tbl_usu_arbitro b
            on a.usu_codigo = b.c_usu and a.apl_codigo = b.n_aplcodigo
          left join arbitraje.tbl_arb_maestro c on b.c_cod_colegiatura = c.n_id_maestro and c.n_id_tipomaestro = 24
         where a.usu_activo = 1
           and a.usu_tipo = '3'
           and trim(b.c_usu) = trim(session__userid);
      r_dato   c_datos%ROWTYPE;
      n_coutArbt number;
   BEGIN
for xrowArb in cFormArb loop
     n_coutArbt := xrowArb.Usu_Codigo;
   end loop;
   
   if n_coutArbt is not null then
     
   for xrowArb in cFormArb loop
     
   
   usp_print('<input type="hidden" value="'||session__userid||'" name="ag_usufun" id="ag_usufun"/>');
   
   usp_print('
   <style>
   .c1, .c2 {text-align: left}
   </style>
        <script>
            function validarCampos()
            { 
             thisform.scriptdo.value = "dograbaractualizacionusuario";
             thisform.submit(); 
            
            }
        </script>
   
   
    <div align ="center">
   <table border="0" class=tableform cellpadding="4"  style="border-collapse: collapse" bordercolor="#111111" width="70%">
        <tr>
            <td align="left">
                <p style="color=gray"><b>Actualizar Datos</b></p>
            </td>       
            <td>
               
            </td>
        </tr>    
   
        <tr>     
           <td align="left" colspan="2"><p style="color:#2C821E; font-size:large"><b>Datos del Conciliador / Presidente Arbitral o &Aacute;rbitro &Uacute;nico</b></p></td>
        </tr>
   
         <tr>
            <td class=c1>RUC</td>
            <td class=c2>'||xrowArb.c_Ruc||'</td>
        </tr>
       
       <tr>
          <td class=c1>Nombre(s)</td>
          <td class=c2>'||xrowArb.Usu_Nombre||'</td>
       </tr>
       
       <tr>
          <td class=c1>Colegio de Abogados</td>
          <td class=c2>'||xrowArb.c_Descripcion||'</td>
       </tr>
       
       <tr>
          <td class=c1>N&uacute;mero de Colegiatura</td>
          <td class=c2>'||xrowArb.n_Num_Colegiatura||'</td>
       </tr>
       
       <tr>
          <td class=c1>Correo Electr&oacute;nico:</td>
          <td class=c2><input type="text" style="border:solid #6C6C6C 1px" value="'||xrowArb.Usu_Email||'" name="ag_usuemail" id="ag_usuemail" size="45"/></td>
       </tr>
       
       <tr>
          <td class=c1>Tel&eacute;fono:</td>
          <td class=c2><input type="text" style="border:solid #6C6C6C 1px" value="'||xrowArb.Usu_Telefono||'" name="ag_usufono" id="ag_usufono" size="45"/></td>
       </tr>
       
       <tr>
          <td class=c1></td>
          <td class=c1 align="center"><input type="button" name="btnGuardar" value="Guardar" OnClick="validarCampos()"/></td>
       </tr>
       </table>
       </div>');
   end loop;
   
   else
      pku_administrar_users.dojavascriptajax;
      pku_administrar_users.dojavascriptcomun;

      IF c_datos%ISOPEN
      THEN
         CLOSE c_datos;

         OPEN c_datos;
      ELSE
         OPEN c_datos;
      END IF;

      LOOP
         FETCH c_datos
          INTO r_dato;

         EXIT WHEN c_datos%NOTFOUND;
         usp_print ('
        <script>
            function validarCampos()
            {   var mensaje="";
                var correo = thisform.ag_usuemail.value;
                //if (thisform.ag_provincia.value == "99" || thisform.ag_provincia.value =="00")
                //{   mensaje="Seleccione el provincia";
                // }
                //if (thisform.ag_departamento.value == "99" || thisform.ag_departamento.value == "00")
                //{   mensaje="Seleccione el departamento";
                //}
                //if (vacio(thisform.ag_usudomicilio.value))
                //{   mensaje="No ha ingresado su domicilio";
                //}
                if (thisform.v_dis_codigo_vb.value == "99" || thisform.v_dis_codigo_vb.value == "00" || thisform.v_dis_codigo_vb.value == "")
                {   mensaje="Seleccione la ubicacion Geografica del Organo Desconcentrado o Unidad Operativa";
                 }
                if (vacio(thisform.ag_descdomicilio.value ))
                {   mensaje="No ha ingresado la direccion del Organo Desconcentrado o Unidad Operativa";
                 }
                if (vacio(thisform.ag_descuniope.value ))
                {   mensaje="No ha ingresado el Organo Desconcentrado o Unidad Operativa";
                 }
                ///////////////////////////
                if (vacio(thisform.ag_usufono.value) || isNumber(thisform.ag_usufono.value)==false)
                {   mensaje="No ha ingresado el telefono del usuario. Debe tener solo d\xedgitos";
                }
                if (vacio(thisform.ag_usudni.value) || isNumber(thisform.ag_usudni.value)==false || (thisform.ag_usudni.value.length!=8))
                {   mensaje="No ha ingresado el DNI o no es valido. Debe tener solo d\xedgitos ";
                }
                if (vacio(thisform.ag_usuemail.value) || validarEmail(correo)==false)
                {   mensaje="No ha ingresado el correo electr\xf3nico o el formato es incorrecto";
                }
                if (vacio(thisform.ag_usucargo.value) || cadenaValida(thisform.ag_usucargo.value)==false)
                {   mensaje="No ha ingresado el cargo del usuario o tiene caracteres invalidos";
                }
                if (vacio(thisform.ag_usunombre.value) || cadenaValida(thisform.ag_usunombre.value)==false)
                {   mensaje="No ha ingresado el nombre del usuario o tiene caracteres invalidos";
                }
                if (mensaje == "")
                {    accion(''dograbaractualizacionusuario'');
                      return true;}
                else
                {  alert(mensaje);
                    return false;}
                }
        </script>  ' );

        usp_print('<INPUT name="tipo_ubi" type="hidden"/> ');

         usp_print
            (   '<table border="0" width=100% align=center class=tableform cellpadding=3 cellspacing=0>
        <tr>
            <td colspan ="3">
              <h3>'
             || portlet__titulo
             || '</h3>
              <input name="ag_usufun" type="hidden" value="'
             || session__userid
             || '" />
            </td>
        </tr>
        <tr>
            <td class=c1>Nombre</td>
            <td class=c2>
                <input type="text" name="ag_usunombre" maxlength="100" style="width:98%" value="'
             || r_dato.usu_nombre
             || '" readonly="true"></td>
            <td class=c3>Nombre completo del usuario</td>
        </tr>
        <tr>
            <td class=c1>Cargo</td>
            <td class=c2>
                <input type="text" name="ag_usucargo" maxlength="60" style="width:98%" value="'
             || r_dato.usu_cargousuario
             || '"/></td>
            <td class=c3>Cargo del usuario</td>
        </tr>
        <tr>
            <td class=c1>DNI</td>
            <td class=c2> ');
                if  (r_dato.usu_dni = '') OR (r_dato.usu_dni is null)  then
                    usp_print ('<input name="ag_usudni" maxlength="8"
                        style="width:98%;" value="'||r_dato.usu_dni||'" >' );
                else
                    usp_print ('<input name="ag_usudni" maxlength="8" readonly="true"
                        style="width:98%;background-color:#F5F5F5;" value="'||r_dato.usu_dni||'" >'  );
                end if;

            usp_print(' </td>
            <td class=c3>DNI - Este dato fue ingresado al crear su usuario y no puede ser modificado</td>
        </tr>
        <tr>
            <td class=c1>Correo electr&oacute;nico</td>
            <td class=c2>
                <input type="text" name="ag_usuemail" maxlength="60" style="width:98%" value="'
             || r_dato.usu_email
             || '"/></td>
            <td class=c3>Correo electr&oacute;nico</td>
        </tr>
        <tr>
            <td class=c1>Tel&eacute;fono</td>
            <td class=c2>
                <input type="text" name="ag_usufono" maxlength="50" style="width:98%" value="'
             || r_dato.usu_telefono
             || '"/></td>
            <td class=c3>N&uacute;mero telef&oacute;nico</td>
        </tr>
        <!--tr>
            <td class=c1>Domicilio</td>
            <td class=c2>
                <input type="text" name="ag_usudomicilio" maxlength="100" style="width:98%" value="'
             || r_dato.usu_direccion
             || '"/></td>
            <td class=c3>Domicilio</td>
        </tr-->
        <tr><td colspan=3><hr></td></tr>
        <tr>
            <td class=c1>Organo Desconcentrado o Unidad Operativa</td>
            <td class=c2> ');
                if  (trim(r_dato.eue_descripcion) = '') OR (r_dato.eue_descripcion is null) then
                    usp_print ('<input name="ag_descuniope" maxlength="100"
                        style="width:98%;" value="'||r_dato.eue_descripcion||'" >' );
                else
                    usp_print ('<input name="ag_descuniope" maxlength="100" readonly="true"
                        style="width:98%;background-color:#F5F5F5;" value="'||r_dato.eue_descripcion||'" >'  );
                end if;
            usp_print(' </td>
            <td class=c3>Descripcion de Organo Desconcentrado o Unidad Operativa</td>
        </tr>
        <tr>
            <td class=c1>Direcci&oacute;n Organo Desconcentrado o Unidad Operativa</td>
            <td class=c2> ');
                if  (r_dato.eue_direccion = '') OR (r_dato.eue_direccion is null) then
                    usp_print ('<input name="ag_descdomicilio" maxlength="100"
                        style="width:98%;" value="'||r_dato.eue_direccion||'" >' );
                else
                    usp_print ('<input name="ag_descdomicilio" maxlength="100" readonly="true"
                        style="width:98%;background-color:#F5F5F5;" value="'||r_dato.eue_direccion||'" >'  );
                end if;
            usp_print(' </td>
            <td class=c3>Domicilio de Organo Desconcentrado o Unidad Operativa</td>
        </tr>
        <tr>
            <td class=c1 colspan="3">Ubicaci&oacute;n Geografica de Organo Desconcentrado o Unidad Operariva</td>
        </tr> ' );

         --JMD 08/07/2010
         if (r_dato.dis_codigo = '') OR (r_dato.dis_codigo is null) then
           usp_print (f_get_ubigeo_ue(r_dato.dep_codigo,r_dato.pro_codigo,r_dato.dis_codigo));
         else
           usp_print (f_read_ubigeo_ue(r_dato.dep_codigo,r_dato.pro_codigo,r_dato.dis_codigo));
         end if;

        --pku_administrar_users.f_lista_ubigeo ('mod_UsuarioGeneral2');

         usp_print('
        <tr>
            <td align="center" valign=top colspan="3">
                <input type="button" name="g" value="Guardar" OnClick="validarCampos()"/>
                <input name="v_modulo" type="hidden" value="mod_UsuarioGeneral2"/>
            </td>
        </tr>
      </table>' );

         /*
         usp_print ( '<script>');

         IF r_dato.dep_codigo IS NOT NULL
         THEN
            usp_print
               (   '
                document.getElementById(''ag_departamento'').value = "'
                || r_dato.dep_codigo
                || '";' );
         END IF;

            usp_print
               (   'refrescarProvincias(''mod_usuarioReportes'',''dolistarprovincias'',''divProvincias'');</script>');

            usp_print
               (   '<script>');

         IF r_dato.pro_codigo IS NOT NULL
         THEN
            usp_print
               (   '
                document.getElementById(''ag_provincia'').value = "'
                || r_dato.pro_codigo
                || '";' );
         END IF;

         usp_print('refrescarDistritos(''mod_usuarioReportes'',''dolistardistritos'',''divDistritos'' );</script>');

         IF r_dato.dis_codigo IS NOT NULL
         THEN
            usp_print
               (   '<script>
                document.getElementById(''ag_distrito'').value = "'
                || r_dato.dis_codigo
                || '";</script>'  );
         END IF;
         */
      END LOOP;

      CLOSE c_datos;
end if;
   EXCEPTION
      WHEN OTHERS
      THEN
         usp_print ('Ocurrio el siguiente error: ' || SQLERRM || ' - '
                    || SQLCODE
                   );
   END;

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
*/
   IS
--cambios arbitro nueva ley  
   cursor cValidaArb is
   select count(usu_codigo) contArb from sease.usuario 
   where usu_tipo = 3
   and trim(usu_codigo)= trim(ag_usufun);
   
   n_contArb number;
   BEGIN
   for xrowArb in cValidaArb loop
     n_contArb := xrowArb.contArb;
   end loop;
   
     
   if n_contArb = 0 then
      UPDATE sease.usuario
         SET usu_nombre = ag_usunombre,
             usu_cargousuario = ag_usucargo,
             usu_dni   = ag_usudni,
             usu_email = TRIM(ag_usuemail),   ----MMAUTINO: EL DIA 01.07.2015 SE AGREGA TRIM AL CAMPO USU_EMAIL
             usu_telefono = ag_usufono,
             --usu_direccion = ag_descdomicilio,
             eue_descripcion = ag_descuniope,
             eue_direccion   = ag_descdomicilio,
             dep_codigo   = v_dep_codigo_vb,
             pro_codigo   = v_pro_codigo_vb,
             dis_codigo   = v_dis_codigo_vb,
             usu_ult_modi = session__userid,
             usu_ip       = iisenv__remote_host
       WHERE usu_codigo = RPAD (ag_usufun, 30);
       else
         
       update sease.usuario set usu_email = TRIM(ag_usuemail),    ----MMAUTINO: EL DIA 01.07.2015 SE AGREGA TRIM AL CAMPO USU_EMAIL
                                usu_telefono = ag_usufono,
                                usu_ult_modi = session__userid,
                                usu_ip       = iisenv__remote_host
                          where trim(usu_codigo) = trim(ag_usufun);
                          
       end if;
      /*  Inserta javascripts */
      pku_administrar_users.dojavascriptcomun;
      /* Fin de insercion de javascripts*/
      usp_print ('<script>inicio();</script>');
   EXCEPTION
      WHEN OTHERS
      THEN
         usp_print ('Ocurrio el siguiente error: ' || SQLERRM || ' - ' || SQLCODE );
   END;

   function f_get_ubigeo_ue(  v_dep_codigo_vb   varchar2,
                              v_pro_codigo_vb   varchar2,
                              v_dis_codigo_vb   varchar2 )
     return varchar2
   is
     lv_rtn varchar2(32000):= null;
     i_dep_desc varchar2(100);
     i_pro_desc varchar2(100);
     i_dis_desc varchar2(100);

   cursor c_ls is
     Select dep_ubigeo.dep_desc,
            prov_ubigeo.pro_desc,
            dist_ubigeo.dis_desc
       from sease.dep_ubigeo,
            sease.prov_ubigeo,
            sease.dist_ubigeo
      where dep_ubigeo.dep_codigo = prov_ubigeo.dep_codigo
        and prov_ubigeo.dep_codigo = dist_ubigeo.dep_codigo
        and prov_ubigeo.pro_codigo = dist_ubigeo.pro_codigo
        and dist_ubigeo.dep_codigo = to_number(v_dep_codigo_vb)
        and dist_ubigeo.pro_codigo = to_number(v_pro_codigo_vb)
        and dist_ubigeo.dis_codigo = to_number(v_dis_codigo_vb);

    cadena varchar2(32000);
   begin
     for item in c_ls loop
       i_dep_desc := item.dep_desc;
       i_pro_desc := item.pro_desc;
       i_dis_desc := item.dis_desc;
     end loop;
     lv_rtn:='<tr ><TD COLSPAN="1"><TD COLSPAN="2">';
     lv_rtn:= lv_rtn|| PKU_PROCESOS_COMUN.f_putRowForm('Ubicaci&oacute;n Geografica',
               '<INPUT name="v_dep_codigo_vb" readonly="true" value="'||v_dep_codigo_vb||'" type="hidden"/>
                <INPUT name="v_pro_codigo_vb" readonly="true" value="'||v_pro_codigo_vb||'" type="hidden"/>
                <INPUT name="v_dis_codigo_vb" readonly="true" value="'||v_dis_codigo_vb||'" type="hidden"/>
                <INPUT style="width:90%" name="lugar_ejec_vb" class=ViewSelect onclick="BuscaUbigeo(2)"  readonly  value="'||i_dep_desc||'/'||i_pro_desc||'/'||i_dis_desc||'"/>
                ','Seleccione la ubicaci&oacute;n geogr&aacute;fica.');

     return lv_rtn||'</TD><TR>';
   end;

   function f_read_ubigeo_ue(v_dep_codigo_vb   varchar2,
                             v_pro_codigo_vb   varchar2,
                             v_dis_codigo_vb   varchar2 )
     return varchar2
   is
     lv_rtn varchar2(32000):= null;
     i_dep_desc varchar2(100);
     i_pro_desc varchar2(100);
     i_dis_desc varchar2(100);

   cursor c_ls is
     Select dep_ubigeo.dep_desc,
            prov_ubigeo.pro_desc,
            dist_ubigeo.dis_desc
       from sease.dep_ubigeo,
            sease.prov_ubigeo,
            sease.dist_ubigeo
      where dep_ubigeo.dep_codigo = prov_ubigeo.dep_codigo
        and prov_ubigeo.dep_codigo = dist_ubigeo.dep_codigo
        and prov_ubigeo.pro_codigo = dist_ubigeo.pro_codigo
        and dist_ubigeo.dep_codigo = to_number(v_dep_codigo_vb)
        and dist_ubigeo.pro_codigo = to_number(v_pro_codigo_vb)
        and dist_ubigeo.dis_codigo = to_number(v_dis_codigo_vb);

    cadena varchar2(32000);
    begin
     for item in c_ls loop
       i_dep_desc := item.dep_desc;
       i_pro_desc := item.pro_desc;
       i_dis_desc := item.dis_desc;
     end loop;
     lv_rtn:='<tr ><TD COLSPAN="1"><TD COLSPAN="2">';
     lv_rtn:= lv_rtn|| PKU_PROCESOS_COMUN.f_putRowForm('Ubicaci&oacute;n Geografica',
               '<INPUT name="v_dep_codigo_vb" readonly="true" value="'||v_dep_codigo_vb||'" type="hidden"/>
                <INPUT name="v_pro_codigo_vb" readonly="true" value="'||v_pro_codigo_vb||'" type="hidden"/>
                <INPUT name="v_dis_codigo_vb" readonly="true" value="'||v_dis_codigo_vb||'" type="hidden"/>
                <INPUT style="width:90%" name="lugar_ejec_vb" class=ViewSelect readonly  value="'||i_dep_desc||'/'||i_pro_desc||'/'||i_dis_desc||'"/>
                ','Seleccione la ubicaci&oacute;n geogr&aacute;fica.');

     return lv_rtn||'</TD><TR>';
   end;

    PROCEDURE doviewHistorial (
        ag_usufun             IN   VARCHAR2,
        session__userid       IN   VARCHAR2,
        iisenv__remote_host        VARCHAR2 DEFAULT NULL )
    /*
    ||    Author: JMD
    ||    Overview: Procedimiento para listar Historial de Cambios
    ||    Modificaciones:
    ||      30/05/2011 - JMD - Creacin del procedimiento
    ||      16/03/2012 - Martn Zanelli - Se adiciona la descripcn del evento "O" -
    ||                   Memo 98-2012/SDP-ECC - opcin 1
    */
    IS
        CURSOR c_item IS
        select case cod_evento
               when 'N' then 'Creaci&oacute;n'
               when 'M' then 'Modificaci&oacute;n'
               when 'A' then 'Anulaci&oacute;n'
               when 'C' then 'Cambio contrase&ntilde;a'
               when 'O' then 'Generaci&oacute;n de nueva contrase&ntilde;a'
               when 'R' then 'Reenvio contrase&ntilde;a' else '' end tipo,
               usu_registro, to_char(fec_registro,'dd/mm/yyyy hh24:mi:ss') fecha, ip_registro, nvl(obs_registro,'&nbsp;') obser
        from sease.usuario_historial
        where id_registro = ag_usufun
        order by log_seq desc;

        r_item   c_item%ROWTYPE;
        lv_num    number:=0;
    BEGIN
        pku_administrar_users.dojavascriptcomun;

        IF c_item%ISOPEN THEN
            CLOSE c_item;

            OPEN c_item;
        ELSE
            OPEN c_item;
        END IF;

        usp_print('
        <table border="0" width=100% align=center class=tableform cellpadding=3 cellspacing=0>
            <tr>
                <td><h3>Historial del Usuario:&nbsp;'||ag_usufun||'</h3></td>
            </tr>
        </table><br>
        <!--table border="0" align=center cellpadding=3 cellspacing=0-->
        <table border="0" width=100% align=center class=tableform cellpadding=3 cellspacing=0>
            <tr>
                <th class="th1">Motivo</th>
                <th class="th1">Usuario</th>
                <th class="th1">Fecha</th>
                <th class="th1">IP</th>
                <th class="th1">Observaci&oacute;n</th>
            </tr>');

        LOOP
            FETCH c_item INTO r_item;

            EXIT WHEN c_item%NOTFOUND;

            lv_num := lv_num + 1;

            IF MOD (lv_num, 2) = 0 THEN
                usp_print ('<tr bgcolor="#ECE9D8">');
            ELSE
                usp_print ('<tr>');
            END IF;

            usp_print('
                <td width=20%>'||r_item.tipo ||'</td>
                <td width=20%>'||r_item.usu_registro ||'</td>
                <td width=20%>'||r_item.fecha ||'</td>
                <td width=15%>'||r_item.ip_registro ||'</td>
                <td width=25%>'||r_item.obser ||'</td>
            </tr>');
        END LOOP;

        usp_print('
        </table>');
    EXCEPTION
        WHEN OTHERS THEN
            usp_print ('Ocurrio el siguiente error: ' || SQLERRM || ' - '
                        || SQLCODE);
    END doviewHistorial;

       PROCEDURE USP_GET_TIPO_ENTIDAD_ACTUAL(
       ag_tipoent varchar2)
    IS
        /*
        ||    Author: Martn Zanelli Mendoza
        ||    Overview: Procedimiento que recupera cuales son los tipos de entidades (antes llamado actividades)
        ||    Modificaciones:
        ||      19/03/2012 - Martn Zanelli - Creacin del procedimiento - Memo 97-2012/SDP-CC
        */
        cursor c_tipos_entidad is
        select a.act_ccodigo codigo, a.act_vdesc descripcion
        from sease.actividad a
        where act_sactivo = 1;
    BEGIN
        usp_print('<select name="ag_tipoent" style="width:250px" onchange="cargarSubTipoEntidad()">');
        usp_print('<option value="0">Seleccione un valor ...</option>');
        for item in c_tipos_entidad loop
            usp_print('<option value="'||item.codigo||'" '||case when ag_tipoent = item.codigo then 'selected' else '' end||'>'||item.descripcion||'</option>');
        end loop;
        usp_print('</select>');
    END; -- Procedure

        PROCEDURE USP_GET_SUBTIPO_ENTIDAD_ACTUAL(
        ag_tipoent varchar2)
    IS
        /*
        ||    Author: Martn Zanelli Mendoza
        ||    Overview: Procedimiento que recupera cuales son los subtipos de enitades (antes llamado instancias)
        ||    Modificaciones:
        ||      19/03/2012 - Martn Zanelli - Creacin del procedimiento - Memo 97-2012/SDP-CC
        */
        cursor c_subtipos_entidad is
        select a.ins_ccodigo codigo, a.ins_vdesc descripcion
        from sease.instancia a
        where a.ins_sactivo = 1
        and a.act_ccodigo = ag_tipoent;
    BEGIN
        usp_print('<select name="ag_subtipoent" style="width:500px">');
        usp_print('<option value="0">Seleccione un valor ...</option>');
        for item in c_subtipos_entidad loop
            usp_print('<option value="'||item.codigo||'">'||item.descripcion||'</option>');
        end loop;
        usp_print('</select>');
    END; -- Procedure

        PROCEDURE USP_GENERA_NUEVA_CLAVE_FORM(
        v_parametro1 varchar2)
    IS
    /*
    ||    Author: Martn Zanelli Mendoza
    ||    Overview: Formulario para generar nueva contrasea en caso de olvido
    ||    Modificaciones:
    ||      15/03/2012 - Martn Zanelli - Creacin del procedimiento - Memo 98-2012/SDP-CC - punto 1
    */
    BEGIN
        usp_print('
        <br><br>
        <table class="tableform" cellpadding="3" cellspacing="0" border="1" bordercolor="666633" align="center" width="90%">
            <tr><td>
            <table class="tableform" cellpadding="3" cellspacing="0" border="0" align="center" width="100%">
                <tr>
                    <td colspan="2" align="center"><br><h3>FORMULARIO PARA GENERAR NUEVA CONTRASE&Ntilde;A</h3></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">&nbsp;</td>
                </tr>
                <tr>
                    <td width="40%" align="right"><font size="2">C&oacute;digo de Usuario</font></td>
                    <td width="60%"><input type="text" name="v_usuario" value="" style="width:250px;font-size:16pt" onblur="ValidarFormatoUsuario(this)"/></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">* Solo se admite usuarios conformados por n&uacute;meros (Ejm. 001952_56989)</td>
                </tr>
                <tr>
                    <td width="40%" align="right"><font size="2">Correo Elecr&oacute;nico</font></td>
                    <td width="60%"><input type="text" name="v_correo" value="" style="width:250px"/></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">&nbsp;</td>
                </tr>
                <tr>
                    <td align="left" colspan="2">
                        <table class="tableform" cellpadding="3" cellspacing="0" align="center" width="90%">
                            <tr><td>&nbsp;</td></tr>
                            <tr><td align="center" colspan="2"><h4>Condiciones para obtener nueva contrase&ntilde;a</h4></td></tr>
                            <tr><td>&nbsp;</td></tr>
                            <tr><td>
                                    <OL>
                                        <LI>El SEACE solo generar&aacute; una nueva contrase&ntilde;a si es que su usuario se encuentra en estado "Activo".</LI>
                                        <br><br>
                                        <LI>El SEACE enviar&aacute; su nueva contrase&ntilde;a al correo electr&oacute;nico que figura en la "Ficha de creaci&oacute;n de su usuario" siempre que este coincida con el declarado en el presente formulario.</LI>
                                    </OL>
                            </td></tr>
                            <tr><td align="center" colspan="2"><font size="2"><input type="checkbox" name="v_check" onclick="ActivarBoton()"/>&nbsp;Acepto Condiciones</font></td></tr>
                            <tr><td>&nbsp;</td></tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">&nbsp;</td>
                </tr>
                <tr>
                    <td align="center" colspan="2">
                        <input type="button" value="Generar Contrase&ntilde;a" onclick="Generar()" name="v_generar" disabled="ture"/>
                        <input type="button" value="Cancelar" onclick="Cerrar()"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">&nbsp;</td>
                </tr>
            </table>
            </td></tr>
        </table>');

        usp_print('
        <script language="javascript">
        function isCaracter(ls_car)
        {
            return ( ((ls_car >="0")&&(ls_car<="9")) || (ls_car == "_") )
        }

        //Funcion que valida si el parametro de entrada se trata de un entero positivo.
        function isFormato(ls_cadena)
        {
            var i;
            for (i = 0; i < ls_cadena.length; i++)
            {
                if (!isCaracter(ls_cadena.charAt(i)))
                     return false;
            }
            return true;
        }

        function ValidarFormatoUsuario(obj)
        {
            if(!isFormato(obj.value))
            {
                alert("El valor ingresado no corresponde al formato del C\xf3digo de Usuario.");
                obj.select();
                obj.focus();
                return false;
            }
        }

        //------------------------------quita caracteres en blanco en la cadena-------------
        function trim(psString)
        {
            return String(psString).replace(/[\s]/g,"");
        }

        //------- Verifica si una cadena es vacia -------
        function vacio(ls_cadena) {
            if (ls_cadena == " " || ls_cadena == null || ls_cadena.length == 0)
                return true;
            else return false;
        }

        //------- Verifica si una cadena solo tiene espacios en blancos -------------
        function Blanco(ls_cadena)
        {   var i;
            if (vacio(ls_cadena)) return true;
            for (i = 0; i < ls_cadena.length; i++)
            {
                if (ls_cadena.charAt(i) != " ") return false;
            }
            return true;
        }

        //------------------------------Verifica si una cadena solo tiene espacios en blancos
        function ValidarBlanco(ls_obj,ls_mensage)
        {
            if (Blanco(trim( ls_obj.value )))
            {
                alert("Por favor ingrese " + ls_mensage);
                ls_obj.value="";
                ls_obj.focus();
                return false;
            }
            return true;
        }

        function ActivarBoton()
        {
            if( thisform.v_check.checked == true )
                thisform.v_generar.disabled = false;
            else
                thisform.v_generar.disabled = true;
        }

        function Generar()
        {
            if (!ValidarBlanco(thisform.v_usuario, "C\xf3digo de Usuario")) return false;
            if (!ValidarBlanco(thisform.v_correo,  "Correo Electr\xf3nico")) return false;

            thisform.scriptdo.value = "doGenerarClave";
            thisform.submit();
        }

        function Cerrar()
        {
            window.close();
        }
        </script>');
    END;

        PROCEDURE USP_GENERA_NUEVA_CLAVE_DML(
        v_usuario           varchar2,
        v_correo            varchar2,
        iisenv__remote_host varchar2 DEFAULT NULL)
    IS
    /*
    ||    Author: Martn Zanelli Mendoza
    ||    Overview: Procedimiento que genera la nueva contrasea x olvido del usuario
    ||              y la envia al correo eletronico
    ||    Modificaciones:
    ||      15/03/2012 - Martn Zanelli - Creacin del procedimiento - Memo 98-2012/SDP-CC - punto 1
    */
        cursor c_usuario (cUsuario varchar2, cEmail varchar2) is
        select TRIM(a.usu_email) usu_email,   ----MMAUTINO: EL DIA 01.07.2015 SE AGREGA TRIM AL CAMPO USU_EMAIL
               a.usu_activo
        from sease.usuario a
        where
            upper(trim(a.usu_codigo)) = upper(trim(cUsuario))
            --and a.usu_activo = 1
            and upper(trim(usu_email)) = upper(trim(cEmail));

        cUsuEmail   varchar2(60);
        cUsuActivo  number;
        cCodError   number;
        cMensaje1   varchar2(500);
        cMensaje2   varchar2(500);
        cNuevaClave varchar2(30);
        cReturn     number;
    BEGIN
        --Verificamos los datos ingresados por el usuario
        cCodError := 1; --No existe coincidencia
        for item in c_usuario (v_usuario, v_correo) loop
            cUsuEmail := item.usu_email;
            cUsuActivo := item.usu_activo;
            cCodError := 0;
        end loop;

        --Si validacion es OK procedemos a actualizar la contrasea
        cReturn := 0;
        if cCodError = 0 then
            if cUsuActivo = 1 then
                BEGIN
                    cNuevaClave := generaclavealeatoria();
                    dograbarcontrasenia('SEACE', cNuevaClave, v_usuario, 'O', iisenv__remote_host, cReturn);

                    if cReturn = 1 then
                        cMensaje1 := 'Se envi&oacute; satisfactoriamente la nueva contrase&ntilde;a, verifique su correo electr&oacute;nico';
                    else
                        cMensaje1 := 'Ocurri&oacute; un error al realizar la actualizar los datos.<br>No se pudo completar la operaci&oacute;n.';
                    end if;
                EXCEPTION
                    WHEN OTHERS THEN
                        cMensaje1 := 'Ocurri&oacute; el siguiente error: '||SQLERRM||' - '||SQLCODE||'.<br>No se pudo completar la operaci&oacute;n';
                END;
            else
                cReturn := 2;
                cMensaje1 := 'El usuario se encuentra en estado INACTIVO, deber&aacute; remitir al OSCE el siguiente formulario:<br><br>';
                cMensaje2 := '<a href="http://'||reg_procesos.f_get_conexiones(7)||'/Documentos/18991230114646rad8DA42.xls" target="_blank">';
                cMensaje2 := cMensaje2||'Descargar Formulario de Creacin y/o Desactivacin de Cuenta Usuario-Funcionario del SEACE</a>';
            end if;
        else
            cMensaje1 := 'El Usuario y/o Correo Electr&oacute;nico NO SON VALIDOS.';
        end if;

        --Enviamos al formulario de resumen
        usp_print('
        <input type=''hidden'' name=''v_mensaje1'' value='''||cMensaje1||'''"/>
        <input type=''hidden'' name=''v_mensaje2'' value='''||cMensaje2||'''"/>
        <input type=''hidden'' name=''v_return'' value='''||cReturn||'''/>
        <script language=''javascript''>
        thisform.scriptdo.value = ''doViewResumen'';
        thisform.submit();
        </script>');
    END;

    PROCEDURE USP_GENERA_NUEVA_CLAVE_RES(
        v_mensaje1  varchar2,
        v_mensaje2  varchar2,
        v_return    number)
    IS
    /*
    ||    Author: Martn Zanelli Mendoza
    ||    Overview: Formulario que muestra una pantalla de resumen con los resultados de la operacin
    ||    Modificaciones:
    ||      16/03/2012 - Martn Zanelli - Creacin del procedimiento - Memo 98-2012/SDP-CC - punto 1
    */
        cColor varchar2(10);
    BEGIN
        if v_return = 1 then
            cColor := 'blue';
        elsif v_return = 2 then
            cColor := 'black';
        else
            cColor := 'red';
        end if;

        usp_print('
        <center>
        <br><br><br><br><br><br><br><br><br>
        <font size="2" color="'||cColor||'">'||v_mensaje1||'</font>
        '||case when v_return = 2 then v_mensaje2 else '' end||'
        <br><br>
        <input type="button" value="Cerrar" onclick="window.close();"/>
        </center>');
    END;

        PROCEDURE USP_JOB_NOTIFICA_VENCIM_CLAVE
    IS
    /*
    ||    Author: Martn Zanelli Mendoza
    ||    Overview: Procedimiento que enva un mensaje al usuarios notificando el proximo vencimiento de su contrasea
    ||    Modificaciones:
    ||      16/03/2012 - Martn Zanelli - Creacin del procedimiento - Memo 98-2012/SDP-CC - punto 2
    */
        cursor c_usuarios is
        select a.usu_codigo, a.usu_nombre, TRIM(a.usu_email) usu_email,  ----MMAUTINO: EL DIA 01.07.2015 SE AGREGA TRIM AL CAMPO USU_EMAIL 
        a.usu_fecult, ADD_MONTHS(trunc(a.usu_fecult),4) vencimiento, e.eue_desc entidad
        from
            sease.usuario a
            inner join sease.entidadue_anho e
                on a.eue_codigo = e.eue_codigo
                and e.eue_anho = to_number(to_char(sysdate,'yyyy'))
        where
            a.usu_activo = 1 and
            a.usu_fecult is not null and
            a.usu_email is not null and
            (
                ADD_MONTHS(trunc(a.usu_fecult),4) - trunc(sysdate) = 15
                or
                ADD_MONTHS(trunc(a.usu_fecult),4) - trunc(sysdate) = 5
            );

        cAsunto varchar2(200);
        cMensaje varchar(4000);
        cMensajeF varchar(4000);
    BEGIN
        cAsunto := 'PROXIMA CADUCIDAD DE CONTRASENA DE ACCESO AL SEACE';
        cMensaje := '';
        cMensaje := cMensaje||'<table align="center" width="70%">';
        cMensaje := cMensaje||'<tr><td>';
        cMensaje := cMensaje||'<center><b><font size="4">PR&Oacute;XIMA CADUCIDAD DE CONTRASE&Ntilde;A DE ACCESO AL SEACE</font></b></center>';
        cMensaje := cMensaje||'<br><br>';
        cMensaje := cMensaje||'<b>C&oacute;digo de Usuario:</b> [USUARIO]';
        cMensaje := cMensaje||'<br>';
        cMensaje := cMensaje||'<b>Entidad a la que pertenece:</b> [ENTIDAD]';
        cMensaje := cMensaje||'<br><br>';
        cMensaje := cMensaje||'Se comunica que Usted debe efectuar el cambio de su contrase&ntilde;a de lo contrario caducar&aacute; el [FECHA_VENCIM] y por consiguiente el sistema bloquear&aacute; su acceso al SEACE.';
        cMensaje := cMensaje||'<br><br>';
        cMensaje := cMensaje||'Si desea conocer los pasos a seguir para efectuar el cambio de contrase&ntilde;a, ingrese a: ';
        cMensaje := cMensaje||'<a href="http://'||reg_procesos.f_get_conexiones(7)||'/Default.asp?_CALIFICADOR_=PORTLET.1.136.0.21.85&_REGIONID_=1&_PORTLETID_=136&_PRIVILEGEID_=1&_ORDERID_=0&_PAGEID_=21&_CONTENTID_=85&_USERID_=%3C%21--USERID--%3E&_EVENTNAME_=&_OBJECTFIRE_=&_OBJECTEVENT_=&scriptdo=&infsecu=2" target="_blank">';
        cMensaje := cMensaje||'Ver Video Tutorial - Cambio de Contrase&ntilde;a</a>.';
        cMensaje := cMensaje||'<br><br><br>';
        cMensaje := cMensaje||'<center><b>DIRECCI&Oacute;N DEL SEACE</b></center>';
        cMensaje := cMensaje||'<center><b>Subdirecci&oacute;n de Plataforma</b></center>';
        cMensaje := cMensaje||'<br><br>';
        cMensaje := cMensaje||'<font color="#2E64FE">Esta notificaci&oacute;n ha sido enviada autom&aacute;ticamente. Por favor, no responda a este correo.</font>';
        cMensaje := cMensaje||'</td></tr>';
        cMensaje := cMensaje||'</table>';

        for item in c_usuarios loop
            cMensajeF := cMensaje;
            cMensajeF := replace(cMensajeF, '[USUARIO]', item.usu_codigo);
            cMensajeF := replace(cMensajeF, '[ENTIDAD]', item.entidad);
            cMensajeF := replace(cMensajeF, '[FECHA_VENCIM]', to_char(item.vencimiento,'dd/mm/yyyy'));
            donotificarusuario(item.usu_email,cAsunto,cMensajeF);
        end loop;
    END;

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
    */
    IS
   --modificacion validacion de contrasenia 
    cursor newpass is
    select usu_codigo, usu_c_pass from sease.usuario
    where trim(usu_codigo) = trim(ag_usufun);
    
        lv_notificacion   VARCHAR2 (1000);
        cPass varchar2(50) default null;
    BEGIN
    
    
    for xrow in newpass loop
    cPass := xrow.usu_c_pass;
    end loop;
    
    
    if cPass =  crypt (ag_paswd) then
    
    usp_print('<script>
    alert("Por cuestiones de seguridad su nueva contrase\xf1a deber\xe1 ser diferente a la anterior");
    thisform.scriptdo.value="doView";
                    thisform.submit();
    </script>');
    
    else
    
    
        UPDATE sease.usuario
        SET
            usu_c_pass = crypt (ag_paswd),
            usu_ult_modi = session__userid,
            fec_ult_modi = SYSDATE,
            usu_fecult = SYSDATE,
            usu_ip = iisenv__remote_host
        WHERE usu_codigo = RPAD (ag_usufun, 30);

        lv_notificacion := '
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2"><font color="#B40404"><b><u>NUEVA CONTRASE&Ntilde;A</u></b></font></td>
        </tr>
        <tr>
            <td><b>Nueva Contrase&ntilde;a:</b></td>
            <td> ' || ag_paswd ||'</td>
        </tr>';

        generarmensajenotificacion (ag_usufun, ag_opcion, lv_notificacion, ag_paswd);

        /*  Inserta javascripts */
        pku_administrar_users.dojavascriptcomun;

        /* Fin de insercion de javascripts*/
        IF ag_opcion = 'C' THEN
            --Auditoria
            insert into sease.usuario_historial
                   (tablename, id_registro , cod_evento, usu_registro   , ip_registro        , obs_registro)
            values ('USUARIO', ag_usufun   , 'C'       , session__userid, iisenv__remote_host, 'Cambio de Contrase&ntilde;a');
            --
            commit;
            --
            usp_print
                 ('<script>alert("Se modific\xf3 la contrase\xf1a");inicio();</script>');
        ELSIF ag_opcion = 'R' THEN
            --Auditoria
            insert into sease.usuario_historial
                   (tablename, id_registro , cod_evento, usu_registro   , ip_registro        , obs_registro)
            values ('USUARIO', ag_usufun   , 'R'       , session__userid, iisenv__remote_host, 'Reenvio Contrase¿a');
            --
            commit;
            --
            usp_print
                 ('<script>alert("Se modific\xf3 y envio la contrase\xf1a");cerrar();</script>');
        END IF;
     end if;   
   EXCEPTION
      WHEN ex_nonotificacion THEN
         usp_print (   'No se pudo realizar la notificaci\xf3n: '
                    || SQLCODE
                    || ' - '
                    || SQLERRM
                   );
      WHEN OTHERS THEN
         usp_print (   'Ocurrio un error, no se pudo modificar la contrase\xf1a'
                    || SQLCODE
                    || ' - '
                    || SQLERRM
                   );
   END dograbarcontrasenia1;
--cambios arbitro nueva ley
PROCEDURE seleccionarPerfil (care varchar2 default null)
     
   is
   
   
  cursor cTipoUsuario is
select n_id_tipo_maestro, c_descripcion 
from sease.tbl_usuario_maestro
where n_id_maestro = 2
order by n_id_tipo_maestro;
  
   begin
     
   usp_print('
   <script type="text/javascript">
   
           function enviar()
            {   
            cPerfil = thisform.cPerfil.value;
            
            switch(cPerfil)
            {
             case "0":
               alert("Tiene que seleccionar un perfil");
               return false;
               break;
             
             case "1":  
                thisform.scriptdo.value = "doView";
                break;
                
             case "2":  
                thisform.scriptdo.value = "doView";
                break;   
             
             case "3":  
                thisform.scriptdo.value = "doFormArbitro";
                break;
            }
                thisform.submit();
            }
   
   </script>');
     
   usp_print('<div align="center">
   <table border="0" class=tableform cellpadding="3" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="70%">
       
         <tr>
            <td class=c1></td>
            <td class=c1></td>
            <td class=c1><input type="button" value="Crear Usuario" onclick="enviar()"/></td>
        </tr>
       
       <tr>
          <td class=c1>&nbsp;</td>
          <td class=c1>&nbsp;</td>
          <td class=c1>&nbsp;</td>
       </tr>
       
       <tr>
           <td class=c1>Usuario Funcionario</td>
           <td class=c1>
              <select name="cPerfil" id="cPerfil" style="width:300px">
                  <option value="0">--Seleccione--</option>');
                         for xrow in cTipoUsuario loop
                             usp_print('<option value="'||xrow.n_id_tipo_maestro||'">'||xrow.c_descripcion||'</option>');
                          end loop;
    usp_print('</select>
            </td>
            <td class=c2>
                Seleccione el tipo de usuario funcionario
            </td>
        </tr>
   </table>
   </div>');
   end seleccionarPerfil;
   
   
   
   PROCEDURE formArbitro (
                          cRuc varchar2 default null,
                          v_nombre varchar2 default null,
                          v_aPaterno varchar2 default null,
                          v_aMaterno varchar2 default null,
                          v_razSoc varchar2 default null 
                          )
   is
   
    razSoc varchar2(150);
   CURSOR c_perfiles
      IS
         SELECT   a.usu_codigo, a.usu_nombre, a.usu_coment, flag
             FROM (SELECT TRIM (usu.usu_codigo) usu_codigo, usu.usu_nombre, usu.usu_coment,
                          CASE
                             WHEN INSTR
                                    (sease.pku_administrar_users.listargruposxusuario('', 3),
                                     TRIM (usu.usu_codigo)
                                     ) >= 1
                             THEN '1'
                             ELSE '0'
                          END flag
                     FROM sease.usuario usu
                    WHERE usu.usu_activo = 1
                      AND usu.apl_codigo = 1
                      AND usu.usu_tipo = 3
                      AND usu.usu_coment is not null
                      AND usu.eue_codigo IS NULL) a
         ORDER BY TRIM (a.usu_nombre) ASC;

      r_perfil   c_perfiles%ROWTYPE;
   
    cursor cColegioAbogados is 
    select a.n_id_maestro, a.c_descripcion, a.c_comentario 
    from arbitraje.tbl_arb_maestro a where a.n_id_tipomaestro = 24;
   
    cursor cValidam is
    select count(u.usu_codigo) nrow_cont from sease.usuario u
    where trim(u.usu_codigo) = trim(cRuc);
    
    cursor cGetArbitro is
    select a.c_ruc, a.c_nombre, a.c_paterno, a.c_materno from arbitraje.tbl_arb_arbitro a 
    where trim(a.c_ruc) = trim(cRuc);
   
   cfecha varchar2(20) := to_char(sysdate,'dd/mm/yyyy');
 an_count        number;
 av_ruc          varchar2(11);
 av_nombre       varchar2(50);
 av_aPaterno     varchar2(50);   
 av_aMaterno     varchar2(50);
   
   begin 
   /*validacion de usuario arbitro*/
   
   if cRuc is not null then
   
       for rowValidate in cValidam loop
    
    an_count := rowValidate.nrow_cont;
    
    
    end loop;
    
    /*if an_count = 0 then
      
    for rowGet in cGetArbitro loop
      
    av_ruc      := rowGet.c_Ruc;
    av_nombre   := rowGet.c_Nombre;
    av_aPaterno := rowGet.c_Paterno;
    av_aMaterno := rowGet.c_Materno;
    
    end loop;
      
    end if;*/ 
    
    end if;  
   
   usp_print('<style type="text/css">
   .c1, .c2 {text-align: left}
   .care{backgroundColor:"#00cc00"}
   .care1{backgroundColor:blue}
   </style>');
   
   usp_print('<script type="text/javascript">
   
   
   function validaRUC ()
   {
   
   
        thisform.scriptdo.value = "validaUsuArbitro";
        thisform.submit();
   
        
   }
   function deshabilita_ck(control) {
          var elementos = thisform.elements.length;
          var name;
          for (j = 0 ; j< elementos ; j++){
            name = thisform.elements[j].name;
            if( name.indexOf(control) >= 0) {
              thisform.elements[j].checked = false;
              thisform.elements[j].disabled = true;
            }
          }
        }
   function habilita_ck(control) {
          var elementos = thisform.elements.length;
          var name;
          for (j = 0 ; j< elementos ; j++){
            name = thisform.elements[j].name;
            if( name.indexOf(control) >= 0) {
              thisform.elements[j].disabled = false;
            }
          }
       }
   

  function evalua(obj)
              {
             var check = document.getElementById("ck"+obj);

                if (check.checked){
                    add(obj);
                }
                else {
                    del(obj);
                }
             }
   function add(cadena)
             {  var grupos = thisform.ag_miembros.value;
                 if (cadena == "OCI" || cadena == "CONTRALORIA" || cadena == "PROVEEDOR_ENTIDAD" || cadena == "SUPERVISOR_OSCE" || cadena == "PROVEEDOR_ELECTRONICA")
                 {  var obj;
                     deshabilita_ck("ck");
                     habilita_ck("ck"+cadena);
                     obj = document.getElementById("ck"+cadena);
                     obj.checked=true;
                     thisform.ag_miembros.value = cadena + ",";
                 }
                 else
                 {  var pos = grupos.indexOf(cadena);
                     if (pos < 0) {thisform.ag_miembros.value = grupos + cadena  + ",";}
                 }
             }

   function del(cadena)
             {  var grupos = thisform.ag_miembros.value;
                if (cadena == "OCI" || cadena == "CONTRALORIA" || cadena == "PROVEEDOR_ENTIDAD" || cadena == "SUPERVISOR_OSCE"  || cadena == "PROVEEDOR_ELECTRONICA")
                {   var obj;
                     habilita_ck("ck");
                     thisform.ag_miembros.value = "";
                }
                else
                {
                     var temp1 = "";
                     var temp2 = "";
                     var pos = grupos.indexOf(cadena)
                     if (pos >= 0)
                     {  temp1 = grupos.substr(0, pos);
                         temp2 = grupos.substr(pos + cadena.length + 1, grupos.length - (pos + cadena.length));
                         thisform.ag_miembros.value = temp1 + temp2;
                     }
                 }
             }             

   function f_validaCampoNumerico1() {

           var key=window.event.keyCode;
           if (key <48 || key > 57 ){
            window.event.keyCode=0;
           }
           }
           
  function isEmail(s)
        {
            for (i = 0; i < s.length; i++)
            {
                var c = s.charAt(i);
            if (c == " ") return false;
            }
            var i = 1;
            var sLength = s.length;

            while ((i < sLength) && (s.charAt(i) != "@"))
            { i++ }

            if ((i >= sLength) || (s.charAt(i) != "@")) return false;
            else i += 2;

            var cont = 0
            while (i < sLength)
            {
               var c = s.charAt(i);
               if (c == ".") cont++
             i++
            }
         if ((cont == 0) || (cont > 2)) return false
         else return true
        }


function NoCaracteresEspeciales(){
    //No permite el ingreso de los caracteres @ alt 64, % alt 37, & alt 38

    var x = window.event.keyCode;

      switch (x){
      //@%&!"#$()<=>?¿!/\+¿¿¿¿¿
      case 173: case 64: case 37: case 38: case 33: case 34: case 35:  case 36:  case 40: case 41:
      case 60:  case 61: case 62: case 63: case 168: case 47: case 92: case 43: case 128: case 135: case 167: 
      case 166: case 186: case 170: case 161: case 191: case 183: case 96: case 94: case 231: case 58: case 59: 
      case 199: case 95: case 42: case 123: case 125: case 91: case 93: case 180: case 225: case 233: case 237:
      case 243: case 250:  

          window.event.keyCode = 0;
          break;
        default:
          return;
      }

    }

function validarCampos(){

    if(thisform.cRuc.value.length == 0){
    alert("Tiene que ingresar el numero del RUC");
    thisform.cRuc.style.border = "solid #C50103 1px";
    thisform.cRuc.focus();
    return false;
    }else{
    thisform.cRuc.style.border="solid #7F9DB9 1px";
    }
    
    if(thisform.cRuc.value.length < 11){
    alert("Tiene que ingresar un formato correcto para el numero del RUC");
    thisform.cRuc.focus();
    thisform.cRuc.style.border = "solid #C50103 1px";
    return false;
    }else{
    thisform.cRuc.style.border="solid #7F9DB9 1px";
    }
    
    if(thisform.cNombre.value.length == 0){
    alert("Tiene que ingresar el nombre del usuario");
    thisform.cNombre.style.border = "solid #C50103 1px";
    thisform.cNombre.focus(); 
    return false;
    }else{
    thisform.cNombre.style.border="solid #7F9DB9 1px";
    }
    
    if(thisform.cApellidoPat.value.length == 0){
    alert("Tiene que ingresar el apellido paterno del usuario");
    thisform.cApellidoPat.style.border = "solid #C50103 1px";
    thisform.cApellidoPat.focus(); 
    return false;
    }else{
    thisform.cApellidoPat.style.border="solid #7F9DB9 1px";
    }
    
    if(thisform.cApellidoMat.value.length == 0){
    alert("Tiene que ingresar el apellido materno del usuario");
    thisform.cApellidoMat.style.border = "solid #C50103 1px";
    thisform.cApellidoMat.focus(); 
    return false;
    }else{
    thisform.cApellidoMat.style.border="solid #7F9DB9 1px";
    }
    
    if(thisform.cColegio.value.length == 0){
    alert("No ha seleccionado el colegio");
    thisform.cColegio.style.border = "solid #C50103 1px";
    thisform.cColegio.focus();
    return false;    
    }else{
    thisform.cColegio.style.border="solid #7F9DB9 1px";
    }
    
    if(thisform.cColegiatura.value.length == 0){
    alert("No ha ingresado el numero de colegiatura");
    thisform.cColegiatura.style.border = "solid #C50103 1px";
    thisform.cColegiatura.focus();
    return false;    
    }else{
    thisform.cColegiatura.style.border="solid #7F9DB9 1px";
    }
    
    if(thisform.cCorreo.value.length == 0){
    alert("No ha ingresado el correo electronico");
    thisform.cCorreo.style.border = "solid #C50103 1px";
    thisform.cCorreo.focus();
    return false;    
    }else{
    thisform.cCorreo.style.border="solid #7F9DB9 1px";    
    if (!(isEmail(thisform.cCorreo.value)))
            {
              alert("Ingrese un formato correcto para el correo del usuario");
              thisform.cCorreo.style.border = "solid #C50103 1px";
              thisform.cCorreo.focus();
              return false;
              }
    }
    
    if(thisform.cTelefono.value.length == 0){
    alert("No ha ingresado el numero telefonico");
    thisform.cTelefono.style.border = "solid #C50103 1px";
    thisform.cTelefono.focus();
    return false;    
    }else{
    thisform.cTelefono.style.border="solid #7F9DB9 1px";
    }
    
    if(thisform.cDoc.value.length == 0){
    alert("No ha ingresado el documento");
    thisform.cDoc.style.border = "solid #C50103 1px";
    thisform.cDoc.focus();
    return false;    
    }else{
    thisform.cDoc.style.border="solid #7F9DB9 1px";
    }
    
    if(thisform.ag_fecrecep.value.length == 0){
    alert("No ha ingresado la fecha de recepcion");
    thisform.ag_fecrecep.style.border = "solid #C50103 1px";
    thisform.ag_fecrecep.focus();
    return false;    
    }else{
    thisform.ag_fecrecep.style.border="solid #7F9DB9 1px";
    }
    
    if (confirm("¿Est\xe1 seguro que desea crear el usuario? ")) {
    thisform.scriptdo.value = "doSaveArbitro";
    thisform.submit(); 
    } 
  }    
  
  function ValidaArbitro(){
    
   if(thisform.cRuc.value.length == 0){
    alert("Tiene que ingresar el numero del RUC");
    thisform.cRuc.style.border = "solid #C50103 1px";

    return false;
    }else{
    thisform.cRuc.style.border="solid #7F9DB9 1px";
    //thisform.cNombre.removeAttribute("readOnly");
    }
    
    if(thisform.cRuc.value.length < 11){
    alert("Tiene que ingresar un formato correcto para el numero del RUC");

    thisform.cRuc.style.border = "solid #C50103 1px";
    return false;
    }else{
    thisform.cRuc.style.border="solid #7F9DB9 1px";
    }
    
    thisform.scriptdo.value = "doFormArbitro";
    thisform.submit();
    
    }

   </script>');
   
     
     usp_print('<div align="center">
   <table border="0" class=tableform cellpadding="3" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="85%">
        <tr>
            <td align="left">
                <h3>Crear Usuario</h3>
            </td>
            <td></td>
            <td>
                   <!-- <input type="button" name="btnVerUsuarios" value="Ver Usuarios Similares" onclick="verUsuarioExiste();" /> -->
                    &nbsp;
                    <input type="button" name="btnGuardar" value="Guardar" OnClick="validarCampos()"/>
            </td>
        </tr>    
   
        <tr>
           <td align="left"><h4>Datos del Presidente Arbitral o &Aacute;rbitro &Uacute;nico.</h4></td>
           <td></td>
           <td></td>
        </tr>
   
         <tr>
            <td class=c1>RUC</td>
            <!--<td class=c1><input class="care1" type="text" value="'||cRuc||'" name="cRuc" id="cRuc" size="46" onkeypress="f_validaCampoNumerico1();validaRUC();" maxlength="11" onblur="ValidaArbitro()"/> 
            </td>--> 
            <td class=c1><input class="care1" type="text" value="'||cRuc||'" name="cRuc" id="cRuc" size="46" onkeypress="f_validaCampoNumerico1();" maxlength="11"/> <input type = "button" value = "Validar Sunat" onclick = "validaRUC()"; ></td>
            <td class=c2>Ingrese el n&uacute;mero del Registro &Uacute;nico de Contribuyente.<br/>Dicho N&uacute;mero ser&aacute; el c&oacute;digo de usuario en el SEACE.</td>
        </tr>
        
        <tr>
            <td class=c1>Raz&oacute;n Social</td>
            <!--<td class=c1><input class="care1" type="text" value="'||cRuc||'" name="cRuc" id="cRuc" size="46" onkeypress="" maxlength="11" /></td>-->
            <td class=c1><input class="care1" type="text" value="'||v_razSoc||'" name="v_razSoc" id="v_razSoc" size="46"  maxlength="46" readonly /></td>
            <td class=c2>Ingrese el n&uacute;mero del Registro &Uacute;nico de Contribuyente.<br/>Dicho N&uacute;mero ser&aacute; el c&oacute;digo de usuario en el SEACE.</td>
        </tr>

        
       <tr>
          <td class=c1>Nombre(s)</td>
          <!--<td class=c1><input type="text" onkeypress="NoCaracteresEspeciales()"  onblur="this.value=this.value.toUpperCase()"  value="" name="cNombre" readOnly="readOnly" id="cNombre" size="46"/></td>-->
          <td class=c1><input type="text" onkeypress="NoCaracteresEspeciales()"  onblur="this.value=this.value.toUpperCase()"  value="" name="cNombre" id="cNombre" size="46"/></td>
          <td class=c2>Ingrese nombre(s) completo(s).</td>
       </tr>
       
       <tr>
          <td class=c1>Apellido Paterno</td>
          <!--<td class=c1><input type="text" onkeypress="NoCaracteresEspeciales()" onblur="this.value=this.value.toUpperCase()" value="" name="cApellidoPat" readOnly="readOnly" id="cApellidoPat" size="46"/></td>-->
          <td class=c1><input type="text" onkeypress="NoCaracteresEspeciales()" onblur="this.value=this.value.toUpperCase()" value="" name="cApellidoPat" id="cApellidoPat" size="46"/></td>
          <td class=c2>Ingrese apellido paterno.</td>
       </tr>
       
       <tr>
          <td class=c1 >Apellido Materno</td>
          <!--<td class=c1><input type="text" onkeypress="NoCaracteresEspeciales()" onblur="this.value=this.value.toUpperCase()" value="" name="cApellidoMat" readOnly="readOnly" id="cApellidoMat" size="46"/></td>-->
          <td class=c1><input type="text" onkeypress="NoCaracteresEspeciales()" onblur="this.value=this.value.toUpperCase()" value="" name="cApellidoMat" id="cApellidoMat" size="46"/></td>
          <td class=c2>Ingrese apellido materno.</td>
       </tr>
       
       <tr>
          <td class=c1>Colegio de Abogados</td>
          <td class=c1>
          <select style="width:98%" name="cColegio" id="cColegio">
          <option value="">-Seleccionar-</option>');             
        for xrow in cColegioAbogados loop
          usp_print('<option value="'||xrow.n_id_maestro||'">'||xrow.c_descripcion||'</option>');
        end loop;       
   usp_print('</select>
          </td>
          <td class=c2>Seleccione el Colegio de Abogado al que pertenece</td>
       </tr>
       
       <tr>
          <td class=c1>N&uacute;mero de Colegiatura</td>
          <td class=c1><input type="text" name="cColegiatura" id="cColegiatura" size="46" onkeypress="f_validaCampoNumerico1()" maxlength="10"/></td>
          <td class=c2>Ingrese el n&uacute;mero de Colegiatura.</td>
       </tr>
       
       <tr>
          <td class=c1>Correo Electr&oacute;nico</td>
          <td class=c1><input type="text" name="cCorreo" id="cCorreo" size="46"/></td>
          <td class=c2>Ingrese el correo electr&oacute;nico.</td>
       </tr> 
       
       <tr>
          <td class=c1>Tel&eacute;fono</td>
          <td class=c1><input type="text" name="cTelefono" id="cTelefono" size="46" maxleng="40"/></td>
          <td class=c2>Ingrese el n&uacute;mero de Tel&eacute;fono.</td>
       </tr>
       
       <tr>
           <td align="left"><h4>Datos de la Solicitud</h4></td>
           <td></td>
           <td></td>
       </tr>
       
       <tr>
           <td class=c1>Documento</td>
           <td class=c1><input type="text" name="cDoc" id="cDoc" size="46"/></td>
           <td class=c2>Ingrese la nomeclatura del documento de solicitud.</td>
       </tr> 
       
       <tr>
           <td class=c1>Fecha de recepci&oacute;n de documentos</td>
           <td class=c1><input readonly name="ag_fecrecep" style="width:90%" class=CalSelect  onclick="calendario(this)"></td>
           <td class=c2>Seleccionar la fecha que se recepcion&oacute; el documento.</td>
       </tr> 
       
       <tr>
           <td align="left"><h4>Datos de Acceso</h4></td>
           <td></td>
           <td></td>
       </tr>
       
       <tr>
           <td class=c1>Fecha de creaci&oacute;n</td>
           <td class=c1><input type="text" value="'||cfecha||'" name="cFecCreacion" id="cFecCreacion" readOnly=readOnly size="46"/></td>
           <td class=c2>Corresponde a la fecha de Creaci&oacute;n y se obtiene por defecto.</td>
       </tr> 
       
       <tr>
           <td class=c1>Estado</td>
           <td class=c1><select style="width:98%"><option>Activo</option></select></td>
           <td class=c2>Seleccione el Estado.</td>
       </tr>
       
        <tr>
           <td class=c1>Funcionario-Usuario</td>
           <td class=c1><select style="width:98%"><option>Funcionario-Usuario &Aacute;rbitros</option></select></td>
           <td class=c2>Corresponde al tipo de Funcionario-Usuario.</td>
       </tr>           
       </table>
       </div>
       <br/>');
       usp_print
         (   '
    <table border="0" width="85%" align=center class=tableform cellpadding=1 cellspacing=0>
        <tr>
            <td class="c1" style="text-align: center" colspan="2"><h4>Perfiles</h4>
              <input name="ag_miembros" type="hidden"
                value="'||TRIM(sease.pku_administrar_users.listargruposxusuario ('ADM_ARBITROS', 3))||'" />
            </td>
        </tr>
         '
         );

      IF c_perfiles%ISOPEN
      THEN
         CLOSE c_perfiles;

         OPEN c_perfiles;
      ELSE
         OPEN c_perfiles;
      END IF;

      LOOP
         FETCH c_perfiles
          INTO r_perfil;

         EXIT WHEN c_perfiles%NOTFOUND;

            usp_print (   '
            <tr>
            <td class=c1>
                <input name="op'
             || r_perfil.usu_codigo
             || '" type="hidden" value="'
             || r_perfil.usu_codigo
             || '"/>
                <input type="checkbox" name="ck'
             || r_perfil.usu_codigo
             || '" id="ck'
             || r_perfil.usu_codigo
             || '" onclick="evalua('''
             || r_perfil.usu_codigo
             || ''');"'
            );

           IF (r_perfil.flag = 1)
           THEN
              usp_print (' checked = true ');
           END IF;

           usp_print (   '>
                </input>'
                 || r_perfil.usu_nombre
                 || '
            </td>
            <td class=c3>'
                 || r_perfil.usu_coment
                 || '</td>
            </td> </tr>'
                );
         
      END LOOP;

      CLOSE c_perfiles;

      usp_print (' </table>');
      
      if cRuc is not null then
      usp_print('<script>
            '||case an_count when 0 then 'alert("No se encuentra registrado este ruc en el sistema");
                      '||case when av_ruc is null then 
                      'thisform.cNombre.removeAttribute("readOnly");
                      thisform.cApellidoPat.removeAttribute("readOnly");
                      thisform.cApellidoMat.removeAttribute("readOnly");' 
                      else 'alert("existe informacion de este ruc en el modulo de arbitros");' end||'' 
               else   'alert("El siguiente ruc ya se encuentra registrado en el modulo de usuarios"); 
                      thisform.cRuc.value = "";' 
               end
             ||'
      </script>');  
      end if;
      
      /*if cRuc is null then
      usp_print('<script>
      thisform.cNombre.style.backgroundColor = "#D2D2D2";
      thisform.cApellidoPat.style.backgroundColor = "#D2D2D2";
      thisform.cApellidoMat.style.backgroundColor = "#D2D2D2";
      thisform.cNombre.style.border = "solid #6C6C6C 1px";
      thisform.cApellidoPat.style.border = "solid #6C6C6C 1px";
      thisform.cApellidoMat.style.border = "solid #6C6C6C 1px";
      </script>');
      end if;
      
      if an_count > 0 then 
      usp_print('<script>
      thisform.cNombre.style.backgroundColor = "#D2D2D2";
      thisform.cApellidoPat.style.backgroundColor = "#D2D2D2";
      thisform.cApellidoMat.style.backgroundColor = "#D2D2D2";
      thisform.cNombre.style.border = "solid #6C6C6C 1px";
      thisform.cApellidoPat.style.border = "solid #6C6C6C 1px";
      thisform.cApellidoMat.style.border = "solid #6C6C6C 1px";
      </script>');
      end if;
      
      if av_ruc is not null then
      usp_print('<script>
      thisform.cNombre.style.backgroundColor = "#D2D2D2";
      thisform.cApellidoPat.style.backgroundColor = "#D2D2D2";
      thisform.cApellidoMat.style.backgroundColor = "#D2D2D2";
      thisform.cNombre.style.border = "solid #6C6C6C 1px";
      thisform.cApellidoPat.style.border = "solid #6C6C6C 1px";
      thisform.cApellidoMat.style.border = "solid #6C6C6C 1px";
      </script>');  
      end if;*/
      
      
   EXCEPTION
      WHEN OTHERS
      THEN
         usp_print ('Ocurrio el siguiente error: ' || SQLERRM || ' - '
                    || SQLCODE
                   );
   
   end formArbitro;
   
 
 
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
   )

   IS
      lv_clavealeatoria   VARCHAR2 (10);
      lv_notificacion     VARCHAR2 (3000);
      lv_nrow             NUMBER (3);
      lv_nombre           VARCHAR2 (100);
      lv_temp             VARCHAR2 (3000) := '';
      ls_msg              varchar2(16000);
      lv_asunto           varchar2(100);
      lv_contArb          number;
      cont                number;
      impedimento         varchar2 (150);
      
      

      CURSOR c_grupos (grupos VARCHAR2)
      IS
         SELECT ROWNUM nrow, usu.usu_nombre
           FROM sease.usuario usu
          WHERE usu.usu_activo = 1
            AND usu.apl_codigo = 1
            AND INSTR (grupos, TRIM (usu.usu_codigo)||',') >= 1
            AND usu.eue_codigo IS NULL
            AND usu.usu_tipo = 3;
            
            
      CURSOR c_perfiles (lv_usufun VARCHAR2, lv_tipo VARCHAR2)
      IS
         SELECT TRIM (usu.usu_codigo) usu_codigo, usu.usu_nombre
           FROM sease.usuario usu
          WHERE INSTR (listargruposxusuario (TRIM (lv_usufun), lv_tipo),
                       TRIM (usu.usu_codigo)
                      ) >= 1
            AND usu.eue_codigo IS NULL;
            
            
      /*cursor cInsertaArbitro
      is
        select count(b.n_id_arbitro) contArb from sease.tbl_arb_arbitro b 
        where trim(b.c_ruc) = trim(cRuc)
        or
        (    trim(b.c_nombre)  = trim(cNombre)
         and trim(b.c_paterno) = trim(cApellidoPat)
         and trim(b.c_materno) = trim(cApellidoMat)); */   
         
      cursor cValidaUser is
      select usu_codigo from sease.usuario
      where trim(usu_codigo) = trim(cRuc)
      and usu_activo = 1;    
   countUser number;
   BEGIN 
         --Validar impedimentos
      
           impedimento := reg_procesos.FN_VALIDA_ARBITRO(cRuc);
    
         if impedimento <> '0' then
            usp_print('<script> 
            alert("El Usuario se encuentra ' ||  impedimento || '  ");
            thisform.scriptdo.value = "doSelectPerfil";
            thisform.submit();
            </script>');
            RETURN;
         end if;
   
  
 
     
      for a1 in cValidaUser loop
        usp_print('<script> 
        alert("El Usuario ya se encuentra registrado en el SEACE");
        thisform.scriptdo.value = "doSelectPerfil";
        thisform.submit();
        </script>');
        RETURN;
      end loop;      
      lv_clavealeatoria := generaclavealeatoria ();

      INSERT INTO sease.usuario
                  (usu_codigo, 
                   usu_nombre,
                   usu_c_user,
                   usu_c_pass, 
                   usu_email,
                   usu_telefono, 
                   usu_tipo,
                   usu_miembros,
                   usu_frecepciondcto, 
                   usu_fecult, 
                   apl_codigo,
                   usu_ult_modi, 
                   usu_ip ,
                   usu_creacion)
           VALUES (RPAD (cRuc, 30, ' '), 
                   cNombre||' '||cApellidoPat||' '||cApellidoMat,
                   crypt (cNombre),
                   crypt (lv_clavealeatoria),
                   TRIM(cCorreo),  ----MMAUTINO: EL DIA 01.07.2015 SE AGREGA TRIM AL CAMPO USU_EMAIL
                   cTelefono, 
                   3,
                   ag_miembros,
                   ag_fecrecep,
                   SYSDATE, 
                   1,
                   session__userid, 
                   iisenv__remote_host,
                   session__userid);
               
           
                   
      insert into sease.tbl_usu_arbitro
                  (c_usu,
                   c_ruc,
                   n_aplcodigo ,
                   c_cod_colegiatura ,
                   n_num_colegiatura ,
                   v_documento ,
                   d_fecha_doc, 
                   v_nombre,     
                   v_apellido_pat,   
                   v_apellido_mat, 
                   v_flag)
            values(RPAD (cRuc, 30, ' '),
                   cRuc,
                   1,
                   cColegio,
                   cColegiatura,
                   cDoc,
                   ag_fecrecep,
                   cNombre,
                   cApellidoPat,
                   cApellidoMat,
                   1);  


        
          select count(*) into cont from arbitraje.tbl_arb_arbitro where  trim(c_ruc) = trim(cRuc);
          
         if cont = 0 then
                      
                   insert into arbitraje.tbl_arb_arbitro
                   (n_id_arbitro,c_razsocial_sunat,c_ruc,c_paterno,c_materno,c_nombre)
                   values
                   (ARBITRAJE.SQ_ARB_ARBITRO.NEXTVAL ,v_razSoc,cRuc,cApellidoPat,cApellidoMat,cNombre);
          
         end if;
          
          
           commit;




           
                   
         /*for xrowArb in cInsertaArbitro loop
           lv_contArb := xrowArb.Contarb;
         end loop;
          
         if lv_contArb = 0 then
         
         insert into sease.tbl_arb_arbitro
                    (n_id_arbitro,
                     c_paterno,
                     c_materno,
                     c_nombre,
                     c_ruc)
              values(SQ_ARB_ID_ARBITRO.NEXTVAL,
                     upper(cNombre),
                     upper(cApellidoPat),
                     upper(cApellidoMat),   
                     trim(cRuc));
         end if;*/

      -- Fin de insercion de javascripts
      OPEN c_grupos (ag_miembros);
      LOOP
         FETCH c_grupos INTO lv_nrow, lv_nombre;
         EXIT WHEN c_grupos%NOTFOUND;
         lv_temp := lv_temp || ' <br> ' ||lv_nrow || '.   ' || lv_nombre;
      END LOOP;
      CLOSE c_grupos;
        
        ls_msg    := '
      <div style="text-align: center; font-family: verdana">
      <table style="border: solid #939393 thin; width: 800">
      <tr>
      <td height="43" colspan="3" align="center"><p><strong>
        <h3>
        <span style="color:#365F91">BIENVENIDO AL SISTEMA ELECTR&Oacute;NICO DE CONTRATACIONES DEL ESTADO<br/>(SEACE)
                               <br/>REPORTE DEL FUNCIONARIO - USUARIO DEL SEACE</span></b></strong></p></td>
      </tr>
      <tr>
      <td colspan="3" align="center">
      <h2><span style="color:black;">CERTIFICADO SEACE<br/>(Art.286&ordm; del D.S. N&ordm;184-2008-EF)</span></h2></td>
      </tr>
      
      <tr>
      <td colspan="3" align="left">
      <span style="color:black;"><b>Fecha:</b> '||to_char(sysdate,'DD/MM/YYYY')||'</span>
    <p>&nbsp;</p>
    </td>
    </tr>
    
      <tr>
      <td colspan="3" align="left">
      <h3><span style="color:B40404;"><b><u>DATOS DEL USUARIO</u></b></span></td>
    </tr>
      
    <tr>
      <td colspan="3" align="left">
      <span style="color:black;"><b>Nombre y Apellidos:</b> '||cNombre||' '||cApellidoPat||' '||cApellidoMat||'</span></td>
    </tr>
      
    <tr>
      <td colspan="3" align="left">
      <span style="color:black;"><b>C&oacute;dico de Usuario:</b> '||cRuc||'</span></td>
    </tr>
      
    <tr>
      <td colspan="3" align="left">
      <span style="color:black;"><b>Contrase&ntilde;a: </b></span>'||lv_clavealeatoria||'</td>
    </tr>
    
    <tr>  
    <td colspan="3">
    &nbsp;
      </td>
    </tr>  
      
    <tr>
      <td colspan="3" align="center">
      <h3><span style="color:black;">Funcionario-Usuario &Aacute;rbitro</span></h3>
    <p>&nbsp;</p></td>
    </tr>
      
    <tr>
      <td colspan="3" align="left">
      <span style="color:black;"><b>Perfiles Asignados</b></span></td>
    </tr>
      
    <tr>
      <td colspan="3" align="left">
      <span style="color:black;">'||lv_temp||'</span></td>
    </tr>
      
      
      <tr>
      <td colspan="3"><p>&nbsp;</p>
        <p align="justify" style="color:B40404;">Usted puede modificar su contrase&ntilde;a ingresando al M&oacute;dulo Usuarios, secci&oacute;n "Cambio de Contrase&ntilde;a". Por motivos de seguridad Ud. debe modificar su contrase&ntilde;a cada cuatro (04) meses, de lo contrario caducar&aacute;.</p>
        <br/>
      </tr>
      
      <tr>
      <td colspan="3">
        <p align="justify"><span style="#B40404">Para un mejor manejo del SEACE, usted debe ingresar al portal del SEACE (<a href="http://'||reg_procesos.f_get_conexiones(7)||'">www.seace.gob.pe</a>) a fin de revisar los <a href="http://'||reg_procesos.f_get_conexiones(7)||'/?_pageid_=21&_contentid_=85">Manuales de Usuario y Videos Tutoriales.</span></a><br/>
El Certificado SEACE emitido por el OSCE es de car&aacute;cter personal e intransferible. Los usuarios son responsables de la informaci&oacute;n que bajo el Certificado SEACE ingresen al sistema.<br/><br/>
Esta notificaci&oacute;n ha sido enviada autom&aacute;ticamente. Por favor, no responda a este correo.
</p>
        <p>&nbsp;</p></td>
      </tr>
      </table>
      <div>';

      lv_asunto := 'OSCE - Certificado SEACE - Nuevo Usuario';
      reg_procesos.sp_send_mail_html(cCorreo, lv_asunto, ls_msg);
 


      --generarmensajenotificacion (cNombre, 'N', lv_notificacion, lv_clavealeatoria);
     --Auditoria
      insert into sease.usuario_historial
             (tablename, id_registro , cod_evento, usu_registro   , ip_registro        , obs_registro)
      values ('USUARIO', cRuc        , 'N'       , session__userid, iisenv__remote_host, '');
   
      usp_print ('<script>
      alert("Grabaci\xf3n exitosa"); 
      
       thisform.scriptdo.value = "doFormArbitro";
       thisform.submit();
      </script>');
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
        usp_print ('No se encontr&oacute; el ubigeo de la Entidad');
      WHEN OTHERS
      THEN
        usp_print ( 'Ocurrio el siguiente error al grabar: '
                    || SQLERRM || ' - ' || SQLCODE );

   END dograbarnuevoarbitro;  
   
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
      session__userid     varchar2)
      
     is
     
      CURSOR c_modificar_arb
      IS
         select a.usu_codigo, a.usu_nombre, TRIM(a.usu_email) usu_email,  ----MMAUTINO: EL DIA 01.07.2015 SE AGREGA TRIM AL CAMPO USU_EMAIL 
                a.usu_telefono, b.c_ruc, b.v_nombre, b.v_apellido_pat,
                b.v_apellido_mat, b.c_cod_colegiatura, b.n_num_colegiatura, c.c_descripcion, a.usu_fcreacion, 
                a.usu_activo, d.c_descripcion act_descripcion
         from sease.usuario a
          inner join sease.tbl_usu_arbitro b
            on a.usu_codigo = b.c_usu and a.apl_codigo = b.n_aplcodigo
          left join arbitraje.tbl_arb_maestro c on b.c_cod_colegiatura = c.n_id_maestro and c.n_id_tipomaestro = 24
          left join sease.tbl_usuario_maestro d on a.usu_activo = d.n_id_tipo_maestro and d.n_id_maestro = 1
         where /*a.usu_activo = 1
           and*/ a.usu_tipo = '3'
           and trim(b.c_usu) = trim(cRuc);
     
     CURSOR c_grupos (grupos VARCHAR2)
      IS
         SELECT ROWNUM nrow, usu.usu_nombre
           FROM sease.usuario usu
          WHERE usu.usu_activo = 1
            AND usu.apl_codigo = 1
            AND INSTR (grupos, TRIM (usu.usu_codigo)||',') >= 1
            AND usu.eue_codigo IS NULL
            AND usu.usu_tipo = 3;
     
     cursor cEstadoUsuario is
     select usu_activo, usu_codigo, usu_tipo from sease.usuario 
     where apl_codigo = 1
     and trim(usu_codigo) =  trim(cRuc);
     
     r_rowEstado_old number;
     lv_nrow             NUMBER (3);
     lv_nombre           VARCHAR2 (100);
     lv_temp             VARCHAR2 (3000) := '';
     ls_msg              VARCHAR2 (16000) := '';
     
     begin
       
      -- Fin de insercion de javascripts
      OPEN c_grupos (ag_miembros);
      LOOP
         FETCH c_grupos INTO lv_nrow, lv_nombre;
         EXIT WHEN c_grupos%NOTFOUND;
         lv_temp := lv_temp || ' <br> ' ||lv_nrow || '.   ' || lv_nombre;
      END LOOP;
      CLOSE c_grupos;
       
     for rowEstado in cEstadoUsuario loop
       r_rowEstado_old := rowEstado.Usu_Activo;
     end loop;
       
         update sease.usuario set usu_email    =  TRIM(cEmail),  ----MMAUTINO: EL DIA 01.07.2015 SE AGREGA TRIM AL CAMPO USU_EMAIL
                                  usu_telefono =  cTelefono,
                                  usu_activo   =  cEstado,
                                  usu_obs      =  cObservaciones,
                                  usu_miembros =  ag_miembros
                          where usu_codigo = RPAD (cRuc, 30, ' ');
                          
                          
                          
          update sease.tbl_usu_arbitro set c_cod_colegiatura  = cColegio,
                                           n_num_colegiatura  = cColegiatura,
                                           v_documento        = cDoc,
                                           d_fecha_doc        = ag_fecrecep 
                           where c_usu = RPAD (cRuc, 30, ' ');
                           
     
     for xrowData in c_modificar_arb loop                      
                           
    ls_msg    := '
      <div style="text-align: center; font-family: verdana">
            <table style="border: solid #939393 thin; width: 800;">
                <tr>
                    <td style="text-align: center">
                        <h2>REPORTE DE MODIFICACI&Oacute;N DE DATOS DEL FUNCIONARIO-USUARIO DEL SEACE</h2>
                    </td>
                </tr>

                <tr>
                    <td>
                        <b>Fecha: </b>'||to_char(sysdate,'DD/MM/YYYY')||'
                        <p>&nbsp;</p>
                    </td>
                </tr>

                <tr>
                    <td>
                        <b><span style="color: red;"><u>DATOS DEL USUARIO</u></span></b>
                    </td>
                </tr>

                <tr>
                    <td>
                        <b>Nombre y apellidos: </b>'||xrowData.Usu_Nombre||'
                    </td>
                </tr>

                <tr>
                    <td>
                        <b>C&oacute;digo de Usuario: </b>'||xrowData.Usu_Codigo||'
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <b>Colegio de Abogados: </b>'||xrowData.c_Descripcion||'
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <b>N&uacute;mero de colegiatura: </b>'||xrowData.n_Num_Colegiatura||'
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <b>Correo Electr&oacute;nico: </b>'||xrowData.Usu_Email||'
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <b>Tel&eacute;fono: </b>'||xrowData.Usu_Telefono||'
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <b>Estado: </b>'||xrowData.Act_Descripcion||'
                        <p>&nbsp;</p>
                    </td>
                </tr>
                
                '||case xrowData.Usu_Activo when 0 then '' else 
                '
                <tr>
                    <td>
                        <b>Perfiles Asignados: </b>
                    </td>
                </tr>
                
                <tr>
                    <td>
                        '||lv_temp||'
                    </td>
                </tr>

                                
                <tr>
                    <td>
                        <p>&nbsp;</p>
                        <p style="color: red; text-align: justify; font-family: verdana">Ud. puede modificar su contrase&ntilde;a ingresando al M&oacute;dulo Usuarios, secci&oacute;n "Cambio de Contrase&ntilde;a". Por motivos de seguridad Ud. debe modificar su contrase&ntilde;a cada cuatro (04) meses, de lo contrario caducar&aacute;.</p> 
                    </td>
                </tr>

                <tr>
                    <td>
                        <p style="text-align: justify; font-family: verdana">Para un mejor manejo del SEACE, usted debe ingresar&aacute; al portal del SEACE (<a href="http://'||reg_procesos.f_get_conexiones(7)||'">www.seace.gob.pe</a>) a fin de revisar los <a href="http://'||reg_procesos.f_get_conexiones(7)||'/?_pageid_=21&_contentid_=85">Manuales de Usuario y Videos Tutoriales.</a></p>
                    </td>
                </tr>

                <tr>
                    <td>
                        <p style="text-align: justify; font-family: verdana">El Certificado SEACE emitido por el OSCE es de car&aacute;cter personal e intransferible. Los usuarios son responsables de la informaci&oacute;n que bajo el Certificado SEACE ingresen al sistema.</p>
                    </td>
                </tr>
                ' end||'
            </table>
        </div>';
      
      
      end loop;

     
      reg_procesos.sp_send_mail_html(cEmail, 'Notificacion Certificado SEACE', ls_msg);                       
                 
   --Auditoria
        if (cEstado <> r_rowEstado_old) then
           if (cEstado = '0') then
             insert into sease.usuario_historial
                    (tablename, id_registro , cod_evento, usu_registro   , ip_registro        , obs_registro)
             values ('USUARIO', cRuc   , 'A'       , session__userid, iisenv__remote_host, 'Inactiva User');
           else
             insert into sease.usuario_historial
                    (tablename, id_registro , cod_evento, usu_registro   , ip_registro        , obs_registro)
             values ('USUARIO', cRuc   , 'A'       , session__userid, iisenv__remote_host, 'Activa User');
           end if;
         else
           insert into sease.usuario_historial
                  (tablename, id_registro , cod_evento, usu_registro   , ip_registro        , obs_registro)
           values ('USUARIO', cRuc   , 'M'       , session__userid, iisenv__remote_host, cObservaciones);
         end if;                        
                           
   usp_print('<input type="hidden" value="'||cRuc||'" name="ag_usufun" id="ag_usufun"/>');                        
   
   
    usp_print ('<script>
      alert("Modificaci\xf3 exitosa"); 
      
       thisform.scriptdo.value = "doModificarUsuario";
       thisform.submit();
      </script>');
                     
                                                              
  COMMIT;  
  EXCEPTION WHEN OTHERS THEN
   DBMS_OUTPUT.PUT_LINE('Error'||SQLCODE||SQLERRM);
    ROLLBACK;

                          
   
  END doEditaArbitro; 
  
PROCEDURE doNotificaArbitro (cRuc                 varchar2,
                             session__userid      varchar2,
                             iisenv__remote_host  varchar2
                            )
  is
  
  CURSOR c_modificar_arb
      IS
         select a.usu_codigo, a.usu_nombre, TRIM(a.usu_email) usu_email,   ----MMAUTINO: EL DIA 01.07.2015 SE AGREGA TRIM AL CAMPO USU_EMAIL
                a.usu_telefono, b.c_ruc, b.v_nombre, b.v_apellido_pat,
                b.v_apellido_mat, b.c_cod_colegiatura, b.n_num_colegiatura, c.dep_desc, a.usu_fcreacion, a.usu_activo  
         from sease.usuario a
          inner join sease.tbl_usu_arbitro b
            on a.usu_codigo = b.c_usu and a.apl_codigo = b.n_aplcodigo
          left join sease.dep_ubigeo c on b.c_cod_colegiatura = c.dep_codigo
         where a.usu_activo = 1
           and a.usu_tipo = '3'
           and trim(b.c_usu) = trim(cRuc);
  
  lv_clavealeatoria   VARCHAR2 (30);
        lv_return number;
        lv_temp             VARCHAR2 (3000) := '';
      ls_msg                varchar2(16000);
    BEGIN
        lv_return := 0;
        lv_clavealeatoria := generaclavealeatoria ();
        
        
        UPDATE sease.usuario
        SET
            usu_c_pass = crypt (lv_clavealeatoria),
            usu_ult_modi = session__userid,
            fec_ult_modi = SYSDATE,
            usu_fecult = SYSDATE,
            usu_ip = iisenv__remote_host
        WHERE trim(usu_codigo) = trim(cRuc);
        
        
        insert into sease.usuario_historial
                   (tablename, id_registro , cod_evento, usu_registro   , ip_registro        , obs_registro)
            values ('USUARIO', cRuc   , 'R'       , session__userid, iisenv__remote_host, 'Reenvio Contrase&ntilde;a');
           
        
        
        for xrow in c_modificar_arb loop
          
     ls_msg := '<div style="text-align: center; font-family: verdana">
            <table style="border: solid #939393 thin; width: 700">
                <tr>
                    <td style="text-align: center">
                        <h2>MODIFICACI&Oacute;N DE CONTRASE&Ntilde;A</h2>
                    </td>
                </tr>

                <tr>
                    <td>
                        <b>Fecha: </b>'||to_char(sysdate,'dd/mm/yyyy')||'
                        <p>&nbsp;</p>
                    </td>
                </tr>

                <tr>
                    <td><b><span style="color: red;"><u>DATOS DEL USUARIO</u></span></b></td>
                </tr>

                <tr>
                    <td><b>Nombre y apellidos: </b>'||xrow.usu_nombre||'</td>
                </tr>

                <tr>
                    <td><b>C&oacute;digo de Usuario: </b>'||xrow.usu_codigo||'<p>&nbsp;</p></td>
                </tr>

                <tr>
                    <td><b><span style="color: red"><u>NUEVA CONTRASE&Ntilde;A</u></span></b></td>
                </tr>

                <tr>
                    <td><b>Nueva Contrase&ntilde;a: </b>'||lv_clavealeatoria||'<p>&nbsp;</p></td>
                </tr>

                <tr>
                    <td>
                        <span style="color: red; text-align: justify">Ud. puede modificar su contrase&ntilde;a ingresando al M&oacute;dulo Usuarios, secci&oacute;n "Cambio de Contrase&ntilde;a". Por motivos de seguridad Ud. debe modificar su contrase&ntilde;a cada cuatro (04) meses, de lo contrario caducar&aacute;.</span> 
                    </td>
                </tr>

                <tr>
                    <td>
                        <span style="text-align: justify">Para un mejor manejo del SEACE, usted debe ingresar&aacute; al portal del SEACE (<a href="http://'||reg_procesos.f_get_conexiones(7)||'">www.seace.gob.pe</a>) a fin de revisar los <a href="http://'||reg_procesos.f_get_conexiones(7)||'/?_pageid_=21&_contentid_=85">Manuales de Usuario y Videos Tutoriales.</a></span>
                    </td>
                </tr>

                <tr>
                    <td>
                        <span style="text-align: justify">El Certificado SEACE emitido por el OSCE es de car&aacute;cter personal e intransferible. Los usuarios son responsables de la informaci&oacute;n que bajo el Certificado SEACE ingresen al sistema.</span>
                    </td>
                </tr>
            </table>
        </div>';   
        
         
        
        reg_procesos.sp_send_mail_html(trim(xrow.usu_email), 'Notificacion Certificado SEACE', ls_msg);
        
          usp_print('<input type="hidden" value="'||cRuc||'" name="ag_usufun" id="ag_usufun"/>');                        
   
   
    usp_print ('<script>
      alert("Modificaci\xf3 exitosa"); 
      
       thisform.scriptdo.value = "doModificarUsuario";
       thisform.submit();
      </script>');
     end loop; 
  end;
    PROCEDURE usp_ValidarRUC (
  session__cod_contrato    VARCHAR2 DEFAULT NULL,
  session__filesingedhttp  VARCHAR2 DEFAULT NULL,
  cRuc                      VARCHAR2 DEFAULT NULL,
  v_razSoc                VARCHAR2 DEFAULT NULL 
  )       
   
 IS 
     nombre      varchar2(4000); 




 BEGIN 
   usp_print('<script>
     document.write("Validadndo con Sunat...");  </script>'); 


     select reg_procesos.f_ws_sunat_get_razon_social(cRuc) into nombre from dual ;
    
 
 
     usp_print('
     <input  type="hidden" name="sunat" value="1" size=54 readonly>
     <input  type="hidden" name="cRuc" value="' || cRuc || '" size=54 readonly>
      <input  type="hidden" name="v_razSoc" value="' || nombre || '" size=54 readonly>

    ');
    
       usp_print('<script>
       thisform.scriptdo.value = "doFormArbitro";
       thisform.submit();
       </script>'); 
        
 END; 
END pku_administrar_users;