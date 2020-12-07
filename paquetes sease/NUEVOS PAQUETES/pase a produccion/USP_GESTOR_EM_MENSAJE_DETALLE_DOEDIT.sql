--------------------------------------------------------
-- Archivo creado  - viernes-noviembre-13-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Procedure USP_EM_MENSAJE_DETALLE_DOEDIT
--------------------------------------------------------
set scan off;

  CREATE OR REPLACE PROCEDURE REG_PROCESOS.USP_GESTOR_EM_MEN_DETAL_DOEDIT ( 
    v_id_mensaje number)
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
    cIdMensaje := 0;
    cTipoDestinatario := 0;
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
    <table cellpadding="3" cellspacing="0" class="tableform" border="0" align="center" width="100%">
        <tr>
            <td><h3>Env&iacute;o de Mensajes</h3></td>
            <td align="right">');
    if cEstadoEnvio = 0 then
        usp_print('
                <input type="button" value="Listo para Enviar" onclick="Enviar()"/>&nbsp;');
    end if;
    usp_print('
                <input type="button" value="Grabar" onclick="Grabar()"/>
                <input type="button" value="Volver" onclick="Volver()"/>
            </td>
        </tr>
    
    </table>
    <br>
    <table cellpadding="3" cellspacing="0" class="tableform" border="0" >
        <tr>
            <td ><b>Destinatarios:</b></td>
            <td colspan="3"></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="radio" name="vOpcionR" id="oUbigeo" value="0" onclick="HabilitarUbigeo()" '||case when cTipoDestinatario = 1 then 'checked' end||' />&nbsp;Ubigeo</td>
            <td>');
                USP_GEN_GET_UBIGEO_DEP_DOVIEW('vDepartamento','','onchange="ObtenerProvincias()"','disabled=');
    usp_print('
            </td>   
            <td>
                <div id="divProv">');
                    USP_GEN_GET_UBIGEO_PRO_DOVIEW('vProvincia','','','disabled');
    usp_print('
                </div>
            </td>
        </tr>
        <tr>
            <td></td>
            <td><input type="radio" name="vOpcionR" id="oGobierno" value="0" onclick="HabilitarGobierno()" '||case when cTipoDestinatario = 2 then 'checked' end||' />&nbsp;Tipo de Gobierno</td>
            <td colspan="2">');
                USP_GET_TIPO_GOBIERNO_DOVIEW('vTipoGobierno','','','disabled');
    usp_print('
            </td>
        </tr>
        <tr>
            <td></td>
            <td><input type="radio" name="vOpcionR" id="oTodos" value="0" onclick="DeshabilitarListas()" '||case when cTipoDestinatario = 3 then 'checked' end||' />&nbsp;Todos</td>
            <td colspan="2"></td>
        </tr>
    </table>
    <br>
    <table cellpadding="3" cellspacing="0" class=tableform border="0" align="center" width="100%">
        <tr>
            <td><b>Asunto:</b></td>
            <td><input type="text" name="vAsunto" value="'||cAsunto||'" size="100%"/></td>
        </tr>
        <tr>
            <td colspan="2"><b>Mensaje:</b></td>
        </tr>
        <tr>
            <td colspan="2" style="padding:10px;border-spacing: 5px;">');
    usp_print('
              <table style="padding:10px;border-spacing: 5px;">
              <tr><td>
                    <select id=textfield onChange="AplicarFormato_Gestor(this)" style="width:5%;font-size:9;">
                        <option value="<div>" cmd="FormatBlock">Normal</option>
                        <option value="<pre>" cmd="FormatBlock">Formatted</option>
                        <option value="<address>" cmd="FormatBlock">Address</option>
                        <option value="<H1>" cmd="FormatBlock">Heading1</option>
                        <option value="<H2>" cmd="FormatBlock">Heading2</option>
                        <option value="<H3>" cmd="FormatBlock">Heading3</option>
                        <option value="<H4>" cmd="FormatBlock">Heading4</option>
                        <option value="<H5>" cmd="FormatBlock">Heading5</option>
                        <option value="<H6>" cmd="FormatBlock">Heading6</option>
                        <!--option value="<ol>" cmd="FormatBlock">Numbered List</option>
                        <option value="<ul>" cmd="FormatBlock">Bulleted List</option-->
                        <option value="dir" cmd="FormatBlock">Directory List</option>
                        <option value="menu" cmd="FormatBlock">Menu List</option>
                        <option value="dt" cmd="FormatBlock">Definition Term</option>
                        <option value="dd" cmd="FormatBlock">Definition</option>
                        <option value="p" cmd="FormatBlock">Paragraph</option>
                    </select>
                    </td>
                    <td>
                    <select id=textfield onChange="AplicarFormato_Gestor(this)" style="width:5%;font- size:9;">
                        <option value="Arial" cmd="Fontname">Arial</option>
                        <option value="Arial Black" cmd="Fontname">Arial&nbsp;Black</option>
                        <option value="Arial Narrow" cmd="Fontname">Arial&nbsp;Narrow</option>
                        <option value="Book Antiqua" cmd="Fontname">Book&nbsp;Antiqua</option>
                        <option value="Bookman Old Style" cmd="Fontname">Bookman&nbsp;Old&nbsp;Style</option>
                        <option value="Comic Sans MS" cmd="Fontname">Comic&nbsp;Sans&nbsp;MS</option>
                        <option value="Courier New" cmd="Fontname">Courier&nbsp;New</option>
                        <option value="Lucida Sans Unicode" cmd="Fontname">Lucida Sans Unicode</option>
                        <option value="Microsoft Sans Serif" cmd="Fontname">Microsoft&nbsp;Sans&nbsp;Serif</option>
                        <option value="Monotype Corsiva" cmd="Fontname">Monotype Corsiva</option>
                        <option value="MS Outlook" cmd="Fontname">MS Outlook</option>
                        <option value="System" cmd="Fontname">System</option>
                        <option value="Symbol" cmd="Fontname">Symbol</option>
                        <option value="Tahoma" cmd="Fontname">Tahoma</option>
                        <option value="Times New Roman" cmd="Fontname">Times New Roman</option>
                        <option value="Verdana" cmd="Fontname">Verdana</option>
                        <option value="Webdings" cmd="Fontname">Webdings</option>
                    </select>
                    </td>
                    <td>
                    <select id=textfield onChange="AplicarFormato_Gestor(this)" style="width:5%;font- size:9;">
                        <option value="3" cmd="FontSize">12</option>
                        <option value="4" cmd="FontSize">14</option>
                        <option value="5" cmd="FontSize">18</option>
                        <option value="6" cmd="FontSize">24</option>
                        <option value="7" cmd="FontSize">36</option>
                    </select>
                    </td>
                    <td>
                    <select id=textfield onChange="AplicarFormato_Gestor(this)"  style="width:5%;font- size:9;">
                        <option style="background-color:#000000" value="#000000" cmd="ForeColor">Black</option>
                        <option style="background-color:#800000" value="#800000" cmd="ForeColor">Maroon</option>
                        <option style="background-color:#008000" value="#008000" cmd="ForeColor">Green</option>
                        <option style="background-color:#808000" value="#808000" cmd="ForeColor">Olive</option>
                        <option style="background-color:#000080" value="#000080" cmd="ForeColor">Navy</option>
                        <option style="background-color:#800080" value="#800080" cmd="ForeColor">Purple</option>
                        <option style="background-color:#008080" value="#008080" cmd="ForeColor">Teal</option>
                        <option style="background-color:#808080" value="#808080" cmd="ForeColor">Gray</option>
                        <option style="background-color:#C0C0C0" value="#C0C0C0" cmd="ForeColor">Silver</option>
                        <option style="background-color:#FF0000" value="#FF0000" cmd="ForeColor">Red</option>
                        <option style="background-color:#00FF00" value="#00FF00" cmd="ForeColor">Lime</option>
                        <option style="background-color:#FFFF00" value="#FFFF00" cmd="ForeColor">Yellow</option>
                        <option style="background-color:#0000FF" value="#0000FF" cmd="ForeColor">Blue</option>
                        <option style="background-color:#FF00FF" value="#FF00FF" cmd="ForeColor">Fuchsia</option>
                        <option style="background-color:#00FFFF" value="#00FFFF" cmd="ForeColor">Aqua</option>
                        <option style="background-color:#FFFFFF" value="#FFFFFF" cmd="ForeColor">White</option>
                    </select>
                    </td>
                    <td>
                    <input type=image onClick="AplicarFormato_Gestor(this)" cmd=Bold width=16 height=16 src="http://zonasegura.seace.gob.pe/images/edit_bold.gif" id=image1 name=image1 title="Negrita">
                   <input type=image onClick="AplicarFormato_Gestor(this)" cmd=Italic width=16 height=16 src="http://zonasegura.seace.gob.pe/images/edit_italic.gif" id=image2 name=image2 title="Cursiva">
                    <input type=image onClick="AplicarFormato_Gestor(this)" cmd=Underline width=16 height=16 src="http://zonasegura.seace.gob.pe/images/edit_underline.gif" id=image3 name=image3 title="Subrayado">
                    <input type=image onClick="AplicarFormato_Gestor(this)" cmd=InsertOrderedList width=16 height=16 src="http://zonasegura.seace.gob.pe/images/edit_list_ordered.gif" id=image4 name=image4 title="Numeraci&oacute;n">
                    <input type=image onClick="AplicarFormato_Gestor(this)" cmd=InsertUnorderedList width=16 height=16 src="http://zonasegura.seace.gob.pe/images/edit_list_unordered.gif" id=image5 name=image5 title="Vi&ntilde;eta">
                    <input type=image onClick="AplicarFormato_Gestor(this)" cmd=Outdent width=16 height=16 src="http://zonasegura.seace.gob.pe/images/edit_outdent.gif" id=image6 name=image6 title="Disminuir Sangr&iacute;a">
                    <input type=image onClick="AplicarFormato_Gestor(this)" cmd=Indent width=16 height=16 src="http://zonasegura.seace.gob.pe/images/edit_indent.gif" id=image7 name=image7 title="Aumentar Sangr&iacute;a">
                    <input type=image onClick="AplicarFormato_Gestor(this)" cmd=JustifyLeft width=16 height=16 src="http://zonasegura.seace.gob.pe/images/edit_justify_left.gif" id=image8 name=image8 title="Alinear Izquierda">
                    <input type=image onClick="AplicarFormato_Gestor(this)" cmd=JustifyCenter width=16 height=16 src="http://zonasegura.seace.gob.pe/images/edit_justify_center.gif" id=image9 name=image9 title="Centrar">
                    <input type=image onClick="AplicarFormato_Gestor(this)" cmd=JustifyRight width=16 height=16 src="http://zonasegura.seace.gob.pe/images/edit_justify_right.gif" id=image10 name=image10 title="Alinear Derecha">
                    <input type=image onClick="AplicarFormato_Gestor(this)" cmd=JustifyFull width=16 height=16 src="http://zonasegura.seace.gob.pe/images/edit_justify_full.gif" id=image11 name=image11 title="Justificar">
<!--                <input type=image onClick="AplicarFormato_Gestor(this)" cmd=InsertHorizontalRule width=16 height=16 src="http://zonasegura.seace.gob.pe/images/edit_insert_rule.gif" id=image12 name=image12> -->
                    <input type=image onClick="AplicarFormato_Gestor(this)" cmd=createLink width=16 height=16 src="http://zonasegura.seace.gob.pe/images/edit_insert_rule.gif" id=image12 name=image12 title="Hiperv&iacute;nculo">
             
              </td><td><input type="text" name="vUrl" value="" style="width:100%;font-size:0.1pt;"/></td></tr></table> <br>
    ');
    usp_print('
                <input name="li_text" type=hidden > 
<!--                <div onkeyup="total.innerHTML='''||'Total Caracteres: '||'''+this.innerHTML.length" -->
                <div 
                    id="HTMLEdit" 
                    style="width:100%;height:200px;BORDER:1px solid #c0c0c0;TEXT-ALIGN:LEFT;OVERFLOW:SCROLL;background-color:#ffffff;padding:3" 
                    contenteditable="true"  
                    EDITTYPE="HTML" 
                    DATAFORMATAS="HTML"> '||cMensaje||'
                </div>
    '); 
    
    --vertical-align:top;border:1px solid #c0c0c0;width:1200;height:50px;
    usp_print('
            </td>
        </tr>
    </table>
    
<!--    <input type="button" value="Vista Previa" onClick="MostrarPrevio()"/> -->
    <input type="hidden" name="vIdMensaje" value="'||cIdMensaje||'" />
    <input type="hidden" name="vOpcion" value="'||cTipoDestinatario||'" />
    <input type="hidden" name="vMensaje" value="" />');
    
    usp_print('
    <script language=javascript>
    function getTime()
    {
        momentoActual = new Date();
        hora = momentoActual.getHours();
        minuto = momentoActual.getMinutes();
        segundo = momentoActual.getSeconds();
        time = hora + " : " + minuto + " : " + segundo;
        
        return time;
    }
    
  function addLink() {
    var linkURL = prompt(''Enter a URL:'', ''http://'');
    var sText = editorWindow.document.getSelection();

    document.execCommand(''createLink'', true, ''<a href="'' + linkURL + ''" target="_blank">'' + sText + ''</a>'');
}
    function AplicarFormato_Gestor(obj)
    {
    document.getElementById("HTMLEdit").focus();
    
        if (obj.tagName=="SELECT") 
        {
            var cmd=obj.options[obj.selectedIndex].getAttribute("cmd")
            document.execCommand(cmd, false, obj.value);
            return;
        }
        else {
           if(obj.getAttribute("cmd")==''createLink''){
           //addLink();
           var url = thisform.vUrl.value;
           var selection = document.getSelection();
            document.execCommand(''createLink'', true, url);
           // selection.anchorNode.parentElement.target = ''_blank'';
           
           }else{
       
           document.execCommand(obj.getAttribute("cmd"), true, null);  
          }
           
        }
        window.event.cancelBounce=false;
        window.event.returnValue=false;
        
    }
  
    function MostrarPrevio()
    { 
        if (thisform.vAsunto.value == "")
        {
            alert("Ingrese el asunto del mensaje.");
            return false;
        }
        
        thisform.vMensaje.value = HTMLEdit.innerHTML;
        if (thisform.vMensaje.value == "")
        {
            alert("Ingrese el contenido del mensaje.");
            return false;
        }
        
        thisform.scriptdo.value = "doViewPrevio";
        thisform.submit();
    }
    
    function HabilitarUbigeo()
    { 
        thisform.vOpcion.value = 1;
        thisform.vDepartamento.disabled = false;
        thisform.vProvincia.disabled = false;
        thisform.vTipoGobierno.disabled = true;
    }
    
    function HabilitarGobierno()
    {
        thisform.vOpcion.value = 2;
        thisform.vTipoGobierno.disabled = false;
        thisform.vDepartamento.disabled = true;
        thisform.vProvincia.disabled = true;
    }
    
    function DeshabilitarListas()
    {
        thisform.vOpcion.value = 3;
        thisform.vTipoGobierno.disabled = true;
        thisform.vDepartamento.disabled = true;
        thisform.vProvincia.disabled = true;
    }
    
    function ObtenerProvincias()
    {
        var time = getTime();
        var obj = document.getElementById(''divProv'');
        parametros="portletid=mod_envio_mensajes&scriptdo=doViewProvincias&v_nombre_var=vProvincia&v_dep_cod="+thisform.vDepartamento.value+"&v_time="+time;
        //divProv.innerHTML = getPortletAjax("portlet5openAjax.asp?_portletid_=mod_envio_mensajes&scriptdo=doViewProvincias&v_nombre_var=vProvincia&v_dep_cod="+thisform.vDepartamento.value+"&v_time="+time);
         getPortletAjax(obj, parametros);
    }
    
    function Grabar()
    {
        if (thisform.vOpcion.value == "" || thisform.vOpcion.value == "0")
        {
            alert("Seleccione el grupo de destinatarios.");
            return false;
        }
        else
        {
            if (thisform.vOpcion.value == "1")
            {
                if (thisform.vDepartamento.value == "-1")
                {
                    alert("Seleccione el departamento.");
                    return false;
                }
                if (thisform.vProvincia.value == "-1")
                {
                    alert("Seleccione la provincia.");
                    return false;
                }
            }
            if (thisform.vOpcion.value == "2")
            {
                if (thisform.vTipoGobierno.value == "-1")
                {
                    alert("Seleccione el tipo de gobierno.");
                    return false;
                }
            }
        }
        
        if (thisform.vAsunto.value == "")
        {
            alert("Ingrese el asunto del mensaje.");
            return false;
        }
        
       // thisform.vMensaje.value = HTMLEdit.innerHTML;
        thisform.vMensaje.value =document.getElementById("HTMLEdit").innerHTML;
        if (thisform.vMensaje.value == "")
        {
            alert("Ingrese el contenido del mensaje.");
            return false;
        }
        
        if (thisform.vIdMensaje.value == 0)
            thisform.scriptdo.value = "doGrabarMensaje";
        else
            thisform.scriptdo.value = "doEditarMensaje";
            
        thisform.submit();
    }
    
    function Enviar()
    {
        if ( confirm("Una vez realizada esta operación el mensaje no podrá ser modificado y quedará listo para ser enviado a la lista de destinatarios. ¿Desea continuar?") )
        {
            thisform.scriptdo.value = "doActualizaEstadoEnvio";
            thisform.submit();    
        }
    }
    
    function Volver()
    {
        thisform.scriptdo.value = "doView";
        thisform.submit();
    }
    
    /* A ejecutar al inicio al cargar la pagina */
    if ('||cTipoDestinatario||' == 1 ) //x Ubigeo
    {
        HabilitarUbigeo();
        thisform.vDepartamento.value = "'||cDestDepCodigo||'";
        ObtenerProvincias();
        thisform.vProvincia.value = "'||cDestProCodigo||'";
    }
    if ('||cTipoDestinatario||' == 2 ) //x Tipo de Gobierno
    {
        HabilitarGobierno();
        thisform.vTipoGobierno.value = "'||cDestTipoGobierno||'";
    }
    </script>');
EXCEPTION
    WHEN others THEN
        usp_print('Error al mostrar la página: '||SQLERRM);
END; -- Procedure

/
