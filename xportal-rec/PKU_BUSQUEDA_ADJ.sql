CREATE OR REPLACE package pku_busqueda_adj is

  -- Author  : CLEONV
  -- Created : 09/02/2012 17:10:25
  -- Purpose : 
  
  -- Public type declarations
PROCEDURE USP_FORMULARIO_BUSQUEDA(v_ruc varchar2:= '',
  ag_currentpage          IN   VARCHAR2 := 1);
  
PROCEDURE showpaginacion (
      currentpage   IN   VARCHAR2,
      num_users     IN   NUMBER,
      enlace        IN   VARCHAR2,
      modulo        IN   VARCHAR2,
      pagesize      IN   NUMBER
     );   

end PKU_BUSQUEDA_ADJ;
/


CREATE OR REPLACE package body pku_busqueda_adj is

PROCEDURE USP_FORMULARIO_BUSQUEDA(
  v_ruc                        VARCHAR2 := '',
  ag_currentpage          IN   VARCHAR2 := 1)
is

  type ref_cursor is ref cursor;
  cCursor         ref_cursor;
  cCursor1        ref_cursor;
  v_query         varchar(32000);
  v_query1        varchar(32000);

--variables
v_sw              number;
ln_cont           number;
lv_currentpage    number;
c_total           number;
va_n_ruc          varchar2(1000);

v_ENTIDAD            VARCHAR2(800);
v_PROCESO            VARCHAR2(800);
v_RUC_GANADOR        VARCHAR2(800);
v_GANADOR            VARCHAR2(800);
v_Fecha_Adjudicada   VARCHAR2(200);
v_DESCRIPCION_ITEM   VARCHAR2(800);

  begin
    
 IF ag_currentpage IS NULL
      THEN
         lv_currentpage := 1;
      ELSE
         lv_currentpage := ag_currentpage;
      END IF;

     v_query:='';
     v_query := v_query||'
select ENTIDAD, PROCESO, DESCRIPCION_ITEM, RUC_GANADOR, GANADOR, Fecha_Adjudicada
            from (
                  select ROWNUM num, a.*
                         from (

select
e.descripcion ENTIDAD,
a.proc_tipo_sigla
       || '' - ''
       || c.proc_num
       || '' - ''
       || c.anhoentidad
       || '' - ''
       || c.proc_sigla
PROCESO,
CASE
          WHEN c.codobjeto = ''1''
             THEN ''BIENES''
          WHEN c.codobjeto = ''2''
             THEN ''SERVICIOS''
          WHEN c.codobjeto = ''3''
             THEN ''OBRAS''
          WHEN c.codobjeto = ''4''
             THEN ''CONSULTORIAS OBRAS''
          WHEN c.codobjeto = ''5''
             THEN ''SERVICIO DE CONSULTORIA''
          WHEN c.codobjeto = ''6''
             THEN ''SERVICIOS EN GENERAL''
          WHEN c.codobjeto = ''7''
             THEN ''ARRENDAMIENTO DE BIENES''
          WHEN c.codobjeto = ''8''
             THEN ''SEGUROS''
          WHEN c.codobjeto = ''9''
             THEN ''SUMINISTROS''
       END objeto,
c.des_objeto,
C1.postor_ruc RUC_GANADOR,
c1.f_registro FECHA_ADJUDICADA,
c1.postor_nom GANADOR, 
c2.descripcion  DESCRIPCION_ITEM,
CASE
          WHEN c.codmoneda = 1
             THEN ''SOLES''
          WHEN c.codmoneda = 2
             THEN ''DOLARES''
          WHEN c.codmoneda = 3
             THEN ''EUROS''
       END MONEDA,
c1.monto_adjudicado MONTO_UNIT_ADJUDICADO,
c3.nom_miembro MIEMBRO_CONSORCIO,
C3.ruc_miembro RUC_MIEMBRO
from
reg_procesos.items_bp c1 
INNER JOIN reg_procesos.buena_pro b
       ON b.n_buenapro = c1.n_buenapro
INNER JOIN reg_procesos.convocatorias c ON c1.n_convoca = c.n_convoca
INNER JOIN reg_procesos.convocatoria_pub p ON c.n_convoca = p.n_convoca
       INNER JOIN reg_procesos.item_convoca c2 ON c.n_convoca = c2.n_convoca
         AND c2.proc_item = c1.proc_item
       INNER JOIN reg_procesos.tipo_procesos a ON a.proc_tipo = c.proc_tipo
       INNER JOIN reg_procesos.entidades e
       ON e.codconsucode = c.codconsucode AND e.anhoentidad = c.anhoentidad
inner join reg_procesos.convocatoria_propuesta c4
on c1.n_propuesta = c4.n_propuesta
left outer join reg_procesos.consorcio_miembro c3
on c4.cod_consorcio = c3.cod_consorcio
where
C1.postor_ruc in ('||''''||replace(v_ruc, ',' , ''',''')||''''||')
AND b.ind_ultimo = 1
AND c1.monto_adjudicado <> 0
order by c1.f_registro desc
) a) b
                         WHERE b.num BETWEEN 25 * (TO_NUMBER ('||lv_currentpage||') - 1) + 1
                               AND 25 * TO_NUMBER ('||lv_currentpage||')';


 v_query1:='';
 v_query1 := v_query1||'
select count(*)  c_total
from (

select
e.descripcion ENTIDAD,
a.proc_tipo_sigla
       || '' - ''
       || c.proc_num
       || '' - ''
       || c.anhoentidad
       || '' - ''
       || c.proc_sigla
PROCESO,
CASE
          WHEN c.codobjeto = ''1''
             THEN ''BIENES''
          WHEN c.codobjeto = ''2''
             THEN ''SERVICIOS''
          WHEN c.codobjeto = ''3''
             THEN ''OBRAS''
          WHEN c.codobjeto = ''4''
             THEN ''CONSULTORIAS OBRAS''
          WHEN c.codobjeto = ''5''
             THEN ''SERVICIO DE CONSULTORIA''
          WHEN c.codobjeto = ''6''
             THEN ''SERVICIOS EN GENERAL''
          WHEN c.codobjeto = ''7''
             THEN ''ARRENDAMIENTO DE BIENES''
          WHEN c.codobjeto = ''8''
             THEN ''SEGUROS''
          WHEN c.codobjeto = ''9''
             THEN ''SUMINISTROS''
       END objeto,
c.des_objeto,
C1.postor_ruc RUC_GANADOR,
c1.f_registro FECHA_ADJUDICADA,
c1.postor_nom GANADOR, 
c2.descripcion  DESCRIPCION_ITEM,
CASE
          WHEN c.codmoneda = 1
             THEN ''SOLES''
          WHEN c.codmoneda = 2
             THEN ''DOLARES''
          WHEN c.codmoneda = 3
             THEN ''EUROS''
       END MONEDA,
c1.monto_adjudicado MONTO_UNIT_ADJUDICADO,
c3.nom_miembro MIEMBRO_CONSORCIO,
C3.ruc_miembro RUC_MIEMBRO
from
reg_procesos.items_bp c1 
INNER JOIN reg_procesos.buena_pro b
       ON b.n_buenapro = c1.n_buenapro
       AND b.ind_ultimo = 1
AND c1.monto_adjudicado <> 0
INNER JOIN reg_procesos.convocatorias c ON c1.n_convoca = c.n_convoca
INNER JOIN reg_procesos.convocatoria_pub p ON c.n_convoca = p.n_convoca
       INNER JOIN reg_procesos.item_convoca c2 ON c.n_convoca = c2.n_convoca
         AND c2.proc_item = c1.proc_item
       INNER JOIN reg_procesos.tipo_procesos a ON a.proc_tipo = c.proc_tipo
       INNER JOIN reg_procesos.entidades e
       ON e.codconsucode = c.codconsucode AND e.anhoentidad = c.anhoentidad
inner join reg_procesos.convocatoria_propuesta c4
on c1.n_propuesta = c4.n_propuesta
left outer join reg_procesos.consorcio_miembro c3
on c4.cod_consorcio = c3.cod_consorcio
where
C1.postor_ruc in ('||''''||replace(v_ruc, ',' , ''',''')||''''||')
)';

open cCursor1 for v_query1;
 loop fetch cCursor1 into c_total;
      exit when cCursor1%notfound;
  end loop; 
usp_print('<style type="text/css">
  .bot{
        font-size:10px;
        font-family:Verdana,Helvetica;
        font-weight:bold;
        color:white;
        background:#638cb5;
        border:0px;
        width:80px;
        height:19px;
       }    
</style>');  
usp_print('<script type="text/javascript">
 function validate_rucs()
   {
                
   var x = window.event.keyCode;
   switch (x)
            {
              case 8: case 9:  case 48: case 49: 
                      case 50: case 51: case 52: 
                      case 53: case 54: case 55: 
                      case 56: case 57: case 44:
                     
                     return;
                     default:
                     window.event.keyCode = 0;
                      break;
             }
    }
    
  function enviar(){
                 if(thisform.v_ruc.value == ""){
                 alert("Tiene que Ingresar por lo menos un RUC");
                 return false;
                 }
                 else{
                 thisform.scriptdo.value = "doview";
                 thisform.submit();
                 
                 }
                 }
</script>');  
  

usp_print('<table class="table" style="width:50%">
<tr>
<td><b>Ingrese RUC:</b>&nbsp;&nbsp;&nbsp;</td>
<td><input type="text" name="v_ruc" size="60" id="v_ruc" maxlength="1000" onkeypress="validate_rucs()"/></td>
<td><input type="button" name="bot" id="bot" value="Buscar" onclick="enviar()"/></td>
</tr>
</table>
');

usp_print('</br>');
 
showpaginacion (lv_currentpage,
                      c_total,
                        'v_ruc='
                      || v_ruc,
                      '&scriptdo=doView',
                      25
                     );

ln_cont:= 1 +  25 * (lv_currentpage-1);
 v_sw:=1;


     if v_ruc is not null and length(v_ruc) > 8 then 
       usp_print('<table class="table table-bordered table-striped">
<tr>
<th class=th1>N&#186;</th>
<th class=th1>Entidad</th>
<th class=th1>Proceso</th>
<th class=th1>Descripci&oacute;n</th>
<th class=th1>Ganador</th>
<th class=th1>Fecha de Adjudicaci&oacute;n</th>
</tr>');
open cCursor for v_query;

  loop fetch cCursor into v_ENTIDAD, v_PROCESO, v_DESCRIPCION_ITEM, v_RUC_GANADOR, v_GANADOR, v_Fecha_Adjudicada;
      exit when cCursor%notfound;
      
      if v_sw = 1 then
              usp_print('<tr bgcolor="#ECE9D8">');
            else
              usp_print('<tr>');
            end if;
       usp_print('<td align="left">'||ln_cont||'</td>');
       usp_print('<td align="left">'||v_ENTIDAD||'</td>');
       usp_print('<td align="left">'||v_PROCESO||'</td>');
       usp_print('<td align="left">'||v_DESCRIPCION_ITEM||'</td>');
       usp_print('<td align="left">'||v_RUC_GANADOR||'-'||v_GANADOR||'</td>');
       usp_print('<td align="left">'||v_Fecha_Adjudicada||'</td>');

ln_cont := ln_cont + 1; 
         v_sw:=v_sw * (-1);  
  end loop; 
  
  
  end if;
usp_print('</table>');


    end;
    
    
    
/***************************************************************************/

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



end PKU_BUSQUEDA_ADJ;
/
