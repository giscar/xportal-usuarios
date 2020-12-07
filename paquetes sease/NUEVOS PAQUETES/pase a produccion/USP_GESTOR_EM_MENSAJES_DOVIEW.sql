--------------------------------------------------------
-- Archivo creado  - viernes-noviembre-13-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Procedure USP_EM_MENSAJES_DOVIEW
--------------------------------------------------------
set scan off;

  CREATE OR REPLACE PROCEDURE REG_PROCESOS.USP_GESTOR_EM_MENSAJES_DOVIEW (
    v_pagina_actual number)
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
    cursor c_total_mensajes is
    select count(*) cant
    from em_mensaje a;

    cursor c_mensajes (c_total_x_pagina number, c_pagina_actual number) is
    select 
        b.id_mensaje, b.asunto, b.tipo_gob_desc, 
        b.tipo_destinatario, b.dep_desc, b.pro_desc,
        b.usu_creacion, b.fec_creacion, b.fec_modifica, 
        b.estado_envio, b.des_estado_envio, b.fec_envio
    from (
        select ROWNUM num, a.*
        from (
            select 
                a.id_mensaje,
                a.tipo_destinatario,
                b.dep_desc,
                c.pro_desc,
                case
                    when UPPER(a.dest_tipo_gobierno) = 'A1'  then 'GOBIERNO CENTRAL'
                    when UPPER(a.dest_tipo_gobierno) = 'A2'  then 'INSTANCIA DESCENTRALIZADA'
                    when UPPER(a.dest_tipo_gobierno) = 'A31' then 'GOBIERNO DISTRITAL'
                    when UPPER(a.dest_tipo_gobierno) = 'A32' then 'GOBIERNO PROVINCIAL'
                    when UPPER(a.dest_tipo_gobierno) = 'A4'  then 'SOCIEDAD DE BENEFICENCIA PUBLICA'
                    when UPPER(a.dest_tipo_gobierno) = 'A5'  then 'GOBIERNO REGIONAL'
                    when UPPER(a.dest_tipo_gobierno) = 'B1'  then 'ENTIDAD DE TRATAMIENTO EMPRESARIAL'
                    when UPPER(a.dest_tipo_gobierno) = 'B2'  then 'ENTIDADES DEL FONAFE'
                    else ''
                end tipo_gob_desc,
                a.asunto,
                a.usu_creacion,
                a.fec_creacion,
                a.fec_modifica,
                a.estado_envio,
                case when a.estado_envio = 0 then 'POR ENVIAR' when a.estado_envio = 1 then 'LISTO PARA ENVIAR' else 'ENVIADO' end des_estado_envio,
                a.fec_envio
            from 
                em_mensaje a
                left join sease.dep_ubigeo b
                    on a.dest_dep_codigo = b.dep_codigo
                left join sease.prov_ubigeo c
                    on a.dest_dep_codigo = c.dep_codigo
                    and a.dest_pro_codigo = c.pro_codigo
            order by
                a.estado_envio asc, a.fec_creacion desc
        ) a
    ) b
    where b.num between (c_total_x_pagina * (c_pagina_actual - 1)) + 1 AND c_total_x_pagina * c_pagina_actual;
    
    cCont           number;
    c_pagina_actual number;
    c_total_x_pag   number;
    c_total         number;
    cColor          varchar2(50);
BEGIN
    c_total_x_pag := 20; --total de registros por pagina
    if v_pagina_actual is null then
        c_pagina_actual := 1;
    else
        c_pagina_actual := v_pagina_actual;
    end if;
    
    for item in c_total_mensajes loop
        c_total := item.cant;
    end loop;
    
    usp_print('
    <table cellpadding="3" cellspacing="0" class=tableform border="0" align="center" width="100%">
        <tr>
            <td colspan="4" align="left">
                <h3>Env&iacute;o de Mensajes</h3>
            </td>
            <td colspan="4" align="right">
                <input type="button" value="Crear Mensaje" onclick="Crear()"/>
            </td>
        </tr>
    </table>
    <br>');

    USP_GEN_SHOW_PAGINACION (
                c_pagina_actual,
                c_total,
                c_total_x_pag,
                '',
                'IrPagina',
                '100%');   
    usp_print('
    <table class="table table-bordered">
        <tr>
            <th class="th1">Para</th>
            <th class="th1">Asunto</th>
            <th class="th1">Creado Por</th>
            <th class="th1">Fecha Creaci&oacute;n</th>
            <th class="th1">Estado</th>
            <th class="th1">Fecha Env&iacute;o</th>
            <th class="th1">Acciones</th>
        </tr>');
    
    cCont := 0;
    for item in c_mensajes(c_total_x_pag, c_pagina_actual) loop
        cCont := cCont + 1;
        cColor := '';
        if mod(cCont,2) = 0 then
            cColor := 'bgcolor="#ECE9D8"';
        end if;
        usp_print('
        <tr '||cColor||'>
            <td>'||
                case 
                    when item.tipo_destinatario = 1 then item.dep_desc ||' - '||item.pro_desc 
                    when item.tipo_destinatario = 2 then item.tipo_gob_desc
                    when item.tipo_destinatario = 3 then 'TODOS' end||'</td>
            <td>'||item.asunto||'</td>
            <td align="center">'||item.usu_creacion||'</td>
            <td align="center">'||item.fec_creacion||'</td>
            <td align="center">'||item.des_estado_envio||'</td>
            <td align="center">'||item.fec_envio||'</td>
            <td align="center">
                <a href="#" onclick="MostrarPrevio('''||item.id_mensaje||''')">[Vista Previa]</a>&nbsp;');
        if item.estado_envio = 0 then
            usp_print('|&nbsp;<a href="#" onclick="Editar('''||item.id_mensaje||''')">[Editar]</a>');
        else
            usp_print('&nbsp;');
        end if;
        usp_print('</td>
        </tr>');
    end loop;
    usp_print('
    </table>
    <input type="hidden" name="v_id_mensaje" value=""/>
    <input type="hidden" name="v_pagina_actual" value=""/>');

    usp_print('
    <script language=javascript>
    function Crear()
    {
        thisform.scriptdo.value = "doEdit";
        thisform.submit();
    }
    
    function Editar(vIdMensaje)
    {
        thisform.v_id_mensaje.value = vIdMensaje;
        thisform.scriptdo.value = "doEdit";
        thisform.submit();
    }
    
    function MostrarPrevio(vIdMensaje)
    { 
       window.open("ControllerServletOpen?portletid=mod_envio_mensajes&scriptdo=doViewPrevio&v_id_mensaje="+vIdMensaje,"","toolbar=no,Width=900,Height=500,scrollbars=yes,modal=yes,dependent,alwaysRaised");
       // window.open("portlet5open.asp?_portletid_=mod_envio_mensajes&scriptdo=doViewPrevio&v_id_mensaje="+vIdMensaje,"","toolbar=no,Width=900,Height=500,scrollbars=yes,modal=yes,dependent,alwaysRaised");
    }
    
    function IrPagina(v_pagina_actual)
    { 
        thisform.v_pagina_actual.value = v_pagina_actual;
        thisform.scriptdo.value = "doView";
        thisform.submit();
    }
    </script>');
EXCEPTION
    WHEN others THEN
        usp_print('Error al mostrar la p¿gina: '||SQLERRM);
END; -- Procedure

/
