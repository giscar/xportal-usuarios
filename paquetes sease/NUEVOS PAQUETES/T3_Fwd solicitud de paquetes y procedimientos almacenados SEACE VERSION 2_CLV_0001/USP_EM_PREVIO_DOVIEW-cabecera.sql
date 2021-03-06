--------------------------------------------------------
-- Archivo creado  - domingo-noviembre-01-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Procedure USP_EM_PREVIO_DOVIEW
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "REG_PROCESOS"."USP_EM_PREVIO_DOVIEW" (
    v_id_mensaje number,
    v_texto      varchar2)
IS
--
-- To modify this template, edit file PROC.TXT in TEMPLATE 
-- directory of SQL Navigator
--
-- Purpose: Briefly explain the functionality of the procedure
--
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  -------------------------------------------       

    cursor c_mensaje (c_IdMensaje number) is 
    select 
        a.id_mensaje, a.asunto, a.mensaje_clob, a.tipo_destinatario,
        a.dest_dep_codigo, a.dest_pro_codigo, a.dest_tipo_gobierno,
        a.estado_envio
    from em_mensaje a
    where id_mensaje = c_IdMensaje;
    
    cIdMensaje          number;
    cAsunto             varchar2(500);
    cMensaje            clob;
    cTipoDestinatario   number;
    cDestDepCodigo      varchar(2);
    cDestProCodigo      varchar(2);
    cDestTipoGobierno   varchar(5);
    cEstadoEnvio        number;   
BEGIN
    for item in c_mensaje(v_id_mensaje) loop
        cIdMensaje          := item.id_mensaje;
        cAsunto             := item.asunto;
        cMensaje            := item.mensaje_clob;
        cTipoDestinatario   := item.tipo_destinatario;
        cDestDepCodigo      := item.dest_dep_codigo;
        cDestProCodigo      := item.dest_pro_codigo;
        cDestTipoGobierno   := item.dest_tipo_gobierno;
        cEstadoEnvio        := item.estado_envio;
    end loop;
    
    usp_print('
    <br><br>
    <table cellpadding="3" cellspacing="0" class=tableform border="0" align="center" width="90%">
        <tr>
            <td><h3>Vista Previa del Mensaje</h3></td>
            <td align="right">
                <input type="button" value="Cerrar" onclick="window.close();"/>
            </td>
        </tr>
        <tr><td colspan="2" align="center"><font color="blue"><b>'||v_texto||'</b></font></td></tr>
        <tr><td colspan="2"><hr></td></tr>
    </table>
    <table cellpadding="3" cellspacing="0" class=tableform border="0" align="center" width="90%" style="border-color: #000000; border-width:1px; border-style: solid">
        <tr><td style="BACKGROUND:#D8D8D8; border-color: #000000; border-bottom: 1px solid; border-width:1px;"><b>Asunto:</b></td></tr>
        <tr><td style="border-color: #000000; border-bottom: 1px solid; border-width:1px;">'||cAsunto||'</td></tr>
        <tr><td style="BACKGROUND:#D8D8D8; border-color: #000000; border-bottom: 1px solid; border-width:1px;"><b>Mensaje:</b></td></tr>
        <tr><td colspan="2">'||cMensaje||'</td></tr>
    </table>');

    if cEstadoEnvio in (0, 1) then --En Borrador o Listo para Enviar pueden enviarse mensajes
        usp_print('
    <table cellpadding="3" cellspacing="0" class=tableform border="0" align="center" width="90%">
        <tr><td><hr></td></tr>
        <tr><td><h3>Enviar Correo de Prueba</h3></td></tr>
        <tr><td><b>Verifique como se mostrar� su correo al ser enviado.</b></td></tr>
        <tr>
            <td>Ingrese una cuenta de correo: <input type="input" name="v_para" value="" size="50"/> <input type="button" value="Enviar" onclick="EnviarCorreoPrueba()"/></td>
        </tr>
    </table>
    <input type="hidden" name="v_id_mensaje" value="'||v_id_mensaje||'"/>');
    end if;
    
    usp_print('
    <script language="javascript">
    function EnviarCorreoPrueba()
    {
        thisform.scriptdo.value = "doEnvioMensajePrueba";
        thisform.submit();    
    }
    </script>');
EXCEPTION
    WHEN others THEN
        usp_print('Error al general la vista previa del mensaje.');
END; -- Procedure

/
