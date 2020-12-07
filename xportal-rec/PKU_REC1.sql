CREATE OR REPLACE PACKAGE                                                     pku_rec1 is

  -- Author  : CLEONV
  -- Created : 05/08/2011 9:44:19
  -- Purpose : 
  
PROCEDURE USP_REC_A001_MANTEN_ENTIDADES(cod varchar2,
  session__anhoentidad    varchar2,
  v_dep_codigo_vb         varchar2, 
  v_pro_codigo_vb         varchar2,
  v_dis_codigo_vb         varchar2,
  v_razon_social          varchar2,
  v_num_ruc               varchar2,
  v_entidad               varchar2,
  ag_currentpage          IN   VARCHAR2 := 1,
  v_num                   varchar2,
  session__eue_codigo     varchar2,
  session__USERID         varchar2
      );
      
      
PROCEDURE showpaginacion (
      currentpage   IN   VARCHAR2,
      num_users     IN   NUMBER,
      enlace        IN   VARCHAR2,
      modulo        IN   VARCHAR2,
      pagesize      IN   NUMBER
     ); 
     
PROCEDURE USP_REC_A001_CAMBIAR_ESTADO(cod_entidad             varchar2,
                                      v_razon_social          varchar2,
                                      v_num_ruc               varchar2,
                                      session__anhoentidad    number);
                                      
PROCEDURE USP_REC_A001_GEN_INSERTAR(cod_entidad             varchar2,
                                    estado_modifica         varchar2,
                                    v_observacion           varchar2,
                                    session__anhoentidad    number,
                                    iisenv__remote_host     varchar2,
                                    session__USERID         varchar2,
                                    ent_activo              varchar2,
                                    v_doc_autoriza          varchar2,
                                    v_dispositivo           varchar2);
                                    
PROCEDURE USP_REC_A001_M_RECORD(  cod_entidad_l           varchar2,
                                  session__anhoentidad    number);                                 
                                    
PROCEDURE USP_REC_A001_FORM_CREACION(cod_entidad               varchar2,                                       
                                     session__anhoentidad      varchar2,  
                                     anio                      varchar2,  
                                     codigo_consucode          varchar2,  
                                     session__eue_codigo       varchar2,  
                                     v_dep_codigo_vb           varchar2,  
                                     v_pro_codigo_vb           varchar2,  
                                     v_dis_codigo_vb           varchar2,  
                                     session__FileSingedHTTP    varchar2,
                                     lv_DOC_URL                 varchar2,
                                     lv_ICON_TIPO_FILE         varchar2, 
                                     v_sector                   varchar2,   
                                     v_num_ruc                  varchar2, 
                                     v_razon_social             varchar2, 
                                     v_sigla                    varchar2,  
                                     lugar_ejec_vb             varchar2,  
                                     v_direccion               varchar2,  
                                     v_telefono                varchar2,  
                                     v_anex_telf               varchar2,   
                                     v_fax                     varchar2,  
                                     v_anex_fax                varchar2, 
                                     v_pag_web                 varchar2,  
                                     v_nom_sol                 varchar2,   
                                     v_cargo_sol               varchar2,   
                                     v_correo                  varchar2, 
                                     v_dispositivo             varchar2,  
                                     v_cod_siaf                varchar2,   
                                     v_pliego                  varchar2,   
                                     v_uni_ejecu               varchar2,   
                                     v_documento_presup        varchar2,   
                                     v_actividad               varchar2,   
                                     v_observaciones_clasif    varchar2, 
                                     v_nombre_titular          varchar2,        
                                     v_tele_titular            varchar2,          
                                     v_anex_titular            varchar2,          
                                     v_cel_titular             varchar2,           
                                     v_correo_titular          varchar2,                       
                                     v_nombre_logistica        varchar2,      
                                     v_tele_logistica          varchar2,        
                                     v_anex_logistica          varchar2,        
                                     v_cel_logistica           varchar2,         
                                     v_correo_logistica        varchar2,                           
                                     v_nombre_informatica      varchar2,    
                                     v_tele_informatica        varchar2,      
                                     v_anex_informatica        varchar2,      
                                     v_cel_informatica         varchar2,       
                                     v_correo_informatica      varchar2,        
                                     v_anho                    varchar2,
                                     session__USERID           varchar2
                                     );   
                                     
PROCEDURE USP_REC_A001_NEW_CLASIFICADOR (valor                 varchar2,
                                         v_session             varchar2);   

PROCEDURE USP_REC_A001_INSERT_CLAS (v_actividad      varchar2,
                                    session__USERID  varchar2,
                                    v_desc           varchar2,
                                    txtObservacion   varchar2,
                                    tipo             varchar2,
                                    v_secto          varchar2);     
                                    
PROCEDURE USP_REC_A001_INSERT_NEW_ENT(v_cod_max                   varchar2,
                                      v_cod_estado                varchar2,
                                      v_num_ruc                   varchar2,
                                      v_razon_social              varchar2,
                                      v_sigla                     varchar2,
                                      v_ubigeo                    varchar2,
                                      v_direccion                 varchar2,
                                      v_telefono                  varchar2,
                                      v_anex_telf                 varchar2,
                                      v_fax                       varchar2,
                                      v_anex_fax                  varchar2,
                                      v_pag_web                   varchar2,
                                      v_correo                    varchar2,
                                      v_correo2                   varchar2,
                                      v_dep_codigo_vb             varchar2,
                                      v_pro_codigo_vb             varchar2,
                                      v_dis_codigo_vb             varchar2,
                                      v_cod_dep                   varchar2,
                                      v_cod_pro                   varchar2,
                                      v_cod_dis                   varchar2,
                                      v_nom_sol                   varchar2,
                                      v_cargo_sol                 varchar2,
                                      session__anhoentidad        number,
                                      v_cod_siaf                  varchar2,
                                      v_sector                    varchar2,
                                      v_pliego                    varchar2,
                                      v_uni_ejecu                 varchar2,
                                      v_actividad                 varchar2,
                                      v_instancia                 varchar2,
                                      v_nombre_titular            varchar2,
                                      v_tele_titular              varchar2,
                                      v_anex_titular              varchar2,
                                      v_cel_titular               varchar2,
                                      v_correo_titular            varchar2,
                                      v_nombre_logistica          varchar2,
                                      v_tele_logistica            varchar2,
                                      v_anex_logistica            varchar2,
                                      v_cel_logistica             varchar2,
                                      v_correo_logistica          varchar2,
                                      v_nombre_informatica        varchar2,
                                      v_tele_informatica          varchar2,
                                      v_anex_informatica          varchar2,
                                      v_cel_informatica           varchar2,
                                      v_correo_informatica        varchar2,
                                      session__USERID             varchar2,
                                      v_cod_actual                varchar2,
                                      WriteFileDirectoryDynamic   varchar2,
                                      pfiletoupload1              varchar2,
                                      pfiletoupload1__size        varchar2,
                                      pfiletoupload2              varchar2,
                                      pfiletoupload2__size        varchar2,
                                      pfiletoupload3              varchar2,
                                      pfiletoupload3__size        varchar2,
                                      iisenv__remote_host         varchar2,
                                      v_dispositivo               varchar2,
                                      v_doc_autoriza              varchar2,
                                      v_documento_presup          varchar2,
                                      v_observaciones_clasif      varchar2,
                                      SESSION__FULLNAME           varchar2,
                                      cod_entidad                 varchar2,
                                      estado_modifica             varchar2,
                                      txtObservacion              varchar2,
                                      ent_activo                  varchar2,
                                      v_ident_entidad             number,
                                      lugar_ejec_vb               varchar2
                                       );  
                                       
PROCEDURE USP_REC_A002_FORM_REPORTES(val varchar2,
  v_dep_codigo_vb         varchar2,
  v_pro_codigo_vb         varchar2,
  v_dis_codigo_vb         varchar2,
  v_session               varchar2,
  session__USERID         varchar2);    
  
  
PROCEDURE USP_REC_A002_RESULT (v_actividad           varchar2,
                               v_instancia           varchar2,
                               v_sector              varchar2,
                               v_pliego              varchar2,
                               v_uni_eje             varchar2,
                               fec_cre_ini           varchar2,
                               fec_cre_fin           varchar2,
                               v_cod_estado          varchar2,
                               fec_des_ini           varchar2,
                               fec_des_fin           varchar2,
                               fec_act_ini           varchar2,
                               fec_act_fin           varchar2,
                               session__anhoentidad  number,
                               ag_currentpage   IN   varchar2 := 1,
                               v_cod_dep             varchar2,
                               v_cod_pro             varchar2,
                               v_cod_dis             varchar2,
                               v_dep_codigo_vb       varchar2,
                               v_pro_codigo_vb       varchar2,
                               v_dis_codigo_vb       varchar2
                            );  
                            
                            
PROCEDURE USP_REC_A002_EXCEL (v_actividad           varchar2,
                               v_instancia           varchar2,
                               v_sector              varchar2,
                               v_pliego              varchar2,
                               v_uni_eje             varchar2,
                               fec_cre_ini           varchar2,
                               fec_cre_fin           varchar2,
                               v_cod_estado          number,
                               fec_des_ini           varchar2,
                               fec_des_fin           varchar2,
                               fec_act_ini           varchar2,
                               fec_act_fin           varchar2,
                               session__anhoentidad  number,
                               v_cod_dep             varchar2,
                               v_cod_pro             varchar2,
                               v_cod_dis             varchar2,
                               v_dep_codigo_vb       varchar2,
                               v_pro_codigo_vb       varchar2,
                               v_dis_codigo_vb       varchar2
                            );  
                            
PROCEDURE USP_REC_A003_FORM_CREACION(cod_entidad                   varchar2,
                                     session__anhoentidad          varchar2,
                                     anio                          varchar2,
                                     codigo_consucode              varchar2,
                                     session__eue_codigo           number,
                                     v_dep_codigo_vb               varchar2,
                                     v_pro_codigo_vb               varchar2,
                                     v_dis_codigo_vb               varchar2,
                                     session__FileSingedHTTP       varchar2,
                                     lv_DOC_URL                    varchar2,
                                     lv_ICON_TIPO_FILE             varchar2,
                                     v_sector                      varchar2
                                     );                                                                                                                                                                                                                                        

PROCEDURE USP_REC_A001_REENVIAR_EMAIL(codigo_consucode             varchar2,
                                      session__anhoentidad         varchar2);

                                 
  PROCEDURE USP_REC_A001_CONFIG_PARAM ( 
        v_cod_entidad varchar2,
        v_anio        varchar2 );
  PROCEDURE USP_GEN_JSCRIPT;
  PROCEDURE USP_GET_SUBTIPO_ENTIDAD_ACTUAL(
        ag_tipoent varchar2);
  PROCEDURE USP_GET_TIPO_ENTIDAD_ACTUAL(
       ag_tipoent varchar2);
  PROCEDURE USP_REC_E001_PERSONAL_DOVIEW (
        session__eue_codigo varchar2,
        v_mensaje1          varchar2,
        v_mensaje2          varchar2,
        v_nombre_buscar     varchar2);
  PROCEDURE USP_REC_E001_UPDATE_TOTAL_PERS(
        session__eue_codigo varchar2,
        session__userid     varchar2,
        iisenv__remote_host varchar2,
        v_total_personal    number);
  PROCEDURE USP_REC_E001_HISTORIAL_DOVIEW(
        session__eue_codigo varchar2);
  PROCEDURE USP_REC_E001_SAVE_PERSONAL(
        session__eue_codigo varchar2,
        session__userid     varchar2,
        iisenv__remote_host varchar2,
        v_nombre            varchar2,
        v_correo            varchar2,
        v_instruccion       number,
        v_unidad_labor      number,
        v_uni_operativa     varchar2);
  PROCEDURE USP_REC_A002_EXCEL_ENT( 
        v_actividad           varchar2,
        v_instancia           varchar2,
        v_sector              varchar2,
        v_pliego              varchar2,
        v_uni_eje             varchar2,
        v_cod_estado          number,
        fec_act_ini           varchar2,
        fec_act_fin           varchar2,
        session__anhoentidad  number,
        v_dep_codigo_vb       varchar2,
        v_pro_codigo_vb       varchar2,
        v_dis_codigo_vb       varchar2);
  PROCEDURE USP_REC_A002_RESULT_ENT( 
        v_actividad           varchar2,
        v_instancia           varchar2,
        v_sector              varchar2,
        v_pliego              varchar2,
        v_uni_eje             varchar2,
        v_cod_estado          number,
        fec_act_ini           varchar2,
        fec_act_fin           varchar2,
        session__anhoentidad  number,
        v_dep_codigo_vb       varchar2,
        v_pro_codigo_vb       varchar2,
        v_dis_codigo_vb       varchar2,
        ag_currentpage        number);
  PROCEDURE USP_REC_A004_REPORTE_DOVIEW(
        v_tipo_vista      number,
        v_tipo_reporte    number,
        ag_tipoent        varchar2,
        ag_subtipoent     varchar2,
        ag_codent         varchar2);
  PROCEDURE USP_REC_A004_REPORTES_PERSONAL(
        session__eue_codigo varchar2,
        v_nivel             number,
        v_tipo_reporte      number,
        ag_tipoent          varchar2);
  PROCEDURE USP_REC_A005_INSERT_PLIEGO(
        session__userid varchar2,
        v_cod_sector1   varchar2,
        v_des_sector1   varchar2,
        v_pliego_desc   varchar2,
        v_pliego_just   varchar2);
  PROCEDURE USP_REC_A005_INSERT_SECTOR(
        session__userid varchar2,
        v_desc varchar2,
        txtObservacion varchar2);
  PROCEDURE USP_REC_A005_MANT_SECTOR_FORM(
        session__userid varchar2,
        v_desc_busca    varchar2,
        v_cod_sector    varchar2,
        v_des_sector    varchar2,
        v_mensaje1      varchar2,
        v_mensaje2      varchar2);
  PROCEDURE USP_REC_A005_UPDATE_PLIEGO(
        session__userid varchar2,
        v_cod_sector1   varchar2,
        v_des_sector1   varchar2,
        v_accion_pliego varchar2,
        v_cod_pliego    varchar2,
        v_pliego_desc   varchar2,
        v_pliego_just   varchar2);
  PROCEDURE USP_REC_A005_UPDATE_SECTOR(
        session__userid varchar2,
        v_accion        varchar2,
        v_cod_sector varchar2,
        v_desc          varchar2,
        txtObservacion  varchar2);
  PROCEDURE USP_REC_E001_HIST_PERSO_DOVIEW(
        v_id_personal number);
  PROCEDURE USP_REC_E001_UPDATE_PERSONAL(
        session__eue_codigo varchar2,
        session__userid     varchar2,
        iisenv__remote_host varchar2,
        v_id_accion         number,
        v_id_personal       number,
        v_nombre            varchar2,
        v_correo            varchar2,
        v_instruccion       number,
        v_unidad_labor      number,
        v_uni_operativa     varchar2);
end PKU_REC1;
/


CREATE OR REPLACE PACKAGE BODY                           pku_rec1 is

PROCEDURE USP_REC_A001_MANTEN_ENTIDADES(
  cod                     varchar2,
  session__anhoentidad    varchar2,
  v_dep_codigo_vb         varchar2,
  v_pro_codigo_vb         varchar2,
  v_dis_codigo_vb         varchar2,
  v_razon_social          varchar2,
  v_num_ruc               varchar2,
  v_entidad               varchar2,
  ag_currentpage          IN   VARCHAR2 := 1,
  v_num                   varchar2,
  session__eue_codigo    varchar2,
  session__USERID         varchar2
      )
            
IS

      cursor cBusqueda (v_currentpage   IN   VARCHAR2,  v_anhoentidad   in   VARCHAR2) IS
             select n_ruc, instancia, pliego, codconsucode, descripcion, ubigeo, activo
            from (
                  select ROWNUM num, a.*
                         from (
                         select distinct e.n_ruc, e.instancia, e.pliego, e.codconsucode, e.descripcion, dep.dep_desc|| ' / ' ||pro.pro_desc|| ' / ' ||dis.dis_desc as ubigeo, e.activo 
                         from sease.entidades e 
                         left join sease.dep_ubigeo dep on e.dep_coddpto = dep.dep_codigo
                         left join sease.prov_ubigeo pro on e.pro_codprov = pro.dep_codigo||''||pro.pro_codigo
                         left join sease.dist_ubigeo dis on e.dis_coddist = dis.dep_codigo||''||dis.pro_codigo||''||dis.dis_codigo
                         where e.anhoentidad = session__anhoentidad 
                         and (UPPER(e.descripcion) like '%'||upper(v_razon_social)||'%'
                         and e.n_ruc like '%'||v_num_ruc||'%')
                         order by e.Codconsucode asc) a) b
                         WHERE b.num BETWEEN 15 * (TO_NUMBER (v_currentpage) - 1) + 1
                               AND 15 * TO_NUMBER (v_currentpage);


lv_currentpage   number;
lv_num_users     number;
lv_num           number;
lv_iterador      number  NOT NULL DEFAULT 0;              
c_total          number;    
ln_cont          number;
v_sw             number;


BEGIN
  
IF ag_currentpage IS NULL
      THEN
         lv_currentpage := 1;
      ELSE
         lv_currentpage := ag_currentpage;
      END IF;

usp_print('

<script language="javascript">


        function form_update(instanc, plie ,codigo, anio){
                 thisform.codigo_consucode.value = codigo;
                 thisform.anio.value = anio;
                 thisform.scriptdo.value = "doForm";
                 thisform.submit();
                 }

        function form_create(){
                 thisform.v_num_ruc.value="";
                 thisform.v_razon_social.value="";
                 thisform.scriptdo.value="doForm";
                 thisform.submit();   
                 }   

        function mostrar_historial_modal(cod_entidad){
                 showModalDialog("portlet5open.asp?_portletid_=mod_rec1_a001_manten_entidad&scriptdo=doRecord&cod_entidad_l="+cod_entidad,self,"dialogWidth=700px;dialogHeight=600px;status:no");
                 } 

        function cambiar_estado_modal(cod_entidad, v_razon_social, v_num_ruc){
                 window.open(''portlet5open.asp?_portletid_=mod_rec1_a001_manten_entidad&scriptdo=doChange&cod_entidad=''+cod_entidad+''&v_razon_social=''+v_razon_social+"&v_num_ruc="+v_num_ruc,''self'',''toolbar=no,Width=500px,Height=300px,scrollbars=yes,modal=yes,dependent,alwaysRaised'')
                 }

        function habilitar(){       
                 if(thisform.v_entidad.value != "0")
                    {
                    thisform.v_descripcion.value = "";
                    thisform.v_descripcion.readOnly = false;
                    }
                 else
                    thisform.v_descripcion.readOnly = true;
                 }
   
        function validate_entidad(){
                 if(thisform.v_entidad.value == "2")
                     {
                     var x = window.event.keyCode;
                     switch (x)
                          {
                            case 8: case 9: case 48: case 49: case 50: case 51: case 52: case 53: case 54: case 55: case 56: case 57:
                            return;
                            default:
                            window.event.keyCode = 0;
                            break;
                           }
                      }
                    
                    if(thisform.v_entidad.value == "1")
                      {
                       var x = window.event.keyCode;  
                           switch (x)
                           {
                              //@%&!"#$()<=>?¿!/\+¿¿¿¿¿
                              case 173: case 64: case 37: case 38: case 33: case 34: case 35:  case 36:  case 40: case 41: 
                              case 60:  case 61: case 62: case 63: case 168: case 47: case 92: case 43: 
                              case 128: case 135: case 167: case 166: case 186: case 170: case 161: case 191: case 183:
                              case 96: case 94: case 231: case 58: case 59: case 199: case 95: case 42: case 123: case 125:
                              case 91: case 93: case 180:
                              window.event.keyCode = 0;
                              break;  
                              default:
                              return;
                            }
                        }  
                    }

        function getReport(){   
           
                 v1 = thisform.v_entidad.value;
                 v2 = thisform.v_descripcion.value;
                 if(v1 == "0")
                 {
                     alert("Debe seleccionar una opci\xf3n");                     
                     return;
                  }
                 if(v2 == "")
                 {
                     alert("Debe de ingresar una descripci\xf3n");                     
                     return;
                  }   
                  if(v1 == "1")
                  {
                     thisform.v_razon_social.value = v2; 
                     thisform.v_num_ruc.value ="";
                  }   
             
                  if(v1 == "2")
                  {
                     thisform.v_num_ruc.value = v2;
                     thisform.v_razon_social.value = "";
                   }    
                     thisform.scriptdo.value = "doView";
                     thisform.submit();                          
               }
</script>');

usp_print('
      <input name="codigo_consucode" value="" type="hidden" />
      <input name="anio" value="" type="hidden" />
      <input name="v_razon_social" value="'||v_razon_social||'" type="hidden" />
      <input name="v_num_ruc" value="'||v_num_ruc||'" type="hidden" />
      <input name="v_num" value="'||v_entidad||'" type="hidden" />
      <input name=v_dep_codigo_vb readonly="true" value="'||v_dep_codigo_vb||'" type="hidden" />
      <input name=v_pro_codigo_vb readonly="true" value="'||v_pro_codigo_vb||'" type="hidden"/>
      <input name=v_dis_codigo_vb readonly="true" value="'||v_dis_codigo_vb||'" type="hidden"/>
      <input name="tipo_ubi" type="hidden"/>
');
usp_print('<div id=resultado>
    <fieldset>
    
    <table  border="0" class=tableform cellpadding="3" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%">
        <tr>
            <td>
                <b>Opciones:</b>
                   <select style="width:180px;text-align:center" name="v_entidad" onchange="habilitar();">
                   <option value="0">--Seleccionar--</option>
                   <option value="1" '||case when v_entidad = 1 then 'selected' else '' end||'>Nombre de la Entidad</option>
                   <option value="2" '||case when v_entidad = 2 then 'selected' else '' end||'>Numero de RUC</option>
            </td>
            <td>
                <b>Descripci&oacute;n:</b>
                   <input type=text size="50" '||case when v_razon_social is not null then 'value="'||v_razon_social||'"' when v_num_ruc is not null then 'value="'||v_num_ruc||'"' else 'value=""' end||'  autocomplete="off" readOnly  name="v_descripcion" id="v_descripcion" onkeypress="validate_entidad()">
            </td>
            <td>
                   <input type="button" value="Buscar" onclick="getReport();" />
            </td>
            <td>
                   <input type="button" value="Crear Entidad" onclick="form_create();" />
            </td>
         </tr>
    </table>
    </fieldset><br></div>
    ');
usp_print('<script>
if(thisform.v_entidad.value != "0")
                    {
                    thisform.v_descripcion.readOnly = false;
                    }
</script>');

c_total :=0;

select count(*) into c_total
from (select distinct e.n_ruc, e.instancia, e.pliego, e.codconsucode, e.descripcion, dep.dep_desc|| ' / ' ||pro.pro_desc|| ' / ' ||dis.dis_desc as ubigeo, e.activo 
          from sease.entidades e 
          left join sease.dep_ubigeo dep on e.dep_coddpto = dep.dep_codigo
          left join sease.prov_ubigeo pro on e.pro_codprov = pro.dep_codigo||''||pro.pro_codigo
          left join sease.dist_ubigeo dis on e.dis_coddist = dis.dep_codigo||''||dis.pro_codigo||''||dis.dis_codigo
          where e.anhoentidad = session__anhoentidad 
          and (UPPER(e.descripcion) like '%'||upper(v_razon_social)||'%'
          and e.n_ruc like '%'||v_num_ruc||'%')
          order by e.Codconsucode asc);

if v_razon_social is not null or v_num_ruc is not null then
showpaginacion (lv_currentpage,
                      c_total,
                        'v_razon_social='
                      || v_razon_social
                      ||'&v_num_ruc='
                      || v_num_ruc
                      ||'&v_entidad='
                      || v_entidad,
                      '&scriptdo=doView',
                      15
                     );   
   
usp_print('
<table id="idtableItems" border="0" width=100% align=center  class=tableform CELLSPACING="0" CELLPADDING="3">    
           <tr>
             <th class=th1 width="3%"  align="center">Nro.</th>
             <th class=th1 width="5%"  align="center">C&oacute;digo</th>
             <th class=th1 width="10%" align="center">RUC</th>
             <th class=th1 width="25%" align="center">Nombre</th>
             <th class=th1 width="25%" align="center">Ubigeo</th> 
             <th class=th1 width="5%"  align="center">Estado</th>
             <th class=th1 width="5%"  align="center">Cambiar Estado</th>
             <th class=th1 width="5%"  align="center">Historial</th>
           </tr>');
           
 ln_cont:= 1 +  15 * (lv_currentpage-1);
 v_sw:=1;
 
      for xrow in cBusqueda(lv_currentpage, session__anhoentidad) loop
        if v_sw = 1 then
              usp_print('<tr bgcolor="#ECE9D8">');
            else
              usp_print('<tr>');
            end if;
           usp_print('<td align="center">'||ln_cont||'</td>');
           usp_print('<td align="center"><a href="#1" onclick="form_update('''||xrow.instancia||''','''||xrow.pliego||''','''||xrow.codconsucode||''', '''||session__anhoentidad||''')">'||xrow.codconsucode||'</a></td>');
           usp_print('<td align="center">'||xrow.n_ruc||'</td>');
           usp_print('<td>'||xrow.descripcion||'</td>');
           usp_print('<td>'||xrow.ubigeo||'</td>');
           usp_print('<td>'||( case xrow.activo when 1 then 'ACTIVO' when 0 then 'INACTIVO' END)||'</td>');
           usp_print('<td align = "center"><img src="images/Eliminar.gif" alt="cambiar de Estado" style="cursor:hand"  onclick="cambiar_estado_modal('''||xrow.codconsucode||''','''||v_razon_social||''','''||v_num_ruc||''')"/></td>');
           usp_print('<td align = "center"><input type="button" value="..." onclick="mostrar_historial_modal('''||xrow.codconsucode||''');"></td>');
           
         ln_cont := ln_cont + 1; 
         v_sw:=v_sw * (-1);  
      end loop;
      
end if;

  usp_print('</table>');
END;
/*********************************************************************************************************************************************************************************************************************************************************************************/
/*********************************************************************************************************************************************************************************************************************************************************************************/
/*********************************************************************************************************************************************************************************************************************************************************************************/
/*********************************************************************************************************************************************************************************************************************************************************************************/
/*********************************************************************************************************************************************************************************************************************************************************************************/
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
/*********************************************************************************************************************************************************************************************************************************************************************************/
/*********************************************************************************************************************************************************************************************************************************************************************************/
/*********************************************************************************************************************************************************************************************************************************************************************************/
/*********************************************************************************************************************************************************************************************************************************************************************************/
PROCEDURE USP_REC_A001_CAMBIAR_ESTADO(cod_entidad                    varchar2,
                                      v_razon_social                 varchar2,
                                      v_num_ruc                      varchar2,
                                      session__anhoentidad           number
                                      )
  IS
  ent_descripcion  varchar2(200);
  ent_ruc          char(11);
  ent_activo       char(1);
  BEGIN
    
 select distinct e.descripcion, e.n_ruc, e.activo into ent_descripcion, ent_ruc, ent_activo from sease.entidades e
                 where e.codconsucode = cod_entidad
                 and e.anhoentidad = session__anhoentidad;
                 
usp_print('<div id="contenedor_modal">');                 
usp_print('<input type="hidden" name="v_razon_social" value="'||v_razon_social||'" />
           <input type="hidden" name="v_num_ruc"      value="'||v_num_ruc||'" />
           <input type="hidden" name="ent_activo"     value="'||ent_activo||'" />
           <input type="hidden" name="cod_entidad"    value="'||cod_entidad||'" />');                 

usp_print('<script>

function f_submit(){
         var v_estado           = thisform.ent_activo.value;
         var v_cod_entidad      = thisform.cod_entidad.value;
         var v_observacion      = thisform.txtObservacion.value;
         
             if(thisform.txtObservacion.value == ""){
             alert("Tiene que Ingresar una Justificaci\xf3n");
             }
             else{
                 if(v_estado=="1")
                     {
                     if (confirm("¿Est\xe1 seguro que desea inactivar esta Entidad? ")) {
                     thisform.scriptdo.value = "doInsertEntidad";
                     
                     thisform.submit();
                     var wo = window.opener
                     wo.getReport()
                     window.close()
                     } 
                  }
             if(v_estado=="0"){
             
                  if (confirm("¿Est\xe1 seguro que desea Activar esta Entidad? ")) {
                  thisform.scriptdo.value = "doInsertEntidad";
                  
                  thisform.submit();
                  var wo = window.opener
                  wo.getReport()
                  window.close()
                  } 
                }
             }
          }
  
function NoCaracteresEspeciales(){
    //No permite el ingreso de los caracteres @ alt 64, % alt 37, & alt 38

    var x = window.event.keyCode;  
        
      switch (x){
      //@%&!"#$()<=>?¿!/\+¿¿¿¿¿
      case 173: case 64: case 37: case 38: case 33: case 34: case 35:  case 36:  case 40: case 41: 
      case 60:  case 61: case 62: case 63: case 168: case 47: case 92: case 43: 
      case 128: case 135: case 167: case 166: case 186: case 170: case 161: case 191: case 183:
      case 96: case 94: case 231: case 58: case 59: case 199: case 95: case 42: case 123: case 125:
      case 91: case 93: case 180:

          window.event.keyCode = 0;
          break;  
        default:
          return;
      }

    }
    
function act_contador() {
         document.all("conta_mensaje").value = document.all("txtObservacion").value.length;
         }  
              
function ValidarString(ls_obj, ls_mensage)
        {
            var strCadena = ls_obj.value;
            var valido= "ABCDEFGHIJKLMNOPQRSTUVWYXZ0123456789abcdefghijklmnopqrstuvwxyz#()=*+}{[]-:,.!&/ ";
            for (i = 0 ; i <= strCadena.length - 1; i++)
            {
                if(!vacio(trim(strCadena.substring(i,i+1))))
                {
                    if (valido.indexOf (strCadena.substring(i,i+1),0) == -1)
                    {
                        ls_obj.select();
                        alert("Hay un caracter no permitido en el campo " + ls_mensage + "\nel caracter no permitido es ( "+strCadena.substring(i,i+1)+" )");
                    ls_obj.focus();
                        return false;
                    }
                }
            }  
            return true;
        }
        
  function ismaxlength(obj){ 
        var mlength=obj.getAttribute? parseInt(obj.getAttribute("maxlength")) : "";
        if (obj.getAttribute && obj.value.length>mlength)
            obj.value=obj.value.substring(0,mlength);
        }      
                    
    </script>
    ');               

  
  usp_print('<div id="cuerpo" align="center">
 <input type="hidden" name="enti"     value="'||v_razon_social||'" />
 <input type="hidden" name="descri"   value="'||v_num_ruc||'" />
<table id="idtableItems" border="0" width=100% align=center  class=tableform CELLSPACING="0" CELLPADDING="3">
<tr>
    <td colspan="3" class=c1 align="center"><h3>Cambio de Estado<br/><br/><h3></td></tr>
<tr>
    <td class=c1 align="left">Entidad:</td>
    <td class=c2 align="left"><b>'||ent_descripcion||'</b></td>
</tr>
<tr>
    <td class=c1 align="left">RUC:</td>
    <td class=c2 align="left"><b>'||ent_ruc||'</b></td>
</tr>

<tr>
    <td class=c1 align="left">Estado Actual:</td>
    <td class=c2 align="left"><b>'||( case ent_activo when '1' then 'ACTIVO' when '0' then 'INACTIVO' END)||'</b></td>
</tr>

<tr>
    <td class=c1 align="left">Justificaci&oacute;n:</td>
    <td align="left" class=c2> 

     <textarea name = "txtObservacion" style="width:330px" rows=3 cols=48 maxlength="500" onkeyup="act_contador(); return ismaxlength(this)" ></textarea>
            <br><input type="text" name="conta_mensaje" maxlength="4" readonly style="width:10%">&nbsp;(M&aacute;x 500 caracteres).

    </td>
</tr>
<tr>
    <td align="center" colspan="2"><input type="button" onclick="f_submit();" '||case when ent_activo = 1 then ' value="Inactivar" ' else ' value="Activar" ' end||' /></td>
</tr>
</table>');
usp_print('</div>');

 usp_print('
        <script language="javascript">
        if (window.opener == null){

   document.getElementById("contenedor_modal").innerHTML="<h2>Acceso Denegado</h2>";
 
   }
            window.moveTo((screen.width-750)/2,(screen.height-400)/2);
        </script>');
  END;
/*********************************************************************************************************************************************************************************************************************************************************************************/
/*********************************************************************************************************************************************************************************************************************************************************************************/
/*********************************************************************************************************************************************************************************************************************************************************************************/
/*********************************************************************************************************************************************************************************************************************************************************************************/
/*********************************************************************************************************************************************************************************************************************************************************************************/
PROCEDURE USP_REC_A001_GEN_INSERTAR(cod_entidad             varchar2,
                                    estado_modifica         varchar2,
                                    v_observacion           varchar2,
                                    session__anhoentidad    number,
                                    iisenv__remote_host     varchar2,
                                    session__USERID         varchar2,
                                    ent_activo              varchar2,
                                    v_doc_autoriza          varchar2,
                                    v_dispositivo           varchar2)
  
IS 

v_observ      varchar2(500);

BEGIN

if ent_activo = 0 then
update sease.entidades e set e.activo = 1,
                             e.f_desactivar = sysdate
       where e.anhoentidad =  session__anhoentidad
       and e.codconsucode = cod_entidad;
       
update reg_procesos.entidades e set e.activo = 1,
                             e.f_desactivar = sysdate
       where e.anhoentidad =  session__anhoentidad
       and e.codconsucode = cod_entidad;       
       
end if;

if ent_activo = 1 then
update sease.entidades e set e.activo = 0,
                             e.f_desactivar = sysdate
       where e.anhoentidad =  session__anhoentidad
       and e.codconsucode = cod_entidad;
       
update reg_procesos.entidades e set e.activo = 0,
                             e.f_desactivar = sysdate
       where e.anhoentidad =  session__anhoentidad
       and e.codconsucode = cod_entidad;       
       
end if;

if ent_activo = 2 then
v_observ := v_doc_autoriza;  
end if;

if ent_activo = 3 then
v_observ := v_dispositivo;  
end if;

if ent_activo = 0 or ent_activo = 1 then
v_observ := v_observacion;  
end if;
       
insert into sease.entidad_historial(
usu_registro,
ip_registro,
estado_registro,
observaciones,
cod_entidad  
)
values(
session__USERID,
iisenv__remote_host,
ent_activo,
v_observ,
cod_entidad
);   

 
usp_print('
<script language="javascript">
alert("Se han producido los cambios");
window.close();
</script>');   

commit; 
  
     
     
  EXCEPTION
  WHEN OTHERS THEN  
     ROLLBACK;
     usp_print ('Ocurrio el siguiente error: ' || SQLERRM || ' - ' || SQLCODE);         
       
END;
/*********************************************************************************************************************************************************************************************************************************************************************************/
/*********************************************************************************************************************************************************************************************************************************************************************************/
/*********************************************************************************************************************************************************************************************************************************************************************************/
/*********************************************************************************************************************************************************************************************************************************************************************************/ 
PROCEDURE USP_REC_A001_M_RECORD(cod_entidad_l             varchar2,
                                session__anhoentidad      number)
  is

cursor cRecord is

  select e.ip_registro, e.cod_historial, e.usu_registro, e.fec_registro, e.estado_registro, e.observaciones 
  from sease.entidad_historial e
         where cod_entidad = cod_entidad_l 
         and anhoentidad = session__anhoentidad
          ORDER BY E.fec_registro;
 
 
  n_entidad varchar2(250);
  v_sw    number;
  ln_cont number;
  
  begin
   
select distinct e.descripcion into n_entidad from sease.entidades e
            where e.codconsucode = lpad(cod_entidad_l,6,0)
            and e.anhoentidad = session__anhoentidad;
    
 usp_print('<table border="0" class=tableform cellpadding="3" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="95%">
             <tr><td  colspan="2" align="left"><h3>Historial de Modificaciones: '||n_entidad||'</h3></td></tr>
             <tr>
             </table></br>');
  
    usp_print('<table id="idtableItems" border="0" width=95% align=center  class=tableform CELLSPACING="0" CELLPADDING="3">    
           <tr>
             <th class=th1 width="3%"   align="center">Nro.</th>
             <th class=th1 width="10%"  align="center">Motivo</th>
             <th class=th1 width="10%"  align="center">Usuario</th>
             <th class=th1 width="10%"  align="center">Fecha</th> 
             <th class=th1 width="10%"  align="center">IP</th>
             <th class=th1 width="30%"  align="center">Observaci&oacute;n</th>
           </tr>');
           
       v_sw:=1;     
     ln_cont := 1;      
   for xrow in cRecord loop
        if v_sw = 1 then
              usp_print('<tr bgcolor="#ECE9D8">');
            else
              usp_print('<tr>');
            end if;
          
           usp_print('<td>'||ln_cont||'</td>');
           usp_print('<td>'||( case xrow.estado_registro when 0 then 'ACTIVAR' when 1 then 'INACTIVAR' when 2 THEN 'MODIFICAR' when 3 then 'CREAR' END)||'</td>');
           usp_print('<td>'||xrow.usu_registro||'</td>');
           usp_print('<td>'||xrow.fec_registro||'</td>');
           usp_print('<td>'||xrow.ip_registro||'</td>');
           usp_print('<td>'||xrow.observaciones||'</td>');
           
           ln_cont := ln_cont + 1; v_sw:=v_sw * (-1);  
      end loop;       
      
end;
/*********************************************************************************************************************************************************************************************************************************************************************************/
/*********************************************************************************************************************************************************************************************************************************************************************************/
/*********************************************************************************************************************************************************************************************************************************************************************************/
/*********************************************************************************************************************************************************************************************************************************************************************************/
/*********************************************************************************************************************************************************************************************************************************************************************************/
PROCEDURE USP_REC_A001_FORM_CREACION(
        cod_entidad              varchar2,
        session__anhoentidad     varchar2,
        anio                     varchar2,
        codigo_consucode         varchar2,
        session__eue_codigo      varchar2,
        v_dep_codigo_vb          varchar2,
        v_pro_codigo_vb          varchar2,
        v_dis_codigo_vb          varchar2,
        session__FileSingedHTTP  varchar2,
        lv_DOC_URL               varchar2,
        lv_ICON_TIPO_FILE        varchar2,
        v_sector                 varchar2,
        v_num_ruc                varchar2,
        v_razon_social           varchar2,
        v_sigla                  varchar2,
        lugar_ejec_vb            varchar2,
        v_direccion              varchar2,
        v_telefono               varchar2,
        v_anex_telf              varchar2,
        v_fax                    varchar2,
        v_anex_fax               varchar2,
        v_pag_web                varchar2,
        v_nom_sol                varchar2,
        v_cargo_sol              varchar2,
        v_correo                 varchar2,
        v_dispositivo            varchar2,
        v_cod_siaf               varchar2,
        v_pliego                 varchar2,
        v_uni_ejecu              varchar2,
        v_documento_presup       varchar2,
        v_actividad              varchar2,
        v_observaciones_clasif   varchar2,
        v_nombre_titular         varchar2,
        v_tele_titular           varchar2,
        v_anex_titular           varchar2,
        v_cel_titular            varchar2,
        v_correo_titular         varchar2,
        v_nombre_logistica       varchar2,
        v_tele_logistica         varchar2,
        v_anex_logistica         varchar2,
        v_cel_logistica          varchar2,
        v_correo_logistica       varchar2,
        v_nombre_informatica     varchar2,
        v_tele_informatica       varchar2,
        v_anex_informatica       varchar2,
        v_cel_informatica        varchar2,
        v_correo_informatica     varchar2,                                                           
        v_anho                   varchar2,
        session__USERID          varchar2)
    IS
    /*
    ||    Author: Mart¿n Zanelli
    ||    Overview: Procedimiento que genera el formulario de Creaci¿n de Entidades
    ||    Modificaciones:
    ||      DD/MM/YYYY - (No Identificado) - Creaci¿n del procedimiento 
    ||      28/03/2012 - Mart¿n Zanelli - Modificaci¿n del procedimiento
    ||                   Se cambia los titulos de los campos Actividad e Instacia por 
    ||                   Tipo de Entidad y Sub Tipo de Entidad - Memorando 97-2012/SDP-ECC - punto 4.2
    ||      29/03/2012 - Mart¿n Zanelli - Modificaci¿n del procedimiento
    ||                   Se retira los botones para la creaci¿n de nuevos pliegos y segmentos porque 
    ||                   ya se implementauna opci¿n de mantenimiento - Memorando 97-2012/SDP-ECC - punto 4.1
    */ 
                                     
        cursor cSector is
       select distinct (case when se.sec_activo = 0  then 'ANTERIOR - ' ELSE '' end   ) com,  se.sec_codigo, se.sec_desc from sease.sector se
       order by com,se.sec_desc; 

cursor cPliego (sectore varchar2) is
       select distinct sp.pli_codigo, sp.desc_pliego from sease.pliego sp
              inner join sease.sector se on se.sec_codigo =sp.sec_codigo
              where se.sec_codigo = sectore
              order by sp.desc_pliego;
         
cursor cPliego1 (sectored varchar2) is
       select distinct sp.pli_codigo, sp.desc_pliego from sease.pliego sp
              inner join sease.sector se on se.sec_codigo =sp.sec_codigo
              where se.sec_codigo = sectored
        union 
        select distinct   sp.pli_codigo, sp.desc_pliego from sease.pliego sp    
        where  v_anho <> session__anhoentidad
          and sp.desc_pliego is not null
             order by desc_pliego;

cursor cActividad is
       select distinct (case when sa.act_sactivo = 0  then 'ANTERIOR - ' ELSE '' end  ) com ,  sa.act_ccodigo  , sa.act_vdesc from sease.actividad sa
         --     where ( ( nvl(v_anho,to_char(sysdate,'yyyy')) = session__anhoentidad and sa.act_sactivo =1) or ( nvl(v_anho,to_char(sysdate,'yyyy')) <> session__anhoentidad  ))
              order by sa.act_ccodigo;  

cursor cInstancia(actividade varchar2) is
       select distinct si.ins_ccodigo, si.ins_vdesc from sease.instancia si
              inner join sease.actividad sa on sa.act_ccodigo = si.act_ccodigo
              where sa.act_ccodigo = to_char(actividade)
             /* and sa.act_sactivo = 1*/
              order by si.ins_ccodigo; 
         
cursor cInstancia1 (actividades varchar2)is
       select distinct si.ins_ccodigo, si.ins_vdesc from sease.instancia si
              inner join sease.actividad sa on sa.act_ccodigo = si.act_ccodigo
              where sa.act_ccodigo = to_char(actividades)
            /*  and sa.act_sactivo = 1*/
              order by si.ins_ccodigo;
              
cursor cAnho is
       select distinct so.anhoentidad from sease.entidades so
              where so.codconsucode = codigo_consucode
              order by so.anhoentidad;

cursor cEntidades_doc1 is
       select ed.doc_url, ed.fec_upload, ta.icon_tipo_file from reg_procesos.entidades_doc ed
              inner join (select max(do.cod_doc) as doc_cod from reg_procesos.entidades_doc do where do.codconsucode = codigo_consucode and do.cod_indicador = 1) vw on vw.doc_cod = ed.cod_doc
              inner join reg_procesos.tipo_archivo ta on ta.cod_tipo_file = ed.cod_tipo_file;
            
cursor cEntidades_doc2 is
       select ed.doc_url, ed.fec_upload, ta.icon_tipo_file from reg_procesos.entidades_doc ed
              inner join (select max(do.cod_doc) as doc_cod from reg_procesos.entidades_doc do where do.codconsucode = codigo_consucode and do.cod_indicador = 2) vw on vw.doc_cod = ed.cod_doc
              inner join reg_procesos.tipo_archivo ta on ta.cod_tipo_file = ed.cod_tipo_file;
                    
cursor cEntidades_doc3 is
       select ed.doc_url, ed.fec_upload, ta.icon_tipo_file from reg_procesos.entidades_doc ed
              inner join (select max(do.cod_doc) as doc_cod from reg_procesos.entidades_doc do where do.codconsucode = codigo_consucode and do.cod_indicador = 3) vw 
              on vw.doc_cod = ed.cod_doc
              inner join reg_procesos.tipo_archivo ta on ta.cod_tipo_file = ed.cod_tipo_file;            
    
i_dep_desc varchar2(100);
i_pro_desc varchar2(100);
i_dis_desc varchar2(100); 

cod_max               char(20);
estado_entidad        number;
cod_actual            char(6); 
titulo                varchar(100);
anho                  varchar2(4);
ruc                   varchar2(20);
depart                char(2);
provin                char(4);
distri                char(6);
descripcion           varchar2(100);
abreviatura           varchar2(30);
direccion             varchar2(200); 
telefono              varchar2(11);
fax                   varchar2(11);
telefono_anx          varchar2(5);
fax_anx               varchar2(12);
web                   varchar2(60);
email                 varchar2(60);
email2                varchar2(60);
nombre_soli           varchar2(60);
cargo_soli            varchar2(60);
siaf                  char(6);
sect                  char(2);
plieg                 char(4);
uject                 char(4);
activ                 char(1);
instanc               char(1); 
activo                number;
nomb_titular          varchar2(60);
telef_titular         varchar2(12);
celular_titular       varchar2(11);
email_titular         varchar2(60);
telef_anx_titular     varchar2(5);
nom_logistica         varchar2(60);
telef_logistica       varchar2(12);
celular_logistica     varchar2(11);
email_logistica       varchar2(60);  
telef_anx_logistica   varchar2(5);
nombre_infor          varchar2(60);
telef_infor           varchar2(12);
celular_infor         varchar2(11);  
email_infor           varchar2(60);
telef_anx_infor       varchar2(5);
cod_consu_actual      char(6);
departam              varchar2(60);
provinc               varchar2(60);
distrit               varchar2(60);
codi_depa             char(2);
codi_provi            char(4);
codi_distri           char(6);
departament_desc      varchar2(60); 
provincia_desc        varchar2(60);
distrito_desc         varchar2(60);
anhos                 varchar2(4);
dispositivo           varchar2(200);
document_modificacion varchar2(150);
lv_ruta_file          varchar2(250);
document_pres         varchar2(100);
observaciones_clasi   varchar2(500);
v_ubig                varchar2(500);
i                     number;

BEGIN

    lv_ruta_file    := 'mon/docs/contratos/'  || session__anhoentidad||'/'||codigo_consucode||'/';    
    usp_print('<input type="hidden" name="WriteFileDirectory"          value="FileSinged">');
    usp_print('<input type="hidden" name="WriteFileDirectoryDynamic"   value="'||lv_ruta_file||'"></input>');         

if codigo_consucode is not null then
select distinct se.codconsucode, se.anhoentidad, se.n_ruc, se.dep_coddpto, se.pro_codprov, se.dis_coddist, se.descripcion, se.abreviatura, se.direccion, se.telefono,
 se.faximil, se.telefono_anx, se.faximil_anx, se.url_web, se.email, se.email2, se.tnomb_solicitante, se.tcargo_solicitante,se.codsiaf, se.sector,
 se.uejecutora, se.actividad, se.instancia, se.activo, se.tnomb_titular, se.ttelef_titular, se.tcelular_titular, se.temail_titular, se.ttelef_anx_titular,
 se.tnombjefelogis, se.ttelefjefelogis, se.tcelular_jefe_logis, se.temail_jefe_logis, se.ttelef_anx_jefe_logis, se.tnombjefeinfor, se.ttelefjefeinfor,
 se.tcelular_jefe_infor, se.temail_jefe_infor, se.ttelef_anx_jefe_infor, se.codconsucode, se.dep_coddpto, se.pro_codprov, se.dis_coddist,
 du.dep_desc, pu.pro_desc, sdu.dis_desc, se.pliego, se.dispositivo_legal, se.document_modif, se.document_presu, se.observaciones_clasif
 
into cod_actual, anho, ruc, depart, provin, distri, descripcion, abreviatura, direccion, telefono, fax, telefono_anx, fax_anx, web, email, email2, nombre_soli,
     cargo_soli, siaf, sect, uject, activ, instanc, activo, nomb_titular, telef_titular, celular_titular, email_titular, telef_anx_titular,
     nom_logistica, telef_logistica, celular_logistica, email_logistica, telef_anx_logistica, nombre_infor, telef_infor, celular_infor, email_infor,
     telef_anx_infor, cod_consu_actual, codi_depa, codi_provi, codi_distri, departament_desc, provincia_desc, distrito_desc, plieg, dispositivo, document_modificacion,
     document_pres, observaciones_clasi
from REG_PROCESOS.entidades se
     left join sease.sector ss on ss.sec_codigo = se.sector
     left join sease.pliego sp on sp.pli_codigo = se.pliego and sp.sec_codigo = ss.sec_codigo
     left join sease.dep_ubigeo du on du.dep_codigo = se.dep_coddpto
     left join sease.prov_ubigeo pu on pu.dep_codigo||''||pu.pro_codigo = se.pro_codprov
     left join sease.dist_ubigeo sdu on sdu.dep_codigo||''||sdu.pro_codigo||''||sdu.dis_codigo = se.dis_coddist
where se.codconsucode = codigo_consucode and se.anhoentidad =  anio;
v_ubig := i_dep_desc||'/'||i_pro_desc||'/'||i_dis_desc;
titulo := descripcion;
estado_entidad := 2;

else
  titulo := 'REGISTRAR NUEVA ENTIDAD';
  estado_entidad := 1;
                    
ruc                 := v_num_ruc;
descripcion         := v_razon_social;
abreviatura         := v_sigla;                                                
v_ubig              := lugar_ejec_vb;
direccion           := v_direccion;
telefono            := v_telefono;
telefono_anx        := v_anex_telf;
fax                 := v_fax;
fax_anx             := v_anex_fax;
web                 := v_pag_web;
email               := v_correo;
nombre_soli         := v_nom_sol;
cargo_soli          := v_cargo_sol;
siaf                := v_cod_siaf;
uject               := v_uni_ejecu;
document_pres       := v_documento_presup;
observaciones_clasi := v_observaciones_clasif;
nomb_titular        := v_nombre_titular;
telef_titular       := v_tele_titular;
telef_anx_titular   := v_anex_titular;
celular_titular     := v_cel_titular;
email_titular       := v_correo_titular;
nom_logistica       := v_nombre_logistica;
telef_logistica     := v_tele_logistica;
telef_anx_logistica := v_anex_logistica;
celular_logistica   := v_cel_logistica;
email_logistica     := v_correo_logistica;
nombre_infor        := v_nombre_informatica;
telef_infor         := v_tele_informatica;
telef_anx_infor     := v_anex_informatica;
celular_infor       := v_cel_informatica;
email_infor         := v_correo_informatica;

end if;
   
select max(e.codconsucode)+1 into cod_max from sease.entidades e
where e.codconsucode not in ('999999')
and e.anhoentidad = session__anhoentidad; 

usp_print('<script language="javascript">

function array_sector(texto,valor){
this.texto = texto
this.valor = valor}

');
/************select***************/
usp_print('var F = new Array();');  
usp_print('F[0]=new array_actividad("--Seleccionar--","");');

for xrow2 in cSector loop 
  i := 1;
usp_print('var A'||xrow2.sec_codigo||'= new Array();');
usp_print('A'||xrow2.sec_codigo||'[0]=new array_sector("--Seleccionar--","");');
      for xrow3 in cPliego(xrow2.sec_codigo) loop
             usp_print('A'||xrow2.sec_codigo||'['||i||'] = new array_sector("'||xrow3.desc_pliego||'","'||xrow3.pli_codigo||'"); ');
             i := i+1;
      end loop;
end loop;

usp_print('
function array_actividad(texto,valor){
this.texto = texto
this.valor = valor}

');

for xrow in cActividad loop 
  i := 1;
usp_print('var '||xrow.act_ccodigo||'= new Array();');
usp_print(''||xrow.act_ccodigo||'[0]=new array_actividad("--Seleccionar--","");');
        for xrow1 in cInstancia(xrow.act_ccodigo) loop
             usp_print(''||xrow.act_ccodigo||'['||i||'] = new array_actividad("'||xrow1.ins_ccodigo||'-'||xrow1.ins_vdesc||'","'||xrow1.ins_ccodigo||'"); ');
             i := i+1;
      end loop;
end loop;



usp_print('

function mostrar_array(cual,donde){
  
if(cual.selectedIndex >= 0){
  donde.length=0
  cual = eval(cual.value)
  for(m=0;m<cual.length;m++){
    var nuevaOpcion = new Option(cual[m].texto);
    donde.options[m] = nuevaOpcion;
   
    if(cual[m].valor != null){
      donde.options[m].value = cual[m].valor
      }
    else{
      donde.options[m].value = cual[m].texto
      }
    }
  }
}

function listar_pliegos(sect){

  thisform.scriptdo.value = "doform";
  thisform.submit();
  }
  
  
 
  
function getUpdate(){
  thisform.anio.value = thisform.v_anho.value;
thisform.scriptdo.value = "doform";
 
  thisform.submit();
   }  
  

function f_validaCampoNumerico1() { 
  
           var key=window.event.keyCode;   
           if (key <48 || key > 57 ){       
            window.event.keyCode=0;     
           }
}

function isEmail(s)
        {
        var regex = /^(([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5}){1,25})+([;.](([a-zA-Z0-9_\-\.]+)@{[a-zA-Z0-9_\-\.]+0\.([a-zA-Z]{2,5}){1,25})+)*$/;
        return regex.test(s);
        
        }

function f_init(){
  thisform.v_num_ruc.value="";
  thisform.v_razon_social.value="";
  thisform.scriptdo.value = "doView";
  thisform.submit();      
  }  

function SectPlieModal(indice){
  window.open(''portlet5open.asp?_portletid_=mod_rec1_a001_manten_entidad&scriptdo=doNewClas&valor=''+indice+''&v_session=''+'''||session__USERID||''',''self'',''toolbar=no,Width=500px,Height=270px,scrollbars=yes,modal=yes,dependent,alwaysRaised'')

 } 

function RtnUbigeo(dep_codigo,pro_codigo,dis_codigo,dep_desc,pro_desc,dis_desc,lugar_ejec)
    { 
        if (thisform.tipo_ubi.value==1)
        {
            thisform.dep_codigo.value=dep_codigo;
            thisform.pro_codigo.value=pro_codigo;
            thisform.dis_codigo.value=dis_codigo;
            thisform.lugar_ejec.value=dep_desc+"/"+pro_desc+"/"+dis_desc;
        }
        if (thisform.tipo_ubi.value==2)
        {
            thisform.v_dep_codigo_vb.value=dep_codigo;
            thisform.v_pro_codigo_vb.value=pro_codigo;
            thisform.v_dis_codigo_vb.value=dis_codigo;
            thisform.lugar_ejec_vb.value=dep_desc+"/"+pro_desc+"/"+dis_desc;
           
        }
        if (thisform.tipo_ubi.value==3)
        {
            thisform.dep_codigo_ed.value=dep_codigo;
            thisform.pro_codigo_ed.value=pro_codigo;
            thisform.dis_codigo_ed.value=dis_codigo;
            thisform.lugar_ejec_ed.value=dep_desc+"/"+pro_desc+"/"+dis_desc;
        }
    }  
    
    
    function BuscaUbigeo(tipo)
    {
        thisform.tipo_ubi.value=tipo;
        window.open("ControllerServletOpen?portletid=BuscadorUbigeo","","toolbar=no,Width=800,Height=400,scrollbars=yes,modal=yes,dependent,alwaysRaised");
    }
    
    function registrar_entidad(){
      
    if(thisform.v_num_ruc.value==""){
      alert("Tiene que Ingresar el Ruc de la Entidad");
      return false;
     }else{
      if(thisform.v_num_ruc.value.length != 11){
       alert("No es un formato de N\xfamero de RUC");
       thisform.v_num_ruc.focus();
       return false;
     }
     
     }
    if(thisform.v_razon_social.value==""){
    alert("Tiene que Ingresar la Raz\xf3n Social de la Entidad");
    return false;
     }
     
     if(thisform.lugar_ejec_vb.value==""){
    alert("Tiene que Ingresar el Ubigeo de la Entidad");
    return false;
     } 
     
     if(thisform.v_direccion.value==""){
    alert("Tiene que Ingresar la Direcci\xf3n de la Entidad");
    return false;
     }  
     
     if(thisform.v_nom_sol.value == ""){
      alert("Tiene que ingresar el Nombre del Solicitante");
      return false;
      }
      
      if(thisform.v_cargo_sol.value == ""){
      alert("Tiene que ingresar el Cargo del Solicitante");
      return false;
      }    
     
     if(thisform.v_correo.value==""){
     alert("Tiene que ingresar el Correo Electr\xf3nico del Solicitante");
     return false;
     }else{
     
     
         if (!(isEmail(thisform.v_correo.value)))
            {
              alert("Ingrese un formato correcto para este Correo de la Entidad");
                thisform.v_correo.focus();
                thisform.v_correo.select();
              return false;
              }
              }
         if(thisform.v_correo_titular.value != ""){ 
             
        if (!(isEmail(thisform.v_correo_titular.value)))
            {
              alert("Ingrese un formato correcto para el Correo del Titular");
                thisform.v_correo_titular.focus();
                thisform.v_correo_titular.select();
              return false;
              }}
              
              
          if(thisform.v_correo_logistica.value != ""){    
         
         if (!(isEmail(thisform.v_correo_logistica.value)))
            {
              alert("Ingrese un formato correcto para el Correo del Jefe del \xd3rgano Encargado de las Contrataciones");
                thisform.v_correo_logistica.focus();
                thisform.v_correo_logistica.select();
              return false;
              }}
              
              
           if(thisform.v_correo_informatica.value != ""){       
          if (!(isEmail(thisform.v_correo_informatica.value)))
            {
              alert("Ingrese un formato correcto para el Correo del Jefe de Inform\xe1tica");
                thisform.v_correo_informatica.focus();
                thisform.v_correo_informatica.select();
              return false;
              }   }     
                   
       if(thisform.v_dispositivo.value=="" && thisform.v_cod_actual.value == "" ){
    alert("Tiene que Ingresar el dispositivo legal que autoriza la creaci\xf3n de la Entidad");
    return false;
     }       
                  
     if(thisform.v_sector.value=="F"){
     alert("Tiene que Ingresar un Sector");
     return false;
     }
     
     if(thisform.v_cod_actual.value != ""){
      
      if(thisform.v_doc_autoriza.value == ""){
      alert("Tiene que ingresar el documento que autoriza la modificaci\xf3n");
      return false;
      }
      }
      
      if(thisform.pfiletoupload1.value != ""){
      
      extencion1 = thisform.pfiletoupload1.value
      
      extencion1 = extencion1.substring((extencion1.length)-4,extencion1.length)
      
      if (extencion1 != ".doc" && extencion1 != ".zip" && extencion1 != ".pdf")
            {
               alert("El archivo de extensi\xf3n "+extencion1+" no est\xe1 permitido.");
               thisform.pfiletoupload1.focus();    
               return false;
            }
      
      }
      
      if(thisform.pfiletoupload2.value != ""){
      
      extencion2 = thisform.pfiletoupload2.value
      
      extencion2 = extencion2.substring((extencion2.length)-4,extencion2.length)
      
       if (extencion2 != ".doc" && extencion2 != ".zip" && extencion2 != ".pdf")
            {
               alert("El archivo de extensi\xf3n "+extencion2+" no est\xe1 permitido.");
               thisform.pfiletoupload2.focus();    
               return false;
            }
      
      }
      
      if(thisform.pfiletoupload3.value != ""){
      
       extencion3 = thisform.pfiletoupload3.value
       
       extencion3 = extencion3.substring((extencion3.length)-4,extencion3.length)
            
            if (extencion3 != ".doc" && extencion3 != ".zip" && extencion3 != ".pdf")
            {
               alert("El archivo de extensi\xf3n "+extencion3+" no est\xe1 permitido.");
               thisform.pfiletoupload3.focus();    
               return false;
            }
      }
      
      
     if(confirm("¿Desea guardar los datos ingresados?")){
      thisform.scriptdo.value = "doInsertEntidad";
      
      if(thisform.v_cod_actual.value != ""){
         
         thisform.cod_entidad.value = thisform.v_cod_actual.value;
         thisform.ent_activo.value = "2";
      
      }else{
         thisform.cod_entidad.value = thisform.v_cod_max.value;
         thisform.ent_activo.value = "3";
      }
      
      
            thisform.submit();
     }
    }
    
    function reenviar_email(){
      var v_correo01 = '''||email||''';
      var v_correo02 = '''||email2||''';
      if(v_correo01 == "" && v_correo02 == ""){
     alert("No existe ning\xfan correo registrado");
     return false;
      }
      
       if(confirm("¿Desea reenviar la Notificaci\xf3n?"))
       {
       thisform.scriptdo.value = "doForward";
       thisform.submit();
        }
      }

</script>');

usp_print('

                <input name=v_dep_codigo_vb readonly="true" value="'||v_dep_codigo_vb||'" type="hidden" />
                <input name=v_pro_codigo_vb readonly="true" value="'||v_pro_codigo_vb||'" type="hidden"/>
                <input name=v_dis_codigo_vb readonly="true" value="'||v_dis_codigo_vb||'" type="hidden"/>
                <input name="tipo_ubi" type="hidden"/>
');
 
 usp_print('<table border="0" class=tableform cellpadding="3" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%">
             <tr><td align="left"><h3>'||titulo||'</h3></td>
             <td align="right">'||case when codigo_consucode is not null then '<input type="button" name="bot_reenviar" value="Reenviar Notificaci&oacute;n" onClick="reenviar_email();" />&nbsp;&nbsp;&nbsp;' else '' end||'<input type="button" value="Volver" onclick="f_init();">&nbsp;&nbsp;<input type="button" name="bot" '||case when codigo_consucode is null then 'value="Grabar" onclick="registrar_entidad();"' else 'value="Grabar" onclick="registrar_entidad();"' end||' ></td>
             </tr>
             </table></br></br>'); 
         
 usp_print('<table border="0" class=tableform cellpadding="3" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%">
             <tr><td  colspan="2" align="left"><h3>Datos Generales de la Entidad</h3></td></tr>
             <tr>
             </table>');
             
 usp_print('<table border="0" class=tableform cellpadding="3" cellspacing="0" align="center" style="border-collapse: collapse" bordercolor="#111111" width="90%">

 <tr '||case when codigo_consucode is null then 'style="display:none;"' else '' end||' >
             <td class=c1>A¿o: </td>  
             <td class=c2><select name="v_anho" onchange="getUpdate()">');
     if codigo_consucode is null then             
             usp_print('<option value="'||session__anhoentidad||'">'||session__anhoentidad||'</option>');
     else
           for xrow in cAnho loop 
             usp_print('<option value="'||xrow.anhoentidad||'" '||case when xrow.anhoentidad = anio then 'selected' else '' end||'>'||xrow.anhoentidad||'</option>');
           end loop;     
     end if;            
             usp_print('</select>
             </td>
             <td class=c2>A&ntilde;o de la Entidad</td>
 </tr>');
 
if departament_desc is not null then

i_dep_desc := departament_desc;

end if;

if provincia_desc is not null then

i_pro_desc := provincia_desc;

end if;

if distrito_desc is not null then

i_dis_desc := distrito_desc;

end if;
 


if codigo_consucode is null then
            usp_print('
         
         <input type="hidden" name="v_cod_max" id="v_cod_max" readOnly value="'||cod_max||'" />
       <tr>
              <td class=c1>C&oacute;digo: </td>
              <td class=c2><input name="v_num_cod" id="v_num_cod" type=text disabled size="25"></td>
              <td class=c2>C&oacute;digo autogenerado de la Entidad</td>
          </tr>');
else
  usp_print('<input type="hidden" name="anio" value="'||anio||'" />');
  usp_print('
           <td class=c1>C&oacute;digo:</td>  
           <td class=c2><input type="text" name="codigo_consucode" readOnly value="'||codigo_consucode||'" /></td>
           <td class=c2>C&oacute;digo de la Entidad</td>');
           
  end if;         
           usp_print('
        
          </tr>
 
          <tr>
              <td class=c1>Estado Actual: </td>
              <td class=c2><select name="v_cod_estado" disabled>');
              if estado_entidad = 1 then
                 usp_print('
             <option value="1">ACTIVO</option>
                 '); 
               else
              usp_print('<option>--Seleccionar--</option>
              <option value="1" '||case when activo = 1 then 'selected readonly' else '' end||'>ACTIVO</option>
              <option value="0" '||case when activo = 0 then 'selected readonly' else '' end||'>INACTIVO</option>');      
              end if;
              
               usp_print('</select></td>
              <td class=c2>Estado Actual de la Entidad</td>
          </tr>

          <tr>
              <td class=c1>(*) Nro. de RUC: </td>
              <td class=c2><input name="v_num_ruc" id="v_num_ruc" type=text size="50" value="'||ruc||'" maxlength="11" onkeypress="f_validaCampoNumerico1()"></td>
              <td class=c2>Ingrese el n&uacute;mero el RUC de la Entidad</td>
          </tr>
          
          <tr>
              <td class=c1>(*) Raz&oacute;n Social: </td>
              <td class=c2><input name="v_razon_social" maxlength="100" id="v_razon_social" size="50" value="'||descripcion||'"></td>
               <td class=c2>Ingrese el nombre de la Entidad</td>
          </tr>
          
          <tr>
              <td class=c1> Sigla: </td>
              <td class=c2><input name="v_sigla" id="v_sigla" maxlength="30" size="50" value="'||abreviatura||'"></td>
              <td class=c2>Ingrese Sigla de la Entidad</td>
          </tr>

          <tr>
              <td class=c1>(*) Ubigeo: </td>
              <td class=c2><input name="lugar_ejec_vb" size="45" class=ViewSelect onclick="BuscaUbigeo(2)" readonly '||case when codigo_consucode is not null then ' value="'||i_dep_desc||'/'||i_pro_desc||'/'||i_dis_desc||'" ' else 'value="'||lugar_ejec_vb||'"' end||'  />&nbsp;&nbsp;
            &nbsp;&nbsp;
             
              <td class=c2>Seleccione Departamento / Provincia / Distrito</td>
          </tr>
          
          <tr>
              <td class=c1>(*) Direcci&oacute;n: </td>
              <td class=c2><input name="v_direccion" size="50" maxlength="200" value="'||direccion||'"></td>
              <td class=c2>Ingrese la direcci&oacute;n de la Entidad</td>
          </tr>
          
          <tr>
              <td class=c1> Tel&eacute;fono: </td>
              <td class=c2><input name="v_telefono" id="txtPreUni" maxlength="11" size="25" value="'||telefono||'" ></td>
              <td class=c2>Ingrese el n&uacute;mero Telef&oacute;nico de la Entidad</td>
          </tr>
          
          <tr>
              <td class=c1>Anexo de Tel&eacute;fono: </td>
              <td class=c2><input name="v_anex_telf" id="v_anex_telf" maxlength="5" size="25" value="'||telefono_anx||'"  /></td>
              <td class=c2>Ingrese n&uacute;mero de Anexo Telef&oacute;nico de la Entidad</td>
          </tr>
          
          <tr>
              <td class=c1>Fax: </td>
              <td class=c2><input name="v_fax" id="v_fax" maxlength="11" size="25" value="'||fax||'" /></td>
              <td class=c2>Ingrese el n&uacute;mero del fax de la Entidad</td>
          </tr>
          
          <tr>
              <td class=c1>Otro Tel&eacute;fono: </td>
              <td class=c2><input name="v_anex_fax" id="v_anex_fax" maxlength="11" size="25" value="'||fax_anx||'"  /></td>
              <td class=c2>Ingrese el n&uacute;mero del otro Tel&eacute;fono de la Entidad</td>
          </tr>
 
          <tr>
              <td class=c1>P&aacute;gina Web: </td>
              <td class=c2><input name="v_pag_web" id="v_pag_web" maxlength="60" size="50" value="'||web||'"></td>
              <td class=c2>Ingrese la p&aacute;gina Web de la Entidad</td>
          </tr>
           
          <tr>
              <td class=c1>(*) Nombre y Apellidos del Solicitante: </td>
              <td class=c2><input name="v_nom_sol" id="v_nom_sol" maxlength="60" size="50" value="'||nombre_soli||'"></td>
              <td class=c2>Ingrese el nombre Completo del Solicitante</td>
          </tr>
          <tr>
              <td class=c1>(*) Cargo del Solicitante:</td>
              <td class=c2><input name="v_cargo_sol" id="v_cargo_sol" maxlength="60" size="50" value="'||cargo_soli||'"></td>
              <td class=c2>Ingrese el Cargo del Solicitante</td>
          </tr>
          
          <tr>
              <td class=c1>(*) Primer Correo Electr&oacute;nico del Solicitante: </td>
              <td class=c2><input name="v_correo" id="v_correo" maxlength="60" size="50" value="'||email||'" /></td>
              <td class=c2>Ingrese el correo Electr&oacute;nico del Solicitante</td>
          </tr>
          
          <tr>
              <td class=c1> Segundo Correo Electr&oacute;nico del Solicitante: </td>
              <td class=c2><input name="v_correo2" id="v_correo2" maxlength="60" size="50" value="'||email2||'" /></td>
              <td class=c2>Ingrese el correo Electr&oacute;nico del Solicitante</td>
          </tr>
          
          <tr>
              <td class=c1>(*) Dispositivo Legal que autoriza la creaci&oacute;n de la Entidad: </td>
              <td class=c2><input name="v_dispositivo" id="v_dispositivo" maxlength="200" size="50" value="'||dispositivo||'" '||case when codigo_consucode is not null then 'readOnly' else '' end||' /></td>
              <td class=c2>Ingrese el dispositivo legal</td>
          </tr>');
          
         if codigo_consucode is not null then
          usp_print('<tr>
              <td class=c1>(*) Documento que autoriza la modificaci&oacute;n: </td>
              <td class=c2><input name="v_doc_autoriza" id="v_doc_autoriza" size="50" maxlength="50" value="" /></td>
              <td class=c2>Ingrese el Documento que autoriza la modificaci&oacute;n</td>
          </tr>');
          end if;
          
          usp_print('</table></br></br>'); 
     
  usp_print('<input name=iv_dep_desc readonly="true" value="" type="hidden" />
             <input name=iv_pro_desc readonly="true" value="" type="hidden" />
             <input name=iv_dis_desc readonly="true" value="" type="hidden" />');
             
             
             
 /********************************************************Datos Presupuestales de la Entidad***************************************************************************/        
             
  usp_print('<table border="0" class=tableform cellpadding="3" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%">
             <tr><td  colspan="2" align="left"><h3>Datos Presupuestales de la Entidad</h3></td></tr>
             <tr>
             </table>');         
             
  usp_print('<table border="0" class=tableform cellpadding="3" cellspacing="0" align="center" style="border-collapse: collapse" bordercolor="#111111" width="90%">
        
          <tr>
           <td class=c1>C&oacute;digo SIAF: </td>
           <td class=c2><input name="v_cod_siaf" id="v_cod_siaf" type=text maxlength="6" size="25" value="'||siaf||'" onkeypress="f_validaCampoNumerico1()"></td>
           <td class=c2>Ingrese el c&oacute;digo SIAF de la Entidad</td>
          </tr>
          <tr>
              <td class=c1>(*) Sector: </td>
              <td class=c2><div id="div_sector"><select name="v_sector" value="" onchange="mostrar_array(this,thisform.v_pliego)" style="width:540px;">
              <option value="F">--Seleccionar--</option>
          ');
          
          
          for xrow in cSector loop
           usp_print('<option  value="A'||xrow.sec_codigo||'" '||case when sect = xrow.sec_codigo then 'selected' else '' end||'>'|| xrow.com||xrow.sec_codigo||' - '||xrow.sec_desc||'</option>');
          end loop;
            
         usp_print('
             
              </select>
              <!--<input type="button" value="..." onclick ="SectPlieModal(1);"/></div></td>-->
              <td class=c2>Seleccione el Sector de la Entidad</td>
          </tr>');
         
          usp_print('<tr>
          
          <td class=c1>Pliego:</td>
          <td class=c2><select style="width:540px;" name="v_pliego" value="">
          
                     <option value = "">--Seleccionar--</option>');
            for xrow in cPliego1(sect) loop
           usp_print('<option  value='||xrow.pli_codigo||' '||case when xrow.pli_codigo = plieg then 'selected' else '' end||'>'||xrow.pli_codigo||'- '||xrow.desc_pliego||'</option>');
          end loop;         
    
          usp_print('</select>
              <!--<input type="button" value="..." onclick="SectPlieModal(2);"/></td>-->
              <td class=c2>Seleccione el Pliego de la Entidad</td>
          </tr>
          <tr>
              <td class=c1>Unidad Ejecutora: </td>
              <td class=c2><input name="v_uni_ejecu" id="v_uni_ejecu" size="25" maxlength="4" value="'||uject||'" onkeypress="f_validaCampoNumerico1()"></td>
              <td class=c2>Ingrese la Unidad Ejecutora de la Entidad</td>
          </tr>
          
          <tr>
              <td class=c1>Documento que autoriza la modificaci&oacute;n: </td>
              <td class=c2><input name="v_documento_presup" id="v_documento_presup" maxlength="60" size="50" maxlength="100" value="'||document_pres||'"></td>
              <td class=c2>Ingrese el detalle del documento</td>
          </tr>
          
        
             </table></br></br>');  
             
             usp_print('<input type="hidden" name="v_cod_dep" value="'||codi_depa||'" />');
             usp_print('<input type="hidden" name="v_cod_pro" value="'||codi_provi||'" />');
             usp_print('<input type="hidden" name="v_cod_dis" value="'||codi_distri||'" />');
             usp_print('<input type="hidden" name="v_cod_actual" value="'||cod_actual||'" />');
             usp_print('<input type="hidden" name="cod_entidad" value="" />');
             usp_print('<input type="hidden" name="ent_activo" value="" />');
             usp_print('<input type="hidden" name="v_opener" id="v_opener" value="1" />');
             
  /*******************************CLASIFICACION DE LA ENTIDAD**************************/
  
  usp_print('<table border="0" class=tableform cellpadding="3" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%">
             <tr><td  colspan="2" align="left"><h3>Clasificaci&oacute;n de la Entidad</h3></td></tr>
             <tr>
             </table>');         
             
  usp_print('<table border="0" class=tableform cellpadding="3" cellspacing="0" align="center" style="border-collapse: collapse" bordercolor="#111111" width="90%">
      
         
          <tr>
              <td class=c1>Tipo de Entidad:</td>
              <td class=c2><select name="v_actividad" onchange="mostrar_array(this,thisform.v_instancia)" style="width:540px;">
              <option value="F">--Seleccionar--</option>');
           for xrow in cActividad loop
             usp_print('<option value='||xrow.act_ccodigo||' '||case when activ = xrow.act_ccodigo then 'selected' else '' end||'   >'|| xrow.com || xrow.act_ccodigo ||' - '||xrow.act_vdesc||'</option>');
           
           end loop;   
           usp_print('   
              </select></td>
           <td class=c2>Seleccione el tipo de entidad</td>
          </tr>
         
          <tr>
              <td class=c1>Sub Tipo de Entidad: </td>
              <td class=c2>');
              
              USP_PRINT('<select name="v_instancia" style="width:540px;" value="">
              <option value="">--Seleccionar--</option>');
               for xrow in cInstancia1(activ) loop
               usp_print('<option '||case when xrow.ins_ccodigo = instanc then 'selected' else '' end||' value='||xrow.ins_ccodigo||' >'||xrow.ins_ccodigo||'-'||xrow.ins_vdesc||'</option>');
           
               end loop;
               USP_PRINT('</select></td>
         <td class=c2>Seleccione el subtipo de entidad</td>
          </tr>
          
          <tr>
              <td class=c1>Observaci&oacute;n: </td>
              <td class=c2><input name="v_observaciones_clasif" id="v_observaciones_clasif" size="50" maxlength="500" value="'||observaciones_clasi||'"></td>
              <td class=c2>Ingrese las Observaciones</td>
          </tr>
          
             </table></br></br>');  
/*******************************Datos del titular**************************/                     
             
 usp_print('<table border="0" class=tableform cellpadding="3" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%">
             <tr><td  colspan="2" align="left"><h3>Datos del Titular de la Entidad</h3></td></tr>
             <tr>
             </table>');
             
 usp_print('<table border="0" class=tableform cellpadding="3" cellspacing="0" align="center" style="border-collapse: collapse" bordercolor="#111111" width="90%">
          
          <tr>
           <td class=c1>Nombres y Apellidos: </td>
           <td class=c2><input name="v_nombre_titular" id="v_nombre_titular" maxlength="60" type=text size="50" value="'||nomb_titular||'" /></td>
           <td class=c2>Ingrese el Nombre completo del Titular</td>
          </tr>
          
          <tr>
           <td class=c1>Tel&eacute;fono: </td>
           <td class=c2><input name="v_tele_titular" id="v_tele_titular" maxlength="11" value="'||telef_titular||'" size="25"></td>
           <td class=c2>Ingrese el tel&eacute;fono del Titular</td>
          </tr>
          
          <tr>
           <td class=c1>Anexo Telef&oacute;nico: </td>
           <td class=c2><input name="v_anex_titular" id="v_anex_titular" maxlength="5" value="'||telef_anx_titular||'" size="25" value="" /></td>
           <td class=c2>N&uacute;mero del Anexo Telef&oacute;nico del Titular</td>
          </tr>
          
          <tr>
           <td class=c1>Celular Institucional: </td>
           <td class=c2><input name="v_cel_titular" id="v_cel_titular" maxlength="11" size="25" value="'||celular_titular||'" ></td>
           <td class=c2>Ingrese el N&uacute;mero del Celular del Titular</td>
          </tr>
          
          
          <tr>
              <td class=c1>Correo Electr&oacute;nico: </td>
              <td class=c2><input name="v_correo_titular" id="v_correo_titular" maxlength="60" size="50" value="'||email_titular||'" /></td>
              <td class=c2>Ingrese el Correo Electr&oacute;nico del Titular</td>
          </tr>');
          
          
          usp_print('<tr>
              <td class=c1>Documento que autoriza la designaci&oacute;n: </td>
              <td class=c2><input type="file"  name="pfiletoupload1"  value="">&nbsp;&nbsp;');
              
              for xrow in  cEntidades_doc1 loop
              usp_print('<a target=_blank href="'||session__FileSingedHTTP||''||xrow.doc_url||'"><img src="'||xrow.icon_tipo_file||'" border="0" width="30" height="30"/>
              '||to_char(xrow.fec_upload,'dd/mm/yyyy hh24:mi')||'</a>');
              end loop;
              usp_print('</td>
              <td class=c2>Tipos de archivo permitidos: *.doc, *.pdf, *.zip</td>
          </tr>
          
             </table></br></br>');  
             
/*******************************DATOS DEL JEFE DEL ORGANO ENCARGADO DE LAS CONTRATASIONES*************************************************************************************/                               
 
usp_print('<table border="0" class=tableform cellpadding="3" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%">
             <tr><td  colspan="2" align="left"><h3>Datos del Jefe del &Oacute;rgano Encargado de las Contrataciones</h3></td></tr>
             <tr>
             </table>');
             
 usp_print('<table border="0" class=tableform cellpadding="3" cellspacing="0" align="center" style="border-collapse: collapse" bordercolor="#111111" width="90%">
         
          <tr>
           <td class=c1>Nombres y Apellidos: </td>
           <td class=c2><input name="v_nombre_logistica" id="v_nombre_logistica" maxlength="60" value="'||nom_logistica||'" type=text size="50" value="" /></td>
           <td class=c2>Ingrese el nombre completo del Jefe del &Oacute;rgano Encargado de las Contrataciones</td>
          </tr>
          
          <tr>
           <td class=c1>Tel&eacute;fono: </td>
           <td class=c2><input name="v_tele_logistica" id="v_tele_logistica" maxlength="11" size="25" value="'||telef_logistica||'" ></td>
           <td class=c2>Ingrese el tel&eacute;fono del Jefe del &Oacute;rgano Encargado de las Contrataciones</td>
          </tr>
          
          
          <tr>
           <td class=c1>Anexo Telef&oacute;nico: </td>
           <td class=c2><input name="v_anex_logistica" id="v_anex_logistica" maxlength="5" size="25" value="'||telef_anx_logistica||'" /></td>
           <td class=c2>Ingrese el anexo del Jefe del &Oacute;rgano Encargado de las Contrataciones</td>
          </tr>
          
          <tr>
           <td class=c1>Celular Institucional: </td>
           <td class=c2><input name="v_cel_logistica" id="v_cel_logistica" maxlength="11" size="25" value="'||celular_logistica||'" ></td>
           <td class=c2>Ingrese el celular del Jefe del &Oacute;rgano Encargado de las Contrataciones</td>
          </tr>
          
          <tr>
           <td class=c1>Correo Electr&oacute;nico: </td>
           <td class=c2><input name="v_correo_logistica" id="v_correo_logistica" maxlength="60" size="50" value="'||email_logistica||'" /></td>
           <td class=c2>Ingrese el correo Electr&oacute;nico del Jefe del &Oacute;rgano Encargado de las Contrataciones</td>
          </tr>');
          
         usp_print('<tr>
              <td class=c1>Documento que autoriza la designaci&oacute;n: </td>
              <td class=c2><input type="file"  name="pfiletoupload2"  value="">&nbsp;&nbsp;');
              
              for xrow in  cEntidades_doc2 loop
              usp_print('<a target=_blank href="'||session__FileSingedHTTP||''||xrow.doc_url||'"><img src="'||xrow.icon_tipo_file||'" border="0" width="30" height="30"/>
              '||to_char(xrow.fec_upload,'dd/mm/yyyy hh24:mi')||'</a>');
              end loop;
              usp_print('</td>
              <td class=c2>Tipos de archivo permitidos: *.doc, *.pdf, *.zip</td>
          </tr>
          
             </table></br></br>');  

/*******************************DATOS DEL JEFE DE Informatica*************************************************************************************/                               

usp_print('<table border="0" class=tableform cellpadding="3" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%">
             <tr><td  colspan="2" align="left"><h3>Datos del Jefe de Inform&aacute;tica</h3></td></tr>
             <tr>
             </table>');
             
 usp_print('<table border="0" class=tableform cellpadding="3" cellspacing="0" align="center" style="border-collapse: collapse" bordercolor="#111111" width="90%">
       
          <tr>
           <td class=c1>Nombre y Apellidos: </td>
           <td class=c2><input name="v_nombre_informatica" id="v_nombre_informatica" maxlength="60" type=text size="50" value="'||nombre_infor||'" ></td>
           <td class=c2>Ingrese el nombre completo del Jefe de Inform&aacute;tica</td>
          </tr>
          
          <tr>
           <td class=c1>Tel&eacute;fono: </td>
           <td class=c2><input name="v_tele_informatica" id="v_tele_informatica" maxlength="11" size="25" value="'||telef_infor||'" ></td>
           <td class=c2>Ingrese el tel&eacute;fono del Jefe de Inform&aacute;tica</td>
          </tr>
          
          
          <tr>
           <td class=c1>Anexo Telef&oacute;nico: </td>
           <td class=c2><input name="v_anex_informatica" id="v_anex_informatica" maxlength="5" size="25" value="'||telef_anx_infor||'" /></td>
           <td class=c2>Ingrese el anexo del Jefe de Inform&aacute;tica</td>
          </tr>
          
          
          
          <tr>
           <td class=c1>Celular Institucional: </td>
           <td class=c2><input name="v_cel_informatica" id="v_cel_informatica" maxlength="11" size="25" value="'||celular_infor||'" /></td>
           <td class=c2>Ingrese el celular del Jefe de Inform&aacute;tica</td>
          </tr>
          
          
          <tr>
           <td class=c1>Correo Electr&oacute;nico: </td>
           <td class=c2><input name="v_correo_informatica" id="v_correo_informatica" maxlength="60" size="50" value="'||email_infor||'" /></td>
           <td class=c2>Ingrese el correo Electr&oacute;nico del Jefe de Inform&aacute;tica</td>
          </tr>');
          
    
         usp_print('<tr>
              <td class=c1>Documento que autoriza la designaci&oacute;n: </td>
              <td class=c2><input type="file"  name="pfiletoupload3"  value="">&nbsp;&nbsp;');
              
              for xrow in  cEntidades_doc3 loop
              usp_print('<a target=_blank href="'||session__FileSingedHTTP||''||xrow.doc_url||'"><img src="'||xrow.icon_tipo_file||'" border="0" width="30" height="30"/>
              '||to_char(xrow.fec_upload,'dd/mm/yyyy hh24:mi')||'</a>');
              end loop;
              usp_print('</td>
              <td class=c2>Tipos de archivo permitidos: *.doc, *.pdf, *.zip</td>
          </tr>
          
             </table></br></br><p>(*) Campos Requeridos</p>');
             
             usp_print('<script>
  if(thisform.v_anho.value == "'||session__anhoentidad||'"){
 thisform.bot.disabled = false;

  }
  else{
    thisform.bot.disabled = true;
        }
            
             </script>'); 
     
    if codigo_consucode is not null then
      
    usp_print('<script>
    if(thisform.v_anho.value == "'||session__anhoentidad||'"){
 thisform.bot_reenviar.disabled = false;

  }
  else{
    thisform.bot_reenviar.disabled = true;
        }
    </script>');
    
    end if;        


END;

/*******************************************************************************************************************/
/*******************************************************************************************************************/
/*******************************************************************************************************************/
/*******************************************************************************************************************/
PROCEDURE USP_REC_A001_NEW_CLASIFICADOR (valor                 varchar2,
                                         v_session             varchar2)
  IS
   cursor cSector is
select distinct se.sec_codigo, se.sec_desc from sease.sector se order by se.sec_desc;  
  
  BEGIN
       usp_print('<div id = "contenedor_modal">');
 usp_print('<style>
 .desab{
 display :none;
 }
 
 </style>');   
 usp_print('<script>

 
 function enviarRadioB(){
          for(i=0; i <thisform.opcion.length; i++){
          if(document.thisform.opcion[i].checked){
          var valor = thisform.opcion[i].value; 
          var time = getTime();
          div_clas.innerHTML = getPortletAjax("portlet5openAjax.asp?_portletid_=mod_rec_a001_manten_entidad&scriptdo=doAjaxClas&v_tipo="+valor+"&v_time="+time);
         }
        }
       }
  
 function NoCaracteresEspeciales(){
    //No permite el ingreso de los caracteres @ alt 64, % alt 37, & alt 38

    var x = window.event.keyCode;  
        
      switch (x){
      //@%&!"#$()<=>?¿!/\+¿¿¿¿¿
      case 173: case 64: case 37: case 38: case 33: case 34: case 35:  case 36:  case 40: case 41: 
      case 60:  case 61: case 62: case 63: case 168: case 47: case 92: case 43: 
      case 128: case 135: case 167: case 166: case 186: case 170: case 161: case 191: case 183:
      case 96: case 94: case 231: case 58: case 59: case 199: case 95: case 42: case 123: case 125:
      case 91: case 93: case 180:

          window.event.keyCode = 0;
          break;  
        default:
          return;
      }

    }
             
   function act_contador() {
            document.all("conta_mensaje").value = document.all("txtObservacion").value.length;
         }  
         
   function ValidarString(ls_obj, ls_mensage){
            var strCadena = ls_obj.value;
            var valido= "ABCDEFGHIJKLMNOPQRSTUVWYXZ0123456789abcdefghijklmnopqrstuvwxyz#()=*+}{[]-:,.!&/ ";
            
            for (i = 0 ; i <= strCadena.length - 1; i++)
            {
                if(!vacio(trim(strCadena.substring(i,i+1))))
                {
                    if (valido.indexOf (strCadena.substring(i,i+1),0) == -1)
                    {
                        ls_obj.select();
                        alert("Hay un caracter no permitido en el campo " + ls_mensage + "\nel caracter no permitido es ( "+strCadena.substring(i,i+1)+" )");
                    ls_obj.focus();
                        return false;
                    }
                }
            }  
            return true;
        }
        
  function ismaxlength(obj){ 
        var mlength=obj.getAttribute? parseInt(obj.getAttribute("maxlength")) : "";
        if (obj.getAttribute && obj.value.length>mlength)
            obj.value=obj.value.substring(0,mlength);
        }
        
        
  function insertClasificador1(){
    if(thisform.v_desc.value==""){
          alert("Debe de ingresar la descripci\xf3n del Sector")
                                  }
    else{
    if (confirm("¿Est\xe1 seguro de ingresar un nuevo Sector?")) {
    
      thisform.tipo.value = 1;
     thisform.scriptdo.value="doInsertClas";
      thisform.submit();
      var wo = window.opener
                wo.listar_pliegos(1)
      window.close();
     
     }
    }
  }                          
   
  
  function insertClasificador2(){
    if(thisform.v_desc.value==""){
          alert("Debe de ingresar la descripci\xf3n del Pliego");
          return false;
                                  }
     if(thisform.v_secto.value==""){
          alert("Debe Seleccionar un Sector");
          return false;
                                  }                             
    else{
    if (confirm("¿Est\xe1 seguro de ingresar un nuevo Pliego?")) {
      thisform.tipo.value = 2;
      thisform.scriptdo.value="doInsertClas"
      thisform.submit();
      var wo = window.opener
      wo.listar_pliegos(1)
      window.close();
      
     }
    }
  }                  
   </script>');

    usp_print('<input type="hidden" value="" name="tipo"/>');
    usp_print('<table border="0" class=tableform cellpadding="3" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%">
             <tr><td colspan="2" align="center" width=100%><h3>Nuevo Clasificador Institucional</h3></td></tr>
             </table>');
         
     if valor = 1 then
       
  usp_print('<table border="0" class=tableform cellpadding="3" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%">
             <tr><td colspan="2" align="left" width=100%><h3>Nuevo Sector</h3></td></tr>
             <tr>
             <td class=c1>Descripci&oacute;n:</td>
             <td class=c2><input type="text" maxlength="100" name="v_desc"/></td>
             </tr>
            
             
             <tr>
    <td class=c1 align="left">Justificaci&oacute;n:</td>
    <td align="left" class=c2> 

     <textarea name = "txtObservacion" style="width:330px" rows=3 cols=48 maxlength="500" onkeyup="act_contador(); return ismaxlength(this)" ></textarea>
            <br><input type="text" name="conta_mensaje" maxlength="4" readonly style="width:10%">&nbsp;(M&aacute;x 500 caracteres).
             </td>
             </tr>
             <tr>
             <td class=c2 colspan="2" align="center"><input type="button" value="Grabar" onclick="insertClasificador1();"/></td>
             </tr>
             
             </table>
             ');

  else   
  usp_print('<table border="0" class=tableform cellpadding="3" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%">
             <tr><td colspan="2" align="left" width=100%><h3>Nuevo Pliego</h3></td></tr>
             
             <tr>
             <td class=c1>Sector</td>
             <td class=c2>
             <select style="width:290px;"  name="v_secto">
             <option>--Seleccionar--</option>');
  for xrow in cSector loop
    usp_print('<option value="'||xrow.sec_codigo||'">'||xrow.sec_desc||'</option>');
  end loop;           
              
  usp_print('</select>
             </td>
             </tr>
            <tr>
             <td class=c1>Descripci&oacute;n:</td>
             <td class=c2><input type="text" maxlength="100" name="v_desc" /></td>
             </tr>
             <tr>
       <td class=c1 align="left">Justificaci&oacute;n:</td>
       <td align="left" class=c2> 

     <textarea name = "txtObservacion" style="width:330px" rows=3 cols=48 maxlength="500" onkeyup="act_contador(); return ismaxlength(this)" ></textarea>
            <br><input type="text" name="conta_mensaje" maxlength="4" readonly style="width:10%">&nbsp;(M&aacute;x 500 caracteres).

    </td>
</tr>
 <tr>
             <td class=c2 colspan="2" align="center"><input type="button" value="Grabar" onclick="insertClasificador2();"/></td>
             </tr>
             </table>
             ');                 
    end if;
    
       usp_print('
        <script language="javascript">
         
            window.moveTo((screen.width-750)/2,(screen.height-400)/2);
        </script>');
        
     usp_print('</div>');
     usp_print('
     <script type="text/javascript">
     if (window.opener == null){

   document.getElementById("contenedor_modal").innerHTML="<h2>Acceso Denegado</h2>";
 
   }
     </script>
     ');
  END;

/*******************************************************************************************************************************/
/*******************************************************************************************************************************/
/*******************************************************************************************************************************/
/*******************************************************************************************************************************/

PROCEDURE USP_REC_A001_INSERT_CLAS (v_actividad     varchar2,
                                    session__USERID varchar2,
                                    v_desc          varchar2,
                                    txtObservacion   varchar2,
                                    tipo            varchar2,
                                    v_secto         varchar2)
  IS
 cod_sector char(2);  
 cod_pliego char(3);
  BEGIN
    
  
    
  usp_print('<input type="text" value="'||v_actividad||'" />');
  usp_print('<input type="text" value="'||v_desc||'" />');
  usp_print('<input type="text" value="'||txtObservacion||'" />');
  usp_print('<input type="text" value="'||tipo||'" />');
  usp_print('<input type="text" value="'||v_secto||'" />');
    
select max(se.sec_codigo)+1 into cod_sector from sease.sector se
where se.sec_codigo not in(99,89);

select max(sp.pli_codigo)+1 into cod_pliego from sease.pliego sp;

if tipo = 1 then 

  insert into sease.sector(
    sec_codigo,
    sec_desc,
    sec_obs,
    sec_activo,
    usu_ult_modi,
    fec_ult_modi     
    )
    values(
    cod_sector,
    UPPER(v_desc),
    UPPER(txtObservacion),
    tipo,
    session__USERID,
    sysdate
    );
    
else
     
   insert into sease.pliego (
   sec_codigo,
   pli_codigo, 
   pli_obs,
   usu_ult_modi,
   fec_ult_modi,     
   desc_pliego
   )values(
   v_secto,
   cod_pliego,
   UPPER(txtObservacion),
   session__USERID,
   sysdate,
   UPPER(v_desc)
   );

end if;

usp_print('<script language="javascript">
  thisform.scriptdo.value="doForm";
  thisform.submit(); 
  window.close();
</script>');  
  END; 
/***********************************************************************************************************************************************/
/***********************************************************************************************************************************************/
/***********************************************************************************************************************************************/
/***********************************************************************************************************************************************/
/***********************************************************************************************************************************************/
PROCEDURE USP_REC_A001_INSERT_NEW_ENT(
        v_cod_max                      varchar2,
        v_cod_estado                   varchar2,
        v_num_ruc                      varchar2,
        v_razon_social                 varchar2,
        v_sigla                        varchar2,
        v_ubigeo                       varchar2,
        v_direccion                    varchar2,
        v_telefono                     varchar2,
        v_anex_telf                    varchar2,
        v_fax                          varchar2,
        v_anex_fax                     varchar2,
        v_pag_web                      varchar2,
        v_correo                       varchar2,
        v_correo2                      varchar2,
        v_dep_codigo_vb                varchar2,
        v_pro_codigo_vb                varchar2,
        v_dis_codigo_vb                varchar2,
        v_cod_dep                      varchar2,
        v_cod_pro                      varchar2,
        v_cod_dis                      varchar2,
        v_nom_sol                      varchar2,
        v_cargo_sol                    varchar2,
        session__anhoentidad           number,
        v_cod_siaf                     varchar2,
        v_sector                       varchar2,
        v_pliego                       varchar2,
        v_uni_ejecu                    varchar2,
        v_actividad                    varchar2,
        v_instancia                    varchar2,
        v_nombre_titular               varchar2,
        v_tele_titular                 varchar2,
        v_anex_titular                 varchar2,
        v_cel_titular                  varchar2,
        v_correo_titular               varchar2,
        v_nombre_logistica             varchar2,
        v_tele_logistica               varchar2,
        v_anex_logistica               varchar2,
        v_cel_logistica                varchar2,
        v_correo_logistica             varchar2,
        v_nombre_informatica           varchar2,
        v_tele_informatica             varchar2,
        v_anex_informatica             varchar2,
        v_cel_informatica              varchar2,
        v_correo_informatica           varchar2,
        session__USERID                varchar2,
        v_cod_actual                   varchar2,
        WriteFileDirectoryDynamic      varchar2,
        pfiletoupload1                 varchar2,
        pfiletoupload1__size           varchar2,
        pfiletoupload2                 varchar2,
        pfiletoupload2__size           varchar2,
        pfiletoupload3                 varchar2,
        pfiletoupload3__size           varchar2,
        iisenv__remote_host            varchar2,
        v_dispositivo                  varchar2,
        v_doc_autoriza                 varchar2,
        v_documento_presup             varchar2,
        v_observaciones_clasif         varchar2,
        SESSION__FULLNAME              varchar2,
        cod_entidad                    varchar2,
        estado_modifica                varchar2,
        txtObservacion                 varchar2,
        ent_activo                     varchar2,
        v_ident_entidad                number,  
        lugar_ejec_vb                  varchar2)
  
    IS
    /*
    ||    Author: Mart¿n Zanelli
    ||    Overview: Procedimiento que inserta una nueva entidad o actualiza una existente
    ||    Modificaciones:
    ||      DD/MM/YYYY - (No Identificado) - Creaci¿n del procedimiento 
    ||      16/03/2012 - Mart¿n Zanelli - Modificaci¿n del procedimiento
    ||                   Se ordena el procedimiento y se agrega el procedimiento USP_REC_A001_CONFIG_PARAM
    ||                   donde se configuran los par¿metros necesarios para que la entidad pueda convocar procesos.
    ||                   Memorando 97-2012/SDP-ECC - punto 1
    ||      28/03/2012 - Mart¿n Zanelli - Modificaci¿n del procedimiento
    ||                   Se agrega el campo TIPO_USUARIO a la tabla sease.entidad_historial con la finalidad
    ||                   de conocer qu¿ tipo de usuario est¿ modificando la informaci¿n de la entidad
    ||                   (un usuario administrador del REC o un usuario de entidad). - Memorando 97-2012/SDP-ECC - punto 4.3.3
    */ 
        lv_ruta_file                 varchar2(1250); 
        lv_codtipofile               varchar2(20);   
        as_usumail                   varchar2(100) := '';
        as_usumail2                  varchar2(100) := '';
        as_usumail_titular           varchar2(100) := '';
        as_usumail_logistica         varchar2(100) := '';
        msg                          varchar2(8000):= '';
        lv_asunto                    varchar2(1000):= '';
        ls_msg                       varchar2(32000):= '';  
        cod_new                      varchar2(6);
        cod_unico                    varchar2(20);
        indicador                    number;
        i_depart                     varchar2(20);  
        i_provin                     varchar2(20);
        i_distri                     varchar2(20);
        v_observ                     varchar2(500);
        contador_veces               number;
        i_dep_desc                   varchar2(100);
        i_pro_desc                   varchar2(100);
        i_dis_desc                   varchar2(100); 
        estado_entidad               number;
        a_cod_actual                 char(6);
        a_anho                       varchar2(4);
        a_ruc                        varchar2(20);
        a_depart                     char(2);
        a_provin                     char(4);
        a_distri                     char(6);
        a_descripcion                varchar2(100);
        a_abreviatura                varchar2(30);
        a_direccion                  varchar2(200);
        a_telefono                   varchar2(11);
        a_fax                        varchar2(11);
        a_telefono_anx               varchar2(5);
        a_fax_anx                    varchar2(12);
        a_web                        varchar2(60);
        a_email                      varchar2(60);
        a_nombre_soli                varchar2(60);
        a_cargo_soli                 varchar2(60);
        a_siaf                       char(6);
        a_sect                       char(2);
        a_plieg                      char(4);
        a_uject                      char(4);
        a_activ                      char(1);
        a_instanc                    char(1); 
        a_activo                     number;
        a_nomb_titular               varchar2(60);
        a_telef_titular              varchar2(12);
        a_celular_titular            varchar2(11);
        a_email_titular              varchar2(60);
        a_telef_anx_titular          varchar2(5);
        a_nom_logistica              varchar2(60);
        a_telef_logistica            varchar2(12);
        a_celular_logistica          varchar2(11);
        a_email_logistica            varchar2(60);  
        a_telef_anx_logistica        varchar2(5);
        a_nombre_infor               varchar2(60);
        a_telef_infor                varchar2(12);
        a_celular_infor              varchar2(11);  
        a_email_infor                varchar2(60);
        a_telef_anx_infor            varchar2(5);
        a_cod_consu_actual           char(6);
        a_departam                   varchar2(60);
        a_provinc                    varchar2(60);
        a_distrit                    varchar2(60);
        a_codi_depa                  char(2);
        a_codi_provi                 char(4);
        a_codi_distri                char(6);
        a_departament_desc           varchar2(60); 
        a_provincia_desc             varchar2(60);
        a_distrito_desc              varchar2(60);
        a_anhos                      varchar2(4);
        a_dispositivo                varchar2(200);
        a_document_modificacion      varchar2(150);
        a_lv_ruta_file               varchar2(250);
        a_document_pres              varchar2(100);
        a_observaciones_clasi        varchar2(500);
        a_v_ubig                     varchar2(500);
        a_i                          number;
        le_ruc                       varchar(20);
        nu                           number;   
        
        c_EsAdm                      char(1);

        --modificacion memorando 642-2013/SDP
        cursor CGENERACODCONSUCODE (CRUC varchar2) is
       -- select N_ID_ORGAN from ADM.TBL_ADM_ORG@AIXSEACE
          select N_ID_INT_ENTIDAD from ADM.TBL_ADM_INTEGRACION_ENT@AIXSEACE
          where  C_NRORUC = CRUC;

        ID_INT_ENTIDAD NUMBER := 0;
    BEGIN

        /*select max(e.codconsucode)+1 into cod_new from sease.entidades e
        where e.codconsucode not in ('999999')
        and e.anhoentidad = session__anhoentidad; */
     
        --modificacion memorando 642-2013/SDP
        --modificacion del pk de la tabla entidades del seace v2.0
      if V_NUM_RUC is not null then
        for ITEM in CGENERACODCONSUCODE(V_NUM_RUC) LOOP
          ID_INT_ENTIDAD := ITEM.N_ID_INT_ENTIDAD;
        end LOOP;

        if ID_INT_ENTIDAD = 0 then
                usp_print('
                <script>
                thisform.scriptdo.value="doForm";
                thisform.submit();
                alert("Este n\xfamero de RUC no se encuentra registrado en el SEACE v3.0");
                </script>');
                return;
        else
               cod_new := ID_INT_ENTIDAD;
        end if; 
     end if;
        /*********************carga de documentos del titular**********************************/ 
        if pfiletoupload1 is not null then 
            indicador := 1;
  
            BEGIN
                select cod_tipo_file into lv_codtipofile From Reg_procesos.tipo_archivo Where ext_tipo_file=upper(substr(pfiletoupload1,length(pfiletoupload1)-2,length(pfiletoupload1)));
            EXCEPTION
                when others then
                    REG_PROCESOS.Pku_Ss_Mod_Contratos.f_msg_error('Error: Al intentar hallar el tipo de documento','''doNewContrato''');
                    return;
            END;

            if v_cod_actual is not null then
                cod_unico := v_cod_actual;
            else
                cod_unico := cod_new;
            end if;

            insert into reg_procesos.entidades_doc
            ( cod_tipo_doc, cod_tipo_file, doc_url, doc_nombre, fec_upload, 
              user_upload, ip_from_upload, tamano_bytes, codconsucode, cod_indicador )
            values
            ( 2450, lv_codtipofile, WriteFileDirectoryDynamic||pfiletoupload1,
              pfiletoupload1, sysdate, session__USERID, iisenv__remote_host, 
              pfiletoupload1__size, cod_unico, indicador );
        end if; 

        /****************************carga de documentos del encargado de las contrataciones*************************************/ 

        if pfiletoupload2 is not null then 
            indicador := 2;
  
            BEGIN
                select cod_tipo_file into lv_codtipofile From Reg_procesos.tipo_archivo Where ext_tipo_file=upper(substr(pfiletoupload2,length(pfiletoupload2)-2,length(pfiletoupload2)));
            EXCEPTION
                when others then
                    REG_PROCESOS.Pku_Ss_Mod_Contratos.f_msg_error('Error: Al intentar hallar el tipo de documento','''doNewContrato''');
                    return;
            END;

            if v_cod_actual is not null then
                cod_unico := v_cod_actual;
            else
                cod_unico := cod_new;
            end if;

            insert into reg_procesos.entidades_doc
            ( cod_tipo_doc, cod_tipo_file, doc_url, doc_nombre, fec_upload, user_upload,
              ip_from_upload, tamano_bytes, codconsucode, cod_indicador )
            values
            ( 2450, lv_codtipofile, WriteFileDirectoryDynamic||pfiletoupload2,
              pfiletoupload2, sysdate, session__USERID, iisenv__remote_host, 
              pfiletoupload2__size, cod_unico, indicador );
        end if; 


        /*************************************carga de archivos del jefe de informatica*************************************************************/
        if pfiletoupload3 is not null then 
            indicador := 3;
  
            BEGIN
                select cod_tipo_file into lv_codtipofile From Reg_procesos.tipo_archivo Where ext_tipo_file=upper(substr(pfiletoupload3,length(pfiletoupload3)-2,length(pfiletoupload3)));
            EXCEPTION
                when others then
                    REG_PROCESOS.Pku_Ss_Mod_Contratos.f_msg_error('Error: Al intentar hallar el tipo de documento','''doNewContrato''');
                    return;
            END;
    
            if v_cod_actual is not null then
                cod_unico := v_cod_actual;
            else
                cod_unico := cod_new;
            end if;
    
            insert into reg_procesos.entidades_doc
            ( cod_tipo_doc, cod_tipo_file, doc_url, doc_nombre, fec_upload, user_upload,
              ip_from_upload, tamano_bytes, codconsucode, cod_indicador )
            values
            ( 2450, lv_codtipofile, WriteFileDirectoryDynamic||pfiletoupload3,
              pfiletoupload3, sysdate, session__USERID, iisenv__remote_host,
              pfiletoupload3__size, cod_unico, indicador );
        end if; 

        /********************************************************************************************************************************************/
    
        select count(*) as contador_veces into contador_veces from sease.entidades se
        where se.anhoentidad = session__anhoentidad
        and se.n_ruc = v_num_ruc;

        if v_cod_max is not null then
            if contador_veces > 0 then
                usp_print('
                <script>
                thisform.scriptdo.value="doForm";
                thisform.submit();
                alert("Ya se encuentra registrado este n\xfamero de RUC, vuelva a ingresar la Entidad");
                </script>');
                return;
            end if; 

            insert into sease.entidades
            ( codconsucode, activo, anhoentidad, n_ruc, descripcion, abreviatura, dep_coddpto,
              pro_codprov, dis_coddist, direccion, telefono, telefono_anx, faximil, faximil_anx,
              url_web, email, email2, codsiaf, sector, pliego,  uejecutora, actividad, instancia,
              TNOMB_TITULAR, ttelef_titular, ttelef_anx_titular, tcelular_titular, temail_titular,
              tnombjefelogis, ttelefjefelogis, ttelef_anx_jefe_logis, tcelular_jefe_logis, temail_jefe_logis,
              tnombjefeinfor, ttelefjefeinfor, ttelef_anx_jefe_infor, tcelular_jefe_infor, temail_jefe_infor,    
              f_registro, fec_ult_modi, usu_ult_modi, tnomb_solicitante, tcargo_solicitante, dispositivo_legal,
              document_modif, document_presu, observaciones_clasif )
            values
            ( cod_new, 1, session__anhoentidad, v_num_ruc, upper(v_razon_social), v_sigla, v_dep_codigo_vb,
              v_dep_codigo_vb||''||v_pro_codigo_vb, v_dep_codigo_vb||''||v_pro_codigo_vb||''||v_dis_codigo_vb,
              upper(v_direccion), v_telefono, v_anex_telf, v_fax, v_anex_fax, v_pag_web, v_correo,
              v_correo2, v_cod_siaf, SUBSTR(v_sector,2,3), v_pliego, lpad(v_uni_ejecu,3,0),
              case when v_actividad = 'F' then null else v_actividad end , v_instancia,
              v_nombre_titular, v_tele_titular, v_anex_titular, v_cel_titular, v_correo_titular, v_nombre_logistica,
              v_tele_logistica, v_anex_logistica, v_cel_logistica, v_correo_logistica, v_nombre_informatica,
              v_tele_informatica, v_anex_informatica, v_cel_informatica, v_correo_informatica, sysdate,
              sysdate, session__USERID, upper(v_nom_sol), upper(v_cargo_sol), upper(v_dispositivo), upper(v_doc_autoriza),
              upper(v_documento_presup), upper(v_observaciones_clasif) );

            /*********************************insert tablas reg_procesos.entidades****************************************************************/

            insert into reg_procesos.entidades
            ( codconsucode, activo, anhoentidad, n_ruc, descripcion, abreviatura, dep_coddpto, pro_codprov, dis_coddist, direccion, 
              telefono, telefono_anx, faximil, faximil_anx, url_web, email, email2, codsiaf, sector, pliego, uejecutora, actividad,
              instancia, TNOMB_TITULAR, ttelef_titular, ttelef_anx_titular, tcelular_titular, temail_titular, tnombjefelogis, 
              ttelefjefelogis, ttelef_anx_jefe_logis, tcelular_jefe_logis, temail_jefe_logis, tnombjefeinfor, ttelefjefeinfor,
              ttelef_anx_jefe_infor, tcelular_jefe_infor, temail_jefe_infor, f_registro, fec_ult_modi, usu_ult_modi, tnomb_solicitante,
              tcargo_solicitante, dispositivo_legal, document_modif, document_presu, observaciones_clasif )
            values
            ( cod_new, 1, session__anhoentidad, v_num_ruc, upper(v_razon_social), upper(v_sigla), v_dep_codigo_vb, v_dep_codigo_vb||''||v_pro_codigo_vb,
              v_dep_codigo_vb||''||v_pro_codigo_vb||''||v_dis_codigo_vb, upper(v_direccion), v_telefono, v_anex_telf, v_fax, v_anex_fax,
              v_pag_web, v_correo, v_correo2, v_cod_siaf, SUBSTR(v_sector,2,3), v_pliego, lpad(v_uni_ejecu,3,0), 
              case when v_actividad = 'F' then null else v_actividad end , v_instancia, upper(v_nombre_titular), v_tele_titular, v_anex_titular,
              v_cel_titular, v_correo_titular, upper(v_nombre_logistica), v_tele_logistica, v_anex_logistica, v_cel_logistica,
              v_correo_logistica, upper(v_nombre_informatica), v_tele_informatica, v_anex_informatica, v_cel_informatica, v_correo_informatica,
              sysdate, sysdate, session__USERID, upper(v_nom_sol), upper(v_cargo_sol), upper(v_dispositivo), upper(v_doc_autoriza),
              upper(v_documento_presup), upper(v_observaciones_clasif) );

            USP_REC_A001_CONFIG_PARAM(cod_new, session__anhoentidad);

            sease.sp_acutaliza_entidadue_anho( cod_new , session__anhoentidad) ;

            /******************************************************************************************/   
            ls_msg := '';
            ls_msg := ls_msg||'<div align="center">';
            ls_msg := ls_msg||'<table width="600" border="0">';
            ls_msg := ls_msg||'<tr>';
            ls_msg := ls_msg||'<td height="43" colspan="3" align="center"><p><strong>';
            ls_msg := ls_msg||'<h3>';
            ls_msg := ls_msg||'<span style="color:black;">Bienvenido al Sistema Electr&oacute;nico de Contrataciones del Estado (SEACE)</span></b></strong></p></td>';
            ls_msg := ls_msg||'</tr>';
            ls_msg := ls_msg||'<tr>';
            ls_msg := ls_msg||'<td colspan="3" align="center"><h2><span style="color:black;">NOTIFICACI&Oacute;N DEL REGISTRO DE ENTIDADES CONTRATANTES-REC</span></h2></td>';
            ls_msg := ls_msg||'</tr>';
            ls_msg := ls_msg||'<tr>';
            ls_msg := ls_msg||'<td colspan="3" align="center"><B>(Art. 283&ordm; del D.S. N&ordm; 184-2008-EF)</B></td>';
            ls_msg := ls_msg||'</tr>';
            ls_msg := ls_msg||'<tr>';
            ls_msg := ls_msg||'<td colspan="3"><p>&nbsp;</p>';
            ls_msg := ls_msg||'<p align="justify">Se comunica que su Entidad ha sido registrada en el REC, para efectos del registro de la informaci&oacute;n de las contrataciones de su Entidad en el SEACE.</p>';
            ls_msg := ls_msg||'<p>&nbsp;</p></td>';
            ls_msg := ls_msg||'</tr>';
            ls_msg := ls_msg||'<tr>';
            ls_msg := ls_msg||'<td align="left"><b>Entidad:</b></td>';
            ls_msg := ls_msg||'<td align="left">'||upper(v_razon_social)||'</td>';
            ls_msg := ls_msg||'</tr>';
            ls_msg := ls_msg||'<tr>';
            ls_msg := ls_msg||'<td align="left"><b>RUC:</b></td>';
            ls_msg := ls_msg||'<td align="left">'||v_num_ruc||'</td>';
            ls_msg := ls_msg||'</tr>';
            ls_msg := ls_msg||'<tr>';
            ls_msg := ls_msg||'<td align="left"><b>Fecha y Hora del Registro:</b></td>';
            ls_msg := ls_msg||'<td align="left">'||sysdate||'</td>';
            ls_msg := ls_msg||'</tr>';
            ls_msg := ls_msg||'<tr>';
            ls_msg := ls_msg||'<td align="left"><b>Nombres y Apellidos del solicitante del registro:</b></td>';
            ls_msg := ls_msg||'<td align="left">'||upper(v_nom_sol)||'</td>';
            ls_msg := ls_msg||'</tr>';
            ls_msg := ls_msg||'<tr>';
            ls_msg := ls_msg||'<td align="left"><b>Cargo del solicitante del registro:</b></td>';
            ls_msg := ls_msg||'<td align="left">'||upper(v_cargo_sol)||'</td>';
            ls_msg := ls_msg||'</tr>';
            ls_msg := ls_msg||'<tr>';
            ls_msg := ls_msg||'<td colspan="3"><p>&nbsp;</p>';
            ls_msg := ls_msg||'<p align="justify">Para interactuar con el SEACE deber&aacute; solicitar el Certificado SEACE (usuario y contrase&ntilde;a)';
            ls_msg := ls_msg||'ingresando al <a href="http://'||reg_procesos.f_get_conexiones(7)||'/Default.asp?_CALIFICADOR_=PORTLET.1.136.0.21.85&_REGIONID_=1&_PORTLETID_=136&_PRIVILEGEID_=1&_ORDERID_=0&_PAGEID_=21&_CONTENTID_=85&_USERID_=%3C%21--USERID--%3E&_EVENTNAME_=&_OBJECTFIRE_=&_OBJECTEVENT_=&scriptdo=&infsecu=3">Formulario Oficial de Creaci&oacute;n de Usuarios.</a></p>';
            ls_msg := ls_msg||'<p align="justify">&nbsp;</p>';
            ls_msg := ls_msg||'<hr /><br />';
            ls_msg := ls_msg||'<p>Esta notificaci&oacute;n ha sido enviada autom&aacute;ticamente. Por favor, no responda a este correo.</p>';
            ls_msg := ls_msg||'</td>';
            ls_msg := ls_msg||'</tr>';
            ls_msg := ls_msg||'</table>';
            ls_msg := ls_msg||'<div>';

            as_usumail := v_correo;
            as_usumail2 := v_correo2;
            lv_asunto := 'Creaci¿n de la Entidad en el SEACE';
            reg_procesos.sp_send_mail_html(as_usumail, lv_asunto, ls_msg);
            if v_correo2 is not null then 
                reg_procesos.sp_send_mail_html(as_usumail2, lv_asunto, ls_msg);
            end if;

            --modificacion memorando 642-203/SDP
              insert into REG_PROCESOS.TBL_VALIDA_ENTIDAD_CAPACITADA
              ( N_ID_ENTIDAD, CODCONSUCODE, ANHOENTIDAD, DESCRIPCION, 
                ABREVIATURA, ACTIVO, RUC, N_ESTADO_CAPACITADA, 
                D_FECHA_CARGA, D_FECHA_MODIFICA, D_FECHA_REGISTRA )
              values
              ( null, COD_NEW, SESSION__ANHOENTIDAD, UPPER(V_RAZON_SOCIAL),
                UPPER(V_SIGLA), 1, V_NUM_RUC, 0,
                sysdate, sysdate, null
               );

        else
            if v_cod_actual is not null and v_ident_entidad = 1 then
                select distinct se.codconsucode, se.anhoentidad, se.n_ruc, se.dep_coddpto, se.pro_codprov, se.dis_coddist, se.descripcion, se.abreviatura, se.direccion, se.telefono,
                    se.faximil, se.telefono_anx, se.faximil_anx, se.url_web, se.email, se.tnomb_solicitante, se.tcargo_solicitante,se.codsiaf, se.sector,
                    se.uejecutora, se.actividad, se.instancia, se.activo, se.tnomb_titular, se.ttelef_titular, se.tcelular_titular, se.temail_titular, se.ttelef_anx_titular,
                    se.tnombjefelogis, se.ttelefjefelogis, se.tcelular_jefe_logis, se.temail_jefe_logis, se.ttelef_anx_jefe_logis, se.tnombjefeinfor, se.ttelefjefeinfor,
                    se.tcelular_jefe_infor, se.temail_jefe_infor, se.ttelef_anx_jefe_infor, se.codconsucode, se.dep_coddpto, se.pro_codprov, se.dis_coddist,
                    du.dep_desc, pu.pro_desc, sdu.dis_desc, se.pliego, se.dispositivo_legal, se.document_modif, se.document_presu, se.observaciones_clasif
                into a_cod_actual, a_anho, a_ruc, a_depart, a_provin, a_distri, a_descripcion, a_abreviatura, a_direccion, a_telefono, a_fax, a_telefono_anx, a_fax_anx, a_web, a_email, a_nombre_soli,
                    a_cargo_soli, a_siaf, a_sect, a_uject, a_activ, a_instanc, a_activo, a_nomb_titular, a_telef_titular, a_celular_titular, a_email_titular, a_telef_anx_titular,
                    a_nom_logistica, a_telef_logistica, a_celular_logistica, a_email_logistica, a_telef_anx_logistica, a_nombre_infor, a_telef_infor, a_celular_infor, a_email_infor,
                    a_telef_anx_infor, a_cod_consu_actual, a_codi_depa, a_codi_provi, a_codi_distri, a_departament_desc, a_provincia_desc, a_distrito_desc, a_plieg, a_dispositivo, a_document_modificacion,
                    a_document_pres, a_observaciones_clasi
                from sease.entidades se
                    left join sease.sector ss on ss.sec_codigo = se.sector
                    left join sease.pliego sp on sp.pli_codigo = se.pliego and sp.sec_codigo = ss.sec_codigo
                    left join sease.dep_ubigeo du on du.dep_codigo = se.dep_coddpto
                    left join sease.prov_ubigeo pu on pu.dep_codigo||''||pu.pro_codigo = se.pro_codprov
                    left join sease.dist_ubigeo sdu on sdu.dep_codigo||''||sdu.pro_codigo||''||sdu.dis_codigo = se.dis_coddist
                where se.codconsucode = v_cod_actual and se.anhoentidad =  session__anhoentidad;
            end if;
    
            if v_cod_actual is not null then
                select distinct le.n_ruc into le_ruc from sease.entidades le
                where le.codconsucode = v_cod_actual and
                le.anhoentidad = session__anhoentidad;
            end if;
          
            i_depart := v_dep_codigo_vb;
            i_provin := v_dep_codigo_vb||''||v_pro_codigo_vb;
            i_distri := v_dep_codigo_vb||''||v_pro_codigo_vb||''||v_dis_codigo_vb;
    
            if i_depart is not null then
                i_depart := v_dep_codigo_vb;
                i_provin := v_dep_codigo_vb||''||v_pro_codigo_vb;
                i_distri := v_dep_codigo_vb||''||v_pro_codigo_vb||''||v_dis_codigo_vb;
            else
                i_depart := v_cod_dep;
                i_provin := v_cod_pro;
                i_distri := v_cod_dis;
            end if;
    
            /********************************************Actualizacion de la tabla sease.entidades***********************************************/
            if contador_veces > 0 and v_num_ruc <> le_ruc then
                usp_print('<input type="hidden" name="codigo_consucode" value="'||v_cod_actual||'">');  
                usp_print('<input type="hidden" name="anio" value="'||session__anhoentidad||'">');  
                usp_print('<script>
                thisform.scriptdo.value="doForm";
                thisform.submit();
                alert("Ya se encuentra registrado este n\xfamero de RUC, vuelva a actualizar la Entidad");
                </script>');
                return;
            end if; 
  
            update sease.entidades  e set 
                n_ruc                 = v_num_ruc,
                descripcion           = upper(v_razon_social),
                abreviatura           = upper(v_sigla), 
                dep_coddpto           = i_depart,
                pro_codprov           = i_provin,
                dis_coddist           = i_distri,
                direccion             = upper(v_direccion), 
                telefono              = v_telefono,
                telefono_anx          = v_anex_telf,
                faximil               = v_fax,
                faximil_anx           = v_anex_fax,
                url_web               = v_pag_web,
                email                 = v_correo,
                email2                = v_correo2,
                codsiaf               = v_cod_siaf,
                sector                = SUBSTR(v_sector,2,3),
                pliego                = v_pliego, 
                uejecutora            = v_uni_ejecu,
                actividad             = case when v_actividad = 'F' then null else v_actividad end ,
                instancia             = v_instancia,
                TNOMB_TITULAR         = upper(v_nombre_titular),
                ttelef_titular        = v_tele_titular,
                ttelef_anx_titular    = v_anex_titular,
                tcelular_titular      = v_cel_titular,
                temail_titular        = v_correo_titular,
                tnombjefelogis        = upper(v_nombre_logistica),
                ttelefjefelogis       = v_tele_logistica,
                ttelef_anx_jefe_logis = v_anex_logistica,
                tcelular_jefe_logis   = v_cel_logistica,
                temail_jefe_logis     = v_correo_logistica,
                tnombjefeinfor        = upper(v_nombre_informatica),
                ttelefjefeinfor       = v_tele_informatica,
                ttelef_anx_jefe_infor = v_anex_informatica,
                tcelular_jefe_infor   = v_cel_informatica,
                temail_jefe_infor     = v_correo_informatica,    
                fec_ult_modi          = sysdate,
                usu_ult_modi          = session__USERID,   
                tnomb_solicitante     = upper(v_nom_sol),
                tcargo_solicitante    = upper(v_cargo_sol),
                dispositivo_legal     = upper(v_dispositivo),
                document_modif        = upper(v_doc_autoriza),
                document_presu        = upper(v_documento_presup),
                observaciones_clasif  = upper(v_observaciones_clasif)
            where e.codconsucode = v_cod_actual and e.anhoentidad = session__anhoentidad;

            /********************************************* tabla reg_procesos.entidades***********************************************/
            update reg_procesos.entidades  e set 
                n_ruc                 = v_num_ruc,
                descripcion           = upper(v_razon_social),
                abreviatura           = upper(v_sigla), 
                dep_coddpto           = i_depart,
                pro_codprov           = i_provin,
                dis_coddist           = i_distri,
                direccion             = upper(v_direccion), 
                telefono              = v_telefono,
                telefono_anx          = v_anex_telf,
                faximil               = v_fax,
                faximil_anx           = v_anex_fax,
                url_web               = v_pag_web,
                email                 = v_correo,
                email2                = v_correo2,
                codsiaf               = v_cod_siaf,
                sector                = SUBSTR(v_sector,2,3),
                pliego                = v_pliego, 
                uejecutora            = v_uni_ejecu,
                actividad             = case when v_actividad = 'F' then null else v_actividad end ,
                instancia             = v_instancia,
                TNOMB_TITULAR         = upper(v_nombre_titular),
                ttelef_titular        = v_tele_titular,
                ttelef_anx_titular    = v_anex_titular,
                tcelular_titular      = v_cel_titular,
                temail_titular        = v_correo_titular,
                tnombjefelogis        = upper(v_nombre_logistica),
                ttelefjefelogis       = v_tele_logistica,
                ttelef_anx_jefe_logis = v_anex_logistica,
                tcelular_jefe_logis   = v_cel_logistica,
                temail_jefe_logis     = v_correo_logistica,
                tnombjefeinfor        = upper(v_nombre_informatica),
                ttelefjefeinfor       = v_tele_informatica,
                ttelef_anx_jefe_infor = v_anex_informatica,
                tcelular_jefe_infor   = v_cel_informatica,
                temail_jefe_infor     = v_correo_informatica,    
                fec_ult_modi          = sysdate,
                usu_ult_modi          = session__USERID,   
                tnomb_solicitante     = upper(v_nom_sol),
                tcargo_solicitante    = upper(v_cargo_sol),
                dispositivo_legal     = upper(v_dispositivo),
                document_modif        = upper(v_doc_autoriza),
                document_presu        = upper(v_documento_presup),
                observaciones_clasif  = upper(v_observaciones_clasif) 
            where e.codconsucode = v_cod_actual and e.anhoentidad = session__anhoentidad;

            if v_cod_actual is not null then
                sease.sp_acutaliza_entidadue_anho( v_cod_actual , session__anhoentidad) ;
            end if;

            nu := 0; 
            if v_cod_actual is not null and v_ident_entidad = 1 then 
                ls_msg := '';
                ls_msg := ls_msg||'<div align="center">';
                ls_msg := ls_msg||'<table width="600" border="0">';
                ls_msg := ls_msg||'<tr>';
                ls_msg := ls_msg||'<td height="43" colspan="3" align="center"><p><strong>';
                ls_msg := ls_msg||'<h3>';
                ls_msg := ls_msg||'<span style="color:black;">Sistema Electr&oacute;nico de Contrataciones del Estado (SEACE)</span></b></strong></p></td>';
                ls_msg := ls_msg||'</tr>';
                ls_msg := ls_msg||'<tr>';
                ls_msg := ls_msg||'<td colspan="3" align="center"><h2><span style="color:black;">NOTIFICACI&Oacute;N DE ACTUALIZACI&Oacute;N DE DATOS EN LA FICHA DE LA ENTIDAD - REGISTRO DE ENTIDADES CONTRATANTES (REC)</span></h2></td>';
                ls_msg := ls_msg||'</tr>';
                ls_msg := ls_msg||'<tr>';
                ls_msg := ls_msg||'<td colspan="3"><p>&nbsp;</p>';
                ls_msg := ls_msg||'<p align="justify">Se comunica que ha sido actualizada la informaci&oacute;n de la ficha de datos de su Entidad.</p>';
                ls_msg := ls_msg||'<p>&nbsp;</p></td>';
                ls_msg := ls_msg||'</tr>';
                ls_msg := ls_msg||'<tr>';
                ls_msg := ls_msg||'<td align="left"><b>Entidad:</b></td>';
                ls_msg := ls_msg||'<td align="left">'||upper(v_razon_social)||'</td>';
                ls_msg := ls_msg||'</tr>';
                ls_msg := ls_msg||'<tr>';
                ls_msg := ls_msg||'<td align="left"><b>RUC:</b></td>';
                ls_msg := ls_msg||'<td align="left">'||v_num_ruc||'</td>';
                ls_msg := ls_msg||'</tr>';
                ls_msg := ls_msg||'<tr>';
                ls_msg := ls_msg||'<td align="left"><b>Usuario Autorizado que Modific&oacute; la Ficha de Datos:</b></td>';
                ls_msg := ls_msg||'<td align="left">'||upper(SESSION__USERID)||'</td>';
                ls_msg := ls_msg||'</tr>';
                ls_msg := ls_msg||'<tr>';
                ls_msg := ls_msg||'<td align="left"><b>Nombres y Apellidos del Usuario Autorizado:</b></td>';
                ls_msg := ls_msg||'<td align="left">'||upper(SESSION__FULLNAME)||'</td>';
                ls_msg := ls_msg||'</tr>';
                ls_msg := ls_msg||'<tr>';
                ls_msg := ls_msg||'<td align="left"><b>Fecha y Hora de Modificaci&oacute;n:</b></td>';
                ls_msg := ls_msg||'<td align="left">'||sysdate||'</td>';
                ls_msg := ls_msg||'</tr>';
                ls_msg := ls_msg||'<tr>';
                ls_msg := ls_msg||'<td colspan="3"><p>&nbsp;</p>';
                ls_msg := ls_msg||'<p align="justify"><u>RELACI&Oacute;N DE CAMPOS MODIFICADOS:</u></p>';
                ls_msg := ls_msg||'</td>';
                ls_msg := ls_msg||'</tr>';
                
                if a_codi_depa||''||a_codi_provi||''||a_codi_distri <> i_depart||''||i_provin||''||i_distri or a_codi_depa||''||a_codi_provi||''||a_codi_distri is null and i_depart||''||i_provin||''||i_distri is not null or a_codi_depa||''||a_codi_provi||''||a_codi_distri is not null and i_depart||''||i_provin||''||i_distri is null then 
                    nu := nu+1;
                    ls_msg := ls_msg||''||'<tr><td align="left"><b>'||nu||'. Ubigeo:</b></td><td align="left">'||lugar_ejec_vb||'</td></tr>'; 
                end if;
      
                if a_direccion <> v_direccion or a_direccion is null and v_direccion is not null or a_direccion is not null and v_direccion is null then
                    nu := nu+1;
                    ls_msg := ls_msg||''||'<tr><td align="left"><b>'||nu||'. Direcci¿n de la Entidad:</b></td><td align="left">'||upper(v_direccion)||'</td></tr>';
                end if;
        
                if a_telefono <> v_telefono or a_telefono is null and v_telefono is not null or a_telefono is not null and v_telefono is null then
                    nu := nu+1;
                    ls_msg := ls_msg||''||'<tr><td align="left"><b>'||nu||'. Tel&eacute;fono de la Entidad:</b></td><td align="left">'||v_telefono||'</td></tr>';
                end if;
        
                if a_telefono_anx <> v_anex_telf or a_telefono_anx is null and v_anex_telf is not null or a_telefono_anx is not null and v_anex_telf is null  then
                    nu := nu+1;
                    ls_msg := ls_msg||''||'<tr><td align="left"><b>'||nu||'. Anexo Telef&oacute;nico de la Entidad:</b></td><td align="left">'||v_anex_telf||'</td></tr>';
                end if;
         
                if a_fax <> v_fax or a_fax is null and v_fax is not null or a_fax is not null and v_fax is null then
                    nu := nu+1;
                    ls_msg := ls_msg||''||'<tr><td align="left"><b>'||nu||'. Fax de la Entidad:</b></td><td align="left">'||v_fax||'</td></tr>';
                end if;
        
                if a_fax_anx <> v_anex_fax or a_fax_anx is null and v_anex_fax is not null or a_fax_anx is not null and v_anex_fax is null then
                    nu := nu+1;
                    ls_msg := ls_msg||''||'<tr><td align="left"><b>'||nu||'. Otro Tel&eacute;fono de la Entidad:</b></td><td align="left">'||v_anex_fax||'</td></tr>';
                end if;
        
                if a_web <> v_pag_web or a_web is null and v_pag_web is not null or a_web is not null and v_pag_web is null then 
                    nu := nu+1;
                    ls_msg := ls_msg||''||'<tr><td align="left"><b>'||nu||'. P&aacute;gina Web:</b></td><td align="left">'||v_pag_web||'</td></tr>';
                end if;
        
                if a_nomb_titular <> v_nombre_titular or a_nomb_titular is null and v_nombre_titular is not null or a_nomb_titular is not null and v_nombre_titular is null then
                    nu := nu+1;
                    ls_msg := ls_msg||''||'<tr><td align="left"><b>'||nu||'. Nombres y Apellidos del Titular:</b></td><td align="left">'||v_nombre_titular||'</td></tr>';
                end if;
          
                if a_telef_titular <> v_tele_titular or a_telef_titular is null and v_tele_titular is not null or a_telef_titular is not null and v_tele_titular is null then
                    nu := nu+1;
                    ls_msg := ls_msg||''||'<tr><td align="left"><b>'||nu||'. Tel&eacute;fono del Titular:</b></td><td align="left">'||v_tele_titular||'</td></tr>';
                end if;
        
                if a_telef_anx_titular <> v_anex_titular or a_telef_anx_titular is null and v_anex_titular is not null or a_telef_anx_titular is not null and v_anex_titular is null then
                    nu := nu+1;
                    ls_msg := ls_msg||''||'<tr><td align="left"><b>'||nu||'. Anexo Telefonico del Titular:</b></td><td align="left">'||v_anex_titular||'</td></tr>';
                end if;
          
                if a_celular_titular <> v_cel_titular or a_celular_titular is null and v_cel_titular is not null or a_celular_titular is not null and v_cel_titular is null then  
                    nu := nu+1;
                    ls_msg := ls_msg||''||'<tr><td align="left"><b>'||nu||'. Celular Institucional del Titular:</b></td><td align="left">'||v_cel_titular||'</td></tr>';
                end if;
        
                if a_email_titular <> v_correo_titular or a_email_titular is null and v_correo_titular is not null or a_email_titular is not null and v_correo_titular is null then
                    nu := nu+1;
                    ls_msg := ls_msg||''||'<tr><td align="left"><b>'||nu||'. Correo Electr&oacute;nico del Titular:</b></td><td align="left">'||v_correo_titular||'</td></tr>';
                end if;
        
                if a_nom_logistica <> v_nombre_logistica or a_nom_logistica is null and v_nombre_logistica is not null or a_nom_logistica is not null and v_nombre_logistica is null then
                    nu := nu+1;
                    ls_msg :=  ls_msg||''||'<tr><td align="left"><b>'||nu||'. Nombres y Apellidos del Jefe del &Oacute;rgano Encargado de las Contrataciones:</b></td><td align="left">'||v_nombre_logistica||'</td></tr>';
                end if;
        
                if a_telef_logistica <> v_tele_logistica or a_telef_logistica is null and v_tele_logistica is not null or a_telef_logistica is not null and v_tele_logistica is null then
                    nu := nu+1;
                    ls_msg := ls_msg||''||'<tr><td align="left"><b>'||nu||'. Tel&eacute;fono del Jefe del &Oacute;rgano Encargado de las Contrataciones:</b></td><td align="left">'||v_tele_logistica||'</td></tr>';
                end if;
        
                if a_telef_anx_logistica <> v_anex_logistica or a_telef_anx_logistica is null and v_anex_logistica is not null or a_telef_anx_logistica is not null and v_anex_logistica is null then 
                    nu := nu+1;
                    ls_msg := ls_msg||''||'<tr><td align="left"><b>'||nu||'. Anexo Telefonico del Jefe del &Oacute;rgano Encargado de las Contrataciones:</b></td><td align="left">'||v_anex_logistica||'</td></tr>';
                end if;
        
                if a_celular_logistica <> v_cel_logistica or a_celular_logistica is null and v_cel_logistica is not null or a_celular_logistica is not null and v_cel_logistica is null then
                    nu := nu+1;
                    ls_msg := ls_msg||''||'<tr><td align="left"><b>'||nu||'. Celular Institucional del Jefe del &Oacute;rgano Encargado de las Contrataciones:</b></td><td align="left">'||v_cel_logistica||'</td></tr>';
                end if;
        
                if a_email_logistica <> v_correo_logistica or a_email_logistica is null and v_correo_logistica is not null or a_email_logistica is not null and v_correo_logistica is null then
                    nu := nu+1;
                    ls_msg := ls_msg||''||'<tr><td align="left"><b>'||nu||'. Correo Electr&oacute;nico del Jefe del &Oacute;rgano Encargado de las Contrataciones:</b></td><td align="left">'||v_correo_logistica||'</td></tr>';
                end if;
        
                if a_nombre_infor <> v_nombre_informatica or a_nombre_infor is null and v_nombre_informatica is not null or a_nombre_infor is not null and v_nombre_informatica is null then
                    nu := nu+1;
                    ls_msg := ls_msg||''||'<tr><td align="left"><b>'||nu||'. Nombres y Apellidos del Jefe de Inform&aacute;tica:</b></td><td align="left">'||v_nombre_informatica||'</td></tr>';
                end if;
        
                if a_telef_infor <> v_tele_informatica or a_telef_infor is null and v_tele_informatica is not null or a_telef_infor is not null and v_tele_informatica is null then
                    nu := nu+1;
                    ls_msg := ls_msg||''||'<tr><td align="left"><b>'||nu||'. Tel&eacute;fono del Jefe de Inform&aacute;tica:</b></td><td align="left">'||v_tele_informatica||'</td></tr>'; 
                end if;
        
                if a_telef_anx_infor <> v_anex_informatica or a_telef_anx_infor is null and v_anex_informatica is not null or a_telef_anx_infor is not null and v_anex_informatica is null then
                    nu := nu+1;
                    ls_msg := ls_msg||''||'<tr><td align="left"><b>'||nu||'. Anexo Telefonico del Jefe de Inform&aacute;tica:</b></td><td align="left">'||v_anex_informatica||'</td></tr>';
                end if;
        
                if a_celular_infor <> v_cel_informatica or a_celular_infor is null and v_cel_informatica is not null or a_celular_infor is not null and v_cel_informatica is null then
                    nu := nu+1;
                    ls_msg := ls_msg||''||'<tr><td align="left"><b>'||nu||'. Celular Institucional del Jefe de Inform&aacute;tica:</b></td><td align="left">'||v_cel_informatica||'</td></tr>';
                end if;
        
                if a_email_infor <> v_correo_informatica or a_email_infor is null and v_correo_informatica is not null or a_email_infor is not null and v_correo_informatica is null then
                    nu := nu+1;
                    ls_msg := ls_msg||''||'<tr><td align="left"><b>'||nu||'. Correo Electr&oacute;nico del Jefe de Inform&aacute;tica:</b></td><td align="left">'||v_correo_informatica||'</td></tr>';
                end if;
         
                ls_msg := ls_msg||''||'</table><hr  style="width:600" /><p>Esta notificaci&oacute;n ha sido enviada autom&aacute;ticamente. Por favor, no responda a este correo.</p><br /><div>';
       
                as_usumail := v_correo;
                as_usumail_titular := v_correo_titular;
                as_usumail_logistica := v_correo_logistica;
                lv_asunto := 'Notificaci¿n de Actualizaci¿n';
         
                if as_usumail is not null then
                    reg_procesos.sp_send_mail_html(as_usumail, lv_asunto, ls_msg);
                end if;
              
                /*if as_usumail_titular is not null then
                    reg_procesos.sp_send_mail_html(as_usumail_titular, lv_asunto, ls_msg);
                end if;*/
                
                if as_usumail_logistica is not null then 
                    reg_procesos.sp_send_mail_html(as_usumail_logistica, lv_asunto, ls_msg);
                end if;
            end if;
        end if;
 
        /***********************************************Insert en tabla de Historial*************************************************************/
        usp_print('<input type="hidden" name="var_retorno" value="1" />');

        if cod_entidad is not null then
            if ent_activo = 0 then
                update sease.entidades e set 
                    e.activo = 1,
                    e.f_desactivar = sysdate
                where e.anhoentidad =  session__anhoentidad
                and e.codconsucode = cod_entidad;
       
                update reg_procesos.entidades e set 
                    e.activo = 1,
                    e.f_desactivar = sysdate
                where e.anhoentidad =  session__anhoentidad
                and e.codconsucode = cod_entidad;

            /**************************************modificacion memorando 642-2013/SDP*********************************************************/    
                update REG_PROCESOS.TBL_VALIDA_ENTIDAD_CAPACITADA set
                ACTIVO = 1,
                D_FECHA_MODIFICA = sysdate
                where codconsucode = COD_ENTIDAD;
            end if;

            if ent_activo = 1 then
                update sease.entidades e 
                    set e.activo = 0,
                    e.f_desactivar = sysdate
                where e.anhoentidad =  session__anhoentidad
                and e.codconsucode = cod_entidad;
       
                update reg_procesos.entidades e set 
                    e.activo = 0,
                    e.f_desactivar = sysdate
                where e.anhoentidad =  session__anhoentidad
                and e.codconsucode = cod_entidad;

            /**************************************modificacion memorando 642-2013/SDP*********************************************************/    
                update REG_PROCESOS.TBL_VALIDA_ENTIDAD_CAPACITADA set
                ACTIVO = 0,
                D_FECHA_MODIFICA = sysdate
                where codconsucode = COD_ENTIDAD;
       
            end if;

            if ent_activo = 2 then
                v_observ := v_doc_autoriza;  
            end if;

            if ent_activo = 3 then
                v_observ := v_dispositivo;  
            end if;

            if ent_activo = 0 or ent_activo = 1 then
                v_observ := txtObservacion;  
            end if;
       
            --obtenemos el tipo de usuario en funci¿n al perfil asignado
            select case when a.cant > 0 then 'A' else 'E' end into c_EsAdm
            from
            (
                select count(*) cant
                from sease.usuario
                where 
                    trim(upper(usu_codigo)) = trim(upper(session__USERID))
                    and usu_miembros like '%ADM_REC,%' --perfil administrador del REC
            ) a;
            
            insert into sease.entidad_historial
            ( usu_registro, ip_registro, estado_registro, observaciones, cod_entidad, anhoentidad, tipo_usuario )
            values
            ( session__USERID, iisenv__remote_host, ent_activo, v_observ, cod_entidad, session__anhoentidad, c_EsAdm );
        end if;

        if ent_activo = 0 or ent_activo = 1 then
            usp_print('
            <script>
            alert("Se ha registrado la Entidad correctamente1");
            window.close();
            </script>');  
        end if;
  
        if v_cod_max is not null then
            usp_print('
            <script>
            thisform.scriptdo.value = "doView";
            alert("Se ha registrado la Entidad correctamente");
            thisform.submit();
            </script>');
        end if;

        if v_cod_actual is not null then
            usp_print('
            <script>
            thisform.scriptdo.value = "doView";
            alert("Se ha modificado los datos de la Entidad correctamente");
            thisform.submit();
            </script>');
        end if;

        commit; 
     
    EXCEPTION
        WHEN OTHERS THEN  
            ROLLBACK;
            usp_print ('Ocurrio el siguiente error: ' || SQLERRM || ' - ' || SQLCODE);  
    END;
    
/***********************************************************************************************************************************************/
/***********************************************************************************************************************************************/
/***********************************************************************************************************************************************/
/***********************************************************************************************************************************************/
    PROCEDURE USP_REC_A002_FORM_REPORTES(val varchar2,
        v_dep_codigo_vb         varchar2,
        v_pro_codigo_vb         varchar2,
        v_dis_codigo_vb         varchar2,
        v_session               varchar2,
        session__USERID         varchar2)
    is
    /*
    ||    Author: Mart¿n Zanelli
    ||    Overview: Procedimiento que genera el formulario Gererar Reportes
    ||    Modificaciones:
    ||      DD/MM/YYYY - (No Identificado) - Creaci¿n del procedimiento 
    ||      28/03/2012 - Mart¿n Zanelli - Modificaci¿n del procedimiento
    ||                   Se cambia los titulos de los campos Actividad e Instacia por 
    ||                   Tipo de Entidad y Sub Tipo de Entidad - Memorando 97-2012/SDP-ECC punto 4.3
    ||      28/03/2012 - Mart¿n Zanelli - Modificaci¿n del procedimiento
    ||                   Se modifica el texto de la opci¿n por defecto de los combobox "--Seleccionar--" 
    ||                   por "TODOS" ya que esa es la funci¿n que cumple dentro de los filtros.
    ||                   - Memorando 97-2012/SDP-ECC punto 4.3.1
    ||      28/03/2012 - Mart¿n Zanelli - Modificaci¿n del procedimiento
    ||                   Se agrega checkbox "Actualizacion datos por la Entidad" el cual desactiva los
    ||                   campos de fecha de creaci¿n y desactivaci¿n - Memorando 97-2012/SDP-ECC punto 4.3.2
    ||      28/03/2012 - Mart¿n Zanelli - Modificaci¿n del procedimiento
    ||                   Se agrega una nueva opci¿n de reporte vinculado al ckeck 
    ||                   "Actualizacion datos por la Entidad", sendo el reporte de entidades que 
    ||                   actualizaron sus datos. - Memorando 97-2012/SDP-ECC punto 4.3.3
    ||      29/03/2012 - Mart¿n Zanelli - Modificaci¿n del procedimiento
    ||                   Se agrega bot¿n Limpiar con la funcionalidad correspondiente - Memorando 97-2012/SDP-ECC punto 4.3.4
    */ 

        cursor cSector is
        select distinct se.sec_codigo, se.sec_desc 
        from sease.sector se; 
    
        cursor cPliego (sectore varchar2) is
        select distinct sp.pli_codigo, sp.desc_pliego 
        from 
            sease.pliego sp
            inner join sease.sector se on se.sec_codigo =sp.sec_codigo
        where se.sec_codigo = sectore
        order by sp.desc_pliego;
      
        cursor cActividad is
        select distinct sa.act_ccodigo, sa.act_vdesc 
        from sease.actividad sa
        where sa.act_sactivo = 1 
        order by sa.act_ccodigo;

        cursor cInstancia(actividade varchar2) is
        select distinct si.ins_ccodigo, si.ins_vdesc 
        from 
            sease.instancia si
            inner join sease.actividad sa on sa.act_ccodigo = si.act_ccodigo
        where sa.act_ccodigo = to_char(actividade) and si.ins_sactivo = 1
        order by si.ins_ccodigo;

        codi_depa          char(2);
        codi_provi         char(4);
        codi_distri        char(6);
        i                  NUMBER;

    begin
  
        usp_print('
    <script language="javascript">
    function array_sector(texto,valor){
        this.texto = texto
        this.valor = valor
    }');

        for xrow2 in cSector loop 
            i := 1;
            usp_print('var A'||xrow2.sec_codigo||'= new Array();');
            usp_print('A'||xrow2.sec_codigo||'[0]=new array_sector("TODOS","");');
            for xrow3 in cPliego(xrow2.sec_codigo) loop
                usp_print('A'||xrow2.sec_codigo||'['||i||'] = new array_sector("'||xrow3.desc_pliego||'","'||xrow3.pli_codigo||'"); ');
                i := i+1;
            end loop;
        end loop;


        usp_print('
    function array_actividad(texto,valor){
        this.texto = texto
        this.valor = valor
    }');

        for xrow in cActividad loop 
            i := 1;
            usp_print('var '||xrow.act_ccodigo||'= new Array();');
            usp_print(''||xrow.act_ccodigo||'[0]=new array_actividad("TODOS","");');
            for xrow1 in cInstancia(xrow.act_ccodigo) loop
                usp_print(''||xrow.act_ccodigo||'['||i||'] = new array_actividad("'||xrow1.ins_vdesc||'","'||xrow1.ins_ccodigo||'"); ');
                i := i+1;
            end loop;
        end loop;

        usp_print('
    function f_validaCampoNumerico1() { 
        var key=window.event.keyCode;   
        if (key <48 || key > 57 ){       
            window.event.keyCode=0;     
        }
    }

    function mostrar_array(cual,donde){
        if(cual.selectedIndex != 0){
        donde.length=0
        cual = eval(cual.value)
        for(m=0;m<cual.length;m++){
            var nuevaOpcion = new Option(cual[m].texto);
            donde.options[m] = nuevaOpcion;
   
    if(cual[m].valor != null){
      donde.options[m].value = cual[m].valor
      }
    else{
      donde.options[m].value = cual[m].texto
      }
    }
  }
}
  
  function RtnUbigeo(dep_codigo,pro_codigo,dis_codigo,dep_desc,pro_desc,dis_desc,lugar_ejec)
    {
        if (thisform.tipo_ubi.value==1)
        {
            thisform.dep_codigo.value=dep_codigo;
            thisform.pro_codigo.value=pro_codigo;
            thisform.dis_codigo.value=dis_codigo;
            thisform.lugar_ejec.value=dep_desc+"/"+pro_desc+"/"+dis_desc;
        }
        if (thisform.tipo_ubi.value==2)
        {
            thisform.v_dep_codigo_vb.value=dep_codigo;
            thisform.v_pro_codigo_vb.value=pro_codigo;
            thisform.v_dis_codigo_vb.value=dis_codigo;
            thisform.lugar_ejec_vb.value=dep_desc+"/"+pro_desc+"/"+dis_desc;
           
        }
        if (thisform.tipo_ubi.value==3)
        {
            thisform.dep_codigo_ed.value=dep_codigo;
            thisform.pro_codigo_ed.value=pro_codigo;
            thisform.dis_codigo_ed.value=dis_codigo;
            thisform.lugar_ejec_ed.value=dep_desc+"/"+pro_desc+"/"+dis_desc;
        }
    }  
    
    
  function BuscaUbigeo(tipo)
    {
        thisform.tipo_ubi.value=tipo;
        window.open("ControllerServletOpen?portletid=BuscadorUbigeo","","toolbar=no,Width=800,Height=400,scrollbars=yes,modal=yes,dependent,alwaysRaised");
    }  
  
  function f_validaCampoNumerico1() 
    { 
        var key=window.event.keyCode;   
        if (key <48 || key > 57 )
           {       
            window.event.keyCode=0;     
           }
    }
            
   
  function codigos_ubigeo(depa, provi, distri)
    {
      thisform.v_cod_dep.value = depa;
      thisform.v_cod_pro.value = provi;
      thisform.v_cod_dis.value = distri; 
    }  
 

  
  function comparaFechas(fec1, fec2)
    {
           var Anio1 = (fec1).substr(6,4)
           var Mes1 = ((fec1).substr(3,2))*1 - 1
           var Dia1 = (fec1).substr(0,2)
           var Anio2 = (fec2).substr(6,4)
           var Mes2 = ((fec2).substr(3,2))*1 - 1
           var Dia2 = (fec2).substr(0,2)
           var Fecha_Inicio = new Date(Anio1,Mes1,Dia1)
           var Fecha_Fin = new Date(Anio2,Mes2,Dia2)
           if(Fecha_Inicio > Fecha_Fin)
                return 1;
            else
            {
                if(Fecha_Inicio < Fecha_Fin)
                    return 2;
                else
                    return 0;
            }
    }
    
    function generar_excel()
    {
        if (comparaFechas(thisform.ag_fec_cre_ini.value, thisform.ag_fec_cre_fin.value) == 1 )
        {
            alert("La fecha de fin debe ser mayor o igual a: "+thisform.ag_fec_cre_ini.value);
            return;
        } 
        if (comparaFechas(thisform.ag_fec_des_ini.value, thisform.ag_fec_des_fin.value) == 1 )
        {
            alert("La fecha de fin debe ser mayor o igual a: "+thisform.ag_fec_des_ini.value);
            return;
        } 
        if (comparaFechas(thisform.ag_fec_act_ini.value, thisform.ag_fec_act_fin.value) == 1 )
        {
            alert("La fecha de fin debe ser mayor o igual a: "+thisform.ag_fec_act_ini.value);
            return;
        }   
        
        if (thisform.v_ade.checked)
        { 
            thisform.scriptdo.value="doExcelEnt";
            thisform.submit();
            window.location.href="portlet5openxls.asp?_portletid_=mod_rec1_a002_generar_reportes&scriptdo=doExcelEnt&v_tipo=1&v_actividad="+thisform.v_actividad.value+"&v_instancia="+thisform.v_instancia.value+"&v_sector="+thisform.v_sector.value+"&v_pliego="+thisform.v_pliego.value+"&v_uni_eje="+thisform.v_uni_eje.value+"&fec_cre_ini="+thisform.fec_cre_ini.value+"&fec_cre_fin="+thisform.fec_cre_fin.value+"&v_cod_estado="+thisform.v_cod_estado.value+"&fec_des_ini="+thisform.fec_des_ini.value+"&fec_des_fin="+thisform.fec_des_fin.value+"&fec_act_ini="+thisform.fec_act_ini.value+"&fec_act_fin="+thisform.fec_act_fin.value+"&v_dep_codigo_vb="+thisform.v_dep_codigo_vb.value+"&v_pro_codigo_vb="+thisform.v_pro_codigo_vb.value+"&v_dis_codigo_vb="+thisform.v_dis_codigo_vb.value;        
        }
        else
        {
            thisform.scriptdo.value="doExcel";
            thisform.submit();
            window.location.href="portlet5openxls.asp?_portletid_=mod_rec1_a002_generar_reportes&scriptdo=doExcel&v_actividad="+thisform.v_actividad.value+"&v_instancia="+thisform.v_instancia.value+"&v_sector="+thisform.v_sector.value+"&v_pliego="+thisform.v_pliego.value+"&v_uni_eje="+thisform.v_uni_eje.value+"&fec_cre_ini="+thisform.fec_cre_ini.value+"&fec_cre_fin="+thisform.fec_cre_fin.value+"&v_cod_estado="+thisform.v_cod_estado.value+"&fec_des_ini="+thisform.fec_des_ini.value+"&fec_des_fin="+thisform.fec_des_fin.value+"&fec_act_ini="+thisform.fec_act_ini.value+"&fec_act_fin="+thisform.fec_act_fin.value+"&v_dep_codigo_vb="+thisform.v_dep_codigo_vb.value+"&v_pro_codigo_vb="+thisform.v_pro_codigo_vb.value+"&v_dis_codigo_vb="+thisform.v_dis_codigo_vb.value;
        }
    }
  
    function ver_reporte()
    {
        if (comparaFechas(thisform.ag_fec_cre_ini.value, thisform.ag_fec_cre_fin.value) == 1 )
        {
            alert("La fecha de fin debe ser mayor o igual a: "+thisform.ag_fec_cre_ini.value);
            return;
        } 
        if (comparaFechas(thisform.ag_fec_des_ini.value, thisform.ag_fec_des_fin.value) == 1 )
        {
            alert("La fecha de fin debe ser mayor o igual a: "+thisform.ag_fec_des_ini.value);
            return;
        } 
        if (comparaFechas(thisform.ag_fec_act_ini.value, thisform.ag_fec_act_fin.value) == 1 )
        {
            alert("La fecha de fin debe ser mayor o igual a: "+thisform.ag_fec_act_ini.value);
            return;
        }
       
        if (thisform.v_ade.checked)
        {
            thisform.v_tipo.value = 2;
            thisform.scriptdo.value="doResultEnt";
            thisform.submit();
        }
        else
        { 
            thisform.scriptdo.value="doResult";
            thisform.submit();
        }
  }
    
  
  
  </script>');  
  
  
 usp_print('<div id="div_reporte"><table border="0" class=tableform cellpadding="3" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%">
             <tr><td  colspan="2" align="left"><h3>Criterio para Generar Reportes</h3></td></tr>
             <tr>
             </table>');         
             
    usp_print('<table class="table table-striped table-bordered">
              
              <tr>
              <td class=c1>Tipo de Entidad: </td>
              <td class=c2 colspan="3"><select style="width:400px;" name="v_actividad" onchange="mostrar_array(this,thisform.v_instancia)">
              <option value="">TODOS</option>');
           for xrow in cActividad loop
             usp_print('<option value='||xrow.act_ccodigo||'  >'||xrow.act_vdesc||'</option>');
           
           end loop;   
           usp_print('   
              </select></td>
         
          </tr>
         <tr>
              <td class=c1>Sub Tipo de Entidad: </td>
              <td class=c2 colspan="3"><div id="div_instancia"><select style="width:400px;" name="v_instancia" >
              <option value="">TODOS</option>
              
              </select></div></td>
         
          </tr>
          
          <tr>
              <td class=c1>Sector: </td>
              <td class=c2 colspan="3"><div id="div_sector"><select name="v_sector" value="" onchange="mostrar_array(this,thisform.v_pliego)" style="width:400px;">
              <option value="">TODOS</option>
          ');
          
          
          for xrow in cSector loop
           usp_print('<option  value="A'||xrow.sec_codigo||'">'||xrow.sec_desc||'</option>');
          end loop;
            
         usp_print('
             
              </select>
              </div></td>
         
          </tr>
         
          <tr>
              <td class=c1>Pliego: </td>
              <td class=c2 colspan="3"><div id="div_pliego"><select name="v_pliego" style="width:400px;">
              <option value="">TODOS</option>
              </select></div></td>
          </tr>
           <tr>
              <td class=c1>Unidad Ejecutora: </td>
              <td class=c2 colspan="3"><input type="text" name="v_uni_eje" style="width= 99%;" onkeypress="f_validaCampoNumerico1()" maxlength="4" /></td>
           
          </tr>
          
          <tr>
              <td class=c1>Ubigeo: </td>
              <td class=c2 colspan=3><input name="lugar_ejec_vb" size="45" class="form-control" onclick="BuscaUbigeo(2)" readonly  value=""  style="width:50%"/>
              
             </td>
       
          </tr>
          
         <tr>
              <td class=c1>Estado Actual: </td>
              <td class=c2 colspan="3"><select name="v_cod_estado">');
           
            
              usp_print('<option value="">TODOS</option>
                         <option value="1">ACTIVO</option>
                         <option value="0">INACTIVO</option>');      
              
               usp_print('</select></td>
         
          </tr>
          <tr>
            <td class="c1">Actualizaci&oacute;n Datos por la Entidad:</td>
            <td class="c2" colspan="3"><input type="checkbox" name="v_ade" value="" onclick="ActivarCampos()"/></td>
          </tr>
          
          <tr>
              <td class=c1>&nbsp;</td>
              <td class=c2>Desde:</td>
              <td class=c2 align="left">Hasta:</td>
              <td class=c2>&nbsp;</td>
          </tr>
         
          <tr>
              <td class=c1>Por Fecha de Creaci&oacute;n: </td>
              <td class=c2>
                <div class="input-group datepicker" id="idDivTxtFechaIni">
                <div class="input-group-addon  add-on">
                     <span class="glyphicon glyphicon-calendar"></span>
                </div>
                
               <input type="text" name="ag_fec_cre_ini" style="width:98%" data-format="dd/MM/yyyy" class="form-control"/>
               </div>
              </td>
              <td class=c2 align="left">
              <div class="input-group datepicker" id="idDivTxtFechaIni">
                <div class="input-group-addon  add-on">
                     <span class="glyphicon glyphicon-calendar"></span>
                </div>
               <input type="text" name="ag_fec_cre_fin" style="width:98%" data-format="dd/MM/yyyy" class="form-control"/>
               </div>
              </td>
             
          </tr>
          
          <tr>
              <td class=c1>Por Fecha de Desactivaci&oacute;n </td>
              <td class=c2>
              <div class="input-group datepicker" id="idDivTxtFechaIni">
                <div class="input-group-addon  add-on">
                     <span class="glyphicon glyphicon-calendar"></span>
                </div>
               <input type="text" name="ag_fec_des_ini" style="width:98%" data-format="dd/MM/yyyy" class="form-control"/>
               </div>
              </td>
              <td class=c2>
              <div class="input-group datepicker" id="idDivTxtFechaIni">
                <div class="input-group-addon  add-on">
                     <span class="glyphicon glyphicon-calendar"></span>
                </div>
               <input type="text" name="ag_fec_des_fin" style="width:98%" data-format="dd/MM/yyyy" class="form-control"/>
              </div>
              </td>
             
          </tr>
          
          <tr>
              <td class=c1>Por Fecha de Modificaci&oacute;n: </td>
              <td class=c2>
              <div class="input-group datepicker" id="idDivTxtFechaIni">
                <div class="input-group-addon  add-on">
                     <span class="glyphicon glyphicon-calendar"></span>
                </div>
               <input type="text" name="ag_fec_act_ini" style="width:98%" data-format="dd/MM/yyyy" class="form-control"/>
              </div>
              
              </td>
              <td class=c2>
              <div class="input-group datepicker" id="idDivTxtFechaIni">
                <div class="input-group-addon  add-on">
                     <span class="glyphicon glyphicon-calendar"></span>
                </div>
               <input type="text" name="ag_fec_act_fin" style="width:98%" data-format="dd/MM/yyyy" class="form-control"/>
              </div>
     
              </td>
              
           
          </tr>
          <tr>
              <td class=c1 colspan="4" align="center">
                <input type="button" value="Generar Excel" onclick="generar_excel();" />&nbsp;
                <input type="button" value="Generar Reporte" onclick="ver_reporte();" />&nbsp;
                <input type="button" value="Limpiar" onclick="limpiar();" />
              </td>
          </tr>
          </table>
          
          </div>
          
          ');
             usp_print('<input type="hidden" name="v_cod_dep" value="'||codi_depa||'" />');
             usp_print('<input type="hidden" name="v_cod_pro" value="'||codi_provi||'" />');
             usp_print('<input type="hidden" name="v_cod_dis" value="'||codi_distri||'" />');
             
             --modal 2 ubigeo
             
             usp_print('
                <input name=v_dep_codigo_vb readonly="true" value="'||v_dep_codigo_vb||'" type="hidden" />
                <input name=v_pro_codigo_vb readonly="true" value="'||v_pro_codigo_vb||'" type="hidden"/>
                <input name=v_dis_codigo_vb readonly="true" value="'||v_dis_codigo_vb||'" type="hidden"/>
                <INPUT name="tipo_ubi" type="hidden"/>
                <input type="hidden" name="v_tipo" value=""/>');  

        usp_print('
        <script language="javascript">
        function ActivarCampos()
        {   
            if (thisform.v_ade.checked == true)
            { 
                thisform.fec_cre_ini.disabled = true;
                thisform.fec_cre_fin.disabled = true;
                thisform.fec_cre_ini.value = "";
                thisform.fec_cre_fin.value = "";
                thisform.fec_des_ini.disabled = true;
                thisform.fec_des_fin.disabled = true;
                thisform.fec_des_ini.value = "";
                thisform.fec_des_fin.value = "";
            }
            else
            {
                thisform.fec_cre_ini.disabled = false;
                thisform.fec_cre_fin.disabled = false;
                thisform.fec_des_ini.disabled = false;
                thisform.fec_des_fin.disabled = false;
            }
        }
        
        function limpiar()
        {
            thisform.v_actividad.value = "";
            thisform.v_instancia.value = "";
            thisform.v_sector.value = "";
            thisform.v_pliego.value = "";
            thisform.v_uni_eje.value = "";
            thisform.lugar_ejec_vb.value = "";
            thisform.v_cod_dep.value = "";
            thisform.v_cod_pro.value = "";
            thisform.v_cod_dis.value = "";
            thisform.v_dep_codigo_vb.value = "";
            thisform.v_pro_codigo_vb.value = "";
            thisform.v_dis_codigo_vb.value = "";
            thisform.v_cod_estado.value = "";
            thisform.v_ade.checked = false;
            thisform.fec_cre_ini.value = "";
            thisform.fec_cre_fin.value = "";
            thisform.fec_des_ini.value = "";
            thisform.fec_des_fin.value = "";
            thisform.fec_act_ini.value = "";
            thisform.fec_act_fin.value = "";
        }
        </script>');
             
  end;
/***********************************************************************************************************************************************/
/***********************************************************************************************************************************************/
/***********************************************************************************************************************************************/
/***********************************************************************************************************************************************/
PROCEDURE USP_REC_A002_RESULT (v_actividad           varchar2,
                               v_instancia           varchar2,
                               v_sector              varchar2,
                               v_pliego              varchar2,
                               v_uni_eje             varchar2,
                               fec_cre_ini           varchar2,
                               fec_cre_fin           varchar2,
                               v_cod_estado          varchar2,
                               fec_des_ini           varchar2,
                               fec_des_fin           varchar2,
                               fec_act_ini           varchar2,
                               fec_act_fin           varchar2,
                               session__anhoentidad  number,
                               ag_currentpage         IN   VARCHAR2 := 1,
                               v_cod_dep             varchar2,
                               v_cod_pro             varchar2,
                               v_cod_dis             varchar2,
                               v_dep_codigo_vb       varchar2,
                               v_pro_codigo_vb       varchar2,
                               v_dis_codigo_vb       varchar2
                            )
IS

cursor cReporte(v_currentpage   IN   VARCHAR2,  v_anhoentidad   in   VARCHAR2) is
select codconsucode, f_registro, descripcion, n_ruc, direccion, ubigeo, estado, 
            sector_des, pliego_des, sector_cod, pliego_cod, activi_cod, activi_des,
            instan_cod, instan_des
   from (
          select ROWNUM num, a.*
          from (
select e.codconsucode, e.f_registro, e.descripcion, e.n_ruc, e.direccion, dep.dep_desc|| ' / ' ||pro.pro_desc|| ' / ' ||dis.dis_desc as ubigeo, 
CASE WHEN e.activo = 1 THEN 'ACTIVO' ELSE 'INACTIVO' end estado,
se.SEC_DESC sector_des, pl.DESC_PLIEGO pliego_des, se.SEC_CODIGO sector_cod, 
pl.PLI_CODIGO pliego_cod, ac.act_ccodigo activi_cod, ac.ACT_VDESC activi_des, 
i.ins_ccodigo instan_cod, i.INS_VDESC instan_des 
from sease.entidades e
left join 
(select ss.codconsucode, ss.f_desactivar, ss.anhoentidad, ss.activo from sease.entidades ss where ss.anhoentidad = session__anhoentidad and ss.activo = 0) vw
on vw.codconsucode = e.codconsucode
left join sease.dep_ubigeo dep on e.dep_coddpto = dep.dep_codigo
left join sease.prov_ubigeo pro on e.pro_codprov = pro.dep_codigo||''||pro.pro_codigo
left join sease.dist_ubigeo dis on e.dis_coddist = dis.dep_codigo||''||dis.pro_codigo||''||dis.dis_codigo
left join sease.sector se on se.SEC_CODIGO = e.sector
left join sease.pliego pl on e.sector = pl.SEC_CODIGO and e.pliego = pl.PLI_CODIGO
left join sease.actividad ac on e.actividad = ac.act_ccodigo
left join sease.instancia i on e.actividad = i.ACT_CCODIGO and e.instancia = i.ins_ccodigo 
where (e.actividad = v_actividad or v_actividad is null)
and (e.instancia = v_instancia or v_instancia is null)
and (e.sector = SUBSTR(v_sector,2,3) or v_sector is null)
and (trim(e.pliego) = trim(v_pliego) or v_pliego is null)
and (trim(e.uejecutora) = trim(v_uni_eje) or v_uni_eje is null)
and (e.f_registro >= to_date(fec_cre_ini, 'dd/mm/yyyy') or fec_cre_ini is null) 
and (e.f_registro <= to_date(fec_cre_fin, 'dd/mm/yyyy') +1 or fec_cre_fin is null)
and (e.activo = v_cod_estado or v_cod_estado is null)
and (e.fec_ult_modi >= to_date(fec_act_ini, 'dd/mm/yyyy') or fec_act_ini is null) 
and (e.fec_ult_modi <= to_date(fec_act_fin, 'dd/mm/yyyy') +1 or fec_act_fin is null)
and (vw.f_desactivar >= to_date(fec_des_ini, 'dd/mm/yyyy') or fec_des_fin is null)
and (vw.f_desactivar <= to_date(fec_des_fin, 'dd/mm/yyyy') +1 or  fec_des_fin is null)
and (e.dis_coddist = v_dep_codigo_vb||''||v_pro_codigo_vb||''||v_dis_codigo_vb  or  v_dep_codigo_vb||''||v_pro_codigo_vb||''||v_dis_codigo_vb is null)
and e.anhoentidad = v_anhoentidad
order by e.codconsucode) a) b
          WHERE b.num BETWEEN 15 * (TO_NUMBER (v_currentpage) - 1) + 1
                          AND 15 * TO_NUMBER (v_currentpage);



      lv_currentpage   number;
      lv_num_users     number;
      lv_num           number;
      lv_iterador      number                    NOT NULL DEFAULT 0;                 
      c_total          number;    
      ln_cont          number;
      v_sw             number;
      cColor           varchar2(50);
BEGIN
  
IF ag_currentpage IS NULL
      THEN
         lv_currentpage := 1;
      ELSE
         lv_currentpage := ag_currentpage;
      END IF;
  
  
 c_total := 0; 
select distinct count(*) into c_total

from (select se.codconsucode, se.descripcion, se.n_ruc, se.direccion, se.activo, dep.dep_desc|| ' / ' ||pro.pro_desc|| ' / ' ||dis.dis_desc as ubigeo from sease.entidades se
left join 
(select ss.codconsucode, ss.f_desactivar, ss.anhoentidad, ss.activo from sease.entidades ss where ss.anhoentidad = session__anhoentidad and ss.activo = 0) vw
on vw.codconsucode = se.codconsucode
left join sease.dep_ubigeo dep on se.dep_coddpto = dep.dep_codigo
left join sease.prov_ubigeo pro on se.pro_codprov = pro.dep_codigo||''||pro.pro_codigo
left join sease.dist_ubigeo dis on se.dis_coddist = dis.dep_codigo||''||dis.pro_codigo||''||dis.dis_codigo
where (se.actividad = v_actividad or v_actividad is null)
and (se.instancia = v_instancia or v_instancia is null)
and (se.sector = SUBSTR(v_sector,2,3) or v_sector is null)
and (trim(se.pliego) = trim(v_pliego) or v_pliego is null)
and (trim(se.uejecutora) = trim(v_uni_eje) or v_uni_eje is null)
and (se.f_registro >= to_date(fec_cre_ini, 'dd/mm/yyyy') or fec_cre_ini is null) 
and (se.f_registro <= to_date(fec_cre_fin, 'dd/mm/yyyy')+1 or fec_cre_fin is null)
and (se.activo = v_cod_estado or v_cod_estado is null)
and (se.fec_ult_modi >= to_date(fec_act_ini, 'dd/mm/yyyy') or fec_act_ini is null) 
and (se.fec_ult_modi <= to_date(fec_act_fin, 'dd/mm/yyyy')+1 or fec_act_fin is null)
and (vw.f_desactivar >= to_date(fec_des_ini, 'dd/mm/yyyy') or fec_des_fin is null)
and (vw.f_desactivar <= to_date(fec_des_fin, 'dd/mm/yyyy')+1  or  fec_des_fin is null)
and (se.dis_coddist = v_dep_codigo_vb||''||v_pro_codigo_vb||''||v_dis_codigo_vb  or  v_dep_codigo_vb||''||v_pro_codigo_vb||''||v_dis_codigo_vb is null)
and se.anhoentidad = session__anhoentidad
order by se.codconsucode);

showpaginacion (lv_currentpage,
                      c_total,
                        'v_actividad='
                      || v_actividad
                      ||'&v_instancia='
                      || v_instancia
                      || '&v_sector='
                      || v_sector
                      || '&v_pliego='
                      || v_pliego
                      || '&fec_cre_ini='
                      || fec_cre_ini
                      || '&fec_cre_fin='
                      || fec_cre_fin
                      || '&fec_act_ini='
                      || fec_act_ini
                      || '&fec_act_fin='
                      || fec_act_fin 
                      || '&fec_des_ini='
                      || fec_des_ini
                      || '&fec_des_fin='
                      || fec_des_fin
                      || '&v_dep_codigo_vb='
                      || v_dep_codigo_vb 
                      || '&v_pro_codigo_vb='
                      || v_pro_codigo_vb
                      || '&v_dis_codigo_vb='
                      || v_dis_codigo_vb
                       || '&v_cod_estado='
                      || v_cod_estado
                      || '&v_uni_eje='
                      || trim(v_uni_eje),
                      '&scriptdo=doResult',
                      15
                     ); 

if c_total = 0 then
        usp_print('No hay datos para mostrar.');
    else 
  
    usp_print('<table class="table table-bordered table-striped" style="font-size: 0.9em">    
           <tr>
             <th class=th1 align="center">Nro.</th>
             <th class=th1 align="center">C&oacute;digo</th>
             <th class=th1 align="center">Estado</th>
             <th class=th1 align="center">Fecha de Creaci&oacute;n</th>
             <th class=th1 align="center">Entidad</th>
             <th class=th1 align="center">RUC</th> 
             <th class=th1 align="center">Ubicaci&oacute;n</th>
             <th class=th1 align="center">Direcci&oacute;n</th>
             <th class=th1 align="center" class="th1">Sector</th>
             <th class=th1 align="center" class="th1">Pliego</th>
             <th class=th1 align="center" class="th1">Tipo de Entidad</th>
             <th class=th1 align="center" class="th1">Subtipo de Entidad</th>
           </tr>');
           
    v_sw:=1;     
   ln_cont:= 1 +  15 * (lv_currentpage-1);     
   for xrow in cReporte(lv_currentpage, session__anhoentidad) loop
        cColor := '';    
            if v_sw = 1 then
                cColor := 'bgcolor="ECE9D8"';
            end if;
           usp_print('<tr>');
           usp_print('<td align="center" '||cColor||'>'||ln_cont||'</td>');
           usp_print('<td align="center" '||cColor||'>'||xrow.codconsucode||'</td>');
           usp_print('<td align="center" '||cColor||'>'||xrow.estado||'</td>');
           usp_print('<td align="center" '||cColor||'>'||to_char(xrow.f_registro,'dd/mm/yyyy hh24:mi:ss')||'</td>');
           usp_print('<td align="left"   '||cColor||'>'||xrow.descripcion||'</td>');
           usp_print('<td align="left"   '||cColor||'>'||xrow.n_ruc||'</td>');
           usp_print('<td align="left"   '||cColor||'>'||xrow.ubigeo||'</td>');
           usp_print('<td align="left"   '||cColor||'>'||xrow.direccion||'</td>');
           usp_print('<td align="left"   '||cColor||'>'||xrow.sector_cod||' - '||xrow.sector_des||'&nbsp;</td>');
           usp_print('<td align="left"   '||cColor||'>'||xrow.pliego_cod||' - '||xrow.pliego_des||'&nbsp;</td>');
           usp_print('<td align="left"   '||cColor||'>'||xrow.activi_cod||' - '||xrow.activi_des||'&nbsp;</td>');
           usp_print('<td align="left"   '||cColor||'>'||xrow.instan_cod||' - '||xrow.instan_des||'&nbsp;</td>');
           usp_print('</tr>');
           ln_cont := ln_cont + 1; v_sw:=v_sw * (-1);  
      end loop;
   usp_print('</table>');   
      end if;   
   
END; 

PROCEDURE USP_REC_A002_EXCEL ( v_actividad           varchar2,
                               v_instancia           varchar2,
                               v_sector              varchar2,
                               v_pliego              varchar2,
                               v_uni_eje             varchar2,
                               fec_cre_ini           varchar2,
                               fec_cre_fin           varchar2,
                               v_cod_estado          number,
                               fec_des_ini           varchar2,
                               fec_des_fin           varchar2,
                               fec_act_ini           varchar2,
                               fec_act_fin           varchar2,
                               session__anhoentidad  number,
                               v_cod_dep             varchar2,
                               v_cod_pro             varchar2,
                               v_cod_dis             varchar2,
                               v_dep_codigo_vb       varchar2,
                               v_pro_codigo_vb       varchar2,
                               v_dis_codigo_vb       varchar2
                              )
IS

cursor cReporte is
select e.codconsucode, f_registro, e.descripcion, e.n_ruc, e.direccion, dep.dep_desc|| ' / ' ||pro.pro_desc|| ' / ' ||dis.dis_desc as ubigeo, 
CASE WHEN e.activo = 1 THEN 'ACTIVO' ELSE 'INACTIVO' end estado,
se.SEC_DESC sector_des, pl.DESC_PLIEGO pliego_des, se.SEC_CODIGO sector_cod, 
pl.PLI_CODIGO pliego_cod, ac.act_ccodigo activi_cod, ac.ACT_VDESC activi_des, 
i.ins_ccodigo instan_cod, i.INS_VDESC instan_des
from sease.entidades e
left join 
(select ss.codconsucode, ss.f_desactivar, ss.anhoentidad, ss.activo from sease.entidades ss where ss.anhoentidad = session__anhoentidad and ss.activo = 0) vw
on vw.codconsucode = e.codconsucode
left join sease.dep_ubigeo dep on e.dep_coddpto = dep.dep_codigo
left join sease.prov_ubigeo pro on e.pro_codprov = pro.dep_codigo||''||pro.pro_codigo
left join sease.dist_ubigeo dis on e.dis_coddist = dis.dep_codigo||''||dis.pro_codigo||''||dis.dis_codigo
left join sease.sector se on se.SEC_CODIGO = e.sector
left join sease.pliego pl on e.sector = pl.SEC_CODIGO and e.pliego = pl.PLI_CODIGO
left join sease.actividad ac on e.actividad = ac.act_ccodigo
left join sease.instancia i on e.actividad = i.ACT_CCODIGO and e.instancia = i.ins_ccodigo 
where (e.actividad = v_actividad or v_actividad is null)
and (e.instancia = v_instancia or v_instancia is null)
and (e.sector = SUBSTR(v_sector,2,3) or SUBSTR(v_sector,2,3) is null)
and (trim(e.pliego) = trim(v_pliego) or v_pliego is null)
and (trim(e.uejecutora) = trim(v_uni_eje) or v_uni_eje is null)
and (e.f_registro >= to_date(fec_cre_ini, 'dd/mm/yyyy') or fec_cre_ini is null) 
and (e.f_registro <= to_date(fec_cre_fin, 'dd/mm/yyyy') + 1 or fec_cre_fin is null)
and (e.activo = v_cod_estado or v_cod_estado is null)
and (e.fec_ult_modi >= to_date(fec_act_ini, 'dd/mm/yyyy') or fec_act_ini is null) 
and (e.fec_ult_modi <= to_date(fec_act_fin, 'dd/mm/yyyy') + 1 or fec_act_fin is null)
and (vw.f_desactivar >= to_date(fec_des_ini, 'dd/mm/yyyy') or fec_des_fin is null)
and (vw.f_desactivar <= to_date(fec_des_fin, 'dd/mm/yyyy') + 1  or  fec_des_fin is null)
and (e.dis_coddist = v_dep_codigo_vb||''||v_pro_codigo_vb||''||v_dis_codigo_vb  or  v_dep_codigo_vb||''||v_pro_codigo_vb||''||v_dis_codigo_vb is null)
and e.anhoentidad = session__anhoentidad
order by e.codconsucode;

  v_sw    number;
  ln_cont number;
  cColor           varchar2(50);
BEGIN
  

usp_print('
<style type="text/css">
.letra{
font-size: x-small;
}
</style>
');  
 
  
    usp_print('<table class="letra" border="1">    
           <tr>
             <th class=th1 align="center">Nro.</th>
             <th class=th1 align="center">C&oacute;digo</th>
             <th class=th1 align="center">Estado</th>
             <th class=th1 align="center">Fecha de Creaci&oacute;n</th>
             <th class=th1 align="center">Entidad</th>
             <th class=th1 align="center">RUC</th> 
             <th class=th1 align="center">Ubicaci&oacute;n</th>
             <th class=th1 align="center">Direcci&oacute;n</th>
             <th class=th1 align="center" class="th1">Sector</th>
             <th class=th1 align="center" class="th1">Pliego</th>
             <th class=th1 align="center" class="th1">Tipo de Entidad</th>
             <th class=th1 align="center" class="th1">Subtipo de Entidad</th>
           </tr>');
           
         
     ln_cont := 1; 
     v_sw := 1;     
   for xrow in cReporte loop
           cColor := '';    
           if v_sw = 1 then
                cColor := 'bgcolor="ECE9D8"';
           end if;
           usp_print('<tr>');
           usp_print('<td align="center" '||cColor||'>'||ln_cont||'</td>');
           usp_print('<td align="center" '||cColor||'>'||xrow.codconsucode||'</td>');
           usp_print('<td align="center" '||cColor||'>'||xrow.estado||'</td>');
           usp_print('<td align="center" '||cColor||'>'||to_char(xrow.f_registro,'dd/mm/yyyy hh24:mi:ss')||'</td>');
           usp_print('<td align="left"   '||cColor||'>'||xrow.descripcion||'</td>');
           usp_print('<td align="left"   '||cColor||'>'||xrow.n_ruc||'</td>');
           usp_print('<td align="left"   '||cColor||'>'||xrow.ubigeo||'</td>');
           usp_print('<td align="left"   '||cColor||'>'||xrow.direccion||'</td>');
           usp_print('<td align="left"   '||cColor||'>'||xrow.sector_cod||' - '||xrow.sector_des||'&nbsp;</td>');
           usp_print('<td align="left"   '||cColor||'>'||xrow.pliego_cod||' - '||xrow.pliego_des||'&nbsp;</td>');
           usp_print('<td align="left"   '||cColor||'>'||xrow.activi_cod||' - '||xrow.activi_des||'&nbsp;</td>');
           usp_print('<td align="left"   '||cColor||'>'||xrow.instan_cod||' - '||xrow.instan_des||'&nbsp;</td>');
           usp_print('</tr>');
           ln_cont := ln_cont + 1;
            v_sw:=v_sw * (-1);  
      end loop;
      usp_print('</table>');
  
END;

PROCEDURE USP_REC_A003_FORM_CREACION(cod_entidad                   varchar2,
                                     session__anhoentidad          varchar2,
                                     anio                          varchar2,
                                     codigo_consucode              varchar2,
                                     session__eue_codigo           number,
                                     v_dep_codigo_vb               varchar2,
                                     v_pro_codigo_vb               varchar2,
                                     v_dis_codigo_vb               varchar2,
                                     session__FileSingedHTTP       varchar2,
                                     lv_DOC_URL                    varchar2,
                                     lv_ICON_TIPO_FILE             varchar2,
                                     v_sector                      varchar2
                                     )
is                                    
cursor cSector is
       select distinct se.sec_codigo, se.sec_desc from sease.sector se
              inner join sease.entidades en on en.sector = se.sec_codigo
              where en.codconsucode = session__eue_codigo
              and en.anhoentidad = session__anhoentidad
              order by se.sec_desc;

cursor cPliego (sectore varchar2) is
       select distinct sp.pli_codigo, sp.desc_pliego from sease.pliego sp
              inner join sease.sector se on se.sec_codigo =sp.sec_codigo
              where se.sec_codigo = sectore
              order by sp.desc_pliego;
         
cursor cPliego1 (sectored varchar2) is
       select distinct sp.pli_codigo, sp.desc_pliego from sease.pliego sp
              inner join sease.sector se on se.sec_codigo =sp.sec_codigo
              inner join sease.entidades sse on sse.pliego = sp.pli_codigo
              where se.sec_codigo = sectored
              and sse.codconsucode = session__eue_codigo
              and sse.anhoentidad = session__anhoentidad
              order by sp.desc_pliego;

cursor cActividad is
       select distinct sa.act_ccodigo, sa.act_vdesc from sease.actividad sa
              order by sa.act_vdesc;  

cursor cInstancia(actividade varchar2) is
       select distinct si.ins_ccodigo, si.ins_vdesc from sease.instancia si
              inner join sease.actividad sa on sa.act_ccodigo = si.act_ccodigo
              where sa.act_ccodigo = to_char(actividade)
              order by si.ins_ccodigo; 
         
cursor cInstancia1 (actividades varchar2)is
       select distinct si.ins_ccodigo, si.ins_vdesc from sease.instancia si
              inner join sease.actividad sa on sa.act_ccodigo = si.act_ccodigo
              where sa.act_ccodigo = to_char(actividades)
              order by si.ins_ccodigo;       

cursor cAnho is
       select distinct so.anhoentidad from sease.entidades so
              where so.codconsucode = session__eue_codigo
              order by so.anhoentidad;

cursor cEntidades_doc1 is
       select ed.doc_url, ed.fec_upload, ta.icon_tipo_file from reg_procesos.entidades_doc ed
              inner join (select max(do.cod_doc) as doc_cod from reg_procesos.entidades_doc do where do.codconsucode = session__eue_codigo and do.cod_indicador = 1) vw on vw.doc_cod = ed.cod_doc
              inner join reg_procesos.tipo_archivo ta on ta.cod_tipo_file = ed.cod_tipo_file;
            
cursor cEntidades_doc2 is
       select ed.doc_url, ed.fec_upload, ta.icon_tipo_file from reg_procesos.entidades_doc ed
              inner join (select max(do.cod_doc) as doc_cod from reg_procesos.entidades_doc do where do.codconsucode = session__eue_codigo
              and do.cod_indicador = 2) vw on vw.doc_cod = ed.cod_doc
              inner join reg_procesos.tipo_archivo ta on ta.cod_tipo_file = ed.cod_tipo_file;
                        
cursor cEntidades_doc3 is
       select ed.doc_url, ed.fec_upload, ta.icon_tipo_file from reg_procesos.entidades_doc ed
              inner join (select max(do.cod_doc) as doc_cod from reg_procesos.entidades_doc do where do.codconsucode = session__eue_codigo and do.cod_indicador = 3) vw on vw.doc_cod = ed.cod_doc
              inner join reg_procesos.tipo_archivo ta on ta.cod_tipo_file = ed.cod_tipo_file;            

i_dep_desc            varchar2(100);
i_pro_desc            varchar2(100);
i_dis_desc            varchar2(100); 
cod_max               char(20);
estado_entidad        number;
cod_actual            char(6); 
titulo                varchar(100);
anho                  varchar2(4);
ruc                   varchar2(20);
depart                char(2);
provin                char(4);
distri                char(6);
descripcion           varchar2(100);
abreviatura           varchar2(30);
direccion             varchar2(200); 
telefono              varchar2(11);
fax                   varchar2(11);
telefono_anx          varchar2(5);
fax_anx               varchar2(12);
web                   varchar2(60);
email                 varchar2(60);
nombre_soli           varchar2(60);
cargo_soli            varchar2(60);
siaf                  char(6);
sect                  char(2);
plieg                 char(4);
uject                 char(4);
activ                 char(1);
instanc               char(1); 
activo                number;
nomb_titular          varchar2(60);
telef_titular         varchar2(12);
celular_titular       varchar2(11);
email_titular         varchar2(60);
telef_anx_titular     varchar2(5);
nom_logistica         varchar2(60);
telef_logistica       varchar2(12);
celular_logistica     varchar2(11);
email_logistica       varchar2(60);  
telef_anx_logistica   varchar2(5);
nombre_infor          varchar2(60);
telef_infor           varchar2(12);
celular_infor         varchar2(11);  
email_infor           varchar2(60);
telef_anx_infor       varchar2(5);
cod_consu_actual      char(6);
departam              varchar2(60);
provinc               varchar2(60);
distrit               varchar2(60);
codi_depa             char(2);
codi_provi            char(4);
codi_distri           char(6);
departament_desc      varchar2(60); 
provincia_desc        varchar2(60);
distrito_desc         varchar2(60);
anhos                 varchar2(4);
dispositivo           varchar2(200);
document_modificacion varchar2(150);
lv_ruta_file          varchar2(250);
document_pres         varchar2(100);
observaciones_clasi   varchar2(500);
v_ubig                varchar2(500);
i                     number;
BEGIN

    lv_ruta_file    := 'mon/docs/contratos/'  || session__anhoentidad||'/'||session__eue_codigo||'/';    
    usp_print('<input type="hidden" name="WriteFileDirectory"          value="FileSinged">');
    usp_print('<input type="hidden" name="WriteFileDirectoryDynamic"   value="'||lv_ruta_file||'"></input>');         
    usp_print('<input type="hidden" name="v_ident_entidad" value="1" />');
if session__eue_codigo is not null then
select distinct se.codconsucode, se.anhoentidad, se.n_ruc, se.dep_coddpto, se.pro_codprov, se.dis_coddist, se.descripcion, se.abreviatura, se.direccion, se.telefono,
se.faximil, se.telefono_anx, se.faximil_anx, se.url_web, se.email, se.tnomb_solicitante, se.tcargo_solicitante,se.codsiaf, se.sector,
 se.uejecutora, se.actividad, se.instancia, se.activo, se.tnomb_titular, se.ttelef_titular, se.tcelular_titular, se.temail_titular, se.ttelef_anx_titular,
 se.tnombjefelogis, se.ttelefjefelogis, se.tcelular_jefe_logis, se.temail_jefe_logis, se.ttelef_anx_jefe_logis, se.tnombjefeinfor, se.ttelefjefeinfor,
 se.tcelular_jefe_infor, se.temail_jefe_infor, se.ttelef_anx_jefe_infor, se.codconsucode, se.dep_coddpto, se.pro_codprov, se.dis_coddist,
 du.dep_desc, pu.pro_desc, sdu.dis_desc, se.pliego, se.dispositivo_legal, se.document_modif, se.document_presu, se.observaciones_clasif
 
into cod_actual, anho, ruc, depart, provin, distri, descripcion, abreviatura, direccion, telefono, fax, telefono_anx, fax_anx, web, email, nombre_soli,
     cargo_soli, siaf, sect, uject, activ, instanc, activo, nomb_titular, telef_titular, celular_titular, email_titular, telef_anx_titular,
     nom_logistica, telef_logistica, celular_logistica, email_logistica, telef_anx_logistica, nombre_infor, telef_infor, celular_infor, email_infor,
     telef_anx_infor, cod_consu_actual, codi_depa, codi_provi, codi_distri, departament_desc, provincia_desc, distrito_desc, plieg, dispositivo, document_modificacion,
     document_pres, observaciones_clasi
from sease.entidades se
left join sease.sector ss on ss.sec_codigo = se.sector
left join sease.pliego sp on sp.pli_codigo = se.pliego and sp.sec_codigo = ss.sec_codigo
left join sease.dep_ubigeo du on du.dep_codigo = se.dep_coddpto
left join sease.prov_ubigeo pu on pu.dep_codigo||''||pu.pro_codigo = se.pro_codprov
left join sease.dist_ubigeo sdu on sdu.dep_codigo||''||sdu.pro_codigo||''||sdu.dis_codigo = se.dis_coddist
where se.codconsucode = session__eue_codigo
and se.anhoentidad =  session__anhoentidad;
v_ubig := i_dep_desc||'/'||i_pro_desc||'/'||i_dis_desc;
titulo := descripcion;
estado_entidad := 2;

else
  titulo := 'REGISTRAR NUEVA ENTIDAD';
  estado_entidad := 1;
 
end if;
   
select max(e.codconsucode)+1 into cod_max from sease.entidades e
where e.codconsucode not in ('999999')
and e.anhoentidad = session__anhoentidad; 

usp_print('<script language="javascript">

function array_sector(texto,valor){
this.texto = texto
this.valor = valor}

');

for xrow2 in cSector loop 
  i := 1;
usp_print('var A'||xrow2.sec_codigo||'= new Array();');
      for xrow3 in cPliego(xrow2.sec_codigo) loop
             usp_print('A'||xrow2.sec_codigo||'['||i||'] = new array_sector("'||xrow3.desc_pliego||'","'||xrow3.pli_codigo||'"); ');
             i := i+1;
      end loop;
end loop;

usp_print('
function array_actividad(texto,valor){
this.texto = texto
this.valor = valor}

');

for xrow in cActividad loop 
  i := 1;
usp_print('var '||xrow.act_ccodigo||'= new Array();');
        for xrow1 in cInstancia(xrow.act_ccodigo) loop
             usp_print(''||xrow.act_ccodigo||'['||i||'] = new array_actividad("'||xrow1.ins_vdesc||'","'||xrow1.ins_ccodigo||'"); ');
             i := i+1;
      end loop;
end loop;


usp_print('
function mostrar_array(cual,donde){
if(cual.selectedIndex != 0){
  donde.length=0
  cual = eval(cual.value)
  for(m=0;m<cual.length;m++){
    var nuevaOpcion = new Option(cual[m].texto);
    donde.options[m] = nuevaOpcion;
   
    if(cual[m].valor != null){
      donde.options[m].value = cual[m].valor
      }
    else{
      donde.options[m].value = cual[m].texto
      }
    }
  }
}

function listar_pliegos(sect){

  thisform.scriptdo.value = "doform";
  thisform.submit();
  }
   
function getUpdate(){
  thisform.anio.value = thisform.v_anho.value;
thisform.scriptdo.value = "doform";
 
  thisform.submit();
   }  

function f_validaCampoNumerico1() { 
  
           var key=window.event.keyCode;   
           if (key <48 || key > 57 ){       
            window.event.keyCode=0;     
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

function f_init(){
  thisform.v_num_ruc.value="";
  thisform.v_razon_social.value="";
  thisform.scriptdo.value = "doView";
  thisform.submit();      
  }  

function SectPlieModal(indice){
       window.open(''portlet5open.asp?_portletid_=mod_rec1_a001_manten_entidad&scriptdo=doNewClas&valor=''+indice,''self'',''toolbar=no,Width=500px,Height=270px,scrollbars=yes,modal=yes,dependent,alwaysRaised'')

 } 

function RtnUbigeo(dep_codigo,pro_codigo,dis_codigo,dep_desc,pro_desc,dis_desc,lugar_ejec)
    { 
        if (thisform.tipo_ubi.value==1)
        {
            thisform.dep_codigo.value=dep_codigo;
            thisform.pro_codigo.value=pro_codigo;
            thisform.dis_codigo.value=dis_codigo;
            thisform.lugar_ejec.value=dep_desc+"/"+pro_desc+"/"+dis_desc;
        }
        if (thisform.tipo_ubi.value==2)
        {
            thisform.v_dep_codigo_vb.value=dep_codigo;
            thisform.v_pro_codigo_vb.value=pro_codigo;
            thisform.v_dis_codigo_vb.value=dis_codigo;
            thisform.lugar_ejec_vb.value=dep_desc+"/"+pro_desc+"/"+dis_desc;
           
        }
        if (thisform.tipo_ubi.value==3)
        {
            thisform.dep_codigo_ed.value=dep_codigo;
            thisform.pro_codigo_ed.value=pro_codigo;
            thisform.dis_codigo_ed.value=dis_codigo;
            thisform.lugar_ejec_ed.value=dep_desc+"/"+pro_desc+"/"+dis_desc;
        }
    }  
    
    
    function BuscaUbigeo(tipo)
    {
        thisform.tipo_ubi.value=tipo;
        window.open("ControllerServletOpen?portletid=BuscadorUbigeo","","toolbar=no,Width=800,Height=400,scrollbars=yes,modal=yes,dependent,alwaysRaised");
    }
    
    function registrar_entidad(){
    if(thisform.v_num_ruc.value==""){
      alert("Tiene que Ingresar el Ruc de la Entidad");
      return false;
     }else{
      if(thisform.v_num_ruc.value.length != 11){
       alert("No es un formato del N\xfamero de RUC");
       thisform.v_num_ruc.focus();
       return false;
     }
     
     }
    if(thisform.v_razon_social.value==""){
    alert("Tiene que Ingresar la Raz\xf3n Social de la Entidad");
    return false;
     }
     if(thisform.lugar_ejec_vb.value==""){
    alert("Tiene que Ingresar el Ubigeo de la Entidad");
    return false;
     }
              
              
         if(thisform.v_correo_titular.value != ""){     
        if (!(isEmail(thisform.v_correo_titular.value)))
            {
              alert("Ingrese un formato correcto para el Correo del Titular");
                thisform.v_correo_titular.focus();
                thisform.v_correo_titular.select();
              return false;
              }}
          if(thisform.v_correo_logistica.value != ""){    
         if (!(isEmail(thisform.v_correo_logistica.value)))
            {
              alert("Ingrese un formato correcto para el Correo del Jefe del \xd3rgano Encargado de las Contrataciones");
                thisform.v_correo_logistica.focus();
                thisform.v_correo_logistica.select();
              return false;
              }}
           if(thisform.v_correo_informatica.value != ""){       
          if (!(isEmail(thisform.v_correo_informatica.value)))
            {
              alert("Ingrese un formato correcto para el Correo del Jefe de Inform\xe1tica");
                thisform.v_correo_informatica.focus();
                thisform.v_correo_informatica.select();
              return false;
              }   }        
     
   if(thisform.pfiletoupload1.value != ""){
      
      extencion1 = thisform.pfiletoupload1.value
      
      extencion1 = extencion1.substring((extencion1.length)-3,extencion1.length)
      
      if (extencion1 != "doc" && extencion1 != "zip" && extencion1 != "pdf")
            {
               alert("Este tipo de archivo no est\xe1 permitido, intente nuevamente.");
               thisform.pfiletoupload1.focus();    
               return false;
            }
      
      }
      
      if(thisform.pfiletoupload2.value != ""){
      
      extencion2 = thisform.pfiletoupload2.value
      
      extencion2 = extencion2.substring((extencion2.length)-3,extencion2.length)
      
       if (extencion2 != "doc" && extencion2 != "zip" && extencion2 != "pdf")
            {
               alert("Este tipo de archivo no est\xe1 permitido, intente nuevamente.");
               thisform.pfiletoupload2.focus();    
               return false;
            }
      
      }
      
      if(thisform.pfiletoupload3.value != ""){
      
       extencion3 = thisform.pfiletoupload3.value
       
       extencion3 = extencion3.substring((extencion3.length)-3,extencion3.length)
            
            if (extencion3 != "doc" && extencion3 != "zip" && extencion3 != "pdf")
            {
               alert("Este tipo de archivo no est\xe1 permitido, intente nuevamente.");
               thisform.pfiletoupload3.focus();    
               return false;
            }
      }
      
      
     if(confirm("¿Desea guardar los datos ingresados?")){
      thisform.scriptdo.value = "doInsertEntidad";
      
      if(thisform.v_cod_actual.value != ""){
         
         thisform.cod_entidad.value = thisform.v_cod_actual.value;
         thisform.ent_activo.value = "2";
      
      }else{
         thisform.cod_entidad.value = thisform.v_cod_max.value;
         thisform.ent_activo.value = "3";
      }
      
      
            thisform.submit();
     }
    }

</script>');

usp_print('<style type="text/css">
.no_mostrar{display:none;}
</style>
');

usp_print('

                <input name=v_dep_codigo_vb readonly="true" value="'||v_dep_codigo_vb||'" type="hidden" />
                <input name=v_pro_codigo_vb readonly="true" value="'||v_pro_codigo_vb||'" type="hidden"/>
                <input name=v_dis_codigo_vb readonly="true" value="'||v_dis_codigo_vb||'" type="hidden"/>
                <INPUT name="tipo_ubi" type="hidden"/>
');
 
 usp_print('<table border="0" class=tableform cellpadding="3" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%">
             <tr><td align="left"><h3>'||titulo||'</h3></td>
             <td align="right">&nbsp;&nbsp;<input type="button" name="bot" '||case when session__eue_codigo is null then 'value="Grabar" onclick="registrar_entidad();"' else 'value="Grabar" onclick="registrar_entidad();"' end||' ></td>
             </tr>
             </table></br></br>'); 
         
 usp_print('<table border="0" class=tableform cellpadding="3" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%">
             <tr><td  colspan="2" align="left"><h3>Datos Generales de la Entidad</h3></td></tr>
             <tr>
             </table>');
             
 usp_print('<table border="0" class=tableform cellpadding="3" cellspacing="0" align="center" style="border-collapse: collapse" bordercolor="#111111" width="90%">
 
 
 <tr class="no_mostrar">
             <td class=c1>A¿o: </td>  
             <td class=c2><select name="v_anho" onchange="getUpdate()">');
     if codigo_consucode is null then             
             usp_print('<option value="'||session__anhoentidad||'">'||session__anhoentidad||'</option>');
     else
           for xrow in cAnho loop 
             usp_print('<option value="'||xrow.anhoentidad||'" '||case when xrow.anhoentidad = anio then 'selected' else '' end||'>'||xrow.anhoentidad||'</option>');
           end loop;     
     end if;            
             usp_print('</select>
             </td>
             <td class=c2>A&ntilde;o de la Entidad</td>
 </tr>');
 
if departament_desc is not null then

i_dep_desc := departament_desc;

end if;

if provincia_desc is not null then

i_pro_desc := provincia_desc;

end if;

if distrito_desc is not null then

i_dis_desc := distrito_desc;

end if;

if session__eue_codigo is null then
            usp_print('
         
         <input type="hidden" name="v_cod_max" id="v_cod_max" readOnly value="'||cod_max||'" />');
       
else
  usp_print('<input type="hidden" name="anio" value="'||session__anhoentidad||'" />');
  usp_print('<tr class="no_mostrar">
           <td class=c1>C&oacute;digo:</td>  
           <td class=c2><input type="text" name="codigo_consucode" readOnly value="'||session__eue_codigo||'" /></td>
           <td class=c2>C&oacute;digo de la Entidad</td>');
           
  end if;         
           usp_print('
        
          </tr>
 
          <tr class="no_mostrar">
              <td class=c1>Estado Actual: </td>
              <td class=c2><select name="v_cod_estado" disabled>');
              if estado_entidad = 1 then
                 usp_print('
             <option value="1">ACTIVO</option>
                 '); 
               else
              usp_print('<option>--Seleccionar--</option>
              <option value="1" '||case when activo = 1 then 'selected readonly' else '' end||'>ACTIVO</option>
              <option value="0" '||case when activo = 0 then 'selected readonly' else '' end||'>INACTIVO</option>');      
              end if;
              
               usp_print('</select></td>
              <td class=c2>Estado Actual de la Entidad</td>
          </tr>

          <tr>
              <td class=c1>Nro. de RUC: </td>
              <td class=c2><input readOnly style="background-color: #D2D2D2;" name="v_num_ruc" id="v_num_ruc" type=text size="50" value="'||ruc||'" maxlength="11" onkeypress="f_validaCampoNumerico1()"></td>
              <td class=c2>N&uacute;mero el RUC de la Entidad</td>
          </tr>
          
          <tr>
              <td class=c1>Raz&oacute;n Social: </td>
              <td class=c2><input readOnly name="v_razon_social" style="background-color: #D2D2D2;" id="v_razon_social" size="50" value="'||descripcion||'"></td>
               <td class=c2>Nombre de la Entidad</td>
          </tr>
          
          <tr>
              <td class=c1>Sigla: </td>
              <td class=c2><input readOnly name="v_sigla" style="background-color: #D2D2D2;" id="v_sigla" size="50" value="'||abreviatura||'"></td>
              <td class=c2>Sigla de la Entidad</td>
          </tr>

          <tr>
              <td class=c1>(*) Ubigeo: </td>
              <td class=c2><input name="lugar_ejec_vb" size="45" class=ViewSelect onclick="BuscaUbigeo(2)" readonly '||case when session__eue_codigo is not null then ' value="'||i_dep_desc||'/'||i_pro_desc||'/'||i_dis_desc||'" ' else '' end||'  />&nbsp;&nbsp;
            &nbsp;&nbsp;
             
              <td class=c2>Seleccione Departamento / Provincia / Distrito</td>
          </tr>
          
          <tr>
              <td class=c1>Direcci&oacute;n: </td>
              <td class=c2><input name="v_direccion" maxlength="200" size="50" value="'||direccion||'"></td>
              <td class=c2>Ingrese la direcci&oacute;n de la Entidad</td>
          </tr>
          
          <tr>
              <td class=c1>Tel&eacute;fono: </td>
              <td class=c2><input name="v_telefono" id="txtPreUni" maxlength="11" size="25" value="'||telefono||'" ></td>
              <td class=c2>Ingrese el n&uacute;mero Telef&oacute;nico de la Entidad</td>
          </tr>
          
          <tr>
              <td class=c1>Anexo de Tel&eacute;fono: </td>
              <td class=c2><input name="v_anex_telf" id="v_anex_telf" maxlength="5" size="25" value="'||telefono_anx||'"  /></td>
              <td class=c2>Ingrese n&uacute;mero de Anexo Telef&oacute;nico de la Entidad</td>
          </tr>
          
          <tr>
              <td class=c1>Fax: </td>
              <td class=c2><input name="v_fax" id="v_fax" maxlength="11" size="25" value="'||fax||'" /></td>
              <td class=c2>Ingrese el n&uacute;mero del fax de la Entidad</td>
          </tr>
          
          <tr>
              <td class=c1>Otro Tel&eacute;fono: </td>
              <td class=c2><input name="v_anex_fax" id="v_anex_fax" maxlength="11" size="25" value="'||fax_anx||'"  /></td>
              <td class=c2>Ingrese el n&uacute;mero del otro Tel&eacute;fono de la Entidad</td>
          </tr>
 
          <tr>
              <td class=c1>P&aacute;gina Web: </td>
              <td class=c2><input name="v_pag_web" maxlength="60" id="v_pag_web" size="50" value="'||web||'"></td>
              <td class=c2>Ingrese la p&aacute;gina Web de la Entidad</td>
          </tr>
           
          <tr class="no_mostrar">
              <td class=c1>(*) Nombre y Apellidos del Solicitante: </td>
              <td class=c2><input name="v_nom_sol" id="v_nom_sol"  size="50" value="'||nombre_soli||'"></td>
              <td class=c2>Ingrese el nombre Completo del Solicitante</td>
          </tr class="no_mostrar">
          <tr class="no_mostrar">
              <td class=c1>(*) Cargo del Solicitante:</td>
              <td class=c2><input name="v_cargo_sol" id="v_cargo_sol" size="50" value="'||cargo_soli||'"></td>
              <td class=c2>Ingrese el Cargo del Solicitante</td>
          </tr>
          
          <tr class="no_mostrar">
              <td class=c1>(*) Correo Electr&oacute;nico del Solicitante: </td>
              <td class=c2><input name="v_correo" id="v_correo" size="50" value="'||email||'" /></td>
              <td class=c2>Ingrese el correo Electr&oacute;nico del Solicitante</td>
          </tr>
          
          <tr class="no_mostrar">
              <td class=c1>(*) Dispositivo Legal que autoriza la creaci&oacute;n de la Entidad: </td>
              <td class=c2><input name="v_dispositivo" id="v_dispositivo" size="50" value="'||dispositivo||'" '||case when codigo_consucode is not null then 'readOnly' else '' end||' /></td>
              <td class=c2>Ingrese el dispositivo legal</td>
          </tr>');
          
         if session__eue_codigo is not null then
          usp_print('<tr class="no_mostrar">
              <td class=c1>(*) Documento que autoriza la modificaci&oacute;n: </td>
              <td class=c2><input name="v_doc_autoriza" id="v_doc_autoriza" size="50" value="" /></td>
              <td class=c2>Ingrese el Documento que autoriza la modificaci&oacute;n</td>
          </tr>');
          end if;
          
          usp_print('</table></br></br>'); 
     
  usp_print('<input name=iv_dep_desc readonly="true" value="" type="hidden" />
             <input name=iv_pro_desc readonly="true" value="" type="hidden" />
             <input name=iv_dis_desc readonly="true" value="" type="hidden" />');
                 
 /********************************************************Datos Presupuestales de la Entidad***************************************************************************/        
             
  usp_print('<table border="0" class=tableform cellpadding="3" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%">
             <tr><td  colspan="2" align="left"><h3>Datos Presupuestales de la Entidad</h3></td></tr>
             <tr>
             </table>');         
             
  usp_print('<table border="0" class=tableform cellpadding="3" cellspacing="0" align="center" style="border-collapse: collapse" bordercolor="#111111" width="90%">
        
          <tr>
           <td class=c1>C&oacute;digo SIAF: </td>
           <td class=c2><input name="v_cod_siaf" style="background-color: #D2D2D2;" readOnly id="v_cod_siaf" type=text maxlength="6" size="25" value="'||siaf||'" onkeypress="f_validaCampoNumerico1()"></td>
           <td class=c2>C&oacute;digo SIAF de la Entidad</td>
          </tr>
          <tr>
              <td class=c1>Sector: </td>
              <td class=c2><div id="div_sector"><select style="background-color: #D2D2D2;" name="v_sector" value="" onchange="mostrar_array(this,thisform.v_pliego)" style="width:460px;">
          ');
          
          
          for xrow in cSector loop
           usp_print('<option  value="A'||xrow.sec_codigo||'" '||case when sect = xrow.sec_codigo then 'selected' else '' end||'>'||xrow.sec_desc||'</option>');
          end loop;
            
         usp_print('
             
              </select>
              </div></td>
              <td class=c2>Sector de la Entidad</td>
          </tr>');
         
          usp_print('<tr>
          <td class=c1>Pliego: </td>
          <td class=c2><select style="background-color: #D2D2D2;" style="width:460px;" name="v_pliego" value="">');
            for xrow in cPliego1(sect) loop
           usp_print('<option  value='||xrow.pli_codigo||' '||case when xrow.pli_codigo = plieg then 'selected' else '' end||'>'||xrow.desc_pliego||'</option>');
          end loop;         
    
          usp_print('</select>
             </td>
              <td class=c2>Pliego de la Entidad</td>
          </tr>
          <tr>
              <td class=c1>Unidad Ejecutora: </td>
              <td class=c2><input readOnly name="v_uni_ejecu" style="background-color: #D2D2D2;" id="v_uni_ejecu" size="25" maxlength="4" value="'||uject||'" onkeypress="f_validaCampoNumerico1()"></td>
              <td class=c2>Unidad Ejecutora de la Entidad</td>
          </tr>
          
          <tr class="no_mostrar">
              <td class=c1>Documento: </td>
              <td class=c2><input name="v_documento_presup" id="v_documento_presup" size="50" maxlength="100" value="'||document_pres||'"></td>
              <td class=c2>Ingrese el detalle del documento</td>
          </tr>
          
        
             </table></br></br>');  
             
             usp_print('<input type="hidden" name="v_cod_dep" value="'||codi_depa||'" />');
             usp_print('<input type="hidden" name="v_cod_pro" value="'||codi_provi||'" />');
             usp_print('<input type="hidden" name="v_cod_dis" value="'||codi_distri||'" />');
             usp_print('<input type="hidden" name="v_cod_actual" value="'||cod_actual||'" />');
             usp_print('<input type="hidden" name="cod_entidad" value="" />');
             usp_print('<input type="hidden" name="ent_activo" value="" />');
             
  /*******************************CLASIFICACION DE LA ENTIDAD**************************/
  
  usp_print('<table border="0" class="no_mostrar" cellpadding="3" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%">
             <tr><td  colspan="2" align="left"><h3>Clasificaci&oacute;n de la Entidad</h3></td></tr>
             <tr>
             </table>');         
             
  usp_print('<table border="0" class="no_mostrar" cellpadding="3" cellspacing="0" align="center" style="border-collapse: collapse" bordercolor="#111111" width="90%">
      
         
          <tr>
              <td class=c1>Actividad: </td>
              <td class=c2><select name="v_actividad" onchange="mostrar_array(this,thisform.v_instancia)" style="width:310px;">
              <option value="">--Seleccionar--</option>');
           for xrow in cActividad loop
             usp_print('<option value='||xrow.act_ccodigo||' '||case when activ = xrow.act_ccodigo then 'selected' else '' end||'   >'||xrow.act_vdesc||'</option>');
           
           end loop;   
           usp_print('   
              </select></td>
           <td class=c2>Seleccione el tipo de Actividad</td>
          </tr>
         
          <tr>
              <td class=c1>Instancia: </td>
              <td class=c2>');
              
              USP_PRINT('<select name="v_instancia" style="width:310px;" value="">
              <option value="">--Seleccionar--</option>');
               for xrow in cInstancia1(activ) loop
             usp_print('<option '||case when xrow.ins_ccodigo = instanc then 'selected' else '' end||' value='||xrow.ins_ccodigo||' >'||xrow.ins_vdesc||'</option>');
           
           end loop;
               USP_PRINT('</select></td>
         <td class=c2>Seleccione el tipo de Instancia</td>
          </tr>
          
          <tr>
              <td class=c1>Observaci&oacute;n: </td>
              <td class=c2><input name="v_observaciones_clasif" id="v_observaciones_clasif" size="50" maxlength="500" value="'||observaciones_clasi||'"></td>
              <td class=c2>Ingrese las Observaciones</td>
          </tr>
          
             </table>');  
/*******************************Datos del titular**************************/                     
             
 usp_print('<table border="0" class=tableform cellpadding="3" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%">
             <tr><td  colspan="2" align="left"><h3>Datos del Titular de la Entidad</h3></td></tr>
             <tr>
             </table>');
             
 usp_print('<table border="0" class=tableform cellpadding="3" cellspacing="0" align="center" style="border-collapse: collapse" bordercolor="#111111" width="90%">
          
          <tr>
           <td class=c1>Nombres y Apellidos: </td>
           <td class=c2><input name="v_nombre_titular" id="v_nombre_titular" maxlength="60" type=text size="50" value="'||nomb_titular||'" /></td>
           <td class=c2>Ingrese el Nombre completo del Titular</td>
          </tr>
          
          <tr>
           <td class=c1>Tel&eacute;fono: </td>
           <td class=c2><input name="v_tele_titular" id="v_tele_titular" maxlength="11" value="'||telef_titular||'" size="25"></td>
           <td class=c2>Ingrese el tel&eacute;fono del Titular</td>
          </tr>
          
          <tr>
           <td class=c1>Anexo Telef&oacute;nico: </td>
           <td class=c2><input name="v_anex_titular" id="v_anex_titular" maxlength="5" value="'||telef_anx_titular||'" size="25" value="" /></td>
           <td class=c2>N&uacute;mero del Anexo Telef&oacute;nico del Titular</td>
          </tr>
          
          <tr>
           <td class=c1>Celular Institucional: </td>
           <td class=c2><input name="v_cel_titular" id="v_cel_titular" maxlength="11" size="25" value="'||celular_titular||'" ></td>
           <td class=c2>Ingrese el N&uacute;mero del Celular del Titular</td>
          </tr>
          
          
          <tr>
              <td class=c1>Correo Electr&oacute;nico: </td>
              <td class=c2><input name="v_correo_titular" id="v_correo_titular" maxlength="60" size="50" value="'||email_titular||'" /></td>
              <td class=c2>Ingrese el Correo Electr&oacute;nico del Titular</td>
          </tr>');
          
          
          usp_print('<tr>
              <td class=c1>Documento que autoriza la designaci&oacute;n: </td>
              <td class=c2><input type="file"  name="pfiletoupload1"  value="">&nbsp;&nbsp;');
              
              for xrow in  cEntidades_doc1 loop
              usp_print('<a target=_blank href="'||session__FileSingedHTTP||''||xrow.doc_url||'"><img src="'||xrow.icon_tipo_file||'" border="0" width="30" height="30"/>
              '||to_char(xrow.fec_upload,'dd/mm/yyyy hh24:mi')||'</a>');
              end loop;
              usp_print('</td>
              <td class=c2>Tipos de archivo permitidos: *.doc, *.pdf, *.zip</td>
          </tr>
          
             </table></br></br>');  
             
/*******************************DATOS DEL JEFE DEL ORGANO ENCARGADO DE LAS CONTRATASIONES*************************************************************************************/                               
 
usp_print('<table border="0" class=tableform cellpadding="3" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%">
             <tr><td  colspan="2" align="left"><h3>Datos del Jefe del &Oacute;rgano Encargado de las Contrataciones</h3></td></tr>
             <tr>
             </table>');
             
 usp_print('<table border="0" class=tableform cellpadding="3" cellspacing="0" align="center" style="border-collapse: collapse" bordercolor="#111111" width="90%">
         
          <tr>
           <td class=c1>Nombres y Apellidos: </td>
           <td class=c2><input name="v_nombre_logistica" id="v_nombre_logistica"  maxlength="60" value="'||nom_logistica||'" type=text size="50" value="" /></td>
           <td class=c2>Ingrese el nombre completo del Jefe del &Oacute;rgano Encargado de las Contrataciones</td>
          </tr>
          
          <tr>
           <td class=c1>Tel&eacute;fono: </td>
           <td class=c2><input name="v_tele_logistica" id="v_tele_logistica" maxlength="11" size="25" value="'||telef_logistica||'" ></td>
           <td class=c2>Ingrese el tel&eacute;fono del Jefe del &Oacute;rgano Encargado de las Contrataciones</td>
          </tr>
          
          
          <tr>
           <td class=c1>Anexo Telef&oacute;nico: </td>
           <td class=c2><input name="v_anex_logistica" id="v_anex_logistica" maxlength="5" size="25" value="'||telef_anx_logistica||'" /></td>
           <td class=c2>Ingrese el anexo del Jefe del &Oacute;rgano Encargado de las Contrataciones</td>
          </tr>
          
          <tr>
           <td class=c1>Celular Institucional: </td>
           <td class=c2><input name="v_cel_logistica" id="v_cel_logistica" maxlength="11" size="25" value="'||celular_logistica||'" ></td>
           <td class=c2>Ingrese el celular del Jefe del &Oacute;rgano Encargado de las Contrataciones</td>
          </tr>
          
          <tr>
           <td class=c1>Correo Electr&oacute;nico: </td>
           <td class=c2><input name="v_correo_logistica" maxlength="60" id="v_correo_logistica" size="50" value="'||email_logistica||'" /></td>
           <td class=c2>Ingrese el correo Electr&oacute;nico del Jefe del &Oacute;rgano Encargado de las Contrataciones</td>
          </tr>');
          
         usp_print('<tr>
              <td class=c1>Documento que autoriza la designaci&oacute;n: </td>
              <td class=c2><input type="file"  name="pfiletoupload2"  value="">&nbsp;&nbsp;');
              
              for xrow in  cEntidades_doc2 loop
              usp_print('<a target=_blank href="'||session__FileSingedHTTP||''||xrow.doc_url||'"><img src="'||xrow.icon_tipo_file||'" border="0" width="30" height="30"/>
              '||to_char(xrow.fec_upload,'dd/mm/yyyy hh24:mi')||'</a>');
              end loop;
              usp_print('</td>
              <td class=c2>Tipos de archivo permitidos: *.doc, *.pdf, *.zip</td>
          </tr>
          
             </table></br></br>');  

/*******************************DATOS DEL JEFE DE Informatica*************************************************************************************/                               

usp_print('<table border="0" class=tableform cellpadding="3" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%">
             <tr><td  colspan="2" align="left"><h3>Datos del Jefe de Inform&aacute;tica</h3></td></tr>
             <tr>
             </table>');
             
 usp_print('<table border="0" class=tableform cellpadding="3" cellspacing="0" align="center" style="border-collapse: collapse" bordercolor="#111111" width="90%">
       
          <tr>
           <td class=c1>Nombre y Apellidos: </td>
           <td class=c2><input name="v_nombre_informatica" maxlength="60" id="v_nombre_informatica" type=text size="50" value="'||nombre_infor||'" ></td>
           <td class=c2>Ingrese el nombre completo del Jefe de Inform&aacute;tica</td>
          </tr>
          
          <tr>
           <td class=c1>Tel&eacute;fono: </td>
           <td class=c2><input name="v_tele_informatica" id="v_tele_informatica" maxlength="11" size="25" value="'||telef_infor||'" ></td>
           <td class=c2>Ingrese el tel&eacute;fono del Jefe de Inform&aacute;tica</td>
          </tr>
          
          
          <tr>
           <td class=c1>Anexo Telef&oacute;nico: </td>
           <td class=c2><input name="v_anex_informatica" id="v_anex_informatica" maxlength="5" size="25" value="'||telef_anx_infor||'" /></td>
           <td class=c2>Ingrese el anexo del Jefe de Inform&aacute;tica</td>
          </tr>
          
          
          
          <tr>
           <td class=c1>Celular Institucional: </td>
           <td class=c2><input name="v_cel_informatica" id="v_cel_informatica" maxlength="11" size="25" value="'||celular_infor||'" /></td>
           <td class=c2>Ingrese el celular del Jefe de Inform&aacute;tica</td>
          </tr>
          
          
          <tr>
           <td class=c1>Correo Electr&oacute;nico: </td>
           <td class=c2><input name="v_correo_informatica" id="v_correo_informatica" maxlength="60" size="50" value="'||email_infor||'" /></td>
           <td class=c2>Ingrese el correo Electr&oacute;nico del Jefe de Inform&aacute;tica</td>
          </tr>');
          
    
         usp_print('<tr>
              <td class=c1>Documento que autoriza la designaci&oacute;n: </td>
              <td class=c2><input type="file"  name="pfiletoupload3"  value="">&nbsp;&nbsp;');
              
              for xrow in  cEntidades_doc3 loop
              usp_print('<a target=_blank href="'||session__FileSingedHTTP||''||xrow.doc_url||'"><img src="'||xrow.icon_tipo_file||'" border="0" width="30" height="30"/>
              '||to_char(xrow.fec_upload,'dd/mm/yyyy hh24:mi')||'</a>');
              end loop;
              usp_print('</td>
              <td class=c2>Tipos de archivo permitidos: *.doc, *.pdf, *.zip</td>
          </tr>
          
             </table></br></br><p>(*) Campos Requeridos</p>');
             
             usp_print('<script>
  if(thisform.v_anho.value == "'||session__anhoentidad||'"){
 thisform.bot.disabled = false;
  }
  else
    thisform.bot.disabled = true;
             
             </script>');  

END;
/********************************************************************************************************/
/********************************************************************************************************/
/********************************************************************************************************/
PROCEDURE USP_REC_A001_REENVIAR_EMAIL(codigo_consucode varchar2,
                                      session__anhoentidad varchar2)
  IS 
  
   as_usumail                   varchar2(100) := '';
   as_usumail2                  varchar2(100) := '';
   msg                          varchar2(4000):= '';
   lv_asunto                    varchar2(1000):= '';
   ls_msg                       varchar2(4000):= ''; 
   se_codconsucode              varchar2(100);
   se_n_ruc                     varchar2(20);
   se_descripcion               varchar2(200);
   se_tnomb_solicitante         varchar2(100);
   se_tcargo_solicitante        varchar2(100);
   se_f_registro                varchar2(100);
   se_email                     varchar2(100);
   se_email2                    varchar2(100);
  BEGIN
    
 select se.codconsucode, se.n_ruc, se.descripcion, se.tnomb_solicitante, se.tcargo_solicitante, se.f_registro, se.email, se.email2
 into  se_codconsucode, se_n_ruc, se_descripcion, se_tnomb_solicitante, se_tcargo_solicitante, se_f_registro, se_email, se_email2
 from sease.entidades se where se.codconsucode = codigo_consucode
                         and se.anhoentidad = session__anhoentidad;
                         
                         
                         
                        

ls_msg    := '
      <div align="center">
      <table width="600" border="0">
      <tr>
      <td height="43" colspan="3" align="center"><p><strong>
        <h3>
        <span style="color:black;">Bienvenido al Sistema Electr&oacute;nico de Contrataciones del Estado (SEACE)</span></b></strong></p></td>
      </tr>
      <tr>
      <td colspan="3" align="center"><h2><span style="color:black;">NOTIFICACI&Oacute;N DEL REGISTRO DE ENTIDADES CONTRATANTES-REC</span></h2></td>
      </tr>
      <tr>
      <td colspan="3" align="center"><B>(Art. 283&ordm; del D.S. N&ordm; 184-2008-EF)</B></td>
      </tr>
      <tr>
      <td colspan="3"><p>&nbsp;</p>
        <p align="justify">Se comunica que su Entidad ha sido registrada en el REC, para efectos del registro de la informaci&oacute;n
          de las contrataciones de su Entidad en el SEACE</p>
        <p>&nbsp;</p></td>
      </tr>
      
      <tr>
      <td align="left"><b>Entidad:</b></td>
      <td align="left">'||upper(se_descripcion)||'</td>
      </tr>
      
      <tr>
      <td align="left"><b>RUC:</b></td>
      <td align="left">'||se_n_ruc||'</td>
      </tr>
      
      <tr>   
      <td align="left"><b>Fecha y Hora del Registro:</b></td>
      <td align="left">'||se_f_registro||'</td>
      </tr>
      
      <tr>   
      <td align="left"><b>Nombres y Apellidos del solicitante del registro:</b></td>
      <td align="left">'||upper(se_tnomb_solicitante)||'</td>
      </tr>
      
      <tr>   
      <td align="left"><b>Cargo del solicitante del registro:</b></td>
      <td align="left">'||upper(se_tcargo_solicitante)||'</td>
      </tr>
      
      <tr>
      <td colspan="3"><p>&nbsp;</p>
        <p align="justify">Para interactuar con el SEACE deber&aacute; solicitar el Certificado SEACE (usuario y contrase&ntilde;a)
        ingresando al <a href="http://'||reg_procesos.f_get_conexiones(7)||'/Default.asp?_CALIFICADOR_=PORTLET.1.136.0.21.85&_REGIONID_=1&_PORTLETID_=136&_PRIVILEGEID_=1&_ORDERID_=0&_PAGEID_=21&_CONTENTID_=85&_USERID_=%3C%21--USERID--%3E&_EVENTNAME_=&_OBJECTFIRE_=&_OBJECTEVENT_=&scriptdo=&infsecu=3">Formulario Oficial de Creaci&oacute;n de Usuarios.</a></p>
        <p align="justify">&nbsp;</p>
        <hr /><br />
        <p>Esta notificaci&oacute;n ha sido enviada autom&aacute;ticamente. Por favor, no responda a este correo.</p>
        </td>
      </tr>
      </table>
      <div>                  
      ';

      as_usumail := se_email;
      as_usumail2 := se_email2;
      lv_asunto := 'Reenvio de Notificaci¿n de creaci¿n de la Entidad';
      if se_email is not null then
      reg_procesos.sp_send_mail_html(as_usumail, lv_asunto, ls_msg);
      end if;
      if se_email2 is not null then
      reg_procesos.sp_send_mail_html(as_usumail2, lv_asunto, ls_msg);
      end if;
      
      usp_print('<input type="hidden" name="codigo_consucode" value="'||codigo_consucode||'" />');
      usp_print('<input type="hidden" name="anio" value="'||session__anhoentidad||'" />');
      usp_print('<script type="text/javascript">
                  alert("Se ha reenviado la Notificaci\xf3n");
                  thisform.scriptdo.value = "doForm";
                  thisform.submit();
                  </script>');
      
    END;
    
    PROCEDURE USP_REC_A001_CONFIG_PARAM ( 
        v_cod_entidad varchar2,
        v_anio        varchar2 )
    IS
    /*
    ||    Author: Mart¿n Zanelli Mendoza
    ||    Overview: Procedimiento que inserta la nueva entidad en las tablas de configuraci¿n
    ||    Modificaciones:
    ||      21/03/2012 - Mart¿n Zanelli - Creaci¿n del procedimiento - Memo 97-2012/SDP-CC
    */    
        cursor c_tipo_proc is
        select tip_codigo from sease.tipo_proceso
        where tip_activo = 1
        and tip_codigo not in (15,16,17);
        
        cursor c_objeto is
        select codobjeto from reg_procesos.objeto
        where activo = 1;
    BEGIN
        --NOTA: este bucle se configura con par¿metros por defecto ya que se necesita para que se muestren 
        --los tipos de proceso en la ficha de convocatoria, sin embargo deberia basarse en par¿metros de entrada
        --que deben alimentarse desde la ficha de creaci¿n de entidades.
        for item in c_tipo_proc loop
            insert into reg_procesos.entidadue_anho_tipo_proceso 
            (   eue_codigo, eue_anho, tip_codigo, ind_bp_sin_igv,
                ind_particip_electron, ind_particip_electron_x_user,
                IND_USO_SIAF, IND_PSA, ind_proc_reserv,ind_entidad_tlc )
            values
            (   v_cod_entidad, v_anio, item.tip_codigo, 0, 
                0, 0, 
                1, 0, 0, 1 );
        end loop;
        
        for item in c_objeto loop
            insert into reg_procesos.entidad_objeto_categoria
            (   eue_codigo, eue_anho, cod_objeto, cod_categoria, estado )
            values
            (   lpad(v_cod_entidad, 6, '0'), v_anio, item.codobjeto, 0, 1 );
        end loop;
    END;
    
    PROCEDURE USP_GEN_JSCRIPT
    IS
    BEGIN
        usp_print('
        <script language="javascript">
        function isDigito(ls_car)
        {
            return ( (ls_car >="0") && (ls_car<="9") )
        }
        
        //Funcion que valida si el parametro de entrada se trata de un entero positivo.
        function isEntero(ls_cadena)
        {
            var i;
            for (i = 0; i < ls_cadena.length; i++)
            {
                if (!isDigito(ls_cadena.charAt(i)))
                     return false;
            }
            return true;
        }
        
        function ValidarNumero(obj)
        {
            if(!isEntero(obj.value))
            {
                alert("Ingrese un n\xfamero.");
                obj.select();
                obj.focus();
                return false;
            }
            return true;
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
        </script>');
    END;
    
    PROCEDURE USP_GET_TIPO_ENTIDAD_ACTUAL(
       ag_tipoent varchar2)
    IS
        /*
        ||    Author: Mart¿n Zanelli Mendoza
        ||    Overview: Procedimiento que recupera cuales son los tipos de entidades (antes llamado actividades)
        ||    Modificaciones:
        ||      23/03/2012 - Mart¿n Zanelli - Creaci¿n del procedimiento - Memo 97-2012/SDP-CC
        */
        cursor c_tipos_entidad is
        select a.act_ccodigo codigo, a.act_vdesc descripcion
        from sease.actividad a
        where act_sactivo = 1;
    BEGIN
        usp_print('<select name="ag_tipoent" style="width:250px" onchange="cargarSubTipoEntidad()">');
        usp_print('<option value="-1">Seleccione un valor ...</option>');
        usp_print('<option value="0" '||case when ag_tipoent = '0' then 'selected' else '' end||'>TODOS</option>');
        for item in c_tipos_entidad loop
            usp_print('<option value="'||item.codigo||'" '||case when ag_tipoent = item.codigo then 'selected' else '' end||'>'||item.descripcion||'</option>');
        end loop;
        usp_print('</select>');
    END; -- Procedure
    
    PROCEDURE USP_GET_SUBTIPO_ENTIDAD_ACTUAL(
        ag_tipoent varchar2)
    IS
        /*
        ||    Author: Mart¿n Zanelli Mendoza
        ||    Overview: Procedimiento que recupera cuales son los subtipos de enitades (antes llamado instancias)
        ||    Modificaciones:
        ||      23/03/2012 - Mart¿n Zanelli - Creaci¿n del procedimiento - Memo 97-2012/SDP-CC
        */
        cursor c_subtipos_entidad is
        select a.ins_ccodigo codigo, a.ins_vdesc descripcion
        from sease.instancia a
        where a.ins_sactivo = 1
        and (a.act_ccodigo = ag_tipoent or ag_tipoent = '0');
    BEGIN
        usp_print('<select name="ag_subtipoent" style="width:500px">');
        usp_print('<option value="-1">Seleccione un valor ...</option>');
        usp_print('<option value="0">TODOS</option>');
        for item in c_subtipos_entidad loop
            usp_print('<option value="'||item.codigo||'">'||item.descripcion||'</option>');
        end loop;
        usp_print('</select>');
    END; -- Procedure
    
    PROCEDURE USP_REC_E001_PERSONAL_DOVIEW (
        session__eue_codigo varchar2,
        v_mensaje1          varchar2,
        v_mensaje2          varchar2,
        v_nombre_buscar     varchar2)
    IS
    /*
    ||    Author: Mart¿n Zanelli
    ||    Overview: Procedimiento que presenta la interfaz para el registro del personal
    ||              de la entidad.
    ||    Modificaciones:
    ||      19/03/2012 - Martin Zanelli - Creaci¿n del procedimiento - Memorando 97-2012/SDP-ECC - punto 2
    */ 
        cursor c_entidad (c_cod_entidad varchar2) is
        select a.total_personal, a.fecha_reg_total_pers
        from reg_procesos.entidades a
        where 
            a.codconsucode = c_cod_entidad
            and a.anhoentidad = to_char(sysdate,'yyyy');
        
        cursor c_instruccion is
        select a.codigo, a.descripcion
        from reg_procesos.rec_nivel_instruccion a
        where a.estado = 1;
        
        cursor c_unidad_labor is
        select a.codigo, a.descripcion
        from reg_procesos.rec_unidad_logistica a
        where a.estado = 1;
        
        cursor c_entidad_personal (c_cod_entidad varchar2, c_nombre_buscar varchar2) is
        select 
            a.id_personal, a.nombre, a.email, b.descripcion instruccion,
            a.cod_instruccion, a.cod_unidad_log, a.estado,
            c.descripcion unidad_labor, a.unidad_operativa, 
            case when a.estado = 1 then 'EN ACTIVIDAD' else 'DE BAJA' end estado_des,
            a.fecha_registro 
        from 
            reg_procesos.rec_entidad_personal a
            inner join reg_procesos.rec_nivel_instruccion b
                on a.cod_instruccion = b.codigo
            inner join reg_procesos.rec_unidad_logistica c
                on a.cod_unidad_log = c.codigo
        where 
            --a.estado = 1 and
            a.codconsucode = c_cod_entidad and
            ( c_nombre_buscar is null or upper(a.nombre) like '%'||upper(c_nombre_buscar)||'%' )
        order by a.estado desc;
        
        cCant number;
    BEGIN
        usp_print('
        <table class="tableform" cellpadding="3" cellspacing="0" border="0" align="center" width="100%">
            <tr>
                <td colspan="2" align="left"><br><h3>PERSONAL DE LA OFICINA DE LOGISTICA</h3></td>
            </tr>
            <tr>
                <td colspan="2" align="center">&nbsp;</td>
            </tr>
            <tr>
                <td width="50%" align="right">¿Cu&aacute;ntas personas laboran en la oficina de Log&iacute;stica?</td>');
        cCant := 0;
        for item in c_entidad (lpad(session__eue_codigo,6,'0')) loop
            if item.total_personal is not null then
                usp_print('
                <td width="50%">
                    <input type="text" name="v_total_personal" value="'||item.total_personal||'" style="width:50px;font-size:16pt" onblur="ValidarNumero(this)"/>
                    &nbsp;
                    <input type="button" value="Actualizar" onclick="GrabarTotalPersonas()" />
                    &nbsp;
                    <input type="button" value="Historial" onclick="VerHistorial()" />
                    <br>registrado el '||to_char(item.fecha_reg_total_pers,'dd/mm/yyyy')||' a las '||to_char(item.fecha_reg_total_pers,'hh24:mi:ss')||' horas.
                    <input type="hidden" name="v_total_personal_comp" value="'||item.total_personal||'"/>
                </td>');
            else
                usp_print('
                <td width="50%">
                    <input type="text" name="v_total_personal" value="" style="width:50px;font-size:16pt" onblur="ValidarNumero(this)"/>
                    &nbsp;
                    <input type="button" value="Grabar" onclick="GrabarTotalPersonas()" />
                    <input type="hidden" name="v_total_personal_comp" value="0"/>
                </td>');
            end if;
        end loop;
        if length(case when v_mensaje1 is null then '.' else v_mensaje1 end) > 2 then
            usp_print('
            <tr>
                <td colspan="2" align="center">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2" align="center"><font color="red">'||v_mensaje1||'</font></td>
            </tr>');
        end if;
        usp_print('
            </tr>
            <tr><td colspan="2"><hr></td></tr>
            <tr>
                <td colspan="2" align="left"><br><h3>Relaci&oacute;n de Personal de la Oficina de Log&iacute;stica</h3></td>
            </tr>
            <tr>
                <td colspan="2" align="center">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                    <table class="tableform" cellpadding="3" cellspacing="0" border="0" align="center" width="100%">
                        <tr>
                            <td colspan="7"><h4>Registro o Modificaci&oacute;n de Personal</h4></td>
                        </tr>
                        <tr>
                            <th class="th1" width="18%">Nombre y Apellidos</th>
                            <th class="th1" width="18%">Correo Electr&oacute;nico</th>
                            <th class="th1" width="18%">Grado de Instrucci&oacute;n</th>
                            <th class="th1" width="18%">Unidad donde labora<br>(Unidad, &aacute;rea o actividad donde desarrolla las funciones)</th>
                            <th class="th1" width="18%">Unidad Operativa</th>
                            <th class="th1" width="10%">.</th>
                        </tr>
                        <tr>
                            <td align="center"><input type="text" name="v_nombre" value="" style="width:250px" maxlength="200"/></td>
                            <td align="center"><input type="text" name="v_correo" value="" style="width:250px" maxlength="200"/></td>
                            <td align="center">
                                <select name="v_instruccion" style="width:150px">
                                    <option value="0">Seleccione ...</option>>');
        for item in c_instruccion loop
            usp_print('<option value="'||item.codigo||'">'||item.descripcion||'</option>');
        end loop;        
        usp_print('
                                </select>
                            </td>
                            <td align="center">
                                <select name="v_unidad_labor" style="width:250px">
                                    <option value="0">Seleccione ...</option>>');
        for item in c_unidad_labor loop
            usp_print('<option value="'||item.codigo||'">'||item.descripcion||'</option>');
        end loop;        
        usp_print('
                                </select>
                            </td>
                            <td align="center"><input type="text" name="v_uni_operativa" value="" style="width:250px"/></td>
                            <td align="center">
                                <input type="button" value="Grabar" onclick="GrabarPersonal()" name="btnGrabar" />&nbsp;
                                <input type="button" value="Cancelar" onclick="Cancelar()" name="btnCancelar" disabled="true"/>
                                <input type="hidden" name="v_id_personal" value="" />
                                <input type="hidden" name="v_id_accion" value="1" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>');
        if length(case when v_mensaje2 is null then '.' else v_mensaje2 end) > 2 then
            usp_print('
            <tr>
                <td colspan="2" align="center">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2" align="center"><font color="red">'||v_mensaje2||'</font></td>
            </tr>');
        end if;
        usp_print('
            <tr>
                <td colspan="2" align="center">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                    <table class="tableform" cellpadding="3" cellspacing="0" border="0" align="center" width="100%">
                        <tr>
                            <td colspan="7"><h4>Lista de Personal de la Oficina de Log&iacute;stica</h4></td>
                        </tr>
                        <tr>
                            <td colspan="7">
                                Buscador de Personal&nbsp;
                                <input type="text" name="v_nombre_buscar" value="'||v_nombre_buscar||'" style="width:250px" maxlength="200"/>&nbsp;
                                <input type="button" value="Buscar" onclick="BuscarPersonal()" name="btnBuscar" />&nbsp;
                                <input type="button" value="Mostrar Todos" onclick="MostrarTodos()" name="btnTodos" /><br>
                                (La b&uacute;squeda se realizar¿ por el campo Nombre y Apellidos).
                            </td>
                        </tr>
                        <tr>
                            <td colspan="7" align="center">&nbsp;</td>
                        </tr>
                        <tr>
                            <th class="th1" width="2%">Nro.</th>
                            <th class="th1" width="15%">Nombre y Apellidos</th>
                            <th class="th1" width="15%">Correo Electr&oacute;nico</th>
                            <th class="th1" width="15%">Grado de Instrucci&oacute;n</th>
                            <th class="th1" width="15%">Unidad donde labora</th>
                            <th class="th1" width="15%">Unidad Operativa</th>
                            <th class="th1" width="8%">Estado</th>
                            <th class="th1" width="8%">Fecha y Hora</th>
                            <th class="th1" width="7%">.</th>
                        </tr>');
        cCant := 0;
        for item in c_entidad_personal(lpad(session__eue_codigo,6,'0'), v_nombre_buscar) loop
            cCant := cCant + 1;
            usp_print('
                        <tr>
                            <td align="right">'||cCant||'</td>
                            <td align="left">'||item.nombre||'</td>
                            <td align="left">'||item.email||'</td>
                            <td align="center">'||item.instruccion||'</td>
                            <td align="center">'||item.unidad_labor||'</td>
                            <td align="center">'||item.unidad_operativa||'</td>
                            <td align="center">'||item.estado_des||'</td>
                            <td align="center">'||item.fecha_registro||'</td>
                            <td>'||
                            case when item.estado = 1 then
                                '<img src="images/Responder.gif" onclick="RecuperarDatos('''||item.id_personal||''','''||item.nombre||''','''||item.email||''','''||item.cod_instruccion||''','''||item.cod_unidad_log||''','''||item.unidad_operativa||''')" alt="Modificar Datos" style="cursor:hand"/>&nbsp;
                                 <img src="images/Eliminar.gif" onclick="CambiarEstado(3,'''||item.id_personal||''','''||item.nombre||''')" alt="Colocar De Baja" style="cursor:hand" />&nbsp;'
                            else
                                '<img src="images/iconprompttick.gif" onclick="CambiarEstado(4,'''||item.id_personal||''','''||item.nombre||''')" alt="Colocar En Actividad" style="cursor:hand" />&nbsp;'
                            end 
                                ||'
                                 <img src="images/edit_preview0.gif" onclick="VerHistorialPersonal('''||item.id_personal||''')" alt="Ver Historial" style="cursor:hand" />&nbsp;
                            </td>
                        </tr>');
        end loop;
        if cCant = 0 then
            usp_print('
                        <tr>
                            <td colspan="9" align="center"><i><b>No se encontraron resultados.</b></i></td>
                        </tr>');
        end if;
        usp_print('
                    </table>
                </td>
            </tr>
        </table>');
        
        USP_GEN_JSCRIPT;
        usp_print('
        <script language="javascript">
        function ValidarNombre(ls_obj, ls_mensage)
        {
            var strCadena = ls_obj.value;
            var valido= "ABCDEFGHIJKLMNOPQRSTUVWYXZabcdefghijklmnopqrstuvwxyz ";

            for (i = 0 ; i <= strCadena.length - 1; i++)
            {
                if(!vacio(trim(strCadena.substring(i,i+1))))
                {
                    if (valido.indexOf (strCadena.substring(i,i+1),0) == -1)
                    {
                        ls_obj.select();
                        alert("Hay un caracter no permitido en el campo " + ls_mensage + "\nel caracter no permitido es ( "+strCadena.substring(i,i+1)+" )");
                        ls_obj.focus();
                        return false;
                    }
                }
            }
            return true;
        }
       
        function GrabarTotalPersonas()
        { 
            if (!ValidarNumero(thisform.v_total_personal))
                return false;
            
            if (!ValidarBlanco(thisform.v_total_personal, "la Cantidad de Personas"))
                return false;
                
            if ( parseFloat(thisform.v_total_personal.value) == parseFloat(thisform.v_total_personal_comp.value) )
            {
                alert("Debe ingresar una cantidad distinta a la actual.");
                return false
            }
            thisform.scriptdo.value = "doSaveTotal";
            thisform.submit();
        }
        
        function VerHistorial()
        {
            window.open("portlet5open.asp?_portletid_=mod_rec1_a004_manten_personal&scriptdo=doViewHist","","toolbar=no,Width=400,Height=400,scrollbars=yes,modal=yes,dependent,alwaysRaised");
        }
        
        function GrabarPersonal()
        {
            if (thisform.v_total_personal_comp.value == "0")
            {
                alert("Antes de registrar al personal, registre cu\xe1ntas personas laboran en la oficina de Log\xedstica ");
                thisform.v_total_personal.focus();
                thisform.v_total_personal.select();
                return false;
            }
            if (!ValidarBlanco(thisform.v_nombre, "Nombre"))
                return false;
            if (!ValidarNombre(thisform.v_nombre,"Nombre"))
                return false;
            if (!(isEmail(thisform.v_correo.value)))
            {
                alert("El correo electr\xf3nico no es v\xe1lido");
                thisform.v_correo.focus();
                thisform.v_correo.select();
                return false;
            }
            if (thisform.v_instruccion.value == 0)
            {
                alert("Seleccione un grado de instrucci\xf3n");
                thisform.v_instruccion.focus();
                thisform.v_instruccion.select();
                return false;
            }
            if (thisform.v_unidad_labor.value == 0)
            {
                alert("Seleccione la unidad donde labora");
                thisform.v_unidad_labor.focus();
                thisform.v_unidad_labor.select();
                return false;
            }
            if (!ValidarBlanco(thisform.v_uni_operativa, "Unidad Operativa"))
                return false;
                
            if (thisform.v_id_accion.value == 1)
            {
                if ( confirm("¿Est\xe1 usted seguro de grabar los datos?") )
                {
                    thisform.scriptdo.value = "doSavePersonal";
                    thisform.submit();
                }
            }
            if (thisform.v_id_accion.value == 2)
            {
                if ( confirm("¿Est\xe1 usted seguro de actualizar los datos?") )
                {
                    thisform.scriptdo.value = "doUpdatePersonal";
                    thisform.submit();
                }
            }
        }
        
        function RecuperarDatos(id_personal, nombre, email, instruccion, unidad_labor, unidad_operativa)
        {
            if ( confirm("¿Desea modificar los datos del personal " + nombre + "?") )
            {
                thisform.btnGrabar.value = "Actualizar";
                thisform.btnCancelar.disabled = false;
                
                thisform.v_id_accion.value = 2;
                thisform.v_id_personal.value = id_personal;
                thisform.v_nombre.value = nombre;
                thisform.v_correo.value = email;
                thisform.v_instruccion.value = instruccion;
                thisform.v_unidad_labor.value = unidad_labor;
                thisform.v_uni_operativa.value = unidad_operativa;
            }
        }
        
        function Cancelar()
        {
            if ( confirm("¿Desea cancelar esta acci\xf3n?") )
            {
                thisform.btnGrabar.value = "Grabar";
                thisform.btnCancelar.disabled = true;
                
                thisform.v_id_accion.value = 1;
                thisform.v_id_personal.value = "";
                thisform.v_nombre.value = "";
                thisform.v_correo.value = "";
                thisform.v_instruccion.value = 0;
                thisform.v_unidad_labor.value = 0;
                thisform.v_uni_operativa.value = "";
            }
        }
        
        function CambiarEstado(accion, id_personal, nombre)
        {
            thisform.v_id_accion.value = accion;
            thisform.v_id_personal.value = id_personal;
            
            var accion_des = "";
            if (accion == 3 )
                accion_des = "DAR DE BAJA";
            if (accion == 4 )
                accion_des = "poner EN ACTIVIDAD";
            
            if ( confirm("¿Est\xe1 usted seguro de " + accion_des + " a " + nombre + "?") )
            {
                thisform.scriptdo.value = "doUpdatePersonal";
                thisform.submit();
            }
        }   
        
        function VerHistorialPersonal(id_personal)
        {
            window.open("portlet5open.asp?_portletid_=mod_rec1_a004_manten_personal&scriptdo=doViewHistPersonal&v_id_personal="+id_personal,"","toolbar=no,Width=900,Height=400,scrollbars=yes,modal=yes,dependent,alwaysRaised");
        }
        
        function BuscarPersonal()
        {
            if (!ValidarBlanco(thisform.v_nombre_buscar, "Buscador de Personal"))
                return false;
            
            thisform.scriptdo.value = "doViewForm";
            thisform.submit();
        }
        
        function MostrarTodos()
        {
            thisform.v_nombre_buscar.value = "";
            thisform.scriptdo.value = "doViewForm";
            thisform.submit();
        }
        </script>');
    END;
    
    PROCEDURE USP_REC_E001_UPDATE_TOTAL_PERS(
        session__eue_codigo varchar2,
        session__userid     varchar2,
        iisenv__remote_host varchar2,
        v_total_personal    number)
    IS
    /*
    ||    Author: Mart¿n Zanelli
    ||    Overview: Procedimiento que actualiza la informaci¿n del campo tota_personal 
    ||              de la tabla REG_PROCESOS.ENTIDADES en la BD
    ||    Modificaciones:
    ||      19/03/2012 - Martin Zanelli - Creaci¿n del procedimiento - Memorando 97-2012/SDP-ECC - punto 2
    */ 
        cMensaje varchar(500);
    BEGIN
        BEGIN
            update reg_procesos.entidades 
            set     
                total_personal = v_total_personal,
                FECHA_REG_TOTAL_PERS = sysdate
            where codconsucode = lpad(session__eue_codigo,6,'0');
            
            insert into reg_procesos.rec_log_entidad_total_personal
            ( fecha_registro, usuario_registro, ip_registro, total_personal, codconsucode )
            values
            ( sysdate, session__userid, iisenv__remote_host, v_total_personal, lpad(session__eue_codigo,6,'0') );
            
            commit;
            
            cMensaje := 'OK';
        EXCEPTION
            WHEN OTHERS THEN
                rollback;
                cMensaje := 'Ocurri&oacute; un error, no se pudo completar la operaci&oacute;n.<br>'||SQLERRM;
        END;
        
        usp_print('
        <input type=''hidden'' name=''v_mensaje1'' value='''||cMensaje||'''/>
        <script language=''javascript''>
        thisform.scriptdo.value = ''doViewForm'';
        thisform.submit();
        </script>');
    END;
    
    PROCEDURE USP_REC_E001_HISTORIAL_DOVIEW(
        session__eue_codigo varchar2)
    IS
    /*
    ||    Author: Mart¿n Zanelli
    ||    Overview: Procedimiento que muestra la interfaz con el historial de cambios realizados 
    ||              al valor de la cantidad de personal de la entidad.
    ||    Modificaciones:
    ||      19/03/2012 - Martin Zanelli - Creaci¿n del procedimiento - Memorando 97-2012/SDP-ECC - punto 2
    */ 
        cursor historial(v_entidad varchar2) is
        select a.fecha_registro, a.total_personal, a.usuario_registro
        from reg_procesos.rec_log_entidad_total_personal a
        where a.codconsucode = v_entidad
        order by id_log desc;
        
        cOrden number;
    BEGIN
        usp_print('
        <br><br>
        <table class="tableform" cellpadding="3" cellspacing="0" border="0" align="center" width="90%">
            <tr>
                <td colspan="4" align="center"><h3>Historial</h3></td>
            </tr>
            <tr>
                <th class="th1">Nro.</th>
                <th class="th1">Fecha</th>
                <th class="th1">Cantidad</th>
                <th class="th1">Usuario</th>
            <tr>');
            
        cOrden := 0;
        for item in historial(lpad(session__eue_codigo, 6, '0')) loop
            cOrden := cOrden + 1;
            usp_print('
            <tr>
                <td align="right">'||cOrden||'</td>
                <td align="center">'||to_char(item.fecha_registro,'dd/mm/yyyy hh24:mi:ss')||'</td>
                <td align="right">'||item.total_personal||'</td>
                <td align="center">'||item.usuario_registro||'</td>
            </tr>');
        end loop;
        usp_print('
        </table>');
    END;
    
    PROCEDURE USP_REC_E001_SAVE_PERSONAL(
        session__eue_codigo varchar2,
        session__userid     varchar2,
        iisenv__remote_host varchar2,
        v_nombre            varchar2,
        v_correo            varchar2,
        v_instruccion       number,
        v_unidad_labor      number,
        v_uni_operativa     varchar2)
    IS
    /*
    ||    Author: Mart¿n Zanelli
    ||    Overview: Procedimiento que registra al personal de la entidad en la BD.
    ||    Modificaciones:
    ||      19/03/2012 - Martin Zanelli - Creaci¿n del procedimiento - Memorando 97-2012/SDP-ECC - punto 2
    */ 
        cMensaje varchar(500);
    BEGIN
        BEGIN
            insert into reg_procesos.rec_entidad_personal 
            ( codconsucode, nombre, email, cod_instruccion, cod_unidad_log, 
              unidad_operativa, usuario_registro, ip_registro, ultima_accion )
            values
            ( lpad(session__eue_codigo,6,'0'), v_nombre, v_correo, v_instruccion, v_unidad_labor,
              v_uni_operativa, session__userid, iisenv__remote_host, 'REGISTRO' );

            commit;
            
            cMensaje := 'OK';
        EXCEPTION
            WHEN OTHERS THEN
                rollback;
                cMensaje := 'Ocurri&oacute; un error, no se pudo completar la operaci&oacute;n.<br>'||SQLERRM;
        END;
        
        usp_print('
        <input type=''hidden'' name=''v_mensaje2'' value='''||cMensaje||'''/>
        <script language=''javascript''>
        thisform.scriptdo.value = ''doViewForm'';
        thisform.submit();
        </script>');
    END;
    
    PROCEDURE USP_REC_E001_UPDATE_PERSONAL(
        session__eue_codigo varchar2,
        session__userid     varchar2,
        iisenv__remote_host varchar2,
        v_id_accion         number,
        v_id_personal       number,
        v_nombre            varchar2,
        v_correo            varchar2,
        v_instruccion       number,
        v_unidad_labor      number,
        v_uni_operativa     varchar2)
    IS
    /*
    ||    Author: Mart¿n Zanelli
    ||    Overview: Procedimiento que actualiza la informaci¿n del personal en la BD
    ||    Modificaciones:
    ||      21/03/2012 - Martin Zanelli - Creaci¿n del procedimiento - Memorando 97-2012/SDP-ECC - punto 2
    */ 
        cMensaje varchar(500);
    BEGIN
        BEGIN
            insert into reg_procesos.rec_entidad_personal_hist 
            ( id_personal, codconsucode, nombre, email, cod_instruccion, cod_unidad_log, 
              unidad_operativa, fecha_registro, usuario_registro, ip_registro, accion, estado )
            select 
              id_personal, codconsucode, nombre, email, cod_instruccion, cod_unidad_log, 
              unidad_operativa, fecha_registro, usuario_registro, ip_registro, ultima_accion, estado
            from reg_procesos.rec_entidad_personal
            where id_personal = v_id_personal;

            if v_id_accion = 2 then
                update reg_procesos.rec_entidad_personal 
                set 
                    nombre = v_nombre,
                    email = v_correo,
                    cod_instruccion = v_instruccion,
                    cod_unidad_log = v_unidad_labor,
                    unidad_operativa = v_uni_operativa,
                    fecha_registro = sysdate,
                    usuario_registro = session__userid,
                    ip_registro = iisenv__remote_host,
                    ultima_accion = 'MODIFICACION'
                where 
                    id_personal = v_id_personal;
            end if;
            
            if v_id_accion = 3 or v_id_accion = 4 then
                update reg_procesos.rec_entidad_personal 
                set 
                    estado = case when v_id_accion = 3 then 0 else 1 end,
                    fecha_registro = sysdate,
                    usuario_registro = session__userid,
                    ip_registro = iisenv__remote_host,
                    ultima_accion = case when v_id_accion = 3 then 'DAR DE BAJA' else 'PONER EN ACTIVIDAD' end
                where 
                    id_personal = v_id_personal;
            end if;

            commit;
            
            cMensaje := 'OK';
        EXCEPTION
            WHEN OTHERS THEN
                rollback;
                cMensaje := 'Ocurri&oacute; un error, no se pudo completar la operaci&oacute;n.<br>'||SQLERRM;
        END;
        
        usp_print('
        <input type=''hidden'' name=''v_mensaje2'' value='''||cMensaje||'''/>
        <script language=''javascript''>
        thisform.scriptdo.value = ''doViewForm'';
        thisform.submit();
        </script>');
    END;
    
    PROCEDURE USP_REC_E001_HIST_PERSO_DOVIEW(
        v_id_personal number)
    IS
    /*
    ||    Author: Mart¿n Zanelli
    ||    Overview: Procedimiento que muestra la interfaz con el historial de cambios realizados 
    ||              al registro del personal.
    ||    Modificaciones:
    ||      22/03/2012 - Martin Zanelli - Creaci¿n del procedimiento - Memorando 97-2012/SDP-ECC - punto 2
    */ 
        cursor historial(c_id_personal varchar2) is
        select * 
        from 
        (
            select 
                a.fecha_registro, a.usuario_registro, a.ultima_accion accion, 
                a.nombre, a.email, b.descripcion instruccion, c.descripcion unidad_labor, 
                a.unidad_operativa, case when a.estado = 1 then 'EN ACTIVIDAD' else 'DE BAJA' end estado_des
            from 
                reg_procesos.rec_entidad_personal a
                inner join reg_procesos.rec_nivel_instruccion b
                    on a.cod_instruccion = b.codigo
                inner join reg_procesos.rec_unidad_logistica c
                    on a.cod_unidad_log = c.codigo
            where a.id_personal = c_id_personal
            union
            select 
                x.fecha_registro, x.usuario_registro, x.accion, 
                x.nombre, x.email, y.descripcion instruccion, z.descripcion unidad_labor, 
                x.unidad_operativa, case when x.estado = 1 then 'EN ACTIVIDAD' else 'DE BAJA' end estado_des
            from 
                reg_procesos.rec_entidad_personal_hist x
                inner join reg_procesos.rec_nivel_instruccion y
                    on x.cod_instruccion = y.codigo
                inner join reg_procesos.rec_unidad_logistica z
                    on x.cod_unidad_log = z.codigo
            where x.id_personal = c_id_personal
        ) w
        order by 1 desc;
        
        cOrden number;
    BEGIN
        usp_print('
        <br><br>
        <table class="tableform" cellpadding="3" cellspacing="0" border="0" align="center" width="90%">
            <tr>
                <td colspan="10" align="center"><h3>Historial</h3></td>
            </tr>
            <tr>
                <th class="th1" colspan="4" style="border-color:#000000;border-top:1px solid;border-bottom:1px solid;border-left:1px solid;">Auditor&iacute;a</th>
                <th class="th1" colspan="6" style="border-color:#000000;border-width:1px;border:solid;">Datos</th>
            <tr>
            <tr>
                <th class="th1" style="border-color:#000000;border-bottom:1px solid;border-left:1px solid;">Nro.</th>
                <th class="th1" style="border-color:#000000;border-bottom:1px solid;border-left:1px solid;">Fecha</th>
                <th class="th1" style="border-color:#000000;border-bottom:1px solid;border-left:1px solid;">Usuario</th>
                <th class="th1" style="border-color:#000000;border-bottom:1px solid;border-left:1px solid;">Acci&oacute;n</th>
                <th class="th1" style="border-color:#000000;border-bottom:1px solid;border-left:1px solid;">Nombre y Apellidos</th>
                <th class="th1" style="border-color:#000000;border-bottom:1px solid;border-left:1px solid;">Correo Electr&oacute;nico</th>
                <th class="th1" style="border-color:#000000;border-bottom:1px solid;border-left:1px solid;">Grado de Instrucci&oacute;n</th>
                <th class="th1" style="border-color:#000000;border-bottom:1px solid;border-left:1px solid;">Unidad donde labora</th>
                <th class="th1" style="border-color:#000000;border-bottom:1px solid;border-left:1px solid;">Unidad Operativa</th>
                <th class="th1" style="border-color:#000000;border-bottom:1px solid;border-left:1px solid;border-right:1px solid;">Estado</th>
            <tr>');
            
        cOrden := 0;
        for item in historial(v_id_personal) loop
            cOrden := cOrden + 1;
            usp_print('
            <tr>
                <td align="right" style="border-color:#000000;border-bottom:1px solid;border-left:1px solid;">'||cOrden||'</td>
                <td align="center" style="border-color:#000000;border-bottom:1px solid;border-left:1px solid;">'||to_char(item.fecha_registro,'dd/mm/yyyy hh24:mi:ss')||'</td>
                <td align="center" style="border-color:#000000;border-bottom:1px solid;border-left:1px solid;">'||item.usuario_registro||'</td>
                <td align="center" style="border-color:#000000;border-bottom:1px solid;border-left:1px solid;">'||item.accion||'</td>
                <td align="center" style="border-color:#000000;border-bottom:1px solid;border-left:1px solid;">'||item.nombre||'</td>
                <td align="center" style="border-color:#000000;border-bottom:1px solid;border-left:1px solid;">'||item.email||'</td>
                <td align="center" style="border-color:#000000;border-bottom:1px solid;border-left:1px solid;">'||item.instruccion||'</td>
                <td align="center" style="border-color:#000000;border-bottom:1px solid;border-left:1px solid;">'||item.unidad_labor||'</td>
                <td align="center" style="border-color:#000000;border-bottom:1px solid;border-left:1px solid;">'||item.unidad_operativa||'</td>
                <td align="center" style="border-color:#000000;border-bottom:1px solid;border-left:1px solid;border-right:1px solid;">'||item.estado_des||'</td>
            </tr>');
        end loop;
        usp_print('
        </table>');
    END;
    
    PROCEDURE USP_REC_A004_REPORTES_PERSONAL(
        session__eue_codigo varchar2,
        v_nivel             number,
        v_tipo_reporte      number,
        ag_tipoent          varchar2)
    IS
    /*
    ||    Author: Mart¿n Zanelli
    ||    Overview: Procedimiento que muestra la interfaz de las opciones de reportes rspecto
    ||              al personal registrado por la entidad
    ||    Modificaciones:
    ||      23/03/2012 - Martin Zanelli - Creaci¿n del procedimiento - Memorando 97-2012/SDP-ECC - punto 3
    */
        cNivel number;
    BEGIN
        if v_nivel is null then
            cNivel := 1;
        else
            cNivel := v_nivel;
        end if;

        if cNivel = 1 then
            usp_print('
        <table class="tableform" cellpadding="3" cellspacing="0" border="0" align="center" width="90%">
            <tr><td><h3>Reportes del Personal</h3></td></tr>
            <tr><td>&nbsp;</td></tr>
            <tr><td align="center" class=c1>'||
                makea( 'v_nivel=2&v_tipo_reporte=1&scriptdo=doView',
                       'Cantidad de Personal del OEC por Entidad' )
            ||'</td></tr>
            <tr><td align="center" class=c1>'||
                makea( 'v_nivel=2&v_tipo_reporte=2&scriptdo=doView',
                       'Relaci&oacute;n de Personal del OEC de Entidades' )
            ||'</td></tr>
        </table>');
        end if;

        if cNivel = 2 then
            usp_print('
        <table class="tableform" cellpadding="3" cellspacing="0" border="0" align="center" width="100%">');
            --titulo
            if v_tipo_reporte = 1 then
                usp_print('
            <tr><td colspan="2"><h3>Cantidad de Personal del OEC por Entidad</h3></td></tr>');
            end if;
            if v_tipo_reporte = 2 then
                usp_print('
            <tr><td colspan="2"><h3>Relaci&oacute;n de Personal del OEC de Entidades</h3></td></tr>');
            end if;
            usp_print('
        </table>');
            --filtros del reporte
            usp_print('
        <table class="tableform" cellpadding="3" cellspacing="0" border="0" align="center">');
            if v_tipo_reporte in (1,2) then
                usp_print('
            <tr><td colspan="2">&nbsp;</td></tr>
            <tr>
                <td align="right">Tipo de Entidad</td>
                <td align="left">');
                USP_GET_TIPO_ENTIDAD_ACTUAL(ag_tipoent);
                usp_print('
                </td>
            </tr>
            <tr>
                <td align="right">Subtipo de Entidad</td>
                <td align="left">');
                USP_GET_SUBTIPO_ENTIDAD_ACTUAL(ag_tipoent);
                usp_print('
                </td>
            </tr>');
            end if;
            if v_tipo_reporte in (1,2) then
                usp_print('
            <tr>
                <td align="right">Entidad</td>
                <td align="left">
                    <input name="ag_descent" type="text" style="width:470px" class=ViewSelect onclick="abrir(''mod_UsuarioCrear'',''doBuscarEntidad'','''',''wbuscaEntidad'')" value="" readonly="true"/>
                    <input name="ag_codent" type="hidden" value="0"/>
                </td>
            </tr>');
            end if;
            --botones
            if v_tipo_reporte in (1,2) then
                usp_print('
            <tr>
                <td align="center" colspan="2">
                    <input type="button" value="Generar Excel" onclick="generar_excel('||v_tipo_reporte||');" /> &nbsp;
                    <input type="button" value="Generar Reporte" onclick="ver_reporte('||v_tipo_reporte||');" /> &nbsp;
                    <input type="button" value="Limpiar" onclick="limpiar();" /> &nbsp;
                    <input type="button" value="Volver" onclick="volver();" />
                </td>
            </tr>');
            end if;
            --variables a usar
            usp_print('
        </table>
        <input type="hidden" name="v_nivel" value="'||cNivel||'"/>
        <input type="hidden" name="v_tipo_reporte" value="'||v_tipo_reporte||'"/>
        <input type="hidden" name="v_tipo_vista" value=""/>');
            --javascript
            if v_tipo_reporte in (1,2) then
                usp_print('
        <script language="javascript">
        function cargarSubTipoEntidad()
        {
            thisform.scriptdo.value = "doView";
            thisform.submit();
        }

        function generar_excel(tipo_reporte)
        {
            if (!ValidarCampos())
                return false;
            thisform.v_tipo_vista.value = 1;
            thisform.scriptdo.value = "doViewReporte";
            thisform.submit();
            window.location.href="portlet5openxls.asp?_portletid_=mod_rec1_a005_reportes_personal&scriptdo=doViewReporte&v_tipo_vista=1&v_tipo_reporte="+tipo_reporte+"&ag_tipoent="+thisform.ag_tipoent.value+"&ag_subtipoent="+thisform.ag_subtipoent.value+"&ag_codent="+thisform.ag_codent.value;
        }

        function ver_reporte(tipo_reporte)
        {
            if (!ValidarCampos())
                return false;
            thisform.v_tipo_vista.value = 2;
            thisform.scriptdo.value = "doViewReporte";
            thisform.submit();
        }

        function ValidarCampos()
        {
            if (thisform.ag_tipoent.value == "-1")
            {
                alert("Seleccione el Tipo de Entidad.");
                thisform.ag_tipoent.focus();
                return false;
            }
            if (thisform.ag_subtipoent.value == "-1")
            {
                alert("Seleccione el Subtipo de Entidad.");
                thisform.ag_subtipoent.focus();
                return false;
            }
            return true;
        }

        function volver()
        {
            thisform.v_nivel.value = 1;
            thisform.scriptdo.value = "doView";
            thisform.submit();
        }

        function abrir( pID, sDO, param, nventana)
        {
            newWindow = window.open("portlet5open.asp?_portletid_="+pID+"&scriptdo="+sDO+param,nventana,"toolbar=no,Width=700,Height=400,scrollbars=yes,modal=yes,dependent,alwaysRaised")
            newWindow.creator=self;
        }

        function RtnEntidad(codEnt,desc)
        {
            thisform.ag_codent.value=codEnt;
            thisform.ag_descent.value=desc;

            //Inactivamos los combos
            thisform.ag_tipoent.disabled = true;
            thisform.ag_tipoent.value = 0;
            thisform.ag_subtipoent.disabled = true;
            thisform.ag_subtipoent.value = 0;
        }

        function limpiar()
        {
            thisform.ag_tipoent.disabled = false;
            thisform.ag_tipoent.value = 0;
            thisform.ag_subtipoent.disabled = false;
            thisform.ag_subtipoent.value = 0;
            thisform.ag_codent.value="0";
            thisform.ag_descent.value="";
        }
        </script>');
            end if;
        end if;
    END;
    
    PROCEDURE USP_REC_A004_REPORTE_DOVIEW(
        v_tipo_vista      number,
        v_tipo_reporte    number,
        ag_tipoent        varchar2,
        ag_subtipoent     varchar2,
        ag_codent         varchar2)
    IS
    /*
    ||    Author: Mart¿n Zanelli
    ||    Overview: Procedimiento que genera los reportes de personal tanto en excel como en pantalla.
    ||    Modificaciones:
    ||      23/03/2012 - Martin Zanelli - Creaci¿n del procedimiento - Memorando 97-2012/SDP-ECC - punto 3
    */
        cursor c_reporte_1( c_tipo_entidad varchar2, c_subtipo_entidad varchar2, c_entidad varchar2 ) is
        select
            a.codconsucode, a.descripcion, s.SEC_DESC sector, p.DESC_PLIEGO pliego, ac.act_vdesc actividad,
            i.ins_vdesc instancia, a.total_personal, count(b.id_personal) total_personal_reg
        from
            (
                select
                    e.codconsucode, e.descripcion, e.sector, e.pliego, e.actividad, e.instancia, e.total_personal
                from
                    reg_procesos.entidades e
                where
                    e.anhoentidad = to_char(sysdate,'yyyy')
                    and (e.actividad = c_tipo_entidad or c_tipo_entidad = '0')
                    and (e.instancia = c_subtipo_entidad or c_subtipo_entidad = '0')
                    and (e.codconsucode = lpad(c_entidad,6,'0') or c_entidad = '0')
            ) a
            left join reg_procesos.rec_entidad_personal b
                on a.codconsucode = b.codconsucode
                and b.estado = 1
            left join sease.sector s
                on a.sector = s.SEC_CODIGO
            left join sease.pliego p
                on a.sector = p.SEC_CODIGO
                and a.pliego = p.PLI_CODIGO
            left join sease.actividad ac
                on a.actividad = ac.act_ccodigo
            left join sease.instancia i
                on a.actividad = i.ACT_CCODIGO and a.instancia = i.ins_ccodigo
        group by a.codconsucode, a.descripcion, s.SEC_DESC, p.DESC_PLIEGO, ac.act_vdesc, i.ins_vdesc, a.total_personal
        order by 1;

        cursor c_reporte_2( c_tipo_entidad varchar2, c_subtipo_entidad varchar2, c_entidad varchar2 ) is
        select
            b.nombre, b.email, ni.descripcion instruccion, ul.descripcion unidad_labor,
            a.codconsucode, a.descripcion, s.SEC_DESC sector, p.DESC_PLIEGO pliego, ac.act_vdesc actividad,
            i.ins_vdesc instancia
        from
            (
                select
                    e.codconsucode, e.descripcion, e.sector, e.pliego, e.actividad, e.instancia
                from
                    reg_procesos.entidades e
                where
                    e.anhoentidad = to_char(sysdate,'yyyy')
                    and (e.actividad = c_tipo_entidad or c_tipo_entidad = '0')
                    and (e.instancia = c_subtipo_entidad or c_subtipo_entidad = '0')
                    and (e.codconsucode = lpad(c_entidad,6,'0') or c_entidad = '0')
            ) a
            inner join reg_procesos.rec_entidad_personal b
                on a.codconsucode = b.codconsucode
                and b.estado = 1
            left join reg_procesos.rec_nivel_instruccion ni
                on b.cod_instruccion = ni.codigo
            left join reg_procesos.rec_unidad_logistica ul
                on b.COD_UNIDAD_LOG = ul.codigo
            left join sease.sector s
                on a.sector = s.SEC_CODIGO
            left join sease.pliego p
                on a.sector = p.SEC_CODIGO
                and a.pliego = p.PLI_CODIGO
            left join sease.actividad ac
                on a.actividad = ac.act_ccodigo
            left join sease.instancia i
                on a.actividad = i.ACT_CCODIGO and  a.instancia = i.ins_ccodigo
        order by a.descripcion, b.nombre;

        cCount number;
        cColor varchar2(20);
        cTipoEnt varchar2(5);
        cSubTipoEnt varchar2(5);
    BEGIN
        if ag_codent = '0' then
            cTipoEnt := ag_tipoent;
            cSubTipoEnt := ag_subtipoent;
        else
            cTipoEnt := 0;
            cSubTipoEnt := 0;
        end if;

        if v_tipo_vista = 1 then
            usp_print('
    <style type="text/css">
        .letra{
            font-size: x-small;
        }
    </style>');
        end if;

        if v_tipo_reporte = 1 and v_tipo_vista = 1 then
            usp_print('
        <table class="letra" border="1">
            <tr>
                <th width=5% align="center">Nro.</th>
                <th width=21% align="center">Entidad</th>
                <th width=16% align="center">Sector</th>
                <th width=16% align="center">Pliego</th>
                <th width=16% align="center">Tipo de Entidad</th>
                <th width=16% align="center">Subtipo de Entidad</th>
                <th width=5% align="center">Cantidad de Personal Declarado</th>
                <th width=5% align="center">Cantidad de Personal Registrado</th>
            </tr>');

            cCount := 0;
            for item in c_reporte_1(cTipoEnt, cSubTipoEnt, ag_codent) loop
                cCount := cCount + 1;
                usp_print('
            <tr>
                <td>'||to_char(cCount)||'</td>
                <td>'||item.descripcion||'</td>
                <td>'||item.sector||'</td>
                <td>'||item.pliego||'</td>
                <td>'||item.actividad||'</td>
                <td>'||item.instancia||'</td>
                <td>'||item.total_personal||'</td>
                <td>'||item.total_personal_reg||'</td>
            </tr>');
            end loop;
            usp_print('
        </table>');
        end if;

        if v_tipo_reporte = 1 and v_tipo_vista = 2 then
            usp_print('
        <table class="tableform" cellpadding="3" cellspacing="0" border="0" align="center" width="100%">
            <tr>
                <td colspan="6"><h3>Cantidad de Personal del OEC por Entidad</h3></td>
                <td colspan="2" align="right"><input type="button" value="Volver" onclick="volver()"/></td>
            </tr>
            <tr><td colspan="8">&nbsp;</td></tr>
            <tr>
                <th class="th1" width=5% align="center">Nro.</th>
                <th class="th1" width=21% align="center">Entidad</th>
                <th class="th1" width=16% align="center">Sector</th>
                <th class="th1" width=16% align="center">Pliego</th>
                <th class="th1" width=16% align="center">Tipo de Entidad</th>
                <th class="th1" width=16% align="center">Subtipo de Entidad</th>
                <th class="th1" width=5% align="center">Cantidad de Personal Declarado</th>
                <th class="th1" width=5% align="center">Cantidad de Personal Registrado</th>
            </tr>');

            cCount := 0;
            for item in c_reporte_1(cTipoEnt, cSubTipoEnt, ag_codent) loop
                cCount := cCount + 1;
                cColor := '';
                if mod(cCount,2) = 0 then
                    cColor := 'bgcolor="#ECE9D8"';
                end if;
                usp_print('
            <tr '||cColor||'>
                <td align="right">'||to_char(cCount)||'</td>
                <td>'||item.descripcion||'</td>
                <td>'||item.sector||'</td>
                <td>'||item.pliego||'</td>
                <td>'||item.actividad||'</td>
                <td>'||item.instancia||'</td>
                <td align="center">'||item.total_personal||'</td>
                <td align="center">'||item.total_personal_reg||'</td>
            </tr>');
            end loop;
            usp_print('
        </table>');
        end if;

        if v_tipo_reporte = 2 and v_tipo_vista = 1 then
            usp_print('
        <table class="letra" border="1">
            <tr>
                <th width=1% align="center">Nro.</th>
                <th width=11% align="center">Nombre</th>
                <th width=11% align="center">Correo Electr&oacute;nico</th>
                <th width=11% align="center">Grado de Instrucci&oacute;n</th>
                <th width=11% align="center">Unidad donde Labora</th>
                <th width=11% align="center">Entidad</th>
                <th width=11% align="center">Sector</th>
                <th width=11% align="center">Pliego</th>
                <th width=11% align="center">Tipo de Entidad</th>
                <th width=11% align="center">Subtipo de Entidad</th>
            </tr>');

            cCount := 0;
            for item in c_reporte_2(cTipoEnt, cSubTipoEnt, ag_codent) loop
                cCount := cCount + 1;
                usp_print('
            <tr>
                <td align="right">'||to_char(cCount)||'</td>
                <td>'||item.nombre||'</td>
                <td>'||item.email||'</td>
                <td>'||item.instruccion||'</td>
                <td>'||item.unidad_labor||'</td>
                <td>'||item.descripcion||'</td>
                <td>'||item.sector||'</td>
                <td>'||item.pliego||'</td>
                <td>'||item.actividad||'</td>
                <td>'||item.instancia||'</td>
            </tr>');
            end loop;
            if cCount = 0 then
                usp_print('
            <tr>
                <td colspan="10" align="center"><b><i>No se encontraron resultados</i></b></td>
            </tr>');
            end if;
            usp_print('
        </table>');
        end if;

        if v_tipo_reporte = 2 and v_tipo_vista = 2 then
            usp_print('
        <table class="tableform" cellpadding="3" cellspacing="0" border="0" align="center" width="100%">
            <tr>
                <td colspan="8"><h3>Relaci&oacute;n de Personal del OEC de Entidades</h3></td>
                <td colspan="2" align="right"><input type="button" value="Volver" onclick="volver()"/></td>
            </tr>
            <tr><td colspan="8">&nbsp;</td></tr>
            <tr>
                <th class="th1" width=1% align="center">Nro.</th>
                <th class="th1" width=11% align="center">Nombre</th>
                <th class="th1" width=11% align="center">Correo Electr&oacute;nico</th>
                <th class="th1" width=11% align="center">Grado de Instrucci&oacute;n</th>
                <th class="th1" width=11% align="center">Unidad donde Labora</th>
                <th class="th1" width=11% align="center">Entidad</th>
                <th class="th1" width=11% align="center">Sector</th>
                <th class="th1" width=11% align="center">Pliego</th>
                <th class="th1" width=11% align="center">Tipo de Entidad</th>
                <th class="th1" width=11% align="center">Subtipo de Entidad</th>
            </tr>');

            cCount := 0;
            for item in c_reporte_2(cTipoEnt, cSubTipoEnt, ag_codent) loop
                cCount := cCount + 1;
                cColor := '';
                if mod(cCount,2) = 0 then
                    cColor := 'bgcolor="#ECE9D8"';
                end if;
                usp_print('
            <tr '||cColor||'>
                <td align="right">'||to_char(cCount)||'</td>
                <td>'||item.nombre||'</td>
                <td>'||item.email||'</td>
                <td>'||item.instruccion||'</td>
                <td>'||item.unidad_labor||'</td>
                <td>'||item.descripcion||'</td>
                <td>'||item.sector||'</td>
                <td>'||item.pliego||'</td>
                <td>'||item.actividad||'</td>
                <td>'||item.instancia||'</td>
            </tr>');
            end loop;
            if cCount = 0 then
                usp_print('
            <tr>
                <td colspan="10" align="center"><b><i>No se encontraron resultados</i></b></td>
            </tr>');
            end if;
            usp_print('
        </table>');
        end if;

        if v_tipo_vista = 2 then
            usp_print('
        <input type="hidden" name="v_nivel" value=""/>
        <input type="hidden" name="v_tipo_reporte" value="'||v_tipo_reporte||'"/>

        <script language="javascript">
        function volver()
        {
            thisform.v_nivel.value = 2;
            thisform.scriptdo.value = "doView";
            thisform.submit();
        }
        </script>');
        end if;
    END;
    
    PROCEDURE USP_REC_A005_MANT_SECTOR_FORM(
        session__userid varchar2,
        v_desc_busca    varchar2,
        v_cod_sector    varchar2,
        v_des_sector    varchar2,
        v_mensaje1      varchar2,
        v_mensaje2      varchar2)
    IS
    /*
    ||    Author: Mart¿n Zanelli
    ||    Overview: Procedimiento que muestra la interfaz para el mantenimiento de los sectores 
    ||              y los pliegos del clasificador de la entidad.
    ||    Modificaciones:
    ||      26/03/2012 - Martin Zanelli - Creaci¿n del procedimiento - Memorando 97-2012/SDP-ECC - punto 4.1
    */ 
        cursor c_sector( c_desc_busca varchar2 ) is
        select 
            a.sec_codigo codigo, a.sec_desc descripcion, 
            replace(replace(a.sec_obs,'"',''),'''','') justificacion, a.sec_activo estado,
            case when a.sec_activo = 1 then 'ACTIVO' else 'INACTIVO' end estado_des
        from sease.sector a
        where 
            upper(a.sec_desc) like '%'||upper(c_desc_busca)||'%' or
            c_desc_busca is null 
        order by a.sec_activo desc, a.sec_desc;
        
        cursor c_pliego( c_sector_cod varchar2 ) is
        select 
            a.pli_codigo codigo, a.desc_pliego descripcion, 
            replace(replace(a.pli_obs,'"',''),'''','') justificacion, a.pli_activo estado,
            case when a.pli_activo = 1 then 'ACTIVO' else 'INACTIVO' end estado_des
        from sease.pliego a
        where a.sec_codigo = c_sector_cod
        order by a.pli_activo desc, a.desc_pliego;
        
        cCount number;
        cColor varchar(50);
    BEGIN
        usp_print('
        <table class="tableform" cellpadding="3" cellspacing="0" border="0" align="center" width="100%">
            <tr><td><h3>Mantenimiento de Sectores y Pliegos</h3></td></tr>
            <tr><td>&nbsp;</td></tr>
            <tr><td>
                <div id="divSectores" style="vertical-align:top;border:1px solid #000000;width:100%;height:350px;overflow:auto">
                    <table class="tableform" cellpadding="3" cellspacing="0" border="0" align="center" width="100%">
                        <tr><td><h4>Nuevo / Modificar Sector</h4></td></tr>
                        <tr><td>
                            <table class="tableform" cellpadding="3" cellspacing="0" border="0">');
        if length(case when v_mensaje1 is null then '.' else v_mensaje1 end) > 2 then
            usp_print('
                                <tr>
                                    <td colspan="3" align="center">'||
                                        case when substr(v_mensaje1,1,1) = '1' then '<font color="blue">' else '<font color="red">' end
                                        ||substr(v_mensaje1,3,length(v_mensaje1))||'</font>
                                    </td>
                                </tr>');
        end if;    
        usp_print('
                                <tr>
                                    <th class="th1" align="center">Descripci&oacute;n</th>
                                    <th class="th1" align="center">Justificaci&oacute;n</th>
                                    <th class="th1" align="center">.</<th>
                                </tr>
                                <tr>
                                    <td valign="top"><input type="text" maxlength="100" name="v_desc" style="width:300px"/></td>
                                    <td nowrap="true">
                                        <textarea name="txtObservacion" style="width:330px" rows=3 cols=48 maxlength="500" onkeyup="act_contador(1); return ismaxlength(this)"></textarea>
                                        <input type="text" name="conta_mensaje" maxlength="4" readonly style="width:10%">&nbsp;(M&aacute;x 500 caracteres).<br>
                                        <input type="hidden" name="v_accion" value="1"/>
                                        <input type="hidden" name="v_cod_sector" value=""/>
                                        <input type="hidden" name="v_des_sector" value=""/>
                                    </td>
                                    <td valign="top">
                                        <input type="button" name="btnGrabar" value="Grabar" onclick="GrabarSector()"/>&nbsp;
                                        <input type="button" name="btnCancelar" value="Cancelar" onclick="CancelarSector()" disabled="true"/>
                                    </td>
                                </tr>
                            </table>
                        </td></tr>
                        <tr><td><hr></td></tr>
                        <tr><td><h4>Sectores Registrados</h4></td></tr>');
        usp_print('
                        <tr><td>
                            <table class="tableform" cellpadding="3" cellspacing="0" border="0" width="80%">
                                <tr>
                                    <td colspan="5">
                                        Filtrar por Descripci¿n: <input type="text" name="v_desc_busca" value="'||v_desc_busca||'" style="width:250px"/>&nbsp;
                                        <input type="button" value="Buscar" onclick="buscar()"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th class="th1" align="center" width="8%">C&oacute;digo</th>
                                    <th class="th1" align="center" width="32%">Descripci&oacute;n</th>
                                    <th class="th1" align="center" width="50%">Justificaci&oacute;n</th>
                                    <th class="th1" align="center" width="10%">Estado</<th>
                                    <th class="th1" align="center">.</<th>                        
                                </tr>');
        cCount := 0;
        for item in c_sector(v_desc_busca) loop
            cCount := cCount + 1;
            cColor := '';
            if mod(cCount,2) = 0 then
                cColor := 'bgcolor="#ECE9D8"';
            end if;
            usp_print('
                                <tr '||cColor||'>
                                    <td align="center">'||item.codigo||'</td>
                                    <td align="left">'||item.descripcion||'</td>
                                    <td align="left">'||item.justificacion||'</td>
                                    <td align="center">'||item.estado_des||'</td>
                                    <td>'||
                                        case when item.estado = 1 then
                                        '<img src="images/view.gif" onclick="VerPliegos('''||item.codigo||''','''||item.descripcion||''')" alt="Ver Pliegos" style="cursor:hand" />&nbsp;
                                        <img src="images/Responder.gif" onclick="RecuperarDatosSector('''||item.codigo||''','''||item.descripcion||''','''||item.justificacion||''')" alt="Modificar Datos" style="cursor:hand" />&nbsp;
                                        <img src="images/Eliminar.gif" onclick="CambiarEstadoSector('''||item.codigo||''','''||item.descripcion||''')" alt="Inactivar" style="cursor:hand" />'
                                        else
                                        ''
                                        end|| 
                                    '</td>
                                </tr>');
        end loop;
        usp_print('
                            </table>
                        </td></tr>
                    </table>
                </div>
            </td></tr>
            <tr><td>
                <div id="divPliegos" style="vertical-align:top;border:1px solid #000000;width:100%;height:300px;overflow:auto">
                    <table class="tableform" cellpadding="3" cellspacing="0" border="0" align="center" width="100%">
                        <tr><td><h4>Nuevo / Modificar Pliego</h4></td></tr>
                        <tr><td>
                            <table class="tableform" cellpadding="3" cellspacing="0" border="0">');
        if length(case when v_mensaje2 is null then '.' else v_mensaje2 end) > 2 then
            usp_print('
                                <tr>
                                    <td colspan="3" align="center">'||
                                        case when substr(v_mensaje2,1,1) = '1' then '<font color="blue">' else '<font color="red">' end
                                        ||substr(v_mensaje2,3,length(v_mensaje2))||'</font>
                                    </td>
                                </tr>');
        end if;    
        usp_print('
                                <tr>
                                    <th class="th1" align="center">Sector</th>
                                    <th class="th1" align="center">Descripci&oacute;n</th>
                                    <th class="th1" align="center">Justificaci&oacute;n</th>
                                    <th class="th1" align="center">.</<th>
                                </tr>
                                <tr>
                                    <td valign="top"><input type="text" maxlength="100" name="v_des_sector1" value="'||v_cod_sector||' - '||v_des_sector||'" style="width:300px;background-color:#B5EDC4;" readonly/></td>
                                    <td valign="top"><input type="text" maxlength="100" name="v_pliego_desc" value="" style="width:300px"/></td>
                                    <td nowrap="true">
                                        <textarea name="v_pliego_just" style="width:330px" rows=3 cols=48 maxlength="500" onkeyup="act_contador(2); return ismaxlength(this)"></textarea>
                                        <input type="text" name="conta_msj_pliego" maxlength="4" readonly style="width:10%">&nbsp;(M&aacute;x 500 caracteres).<br>
                                        <input type="hidden" name="v_accion_pliego" value="1"/>
                                        <input type="hidden" name="v_cod_pliego" value=""/>
                                        <input type="hidden" name="v_cod_sector1" value="'||v_cod_sector||'"/>
                                    </td>
                                    <td valign="top">
                                        <input type="button" name="btnGrabarPliego" value="Grabar" onclick="GrabarPliego()" '||case when v_cod_sector is null then 'disabled="true"' else '' end||'/>&nbsp;
                                        <input type="button" name="btnCancelarPliego" value="Cancelar" onclick="CancelarPliego()" disabled="true"/>
                                    </td>
                                </tr>
                            </table>
                        </td></tr>
                        <tr><td><hr></td></tr>
                        <tr><td><h4>Pliegos Registrados del Sector '||v_des_sector||'</h4></td></tr>');
        usp_print('
                        <tr><td>
                            <table class="tableform" cellpadding="3" cellspacing="0" border="0" width="80%">
                                <tr>
                                    <th class="th1" align="center" width="8%">C&oacute;digo</th>
                                    <th class="th1" align="center" width="32%">Descripci&oacute;n</th>
                                    <th class="th1" align="center" width="50%">Justificaci&oacute;n</th>
                                    <th class="th1" align="center" width="10%">Estado</<th>
                                    <th class="th1" align="center">.</<th>                        
                                </tr>');
        cCount := 0;
        for item in c_pliego(v_cod_sector) loop
            cCount := cCount + 1;
            cColor := '';
            if mod(cCount,2) = 0 then
                cColor := 'bgcolor="#ECE9D8"';
            end if;
            usp_print('
                                <tr '||cColor||'>
                                    <td align="center">'||item.codigo||'</td>
                                    <td align="left">'||item.descripcion||'</td>
                                    <td align="left">'||item.justificacion||'</td>
                                    <td align="center">'||item.estado_des||'</td>
                                    <td>'||
                                        case when item.estado = 1 then
                                        '<img src="images/Responder.gif" onclick="RecuperarDatosPliego('''||item.codigo||''','''||item.descripcion||''','''||item.justificacion||''')" alt="Modificar Datos" style="cursor:hand" />&nbsp;
                                        <img src="images/Eliminar.gif" onclick="CambiarEstadoPliego('''||item.codigo||''','''||item.descripcion||''')" alt="Inactivar" style="cursor:hand" />'
                                        else
                                        ''
                                        end|| 
                                    '</td>
                                </tr>');
        end loop;
        if cCount = 0 then
            usp_print('
                                <tr>
                                    <td colspan="5" align="center"><b><i>No hay resultados para mostrar.<br>Seleccione un Sector.</i></b></td>
                                </tr>');
        end if;
        usp_print('
                            </table>
                        </td></tr>
                    </table>    
                </div>
            </td></tr>
        </table>');
        
        USP_GEN_JSCRIPT;
        
        usp_print('
        <script>
        function act_contador(tipo) 
        {
            if (tipo == 1)
                document.all("conta_mensaje").value = document.all("txtObservacion").value.length;
            if (tipo == 2)
                document.all("conta_msj_pliego").value = document.all("v_pliego_just").value.length;
        }
        
        function ismaxlength(obj)
        { 
            var mlength=obj.getAttribute? parseInt(obj.getAttribute("maxlength")) : "";
            if (obj.getAttribute && obj.value.length>mlength)
                obj.value=obj.value.substring(0,mlength);
        }
        
        function ValidarString(ls_obj, ls_mensage)
        {
            var strCadena = ls_obj.value;
            var valido= "ABCDEFGHIJKLMNOPQRSTUVWYXZ0123456789abcdefghijklmnopqrstuvwxyz¿¿¿¿¿¿¿¿¿¿#()=*+}{[]-:,.!&/ ";
            for (i = 0 ; i <= strCadena.length - 1; i++)
            {
                if(!vacio(trim(strCadena.substring(i,i+1))))
                {
                    if (valido.indexOf (strCadena.substring(i,i+1),0) == -1)
                    {
                        ls_obj.select();
                        alert("Hay un caracter no permitido en el campo " + ls_mensage + "\nel caracter no permitido es ( "+strCadena.substring(i,i+1)+" )");
                    ls_obj.focus();
                        return false;
                    }
                }
            }  
            return true;
        }
        
        function GrabarSector()
        {
            //validar campos
            if (!ValidarBlanco(thisform.v_desc, "Descripci\xf3n"))
                return false;
            if (!ValidarString(thisform.v_desc, "Descripci\xf3n"))
                return false;
            if (!ValidarBlanco(thisform.txtObservacion, "Justificaci\xf3n"))
                return false;
            if (!ValidarString(thisform.txtObservacion, "Justificaci\xf3n"))
                return false;
            
            if (thisform.v_accion.value == 1)
            {
                if ( confirm("¿Est\xe1 usted seguro de grabar los datos?") )
                {
                    thisform.scriptdo.value = "doInsertSector";
                    thisform.submit();
                }
            }
            
            if (thisform.v_accion.value == 2)
            {   
                if ( thisform.v_cod_sector.value == "")
                {
                    alert("Ocurri\xf3 un error al modificar el Sector. Vuelva a seleccionarlo y modificar los datos.");
                    return false;
                }
                
                if ( confirm("¿Est\xe1 usted seguro de modificar los datos?") )
                {
                    thisform.scriptdo.value = "doUpdateSector";
                    thisform.submit();
                }
            }
        }
        
        function RecuperarDatosSector(codigo, descripcion, justificacion)
        {
            if ( confirm("¿Desea modificar los datos del Sector " + descripcion + "?") )
            {
                thisform.btnGrabar.value = "Actualizar";
                thisform.btnCancelar.disabled = false;
        
                thisform.v_cod_sector.value = codigo;
                thisform.v_desc.value = descripcion;
                thisform.txtObservacion.value = justificacion;
                act_contador(); 
                ismaxlength(thisform.txtObservacion);
                
                thisform.v_accion.value = 2;
            }
        }
        
        function CancelarSector()
        { 
            if ( confirm("¿Desea cancelar esta acci\xf3n?") )
            {
                thisform.btnGrabar.value = "Grabar";
                thisform.btnCancelar.disabled = true;
                
                thisform.v_accion.value = 1;
                thisform.v_cod_sector.value = "";
                thisform.v_desc.value = "";
                thisform.txtObservacion.value = "";
                thisform.conta_mensaje.value = "";
            }
        }
        
        function CambiarEstadoSector(codigo, sector)
        {
            if ( confirm("¿Desea inactivar el sector " + sector + "?") )
            {
                thisform.v_accion.value = 3;
                thisform.v_cod_sector.value = codigo;
                thisform.scriptdo.value = "doUpdateSector";
                thisform.submit();
            }
        }
        
        function buscar()
        {
            thisform.scriptdo.value = "doView";
            thisform.submit();
        }
        
        function VerPliegos(codigo, sector)
        { 
            thisform.v_cod_sector.value = codigo;
            thisform.v_des_sector.value = sector;
            thisform.scriptdo.value = "doView";
            thisform.submit();
        }
        
        function GrabarPliego()
        {
            //validar campos
            if (!ValidarBlanco(thisform.v_pliego_desc, "Descripci\xf3n"))
                return false;
            if (!ValidarString(thisform.v_pliego_desc, "Descripci\xf3n"))
                return false;
            if (!ValidarBlanco(thisform.v_pliego_just, "Justificaci\xf3n"))
                return false;
            if (!ValidarString(thisform.v_pliego_just, "Justificaci\xf3n"))
                return false;
                
            if (thisform.v_accion_pliego.value == 1)
            {
                if ( confirm("¿Est\xe1 usted seguro de grabar los datos?") )
                {
                    thisform.scriptdo.value = "doInsertPliego";
                    thisform.submit();
                }
            }
            
            if (thisform.v_accion_pliego.value == 2)
            {   
                if ( thisform.v_cod_pliego.value == "")
                {
                    alert("Ocurri\xf3 un error al modificar el Pliego. Vuelva a seleccionarlo y modificar los datos.");
                    return false;
                }
                
                if ( confirm("¿Est\xe1 usted seguro de modificar los datos?") )
                {
                    thisform.scriptdo.value = "doUpdatePliego";
                    thisform.submit();
                }
            }
        }
        
        function RecuperarDatosPliego(codigo, descripcion, justificacion)
        {
            if ( confirm("¿Desea modificar los datos del Pliego " + descripcion + "?") )
            {
                thisform.btnGrabarPliego.value = "Actualizar";
                thisform.btnCancelarPliego.disabled = false;
        
                thisform.v_cod_pliego.value = codigo;
                thisform.v_pliego_desc.value = descripcion;
                thisform.v_pliego_just.value = justificacion;
                act_contador(2); 
                ismaxlength(thisform.v_pliego_just);
                
                thisform.v_accion_pliego.value = 2;
            }
        }
        
        function CancelarPliego()
        { 
            if ( confirm("¿Desea cancelar esta acci\xf3n?") )
            {
                thisform.btnGrabarPliego.value = "Grabar";
                thisform.btnCancelarPliego.disabled = true;
                
                thisform.v_accion_pliego.value = 1;
                thisform.v_cod_pliego.value = "";
                thisform.v_pliego_desc.value = "";
                thisform.v_pliego_just.value = "";
                thisform.conta_msj_pliego.value = "";
            }
        }
        
        function CambiarEstadoPliego(codigo, sector)
        {
            if ( confirm("¿Desea inactivar el pliego " + sector + "?") )
            {
                thisform.v_accion_pliego.value = 3;
                thisform.v_cod_pliego.value = codigo;
                thisform.scriptdo.value = "doUpdatePliego";
                thisform.submit();
            }
        }
        </script>');
    END;
    
    PROCEDURE USP_REC_A005_INSERT_SECTOR(
        session__userid varchar2,
        v_desc varchar2,
        txtObservacion varchar2)
    IS
    /*
    ||    Author: Mart¿n Zanelli
    ||    Overview: Procedimiento que registra un nuevo sector en la BD 
    ||    Modificaciones:
    ||      26/03/2012 - Martin Zanelli - Creaci¿n del procedimiento - Memorando 97-2012/SDP-ECC - punto 4.1
    */ 
        cMensaje varchar(200);
        cCodSector char(2);
    BEGIN
        begin
            select max(se.sec_codigo)+1 into cCodSector 
            from sease.sector se
            where se.sec_codigo not in(99,89);

            insert into sease.sector
            ( sec_codigo, sec_desc, sec_obs, sec_activo, usu_ult_modi, fec_ult_modi )
            values
            ( cCodSector, UPPER(v_desc), UPPER(txtObservacion), 1, session__userid, sysdate );
            commit;
        
            cMensaje := '1-La operaci&oacute;n se realiz&oacute; con &eacute;xito';
        exception
            when others then
                rollback;
                cMensaje := '0-Ocurri&oacute; el siguiente error: '||SQLERRM||' - '||SQLCODE||'.<br>No se pudo completar la operaci&oacute;n';
        end;
        
        usp_print('
        <input type="hidden" name="v_mensaje1" value=""/>
        <script language="javascript">
            thisform.v_mensaje1.value = "'||cMensaje||'";
            thisform.scriptdo.value="doView";
            thisform.submit(); 
        </script>');
    END;
    
    PROCEDURE USP_REC_A005_INSERT_PLIEGO(
        session__userid varchar2,
        v_cod_sector1   varchar2,
        v_des_sector1   varchar2,
        v_pliego_desc   varchar2,
        v_pliego_just   varchar2)
    IS
    /*
    ||    Author: Mart¿n Zanelli
    ||    Overview: Procedimiento que registra un nuevo pliego en la BD 
    ||    Modificaciones:
    ||      26/03/2012 - Martin Zanelli - Creaci¿n del procedimiento - Memorando 97-2012/SDP-ECC - punto 4.1
    */ 
        cMensaje varchar(200);
        cCodPliego char(3);
    BEGIN
        begin
            select max(sp.pli_codigo)+1 into cCodPliego 
            from sease.pliego sp;
            
            insert into sease.pliego 
            ( sec_codigo, pli_codigo, pli_obs, usu_ult_modi, fec_ult_modi, desc_pliego )
            values
            ( v_cod_sector1, cCodPliego, UPPER(v_pliego_just), session__userid, sysdate, UPPER(v_pliego_desc) );
        
            cMensaje := '1-La operaci&oacute;n se realiz&oacute; con &eacute;xito';
        exception
            when others then
                rollback;
                cMensaje := '0-Ocurri&oacute; el siguiente error: '||SQLERRM||' - '||SQLCODE||'.<br>No se pudo completar la operaci&oacute;n';
        end;
        
        usp_print('
        <input type="hidden" name="v_cod_sector" value="'||v_cod_sector1||'"/>
        <input type="hidden" name="v_des_sector" value="'||substr(v_des_sector1,5,length(v_des_sector1))||'"/>
        <input type="hidden" name="v_mensaje2" value=""/>
        <script language="javascript">
            thisform.v_mensaje2.value = "'||cMensaje||'";
            thisform.scriptdo.value="doView";
            thisform.submit(); 
        </script>');
    END;
    
    PROCEDURE USP_REC_A005_UPDATE_SECTOR(
        session__userid varchar2,
        v_accion        varchar2,
        v_cod_sector varchar2,
        v_desc          varchar2,
        txtObservacion  varchar2)
    IS
    /*
    ||    Author: Mart¿n Zanelli
    ||    Overview: Procedimiento que actualiza un sector en la BD 
    ||    Modificaciones:
    ||      26/03/2012 - Martin Zanelli - Creaci¿n del procedimiento - Memorando 97-2012/SDP-ECC - punto 4.1
    */ 
        cMensaje varchar(200);
        cCodSector char(2);
    BEGIN
        begin
            if v_accion = 2 then
                update sease.sector
                set 
                    sec_desc = UPPER(v_desc),
                    sec_obs = UPPER(txtObservacion),
                    usu_ult_modi = session__userid,
                    fec_ult_modi = sysdate
                where 
                    sec_codigo = v_cod_sector;
            end if;
            if v_accion = 3 then
                update sease.sector
                set 
                    sec_activo = 0,
                    usu_ult_modi = session__userid,
                    fec_ult_modi = sysdate
                where 
                    sec_codigo = v_cod_sector;
            end if;

            commit;
        
            cMensaje := '1-La operaci&oacute;n se realiz&oacute; con &eacute;xito';
        exception
            when others then
                rollback;
                cMensaje := '0-Ocurri&oacute; el siguiente error: '||SQLERRM||' - '||SQLCODE||'.<br>No se pudo completar la operaci&oacute;n';
        end;
        
        usp_print('
        <input type="hidden" name="v_mensaje1" value=""/>
        <script language="javascript">
            thisform.v_mensaje1.value = "'||cMensaje||'";
            thisform.scriptdo.value="doView";
            thisform.submit(); 
        </script>');
    END;
    
    PROCEDURE USP_REC_A005_UPDATE_PLIEGO(
        session__userid varchar2,
        v_cod_sector1   varchar2,
        v_des_sector1   varchar2,
        v_accion_pliego varchar2,
        v_cod_pliego    varchar2,
        v_pliego_desc   varchar2,
        v_pliego_just   varchar2)
    IS
    /*
    ||    Author: Mart¿n Zanelli
    ||    Overview: Procedimiento que actualiza un pliego en la BD 
    ||    Modificaciones:
    ||      26/03/2012 - Martin Zanelli - Creaci¿n del procedimiento - Memorando 97-2012/SDP-ECC - punto 4.1
    */ 
        cMensaje varchar(200);
        cCodSector char(2);
    BEGIN
        begin
            if v_accion_pliego = 2 then
                update sease.pliego
                set 
                    pli_desc = UPPER(v_pliego_desc),
                    pli_obs = UPPER(v_pliego_just),
                    usu_ult_modi = session__userid,
                    fec_ult_modi = sysdate
                where 
                    sec_codigo = v_cod_sector1
                    and pli_codigo = v_cod_pliego;
            end if;
            if v_accion_pliego = 3 then
                update sease.pliego
                set 
                    pli_activo = 0,
                    usu_ult_modi = session__userid,
                    fec_ult_modi = sysdate
                where 
                    sec_codigo = v_cod_sector1
                    and pli_codigo = v_cod_pliego;
            end if;

            commit;
        
            cMensaje := '1-La operaci&oacute;n se realiz&oacute; con &eacute;xito';
        exception
            when others then
                rollback;
                cMensaje := '0-Ocurri&oacute; el siguiente error: '||SQLERRM||' - '||SQLCODE||'.<br>No se pudo completar la operaci&oacute;n';
        end;
        
        usp_print('
        <input type="hidden" name="v_cod_sector" value="'||v_cod_sector1||'"/>
        <input type="hidden" name="v_des_sector" value="'||substr(v_des_sector1,5,length(v_des_sector1))||'"/>
        <input type="hidden" name="v_mensaje2" value=""/>
        <script language="javascript">
            thisform.v_mensaje2.value = "'||cMensaje||'";
            thisform.scriptdo.value="doView";
            thisform.submit(); 
        </script>');
    END;
    
    PROCEDURE USP_REC_A002_EXCEL_ENT( 
        v_actividad           varchar2,
        v_instancia           varchar2,
        v_sector              varchar2,
        v_pliego              varchar2,
        v_uni_eje             varchar2,
        v_cod_estado          number,
        fec_act_ini           varchar2,
        fec_act_fin           varchar2,
        session__anhoentidad  number,
        v_dep_codigo_vb       varchar2,
        v_pro_codigo_vb       varchar2,
        v_dis_codigo_vb       varchar2)
    IS
    /*
    ||    Author: Mart¿n Zanelli
    ||    Overview: Procedimiento que genera el reporte en excel de entidades que han 
    ||              realizado la actualizaci¿n de sus datos
    */
    
        cursor c_reporte is
        select 
            rownum num, e.codconsucode, e.f_registro, e.descripcion, e.n_ruc, 
            dep.dep_desc|| ' / ' ||pro.pro_desc|| ' / ' ||dis.dis_desc as ubigeo,
            e.direccion, x.f_actualizacion, x.usu_actualizacion, 
            CASE WHEN e.activo = 1 THEN 'ACTIVO' ELSE 'INACTIVO' end estado,
            se.SEC_DESC sector_des, pl.DESC_PLIEGO pliego_des, se.SEC_CODIGO sector_cod, 
            pl.PLI_CODIGO pliego_cod, ac.act_ccodigo activi_cod, ac.ACT_VDESC activi_des, 
            i.ins_ccodigo instan_cod, i.INS_VDESC instan_des
        from
            sease.entidades e
            inner join 
            (
                select a.cod_entidad, a.usu_registro usu_actualizacion, a.fec_registro f_actualizacion
                from 
                    sease.entidad_historial a
                    inner join 
                    (
                        select eh.cod_entidad, max(eh.cod_historial) cod_historial
                        from sease.entidad_historial eh
                        where eh.tipo_usuario = 'E'
                        and (eh.fec_registro >= to_date(fec_act_ini, 'dd/mm/yyyy') or fec_act_ini is null) 
                        and (eh.fec_registro <= to_date(fec_act_fin, 'dd/mm/yyyy') + 1 or fec_act_fin is null)                        
                        group by eh.cod_entidad 
                    ) b
                        on a.cod_historial = b.cod_historial
            ) x        
                on e.codconsucode = x.cod_entidad
                and e.anhoentidad = to_char(sysdate,'yyyy')
            left join sease.dep_ubigeo dep  on e.dep_coddpto = dep.dep_codigo
            left join sease.prov_ubigeo pro on e.pro_codprov = pro.dep_codigo||''||pro.pro_codigo
            left join sease.dist_ubigeo dis on e.dis_coddist = dis.dep_codigo||''||dis.pro_codigo||''||dis.dis_codigo
            left join sease.sector se on se.SEC_CODIGO = e.sector
            left join sease.pliego pl on e.sector = pl.SEC_CODIGO and e.pliego = pl.PLI_CODIGO
            left join sease.actividad ac on e.actividad = ac.act_ccodigo
            left join sease.instancia i on e.actividad = i.ACT_CCODIGO and e.instancia = i.ins_ccodigo 
        where 
            (e.actividad = v_actividad or v_actividad is null)
            and (e.instancia = v_instancia or v_instancia is null)
            and (e.sector = SUBSTR(v_sector,2,3) or SUBSTR(v_sector,2,3) is null)
            and (trim(e.pliego) = trim(v_pliego) or v_pliego is null)
            and (trim(e.uejecutora) = trim(v_uni_eje) or v_uni_eje is null)
            and (e.activo = v_cod_estado or v_cod_estado is null)
            and (e.fec_ult_modi >= to_date(fec_act_ini, 'dd/mm/yyyy') or fec_act_ini is null) 
            and (e.fec_ult_modi <= to_date(fec_act_fin, 'dd/mm/yyyy') + 1 or fec_act_fin is null)
            and (e.dis_coddist = v_dep_codigo_vb||''||v_pro_codigo_vb||''||v_dis_codigo_vb  or  v_dep_codigo_vb||''||v_pro_codigo_vb||''||v_dis_codigo_vb is null)
        order by e.codconsucode;
    
        v_sw           number;
        ln_cont        number;
        cColor         varchar2(50);
    BEGIN
        usp_print('
        <style type="text/css">
        .letra{
        font-size: x-small;
        }
        </style>');  
 
        usp_print('
        <table class="letra" border="1">
            <tr>
                <th align="center" class="th1">Nro.</th>
                <th align="center" class="th1">C&oacute;digo</th>
                <th align="center" class="th1">Estado</th>
                <th align="center" class="th1">Fecha de Creaci&oacute;n</th>
                <th align="center" class="th1">Entidad</th>
                <th align="center" class="th1">RUC</th> 
                <th align="center" class="th1">Ubicaci&oacute;n</th>
                <th align="center" class="th1">Direcci&oacute;n</th>
                <th align="center" class="th1">Fecha y Hora de &Uacute;ltima Actualizaci&oacute;n</th>
                <th align="center" class="th1">Usuario que Actualiz&oacute;</th>
                <th align="center" class="th1">Sector</th>
                <th align="center" class="th1">Pliego</th>
                <th align="center" class="th1">Tipo de Entidad</th>
                <th align="center" class="th1">Subtipo de Entidad</th>
            </tr>');
         
        ln_cont := 0; 
        v_sw := 1; 
        for xrow in c_reporte loop
            cColor := '';    
            if v_sw = 1 then
                cColor := 'bgcolor="ECE9D8"';
            end if;

            ln_cont := ln_cont + 1;
            usp_print('
            <tr>
                <td align="center" '||cColor||'>'||ln_cont||'</td>
                <td align="center" '||cColor||'>'||xrow.codconsucode||'</td>
                <td align="center" '||cColor||'>'||xrow.estado||'</td>
                <td align="center" '||cColor||'>'||to_char(xrow.f_registro,'dd/mm/yyyy hh24:mi:ss')||'</td>
                <td align="left"   '||cColor||'>'||xrow.descripcion||'</td>
                <td align="center" '||cColor||'>'||xrow.n_ruc||'</td>
                <td align="left"   '||cColor||'>'||xrow.ubigeo||'</td>
                <td align="left"   '||cColor||'>'||xrow.direccion||'</td>
                <td align="center" '||cColor||'>'||to_char(xrow.f_actualizacion,'dd/mm/yyyy hh24:mi:ss')||'</td>
                <td align="left"   '||cColor||'>'||xrow.usu_actualizacion||'&nbsp;</td>
                <td align="left"   '||cColor||'>'||xrow.sector_cod||' - '||xrow.sector_des||'&nbsp;</td>
                <td align="left"   '||cColor||'>'||xrow.pliego_cod||' - '||xrow.pliego_des||'&nbsp;</td>
                <td align="left"   '||cColor||'>'||xrow.activi_cod||' - '||xrow.activi_des||'&nbsp;</td>
                <td align="left"   '||cColor||'>'||xrow.instan_cod||' - '||xrow.instan_des||'&nbsp;</td>
            </tr>');
            v_sw := v_sw * (-1);  
        end loop;
        
        if ln_cont = 0 then
            usp_print('
            <tr><td align="center" colspan="9"><i>No se encontraron resultados.</i></td></tr>');
        end if;
        
        usp_print('
        </table>');
    END;
    
    PROCEDURE USP_REC_A002_RESULT_ENT( 
        v_actividad           varchar2,
        v_instancia           varchar2,
        v_sector              varchar2,
        v_pliego              varchar2,
        v_uni_eje             varchar2,
        v_cod_estado          number,
        fec_act_ini           varchar2,
        fec_act_fin           varchar2,
        session__anhoentidad  number,
        v_dep_codigo_vb       varchar2,
        v_pro_codigo_vb       varchar2,
        v_dis_codigo_vb       varchar2,
        ag_currentpage        number)
    IS
    /*
    ||    Author: Mart¿n Zanelli
    ||    Overview: Procedimiento que genera el reporte en pantalla de entidades que han 
    ||              realizado la actualizaci¿n de sus datos
    */
        cursor c_reporte (c_total_x_pag number, c_currentpage number) is
        select 
            z.codconsucode, z.f_registro, z.descripcion, z.n_ruc, z.ubigeo,
            z.direccion, z.f_actualizacion, z.usu_actualizacion, estado, 
            sector_des, pliego_des, sector_cod, pliego_cod, activi_cod, activi_des,
            instan_cod, instan_des
        from 
        (
            select 
                rownum num, e.codconsucode, e.f_registro, e.descripcion, e.n_ruc, 
                dep.dep_desc|| ' / ' ||pro.pro_desc|| ' / ' ||dis.dis_desc as ubigeo,
                e.direccion, x.f_actualizacion, x.usu_actualizacion, 
                CASE WHEN e.activo = 1 THEN 'ACTIVO' ELSE 'INACTIVO' end estado,
                se.SEC_DESC sector_des, pl.DESC_PLIEGO pliego_des, se.SEC_CODIGO sector_cod, 
                pl.PLI_CODIGO pliego_cod, ac.act_ccodigo activi_cod, ac.ACT_VDESC activi_des, 
                i.ins_ccodigo instan_cod, i.INS_VDESC instan_des
            from
                sease.entidades e
                inner join 
                (
                    select a.cod_entidad, a.usu_registro usu_actualizacion, a.fec_registro f_actualizacion
                    from 
                        sease.entidad_historial a
                        inner join 
                        (
                            select eh.cod_entidad, max(eh.cod_historial) cod_historial
                            from sease.entidad_historial eh
                            where eh.tipo_usuario = 'E'
                            and (eh.fec_registro >= to_date(fec_act_ini, 'dd/mm/yyyy') or fec_act_ini is null) 
                            and (eh.fec_registro <= to_date(fec_act_fin, 'dd/mm/yyyy') + 1 or fec_act_fin is null)                        
                            group by eh.cod_entidad 
                        ) b
                            on a.cod_historial = b.cod_historial
                ) x        
                    on e.codconsucode = x.cod_entidad
                    and e.anhoentidad = to_char(sysdate,'yyyy')
                left join sease.dep_ubigeo dep  on e.dep_coddpto = dep.dep_codigo
                left join sease.prov_ubigeo pro on e.pro_codprov = pro.dep_codigo||''||pro.pro_codigo
                left join sease.dist_ubigeo dis on e.dis_coddist = dis.dep_codigo||''||dis.pro_codigo||''||dis.dis_codigo
                left join sease.sector se on se.SEC_CODIGO = e.sector
                left join sease.pliego pl on e.sector = pl.SEC_CODIGO and e.pliego = pl.PLI_CODIGO
                left join sease.actividad ac on e.actividad = ac.act_ccodigo
                left join sease.instancia i on e.actividad = i.ACT_CCODIGO and e.instancia = i.ins_ccodigo 
            where 
                (e.actividad = v_actividad or v_actividad is null)
                and (e.instancia = v_instancia or v_instancia is null)
                and (e.sector = SUBSTR(v_sector,2,3) or SUBSTR(v_sector,2,3) is null)
                and (trim(e.pliego) = trim(v_pliego) or v_pliego is null)
                and (trim(e.uejecutora) = trim(v_uni_eje) or v_uni_eje is null)
                and (e.activo = v_cod_estado or v_cod_estado is null)
                and (e.fec_ult_modi >= to_date(fec_act_ini, 'dd/mm/yyyy') or fec_act_ini is null) 
                and (e.fec_ult_modi <= to_date(fec_act_fin, 'dd/mm/yyyy') + 1 or fec_act_fin is null)
                and (e.dis_coddist = v_dep_codigo_vb||''||v_pro_codigo_vb||''||v_dis_codigo_vb  or  v_dep_codigo_vb||''||v_pro_codigo_vb||''||v_dis_codigo_vb is null)
            order by e.codconsucode
        )z
        WHERE 
            z.num BETWEEN c_total_x_pag * (TO_NUMBER (c_currentpage) - 1) + 1
            AND c_total_x_pag * TO_NUMBER (c_currentpage);
    
        v_sw           number;
        ln_cont        number;
        cColor         varchar2(50);
        lv_currentpage number;
        cTotalPag      number;
        cTotalReg      number;
    BEGIN
        cTotalPag := 25;
        IF ag_currentpage IS NULL THEN
            lv_currentpage := 1;
        ELSE
            lv_currentpage := ag_currentpage;
        END IF;
        
        --obtenemos el total de registros
        select count(*) into cTotalReg
        from
            sease.entidades e
            inner join 
            (
                select a.cod_entidad, a.usu_registro usu_actualizacion, a.fec_registro f_actualizacion
                from 
                    sease.entidad_historial a
                    inner join 
                    (
                        select eh.cod_entidad, max(eh.cod_historial) cod_historial
                        from sease.entidad_historial eh
                        where eh.tipo_usuario = 'E'
                        and (eh.fec_registro >= to_date(fec_act_ini, 'dd/mm/yyyy') or fec_act_ini is null) 
                        and (eh.fec_registro <= to_date(fec_act_fin, 'dd/mm/yyyy') + 1 or fec_act_fin is null)                        
                        group by eh.cod_entidad 
                    ) b
                        on a.cod_historial = b.cod_historial
            ) x        
                on e.codconsucode = x.cod_entidad
                and e.anhoentidad = to_char(sysdate,'yyyy')
            left join sease.dep_ubigeo dep  on e.dep_coddpto = dep.dep_codigo
            left join sease.prov_ubigeo pro on e.pro_codprov = pro.dep_codigo||''||pro.pro_codigo
            left join sease.dist_ubigeo dis on e.dis_coddist = dis.dep_codigo||''||dis.pro_codigo||''||dis.dis_codigo
        where 
            (e.actividad = v_actividad or v_actividad is null)
            and (e.instancia = v_instancia or v_instancia is null)
            and (e.sector = SUBSTR(v_sector,2,3) or SUBSTR(v_sector,2,3) is null)
            and (trim(e.pliego) = trim(v_pliego) or v_pliego is null)
            and (trim(e.uejecutora) = trim(v_uni_eje) or v_uni_eje is null)
            and (e.activo = v_cod_estado or v_cod_estado is null)
            and (e.fec_ult_modi >= to_date(fec_act_ini, 'dd/mm/yyyy') or fec_act_ini is null) 
            and (e.fec_ult_modi <= to_date(fec_act_fin, 'dd/mm/yyyy') + 1 or fec_act_fin is null)
            and (e.dis_coddist = v_dep_codigo_vb||''||v_pro_codigo_vb||''||v_dis_codigo_vb  or  v_dep_codigo_vb||''||v_pro_codigo_vb||''||v_dis_codigo_vb is null)
        order by e.codconsucode;
        
        showpaginacion( lv_currentpage, cTotalReg,
                        'v_actividad='
                        || v_actividad
                        ||'&v_instancia='
                        || v_instancia
                        || '&v_sector='
                        || v_sector
                        || '&v_pliego='
                        || v_pliego
                        || '&v_uni_eje='
                        || trim(v_uni_eje)
                        || '&v_cod_estado='
                        || v_cod_estado
                        || '&fec_act_ini='
                        || fec_act_ini
                        || '&fec_act_fin='
                        || fec_act_fin 
                        || '&v_dep_codigo_vb='
                        || v_dep_codigo_vb 
                        || '&v_pro_codigo_vb='
                        || v_pro_codigo_vb
                        || '&v_dis_codigo_vb='
                        || v_dis_codigo_vb,
                        '&scriptdo=doResultEnt',
                        15); 
    
        usp_print('
        <table class="tableform" cellpadding="3" cellspacing="0" border="0" align="center" width="100%">
            <tr>
                <th align="center" class="th1">Nro.</th>
                <th align="center" class="th1">C&oacute;digo</th>
                <th align="center" class="th1">Estado</th>
                <th align="center" class="th1">Fecha de Creaci&oacute;n</th>
                <th align="center" class="th1">Entidad</th>
                <th align="center" class="th1">RUC</th> 
                <th align="center" class="th1">Ubicaci&oacute;n</th>
                <th align="center" class="th1">Direcci&oacute;n</th>
                <th align="center" class="th1">Fecha y Hora de &Uacute;ltima Actualizaci&oacute;n</th>
                <th align="center" class="th1">Usuario que Actualiz&oacute;</th>
                <th align="center" class="th1">Sector</th>
                <th align="center" class="th1">Pliego</th>
                <th align="center" class="th1">Tipo de Entidad</th>
                <th align="center" class="th1">Subtipo de Entidad</th>
            </tr>');
         
        ln_cont := 0; 
        v_sw := 1; 
        for xrow in c_reporte(cTotalPag, lv_currentpage) loop
            cColor := '';    
            if v_sw = 1 then
                cColor := 'bgcolor="ECE9D8"';
            end if;

            ln_cont := ln_cont + 1;
            usp_print('
            <tr>
                <td align="center" '||cColor||'>'||ln_cont||'</td>
                <td align="center" '||cColor||'>'||xrow.codconsucode||'</td>
                <td align="center" '||cColor||'>'||xrow.estado||'</td>
                <td align="center" '||cColor||'>'||to_char(xrow.f_registro,'dd/mm/yyyy hh24:mi:ss')||'</td>
                <td align="left"   '||cColor||'>'||xrow.descripcion||'</td>
                <td align="center" '||cColor||'>'||xrow.n_ruc||'</td>
                <td align="left"   '||cColor||'>'||xrow.ubigeo||'</td>
                <td align="left"   '||cColor||'>'||xrow.direccion||'</td>
                <td align="center" '||cColor||'>'||to_char(xrow.f_actualizacion,'dd/mm/yyyy hh24:mi:ss')||'</td>
                <td align="left"   '||cColor||'>'||xrow.usu_actualizacion||'&nbsp;</td>
                <td align="left"   '||cColor||'>'||xrow.sector_cod||' - '||xrow.sector_des||'&nbsp;</td>
                <td align="left"   '||cColor||'>'||xrow.pliego_cod||' - '||xrow.pliego_des||'&nbsp;</td>
                <td align="left"   '||cColor||'>'||xrow.activi_cod||' - '||xrow.activi_des||'&nbsp;</td>
                <td align="left"   '||cColor||'>'||xrow.instan_cod||' - '||xrow.instan_des||'&nbsp;</td>
            </tr>');
    
            v_sw := v_sw * (-1);  
        end loop;
        
        if ln_cont = 0 then
            usp_print('
            <tr><td align="center" colspan="9"><b><i>No se encontraron resultados.</i></b></td></tr>');
        end if;
        
        usp_print('
        </table>');
    END;
end;
/
