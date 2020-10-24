CREATE OR REPLACE PACKAGE         "PKU_BUSCADORES_MOD" 
  IS
--
-- To modify this template, edit file PKGSPEC.TXT in TEMPLATE
-- directory of SQL Navigator
--
-- Purpose: Briefly explain the functionality of the package
--
-- MODIFICATION HISTORY
-- Person      Date         Comments
-- Sara Rojas  2007-012-04  Buscadores comunmente usados
 type ref_cursor is ref cursor;

  PROCEDURE uspBuscaCIIU4doView(pv_nombre varchar2 default null);

  function f_get_ciiu4(pv_nombre in varchar2) return ref_cursor;
  PROCEDURE do_consultas_javascript;
  PROCEDURE BuscaEntidad( v_desc varchar2 default null);
  function f_get_entidad(v_desc in varchar2, v_eue_anho in varchar2 ) return ref_cursor;
  function f_get_ubigeo_depa return ref_cursor;
  function f_get_ubigeo_dist(v_dep_codigo in varchar2,v_pro_codigo in varchar2) return ref_cursor;
  function f_get_ubigeo_prov(v_dep_codigo in varchar2) return ref_cursor;
  PROCEDURE BuscaUbigeo ( v_depa_cod varchar2 default null,v_prov_cod varchar2 default null );
  PROCEDURE BuscaCatalogo( v_tipo_bien varchar2 default null, v_desc varchar2 default null );
  function f_get_CatalogoNU(v_desc in varchar2) return ref_cursor;
  function f_get_Catalogo(v_tipo_bien in varchar2, v_desc in varchar2) return ref_cursor;
  function f_get_CatalogoBC( v_desc in varchar2) return ref_cursor;
  PROCEDURE BuscaCatalogoBC( v_desc varchar2 default null );
  PROCEDURE BuscaCatalogo_Ajax(v_tipo_bien varchar2 default null, v_desc varchar2 default null, v_time varchar2 default null);
  PROCEDURE BuscaCatalogo_MEF( v_tipo_bien varchar2 default null, v_desc varchar2 default null );
  function f_get_Catalogo_MEF(v_tipo_bien in varchar2, v_desc in varchar2) return ref_cursor;
  PROCEDURE BuscaCatalogo_BC_Ajax( v_desc varchar2 default null, v_time varchar2 default null );
  function f_get_CatalogoNU_Seg(v_desc in varchar2) return ref_cursor;
  PROCEDURE BuscaCatalogoNU_Ajax2(
    v_desc          varchar2 default null,
    v_it_code_nu    varchar2 default null,
    v_time          varchar2 default null);
  function f_get_CatalogoNU_2(v_desc in varchar2, v_it_code_nu in varchar2) return ref_cursor;
  PROCEDURE BuscaCatalogoNU_Ajax(
    v_desc varchar2 default null,
    v_it_code_nu    varchar2 default null,    
    v_time varchar2 default null);
  PROCEDURE BuscaCodigoPresu( v_desc varchar2 default null,codent varchar2,anho varchar2 );
  function f_get_CodigoPresupuestal(v_desc in varchar2,coEnt varchar2,anho varchar2) return ref_cursor;
  PROCEDURE BuscaCatalogoNU( v_desc varchar2 default null );
  PROCEDURE BuscaCatalogoNU2( v_desc varchar2 default null, v_grupo varchar2 default null );
  function f_get_CatalogoNU2(v_desc in varchar2, v_grupo in varchar2) return ref_cursor;
  function f_get_CatalogoNU_2_(v_desc in varchar2, v_grupo in varchar2) return ref_cursor;
  PROCEDURE BuscaCatalogoNU_2_( v_desc varchar2 default null, v_grupo varchar2 default null );
  function f_get_CatalogoNU_Seg_V2011(v_desc in varchar2) return ref_cursor;
  PROCEDURE BuscaCatalogoNU_V2011( v_desc varchar2 default null );
  PROCEDURE BuscaCatalogoNU_V2011Excel(
    v_desc          varchar2 default null,
    v_objeto        varchar2 default null
  );
  function valida_objeto (v_objeto in varchar2 default null, v_codigo in varchar2 default null) return integer;
  function f_get_CatalogoNU_2_V2011(v_desc in varchar2, v_objeto varchar2) return ref_cursor;
  PROCEDURE BuscaCatalogoNU_Ajax_V2011(
    v_desc          varchar2 default null,
  --  v_it_code_nu    varchar2 default null,
    v_cod_objeto    varchar2 default null,    
    v_time          varchar2 default null);
   PROCEDURE doBuscaEntidadExcel( v_desc varchar2 default null );
   PROCEDURE doBuscaConfigExcel( v_desc varchar2 default null );
   PROCEDURE doBCExcel( v_desc varchar2 default null );
END; -- Package spec
/


CREATE OR REPLACE PACKAGE BODY               "PKU_BUSCADORES_MOD" 
IS
--
-- To modify this template, edit file PKGBODY.TXT in TEMPLATE
-- directory of SQL Navigator
--
-- Purpose: Briefly explain the functionality of the package body
--
-- MODIFICATION HISTORY
-- Person      Date     Comments
-- Sara Rojas  Dic-2007 Principales Buscadores
-- JCarrillo   06/06/15 Modifica evento de busqueda del catalogo NU - 1375_OP_SEACE2_PRO

   PROCEDURE do_consultas_javascript
   IS
   BEGIN
   --//'''||ln_CIU_VDESC||''','''||ln_CIU_CCODIGO||'''
    usp_print('
        <script>

        function enviardatos(obj,pscriptdo)
        {    var f=getForm(obj);
             f.scriptdo.value=pscriptdo;
             f.submit();
        }

        function retornar(desc,codCiiu)
        {
            var wo = window.opener
            wo.RtnCIIU4(codCiiu,desc)
            window.close();
        }

        function retornaCatalogo(value,item){

            var wo = window.opener
            wo.RtnBusCatalogo(item,value)
            window.close();

        }

        function retornaCatalogoNU(value, codNU){

             var wo = window.opener
             wo.RtnCatNU(codNU,value)
             window.close();
        }

        function retornaCod_preupuestal(value, cod){

             var wo = window.opener
             wo.RtnCodPresup(cod,value)
             window.close();
        }

        function retornaCatalogoNU2(value, cod){

             var wo = window.opener
             wo.retornaCatalogoNU2(cod, value)
             window.close();
        }

        function retornaCatalogoCM(obj,lv_ncor_cm,lv_ncor_prod_cm , lv_ncor_ficha_cm ,
                           lv_nver_ficha_cm ,lv_nprec_prod ,lv_vnom_prod_ficha,
                           lv_vflag_oferta ,lv_vdesc_tit_oferta , lv_dfec_inicio,
                           lv_dfec_cierre_prevista ,lv_nprec_prod_ofer ,lv_nsts_oferta ,
                           lv_ncor_ficha_ofer,lv_dfec_ult_mod ,lv_proc_item ,
                           lv_monto_adjudicado )
            {


             var frmLogin=getForm(obj);
              window.opener.document.forms(0).cm_item.value = lv_proc_item;
             window.opener.document.forms(0).an_ncor_cm.value  = lv_ncor_cm ;
             window.opener.document.forms(0).an_ncor_prod.value = lv_ncor_prod_cm;
             window.opener.document.forms(0).an_ncor_ficha_cm.value = lv_ncor_ficha_cm;
             window.opener.document.forms(0).an_nver_ficha_cm.value = lv_nver_ficha_cm;
             window.opener.document.forms(0).nprec_prod.value = lv_nprec_prod;
             window.opener.document.forms(0).vnom_prod_ficha.value = lv_vnom_prod_ficha;
             window.opener.document.forms(0).lv_vflag_oferta.value  = lv_vflag_oferta;
             window.opener.document.forms(0).av_vdesc_tit_oferta.value   = lv_vdesc_tit_oferta;
             window.opener.document.forms(0).av_fecha_ini.value = lv_dfec_inicio;
             window.opener.document.forms(0).av_fecha_fin.value = lv_dfec_cierre_prevista;
             window.opener.document.forms(0).cm_prec_ofer.value  = lv_nprec_prod_ofer;
             window.opener.document.forms(0).lv_nsts_oferta.value    = lv_nsts_oferta;
             window.opener.document.forms(0).lv_ncor_ficha_ofer.value  = lv_ncor_ficha_ofer;
             window.opener.document.forms(0).av_dfec_ult_mod.value = lv_dfec_ult_mod;
             window.opener.document.forms(0).monto_adjudicado.value=lv_monto_adjudicado;
             close();
        }
        function retornaProductoCM(obj, ncor_prod_cm, ncor_ficha_cm, nver_ficha_cm, item, desc_prod, prec_prod, ncor_cm){
             var frmLogin=getForm(obj);
             window.opener.document.forms(0).av_prod_id.value    = ncor_prod_cm;
             window.opener.document.forms(0).av_ncor_fich.value  = ncor_ficha_cm;
             window.opener.document.forms(0).av_nver_fich.value  = nver_ficha_cm;
             window.opener.document.forms(0).av_nro_item.value   = item;
             window.opener.document.forms(0).av_desc_prod.value  = desc_prod;
             window.opener.document.forms(0).av_prec_ficha.value = prec_prod;
             window.opener.document.forms(0).av_conv.value       = ncor_cm;
             window.opener.document.forms(0).comodin.onfocus();
             close();
        }

        function retornaEntidad(obj, desc, codEnt){
             var frm=getForm(obj);
             window.opener.document.forms(0).desentidad.value = desc ;
             window.opener.document.forms(0).v_entidad.value  = codEnt;
             close();
        }

        function retornaEnti(desc, codEnt){
            var wo = window.opener
            wo.RtnEntidad(codEnt,desc)
            window.close();
        }

        function retornaUbigeo(obj){
             var d_depa = "";
             var d_prov = "";
             var d_dist = "";
             var d_ubigeo = "";
             var c_depa = "";
             var c_prov = "";
             var c_dist = "";

             var frm=getForm(obj);

                c_depa   = frm.v_depa_cod.value
                c_prov   = frm.v_prov_cod.value
                c_dist   = frm.v_dist_cod.value

                if (c_depa=="")
                  {
                  alert("Debe Seleccionadr un Departamento");
                  return;
                  }
                if (c_prov=="")
                  {
                  alert("Debe Seleccionadr una Provincia");
                  return;
                  }
                if (c_dist=="")
                  {
                  alert("Debe Seleccionadr un Disdrito");
                  return;
                  }


            d_depa   = frm.v_depa_cod.item(frm.v_depa_cod.selectedIndex).text
            d_prov   = frm.v_prov_cod.item(frm.v_prov_cod.selectedIndex).text
            d_dist   = frm.v_dist_cod.item(frm.v_dist_cod.selectedIndex).text

            d_ubigeo = "["+c_depa+c_prov+c_dist+"] "+d_depa+" / "+d_prov +" / "+d_dist

             window.opener.document.forms(0).v_dep_codigo.value         = c_depa ;
             window.opener.document.forms(0).v_pro_codigo.value         = c_prov ;
             window.opener.document.forms(0).v_dis_codigo.value         = c_dist ;

             window.opener.document.forms(0).v_desubi.value             = d_ubigeo;
             close();
        }

           function verifica(){
              var key = window.event.keyCode;    //codigo de tecla.
              if(key == 13)
                  window.event.keyCode=0;        //anula que al presionar enter estando activo la casilla de texto haga submit

           }
           
           function verifica1(){
              var key = window.event.keyCode;    //codigo de tecla.
              if(key == 13){
                // MMAUTINO: AL PRESIONAR ENTER SE VISUALIZA LA LISTA DEL CATALOGO
                thisform.scriptdo.value=''doBuscaCatalogoNU'';
                thisform.submit();
              }
           }

        </script>');
   END;




function f_get_Catalogo(
    v_tipo_bien in varchar2,
    v_desc in varchar2) return ref_cursor
is
    c_Catalogo ref_cursor ;
begin
    open c_Catalogo for
    select item, item_desc, nombre_gru, nombre_cla, cant, cmarco
    from
    (
        SELECT distinct
            rownum num,
            a.tipo_bien||a.grupo_bien||a.clase_bien||a.familia_bien item,
            replace(replace(replace(a.nombre_fam    ,chr(13),chr(32)),chr(10),chr(32)),'''','') item_desc,
            replace(replace(replace(t_gru.nombre_gru,chr(13),chr(32)),chr(10),chr(32)),'''','') nombre_gru,
            replace(replace(replace(t_cla.nombre_cla,chr(13),chr(32)),chr(10),chr(32)),'''','') nombre_cla,
            count(ncor_fich_tec_sub_inv)  cant,
            decode(reg_procesos.F_VALIDAR_IN_CM(a.tipo_bien,a.grupo_bien,a.clase_bien,a.familia_bien), '0','No','1','Si') cmarco
        FROM
            reg_procesos.t_cat_grupo t_gru,
            reg_procesos.t_cat_clase t_cla,
            reg_procesos.t_cat_familia a
            left outer join reg_procesos.ficha_tecnica_sub_inv fich
                on a.tipo_bien      = fich.tipo_bien
                and a.grupo_bien     = fich.grupo_bien
                and a.clase_bien     = fich.clase_bien
                and a.familia_bien   = fich.familia_bien
                and fich.nsts_ficha_tecnica = 5
        WHERE
            length(v_desc) > 0 and
            (
                UPPER(a.nombre_fam) like '%'||UPPER(v_desc)||'%'
                or a.tipo_bien||a.grupo_bien||a.clase_bien||a.familia_bien like '%'||v_desc||'%'
            )
            and t_gru.tipo_bien  = t_cla.tipo_bien
            and t_gru.grupo_bien = t_cla.grupo_bien
            and t_cla.tipo_bien  = a.tipo_bien
            and t_cla.grupo_bien = a.grupo_bien
            and t_cla.clase_bien = a.clase_bien
            and a.estado = 'A'
            and t_gru.tipo_bien != 'X'
            and a.tipo_bien like case when nvl(v_tipo_bien,0) in (1,9) then 'B'
                                      when nvl(v_tipo_bien,0) in (2,4,5,6,7,8) then 'S'
                                      when nvl(v_tipo_bien,0) in (3) then 'O'
                                      else '%' end
        group by
            rownum,
            a.tipo_bien||a.grupo_bien||a.clase_bien||a.familia_bien,
            a.nombre_fam, t_gru.nombre_gru, t_cla.nombre_cla,
            a.tipo_bien, a.grupo_bien, a.clase_bien, a.familia_bien
    ) X
    where
        x.num between 1 and 60
    order by X.item_desc;

    return c_Catalogo;

end;

    function f_get_Catalogo_MEF(v_tipo_bien in varchar2, v_desc in varchar2) return ref_cursor
    is
          c_Catalogo ref_cursor ;
    begin

        open c_Catalogo for

        SELECT distinct a.tipo_bien||a.grupo_bien||a.clase_bien||a.familia_bien "item",
               replace(replace(replace(a.nombre_fam    ,chr(13),chr(32)),chr(10),chr(32)),'''','') "item_desc",
               replace(replace(replace(t_gru.nombre_gru,chr(13),chr(32)),chr(10),chr(32)),'''','') "nombre_gru",
               replace(replace(replace(t_cla.nombre_cla,chr(13),chr(32)),chr(10),chr(32)),'''','') "nombre_cla",
               count(ncor_fich_tec_sub_inv)  cant
              ,decode(reg_procesos.F_VALIDAR_IN_CM(a.tipo_bien,a.grupo_bien,a.clase_bien,a.familia_bien), '0','No','1','Si') "cmarco"

          FROM  reg_procesos.t_cat_grupo t_gru,
                reg_procesos.t_cat_clase t_cla,
                reg_procesos.t_cat_familia a left outer join
                reg_procesos.ficha_tecnica_sub_inv fich on
                     a.tipo_bien      = fich.tipo_bien
                 and a.grupo_bien     = fich.grupo_bien
                 and a.clase_bien     = fich.clase_bien
                 and a.familia_bien   = fich.familia_bien
                 and fich.nsts_ficha_tecnica = 5
                 --and fich.n_ver_catalogo = a.n_ver_catalogo
           WHERE
            length(v_desc) > 0 and
            (    UPPER(a.nombre_fam) like '%'||UPPER(v_desc)||'%'
                 or a.tipo_bien||a.grupo_bien||a.clase_bien||a.familia_bien like '%'||v_desc||'%'
            )
            and t_gru.tipo_bien  = t_cla.tipo_bien
            and t_gru.grupo_bien = t_cla.grupo_bien
--            and t_gru.n_ver_catalogo = t_cla.n_ver_catalogo

            and t_cla.tipo_bien  = a.tipo_bien
            and t_cla.grupo_bien = a.grupo_bien
            and t_cla.clase_bien = a.clase_bien
--            and t_cla.n_ver_catalogo = a.n_ver_catalogo
            and a.estado = 'A'
            and a.tipo_bien  like case when nvl(v_tipo_bien,0) in (1,9) then 'B'
                                    when nvl(v_tipo_bien,0) in (2,4,5,6,7,8) then 'S'
                                    when nvl(v_tipo_bien,0) in (3) then 'O'
                                    else '%' end

            and rownum between 1 and 60

          group by a.tipo_bien||a.grupo_bien||a.clase_bien||a.familia_bien,
          a.nombre_fam, t_gru.nombre_gru, t_cla.nombre_cla
          ,a.tipo_bien,a.grupo_bien,a.clase_bien,a.familia_bien;


        return c_Catalogo;

    end;

function f_get_CatalogoBC(
    v_desc in varchar2) return ref_cursor
is
    c_Catalogo ref_cursor ;
begin
    open c_Catalogo for
    select item, version, item_desc
    from
    (
        SELECT
            rownum num,
            a.tipo_bien||a.grupo_bien||a.clase_bien||a.familia_bien item,
            a.nver_fich_tec_sub_inv version, a.vnom_comercial item_desc
        FROM
            reg_procesos.ficha_tecnica_sub_inv a,
            reg_procesos.t_cat_item it
        where
            it.tipo_bien    = a.tipo_bien
            and it.grupo_bien   = a.grupo_bien
            and it.clase_bien   = a.clase_bien
            and it.familia_bien = a.familia_bien
            and it.item_bien    = a.item_bien
            and a.nsts_ficha_tecnica = 5
            and v_desc is not null
            and it.flag_activ = 'A'
            and (
                upper(it.nombre_item)   like upper('%'||v_desc||'%') or
                upper(a.vnom_comercial) like upper('%'||v_desc||'%') or
                a.tipo_bien||a.grupo_bien||a.clase_bien||a.familia_bien like '%'||v_desc||'%'
                )
    ) x
    where num between 1 and 60
    order by item_desc;

    return c_Catalogo;
end;

    function f_get_CatalogoNU(v_desc in varchar2) return ref_cursor
    is
          c_CatalogoNU ref_cursor ;
    begin

        open c_CatalogoNU for
        /*
        select codigo, descripcion
        from
        (
            select
                rownum num,
                trim(x.grupo_bien)||trim(x.clase_bien)||trim(x.familia_bien)||trim(x.commoditi_bien) CODIGO,
                x.nombre_commodi descripcion
            from
                reg_procesos.t_cat_commodity x
            where
                x.tipo_bien = 'X'
                and x.estado = 'A'
                and upper(x.nombre_commodi) like '%'||upper(v_desc)||'%'
                and v_desc is not null
        ) Y
        where
            num between 1 and 60
        order by Y.descripcion;
        */

        select codigo, descripcion
        from
        (
            select
                rownum num,
                trim(x.grupo_bien)||trim(x.clase_bien)||trim(x.familia_bien)||trim(x.item_bien) CODIGO,
                x.nombre_item descripcion
            from
                reg_procesos.t_cat_item x
            where
                x.tipo_bien = 'X'
                and upper(x.nombre_item) like '%'||upper(v_desc)||'%'
                and v_desc is not null
                and x.flag_activ = 'A'
        ) Y
        where
            num between 1 and 60
        order by Y.descripcion;

        return c_CatalogoNU;
    end;

    function f_get_CatalogoNU_2(v_desc in varchar2, v_it_code_nu in varchar2) return ref_cursor
    is
          c_CatalogoNU ref_cursor ;
    begin

        open c_CatalogoNU for
        /*
        select codigo, descripcion
        from
        (
            select
                rownum num,
                trim(x.grupo_bien)||trim(x.clase_bien)||trim(x.familia_bien)||trim(x.commoditi_bien) CODIGO,
                x.nombre_commodi descripcion
            from
                reg_procesos.t_cat_commodity x
            where
                x.tipo_bien = 'X'
                and x.estado = 'A'
                and upper(x.nombre_commodi) like '%'||upper(v_desc)||'%'
                and v_desc is not null
        ) Y
        where
            num between 1 and 60
        order by Y.descripcion;
        */

        select codigo, descripcion
        from
        (
            select
                rownum num,
                trim(x.grupo_bien)||trim(x.clase_bien)||trim(x.familia_bien)||trim(x.item_bien) CODIGO,
                x.nombre_item descripcion
            from
                reg_procesos.t_cat_item x
            where
                x.tipo_bien = 'X'
                and upper(x.nombre_item) like '%'||upper(v_desc)||'%'
                and x.grupo_bien = trim(v_it_code_nu)
                and v_desc is not null
                and x.flag_activ = 'A'
        ) Y
        where
            num between 1 and 60
        order by Y.descripcion;

        return c_CatalogoNU;
    end;

     function f_get_CatalogoNU_2_V2011(v_desc in varchar2, v_objeto varchar2) return ref_cursor
    is
          c_CatalogoNU ref_cursor ;
    begin

        open c_CatalogoNU for
        select codigo, descripcion, cod_objeto
        from
        (
            select
                rownum num,
                trim(x.grupo_bien)||trim(x.clase_bien)||trim(x.familia_bien)||trim(x.item_bien)||trim(x.nivel5) CODIGO,
                x.descripcion ,
                x.codobjeto cod_objeto
            from
                reg_procesos.t_cat_nivel5 x
            where
                x.tipo_bien = 'A'
                and upper(x.descripcion) like '%'||upper(v_desc)||'%'
                --and x.grupo_bien = trim(v_it_code_nu)
                and v_desc is not null
                and x.estado = 'A'
                and x.codobjeto = v_objeto
        ) Y
        where
            num between 1 and 60
        order by Y.descripcion;

        return c_CatalogoNU;
    end;

   function f_get_CatalogoNU_2_V2011Excel(v_desc in varchar2, v_objeto in varchar2) return ref_cursor
    is
          c_CatalogoNU ref_cursor ;
    begin

        open c_CatalogoNU for
        select codigo, descripcion
        from
        (
            select
                rownum num,
                trim(x.grupo_bien)||trim(x.clase_bien)||trim(x.familia_bien)||trim(x.item_bien)||trim(x.nivel5) CODIGO,
                x.descripcion ,
                o.descripcion tipo_objeto
            from
                reg_procesos.t_cat_nivel5 x,
                reg_procesos.objeto o
            where
                x.codobjeto = o.codobjeto
                and x.tipo_bien = 'A'
                 and upper(x.descripcion) like '%'||upper(v_desc)||'%'
                and x.codobjeto = v_objeto
                and v_desc is not null
                and x.estado = 'A'
        ) Y
        where
            num between 1 and 250
        order by Y.descripcion;
        return c_CatalogoNU;
    end;


    function f_get_CatalogoNU_2_(v_desc in varchar2, v_grupo in varchar2) return ref_cursor
    is
          c_CatalogoNU ref_cursor ;
    begin


 if (v_desc <> '' or v_desc is not null) then
        open c_CatalogoNU for

        select codigo, descripcion
        from
        (
            select
                rownum num,
                trim(x.grupo_bien)||trim(x.clase_bien)||trim(x.familia_bien)||trim(x.item_bien) CODIGO,
                x.nombre_item descripcion,
                 trim(x.grupo_bien) grupo_bien,
                trim(x.tipo_bien) tipo_bien,
                trim(x.clase_bien) clase_bien,
            trim(x.familia_bien) familia_bien,
            trim(x.item_bien) commoditti_bien
            from
                reg_procesos.t_cat_item x
            where
                x.tipo_bien = 'X'
                and upper(x.nombre_item) like '%'||upper(v_desc)||'%'
                and x.grupo_bien = trim(v_grupo)
                 and v_desc is not null
                 and x.flag_activ = 'A'
             ) Y
        where
            num between 1 and 60
        order by Y.descripcion;
 else
         open c_CatalogoNU for

        select codigo, descripcion
        from
        (
            select
                rownum num,
                trim(x.grupo_bien)||trim(x.clase_bien)||trim(x.familia_bien)||trim(x.item_bien) CODIGO,
                x.nombre_item descripcion,
                 trim(x.grupo_bien) grupo_bien,
                trim(x.tipo_bien) tipo_bien,
                trim(x.clase_bien) clase_bien,
            trim(x.familia_bien) familia_bien,
            trim(x.item_bien) commoditti_bien
            from
                reg_procesos.t_cat_item x
            where
                x.tipo_bien = 'X'
                and x.grupo_bien = trim(v_grupo)
                and x.flag_activ = 'A'

        ) Y
        where
            num between 1 and 60
        order by Y.descripcion;
 end if;

        return c_CatalogoNU;
    end;

    function f_get_CatalogoNU_Seg(v_desc in varchar2) return ref_cursor
    is
          c_CatalogoNU ref_cursor ;
    begin

    if (v_desc <> '' or v_desc is not null) then
        open c_CatalogoNU for
        select CODIGO, DESCRIPCION
        from
        (
            /*select
                rownum num,
                u.grupo_bien CODIGO,
                u.nombre_gru DESCRIPCION
            from
                reg_procesos.t_cat_grupo u
            where
                upper(u.nombre_gru)  like '%'||upper(v_desc)||'%'
                and v_desc is not null
                and u.tipo_fuente = 'U'
                and u.estado = 'A'*/
            select
                rownum num,
                u.codigo_general CODIGO,
                u.titulo DESCRIPCION
            from
                cubso.cat_clasificador u
            where 
                u.id_nivel = 1
                and v_desc is not null
                and u.estado = 1
                and upper(u.titulo)  like '%'||upper(v_desc)||'%'
                
        ) x
        where
            num between 1 and 60
        order by
            x.descripcion;
    else
        open c_CatalogoNU for
        select CODIGO, DESCRIPCION
        from
        (
            /*select
                rownum num,
                u.grupo_bien CODIGO,
                u.nombre_gru DESCRIPCION
            from
                reg_procesos.t_cat_grupo u
            where
                u.tipo_fuente = 'U'
                and u.estado = 'A'*/
            select
                rownum num,
                u.codigo_general CODIGO,
                u.titulo DESCRIPCION
            from
                cubso.cat_clasificador u
            where
                u.id_nivel = 1
                and u.estado = 1
        ) x
        where
            num between 1 and 60
        order by
            x.descripcion;

    end if;

       return c_CatalogoNU;
    end;

     function f_get_CatalogoNU2(v_desc in varchar2, v_grupo in varchar2) return ref_cursor
    is
          c_CatalogoNU ref_cursor ;
    begin

    if (v_desc <> '' or v_desc is not null) then
        open c_CatalogoNU for
        select ITEM CODIGO, nombre_commodi DESCRIPCION
        from
        (
              select rownum num, y.*
              from(
                  SELECT
            trim(x.grupo_bien)||trim(x.clase_bien)||trim(x.familia_bien)||trim(x.commoditi_bien) item,
            trim(x.grupo_bien) grupo_bien,
            trim(x.tipo_bien) tipo_bien,
            trim(x.clase_bien) clase_bien,
            trim(x.familia_bien) familia_bien,
            trim(x.commoditi_bien) commoditti_bien,
            x.nombre_commodi
            FROM REG_PROCESOS.T_CAT_COMMODITY x
            WHERE GRUPO_BIEN = trim(v_grupo)
            AND TIPO_BIEN = 'X'
            AND ESTADO = 'A'
            AND upper(x.nombre_commodi)  like '%'||upper(v_desc)||'%'
            ORDER BY x.nombre_commodi
            )y
        ) x
        where
            num between 1 and 60
        order by
            x.nombre_commodi;
    else
        open c_CatalogoNU for
        select ITEM CODIGO, nombre_commodi DESCRIPCION
        from
        (
         select rownum num, y.*
              from(
            SELECT
            trim(x.grupo_bien)||trim(x.clase_bien)||trim(x.familia_bien)||trim(x.commoditi_bien) item,
            trim(x.grupo_bien) grupo_bien,
            trim(x.tipo_bien) tipo_bien,
            trim(x.clase_bien) clase_bien,
            trim(x.familia_bien) familia_bien,
            trim(x.commoditi_bien) commoditti_bien,
            x.nombre_commodi
            FROM REG_PROCESOS.T_CAT_COMMODITY x
            WHERE GRUPO_BIEN = trim(v_grupo)
            AND TIPO_BIEN = 'X'
            AND ESTADO = 'A'
            ORDER BY x.nombre_commodi
            )y
        ) x
        where
            num between 1 and 60
        order by
            x.nombre_commodi;

    end if;


        return c_CatalogoNU;
    end;
/********************************************************************/
    function f_get_ciiu4(pv_nombre in varchar2) return ref_cursor
    is
          c_ciiu4 ref_cursor ;
    begin

        open c_ciiu4 for

            SELECT item.ite_ciu CIU_CCODIGO,
            item.ite_desc  CIU_VDESC
            FROM SEASE.item
            where
            pv_nombre IS NOT NULL AND
            rownum between 1 and 40 and
            (
            UPPER(ite_desc) like '%'||UPPER(pv_nombre)||'%'
            or UPPER(ite_ciu)  like '%'||UPPER(pv_nombre)||'%'
            );
        return c_ciiu4;
    end;


   PROCEDURE uspBuscaCIIU4doView(pv_nombre varchar2 default null)
    is
        lv_mensaje              varchar2(55);
        ln_cont                 number;
        ln_CIU_CCODIGO          varchar2(4);
        ln_CIU_VDESC            varchar2(250);
        c_ciiu4                 ref_cursor;

    begin
    -- Java Scriop
    do_consultas_javascript;

    -- Estilos
    PKU_SS_ESTILO_CSS.estilos;

    usp_print('
        <table border="0" width=100% align=center class=tableform cellpadding=3 cellspacing=0>
        <tr>
            <td><h3>Busqueda de CIIU de 4 digitos</h3></td>
            <td>
                <table >
                    <tr>
                        <td>Descripci&oacute;n:</td>
                        <td><INPUT value="'||pv_nombre||'" onkeyPress="verifica();" type="text"  id="pv_nombre" name="pv_nombre" maxlength="50" style="width:200;"></td>
                        <td><input type="button" value="Buscar CIIU" onclick="thisform.scriptdo.value=''doBuscarCIIU4'';thisform.submit();"></td>
                        <td><input type="button" value="Cerrar" onclick="window.close();"></td>
                    </tr>
                </table>
            </td>
        </tr>
        </table>');
/*
    usp_print('<table border="0" align="center"><tr>');
    usp_print('<td>Descripcion:</b></td>');
    usp_print('<td><INPUT value="'||pv_nombre||'" onkeyPress="verifica();" type="text"  id="pv_nombre" name="pv_nombre" maxlength="50" style="width:200;"></td>');
    usp_print('<td align="left"><input type="button" value="Buscar CIIU" onclick="thisform.scriptdo.value=''doBuscarCIIU4'';thisform.submit();">');
    usp_print('</tr></table>');
*/
    ln_cont         := 0;

    c_ciiu4      := f_get_ciiu4(pv_nombre);

--    usp_print(' El pv_nombre es : '|| pv_nombre || '');
--    return;

--    usp_print('<hr/>');
    usp_print('
    <table border="0" width=100% align=center class=tableform cellpadding="3" cellspacing="0">
        <th class="th1">&nbsp;</th>
        <th class="th1" align="center">C&oacute;digo</th>
        <th class="th1" align="center">Nombre</th>');
     LOOP FETCH c_ciiu4 INTO ln_CIU_CCODIGO, ln_CIU_VDESC;
     EXIT WHEN c_ciiu4%NOTFOUND;
        usp_print('
        <tr');
        if mod(ln_cont + 1 ,2)<>0 then
            usp_print(' style="background-color:#F5F5F5;"');
        end if;
        usp_print('>
            <td align="center">
                <input type=button value="..." onclick="retornar('''||ln_CIU_VDESC||''','''||ln_CIU_CCODIGO||''')">
            </td>
            <td align="center">'||ln_CIU_CCODIGO||'</td>
            <td>'||ln_CIU_VDESC||'</td>
        </tr>');
        ln_cont       := ln_cont + 1 ;
    END LOOP;

    usp_print('</table>');
/*
    if pv_nombre is null then
        lv_mensaje := 'Por favor, Ingrese la(s) palabras(s) que desea buscar';
    elsif ln_cont = 0 then
        lv_mensaje := 'No se encontraron resultados ...';
    end if;

    usp_print('
       <br><br>
           <p align="center" style="font-family:verdana;font-size:12;">
            <b>'||lv_mensaje||'</b></p>
       <br><br>');
*/

    end;

    function f_get_entidad(v_desc in varchar2, v_eue_anho in varchar2 ) return ref_cursor
    is
          c_entidad ref_cursor ;
    begin

        open c_entidad for
                select 
                lpad(e.eue_codigo,6,'0'), 
                e.eue_desc, nvl(e.eue_ruc ,'') ruc,
                '['||nvl(e.dep_codigo,'00') || nvl(e.pro_codigo,'00')|| nvl(e.dis_codigo,'00')||'] ' || dep.dep_desc||' / '|| pro.pro_desc || ' / '||dis.dis_desc ubigeo,
                x1.cod_categoria||x1.cod_clasificacion as actins
                
                from sease.entidadue_anho e, 
                    sease.dep_ubigeo dep, 
                    sease.prov_ubigeo pro,
                    sease.dist_ubigeo dis, 
                    reg_procesos.entidades ent,
                    (
                      select distinct x.codconsucode, x.anhoentidad,x.cod_clasificacion,case when x.anhoentidad > 2010 and x.codconsucode <> 2433 then '0' else eoc.cod_categoria end cod_categoria
                       
                            from
                                reg_procesos.entidades x
                                join reg_procesos.entidad_objeto_categoria eoc        
                                on x.codconsucode = eoc.eue_codigo 
                                and x.anhoentidad = eoc.eue_anho         
                )x1
                where
                x1.codconsucode = e.eue_codigo 
                and x1.anhoentidad = e.eue_anho
                and e.dep_codigo   = dis.dep_codigo
                and e.pro_codigo   = dis.pro_codigo
                and e.dis_codigo   = dis.dis_codigo
                and pro.dep_codigo = dis.dep_codigo
                and pro.pro_codigo = dis.pro_codigo
                and dep.dep_codigo = pro.dep_codigo
                --
                and lpad(e.eue_codigo,6,0) = lpad(ent.codconsucode,6,0)
                and e.eue_anho = ent.anhoentidad
                and ent.activo = 1
                --
                and e.eue_anho = v_eue_anho
                and rownum between 1 and 40
                and length(v_desc) > 0
                and ( upper(e.eue_desc)  like '%'||upper(v_desc)||'%'
                or upper(e.eue_abrev)  like '%'||upper(v_desc)||'%'
                or upper(e.eue_codigo) like '%'||upper(v_desc)||'%')
                order by e.eue_desc;
        return c_entidad;
    end;

    PROCEDURE BuscaEntidad( v_desc varchar2 default null )
    IS
        ls_eue_desc     varchar2(200);
        ls_eue_codigo   varchar2(6);
        ls_ruc          varchar2(11);
        ls_dum         varchar2(100);
        ls_ubigeo       varchar2(200);
        c_entidad       ref_cursor;
        ln_cont                 number;
        v_eue_anho          varchar2(4);
    BEGIN

        -- Java Script
        do_consultas_javascript;

        -- Estilos
      --  PKU_SS_ESTILO_CSS.estilos;

        ln_cont         := 0;
      --  v_eue_anho := to_char(SYSDATE,'yyyy');
        v_eue_anho := '2019';
        c_entidad      := f_get_entidad(v_desc ,v_eue_anho);

        usp_print('
            <table class="table">
            <tr>
                <td align="left"><h3>Busqueda de Entidades</h3></td>
                <td align="right">
                    <table border="0" cellspacing="0" cellpadding="0">
                        <tr>
                        <td align="right">Descripcion</td>
                        <td><input name="v_desc" class="form-control" onkeyPress="verifica();" /></td>
                        <td><input type="button" value="Buscar entidad" onclick="thisform.scriptdo.value=''doBuscarEntidad'';thisform.submit();" /></td>
                        <td><input type="button" value="Cerrar" onclick="javascript:window.close();"
                        </tr>
                    </table>
                </td>
            </tr>
            </table><br>
            <table class="table table-striped table-bordered">
            <tr>
                <th class=th1>&nbsp;</th>
                <th class=th1 align="center">C&oacutedigo</th>
                <td class=th1 align="center">Nombre</th>
                <td class=th1 align="center">Ruc</th>
                <td class=th1 align="center">Ubigeo</th>
            </tr>
        ');

         LOOP
            FETCH c_entidad INTO ls_eue_codigo, ls_eue_desc, ls_ruc, ls_ubigeo,ls_dum;

                EXIT WHEN c_entidad%NOTFOUND;

            usp_print('<tr');
                if mod(ln_cont + 1 ,2)<>0 then
                    usp_print(' style="background-color:#F5F5F5;"');
                end if;
            usp_print('>');

            usp_print(' <td align="center">
                            <input type=button value="..." onclick="retornaEnti('''||ls_eue_desc||''','''||ls_eue_codigo||''') ">
                        </td>
                        <td align="center"> '||ls_eue_codigo||' </td>
                        <td align="left"> '||ls_eue_desc||'  </td>
                        <td> ' || ls_ruc ||  '  </td>
                        <td> ' ||ls_ubigeo|| '  </td>
                      </tr>  ');

             ln_cont := ln_cont +1;

         END LOOP;

        usp_print('</table>');

    END;

    function f_get_ubigeo_depa return ref_cursor
    is
          c_ubigeo_depa ref_cursor ;
    begin

        open c_ubigeo_depa for
            SELECT dep_ubigeo.dep_codigo, dep_ubigeo.dep_desc
            FROM sease.dep_ubigeo
            order by dep_ubigeo.dep_codigo;
        return c_ubigeo_depa;

    end;

    function f_get_ubigeo_prov(v_dep_codigo in varchar2) return ref_cursor
    is
          c_ubigeo_prov ref_cursor ;
    begin

        open c_ubigeo_prov for
            SELECT prov_ubigeo.pro_codigo,
            prov_ubigeo.pro_desc
            FROM sease.prov_ubigeo
            where prov_ubigeo.dep_codigo = v_dep_codigo
            order by prov_ubigeo.pro_codigo;
        return c_ubigeo_prov;

    end;

    function f_get_ubigeo_dist(v_dep_codigo in varchar2,v_pro_codigo in varchar2) return ref_cursor
    is
          c_ubigeo_dist ref_cursor ;
    begin

        open c_ubigeo_dist for
                SELECT dist_ubigeo.dis_codigo,
                dist_ubigeo.dis_desc
                FROM sease.dist_ubigeo
                WHERE
                dist_ubigeo.dep_codigo = v_dep_codigo
                and dist_ubigeo.pro_codigo = v_pro_codigo
                order by dist_ubigeo.dis_codigo;
        return c_ubigeo_dist;

    end;

    PROCEDURE BuscaUbigeo ( v_depa_cod varchar2 default null,v_prov_cod varchar2 default null )
    IS
        ls_depa_cod          varchar2(2);
        ls_depa_des          varchar2(60);
        ls_prov_cod          varchar2(2);
        ls_prov_des          varchar2(60);
        ls_dist_cod          varchar2(2);
        ls_dist_des          varchar2(60);

        c_ubigeo_depa        ref_cursor;
        c_ubigeo_prov        ref_cursor;
        c_ubigeo_dist        ref_cursor;
        ln_cont                 number;
    BEGIN

        -- Java Script
        do_consultas_javascript;

        -- Estilos
        PKU_SS_ESTILO_CSS.estilos;
        ln_cont         := 0;

        c_ubigeo_depa      := f_get_ubigeo_depa;
        c_ubigeo_prov      := f_get_ubigeo_prov(v_depa_cod);
        c_ubigeo_dist      := f_get_ubigeo_dist(v_depa_cod,v_prov_cod);

        usp_print('
            <Table border="0" style="FONT-FAMILY: Arial; FONT-SIZE: 8pt" cellspacing ="0" cellpadding="3" width="100%">
            <tr>
                <td bgcolor="#cccccc" align="left" colspan="2" style="BORDER-BOTTOM: #ff0000 1px solid">
                  <b><i><font size="5" face="Arial" color="#000000">Seleccion de Ubigeo</font></i></b></td>
            </tr>
        ');

            usp_print('
            <tr>
            <td>
            <select name="v_depa_cod" size="1" onChange="enviardatos(scriptdo,''PKU_BUSCADORES.buscaubigeo'')" >
              <OPTION value="">-- Seleccionar --</OPTION>
              ');
            -- Pinta la lista de departamentos
        LOOP
            FETCH c_ubigeo_depa INTO ls_depa_cod, ls_depa_des;
                EXIT WHEN c_ubigeo_depa%NOTFOUND;
                usp_print('
                  <OPTION  value="'||ls_depa_cod||'"
                          ');
                        if ( ls_depa_cod = v_depa_cod  ) then
                        usp_print(' Selected = "true" ');
                        end if;

                usp_print(' >
                  ['||ls_depa_cod||']'||ls_depa_des||'
                  </OPTION>
                ');
            END LOOP;

            usp_print('
            </select>
            </td>
            </tr>
            ');


            -- Pinta la lista de provincias
            usp_print('
            <tr>
            <td>
            <select name="v_prov_cod" size="1" onChange="enviardatos(scriptdo,''PKU_BUSCADORES.buscaubigeo'')" >
              <option value="">-- Seleccionar --</OPTION>
              ');
        LOOP
            FETCH c_ubigeo_prov INTO ls_prov_cod, ls_prov_des;
                EXIT WHEN c_ubigeo_prov%NOTFOUND;
                usp_print('
                  <OPTION  value="'||ls_prov_cod||'"
                          ');
                        if ( ls_prov_cod = v_prov_cod  ) then
                        usp_print(' Selected = "true" ');
                        end if;

                usp_print(' >
                  ['||ls_prov_cod||']'||ls_prov_des||'
                  </OPTION>
                ');
            END LOOP;

            usp_print('
            </select>
            </tr>
            </td>
            ');

           -- Pinta la lista de distritos
            usp_print('
            <tr>
            <td>
            <select name="v_dist_cod" size="1" >
              <OPTION value="">-- Seleccionar --</OPTION>
              ');
        LOOP
            FETCH c_ubigeo_dist INTO ls_dist_cod, ls_dist_des;
                EXIT WHEN c_ubigeo_dist%NOTFOUND;
                usp_print('
                  <OPTION  value="'||ls_dist_cod||'" >
                  ['||ls_dist_cod||']'||ls_dist_des||'
                  </OPTION>
                ');
            END LOOP;

            usp_print('
            </select>
            </tr>
            </td>

              <tr>
                <td><input value="Aceptar"  type="button" OnClick="retornaUbigeo(scriptdo)"></input>
                    <input value="Cancelar" type="button" OnClick="window.close();"></input>
                </td>
              </tr>
            ');

    END;

    PROCEDURE BuscaCatalogo_Ajax(v_tipo_bien varchar2 default null, v_desc varchar2 default null, v_time varchar2 default null)
    IS
        v_item        varchar2(250);
        v_item_desc   varchar2(250);
        v_nombre_gru    varchar2(250);
        v_nombre_cla   varchar2(250);
        v_cant          number;
        v_cmarco        varchar2(2);

        c_catalogo     ref_cursor;
        ln_cont       number;
        lv_mensaje     varchar2(200);
    BEGIN

        -- Java Script
        do_consultas_javascript;

        -- Estilos
        PKU_SS_ESTILO_CSS.estilos;

        ln_cont         := 0;
        c_catalogo      := f_get_catalogo(v_tipo_bien,v_desc);

             LOOP
                FETCH c_catalogo INTO v_item, v_item_desc, v_nombre_gru, v_nombre_cla , v_cant , v_cmarco ;

                    EXIT WHEN c_catalogo%NOTFOUND;
            /*
            usp_print('
                <link rel="StyleSheet" href="np4/css/cnetportal.asp" type="text/css">
            ');
            */
            /*
            usp_print('<tr');
                   if mod(ln_cont + 1 ,2)<>0 then
                        usp_print(' style="background-color:#F5F5F5;"');
                    end if;
            usp_print('>');
            */

           usp_print('<a href="#1" idcat1='||v_item||' decat1='||v_item_desc||' onclick="setcat1(this)" >
                       '||v_item_desc||'
                     </a><br>');

           /*
           usp_print('<td align="center">
                        <input type=button value="..." onclick="retornaCatalogo('''||v_item_desc||''','''||v_item||''')">
                      </td>
                      <td align="center">'||v_item||'</td>
                      <td align="left">'||v_item_desc||'</td>
                      <td align="center">'||v_cant||'</td>
                      <td align="center">'||v_cmarco||'</td>
                     </tr>');
           */

                ln_cont       := ln_cont + 1 ;

                END LOOP;

            /*

            if v_desc is null then
                lv_mensaje := 'Por favor, Ingrese la(s) palabras(s) que desea buscar';
            elsif ln_cont = 0 then
                lv_mensaje := 'No se encontraron resultados ...';
            end if;


            usp_print('
               <br><br>
                   <p align="center" style="font-family:verdana;font-size:12;">
                    <b>'||lv_mensaje||'</b></p>
               <br><br>');

            usp_print('<br><p align="center">');
            usp_print(PKU_XPORTAL_UTILS.UFUTIL_MKBTM(null,'Cerrar','javascript:window.close('));
            usp_print('</p><br>');
            */
    END;

    PROCEDURE BuscaCatalogo( v_tipo_bien varchar2 default null, v_desc varchar2 default null )
    IS
        v_item        varchar2(250);
        v_item_desc   varchar2(250);
        v_nombre_gru    varchar2(250);
        v_nombre_cla   varchar2(250);
        v_cant          number;
        v_cmarco        varchar2(2);

        c_catalogo     ref_cursor;
        ln_cont       number;
        lv_mensaje     varchar2(200);
    BEGIN

        -- Java Script
        do_consultas_javascript;

        -- Estilos
        PKU_SS_ESTILO_CSS.estilos;
        ln_cont         := 0;
        c_catalogo      := f_get_catalogo(v_tipo_bien,v_desc);

            usp_print('
                <table cellspacing="0" cellpadding="3" border="0" width="100%" align="center" class=tableform>
                    <tr>
                        <td><h3>Busqueda del Catalogo---aaa</h3></td>
                        <td>
                            <table width="100%" border="0" align="right">
                                <tr>
                                    <td><b>Codigo o Descripcion:</b></td>
                                    <td><input value="'||v_desc||'" onkeyPress="verifica();" type="text"  id="v_desc" name="v_desc" maxlength="50" style="width:130;"></td>
                                    <td><input type="button" value="Buscar Catalogo" onclick="thisform.scriptdo.value=''doBuscarCat'';thisform.submit(); "/> </td>
                                    <td><input type="button" value="Cerrar" onclick="javascript:window.close();" /></td>
                                </tr>
                            </table>

                        </td>
                    </tr>
                </table><br>');

            /*
            usp_print('<table border="0" align="center" cellspacing="0" cellpadding="0" class=tableform>
                       <tr>');
            usp_print('<td style="font-family:verdana;"><b>Codigo o Descripcion:</b></td>');
            usp_print('<td><INPUT value="'||v_desc||'" onkeyPress="verifica();" type="text"  id="v_desc" name="v_desc" maxlength="50" style="width:200;"></td>');
            usp_print('<td align="left">'||PKU_XPORTAL_UTILS.UFUTIL_MKBTM('PKU_BUSCADORES.BuscaCatalogo','Buscar Catalogo',''));
            usp_print('</tr></table>');
            usp_print('<hr/>');
            */
            usp_print('<table class=tableform cellSpacing="0" cellPadding="3" width="100%" align="center">');
            usp_print('<tr>
                        <th class=th1>&nbsp;</th>
                        <th class=th1 align="center">C&oacute;digo</td>
                        <td class=th1 align="center">Nombre</td>
                        <td class=th1 align="center">Cantidad de </BR> Fichas</td>
                        <td class=th1 align="center">Registrado en</B> Convenio Marco</td>
                      <tr>');
             LOOP
                FETCH c_catalogo INTO v_item, v_item_desc, v_nombre_gru, v_nombre_cla , v_cant , v_cmarco ;

                    EXIT WHEN c_catalogo%NOTFOUND;

           usp_print('<tr');
                   if mod(ln_cont + 1 ,2)<>0 then
                        usp_print(' style="background-color:#F5F5F5;"');
                    end if;
            usp_print('>');

           usp_print('<td align="center">
                        <input type=button value="..." onclick="retornaCatalogo('''||v_item_desc||''','''||v_item||''')">
                      </td>
                      <td align="center">'||v_item||'</td>
                      <td align="left">'||v_item_desc||'</td>
                      <td align="center">'||v_cant||'</td>
                      <td align="center">'||v_cmarco||'</td>
                     </tr>');

                ln_cont       := ln_cont + 1 ;

                END LOOP;

            usp_print('</table>');

            if v_desc is null then
                lv_mensaje := 'Por favor, Ingrese la(s) palabras(s) que desea buscar';
            elsif ln_cont = 0 then
                lv_mensaje := 'No se encontraron resultados ...';
            end if;

            usp_print('
               <br><br>
                   <p align="center" style="font-family:verdana;font-size:12;">
                    <b>'||lv_mensaje||'</b></p>
               <br><br>');
            /*
            usp_print('<br><p align="center">');
            usp_print(PKU_XPORTAL_UTILS.UFUTIL_MKBTM(null,'Cerrar','javascript:window.close('));
            usp_print('</p><br>');
            */
    END;

    PROCEDURE BuscaCatalogo_MEF( v_tipo_bien varchar2 default null, v_desc varchar2 default null )
    IS
        v_item        varchar2(250);
        v_item_desc   varchar2(250);
        v_nombre_gru    varchar2(250);
        v_nombre_cla   varchar2(250);
        v_cant          number;
        v_cmarco        varchar2(2);

        c_catalogo     ref_cursor;
        ln_cont       number;
        lv_mensaje     varchar2(200);
    BEGIN

        -- Java Script
        do_consultas_javascript;

        -- Estilos
        PKU_SS_ESTILO_CSS.estilos;
        ln_cont         := 0;
        c_catalogo      := f_get_catalogo_MEF(v_tipo_bien,v_desc);

            usp_print('
                <table cellspacing="0" cellpadding="3" border="0" width="100%" align="center" class=tableform>
                    <tr>
                        <td><h3>Busqueda del Catalogo---</h3></td>
                        <td>
                            <table width="100%" border="0" align="right">
                                <tr>
                                    <td><b>Codigo o Descripcion:</b></td>
                                    <td><input value="'||v_desc||'" onkeyPress="verifica();" type="text"  id="v_desc" name="v_desc" maxlength="50" style="width:130;"></td>
                                    <td><input type="button" value="Buscar Catalogo" onclick="thisform.scriptdo.value=''doBuscarCat'';thisform.submit(); "/> </td>
                                    <td><input type="button" value="Cerrar" onclick="javascript:window.close();" /></td>
                                </tr>
                            </table>

                        </td>
                    </tr>
                </table><br>');

            /*
            usp_print('<table border="0" align="center" cellspacing="0" cellpadding="0" class=tableform>
                       <tr>');
            usp_print('<td style="font-family:verdana;"><b>Codigo o Descripcion:</b></td>');
            usp_print('<td><INPUT value="'||v_desc||'" onkeyPress="verifica();" type="text"  id="v_desc" name="v_desc" maxlength="50" style="width:200;"></td>');
            usp_print('<td align="left">'||PKU_XPORTAL_UTILS.UFUTIL_MKBTM('PKU_BUSCADORES.BuscaCatalogo','Buscar Catalogo',''));
            usp_print('</tr></table>');
            usp_print('<hr/>');
            */
            usp_print('<table class=tableform cellSpacing="0" cellPadding="3" width="100%" align="center">');
            usp_print('<tr>
                        <th class=th1>&nbsp;</th>
                        <th class=th1 align="center">C&oacute;digo</td>
                        <td class=th1 align="center">Nombre</td>
                        <td class=th1 align="center">Cantidad de </BR> Fichas</td>
                        <td class=th1 align="center">Registrado en</B> Convenio Marco</td>
                      <tr>');
             LOOP
                FETCH c_catalogo INTO v_item, v_item_desc, v_nombre_gru, v_nombre_cla , v_cant , v_cmarco ;

                    EXIT WHEN c_catalogo%NOTFOUND;

           usp_print('<tr');
                   if mod(ln_cont + 1 ,2)<>0 then
                        usp_print(' style="background-color:#F5F5F5;"');
                    end if;
            usp_print('>');

           usp_print('<td align="center">
                        <input type=button value="..." onclick="retornaCatalogo('''||v_item_desc||''','''||v_item||''')">
                      </td>
                      <td align="center">'||v_item||'</td>
                      <td align="left">'||v_item_desc||'</td>
                      <td align="center">'||v_cant||'</td>
                      <td align="center">'||v_cmarco||'</td>
                     </tr>');

                ln_cont       := ln_cont + 1 ;

                END LOOP;

            usp_print('</table>');

            if v_desc is null then
                lv_mensaje := 'Por favor, Ingrese la(s) palabras(s) que desea buscar';
            elsif ln_cont = 0 then
                lv_mensaje := 'No se encontraron resultados ...';
            end if;

            usp_print('
               <br><br>
                   <p align="center" style="font-family:verdana;font-size:12;">
                    <b>'||lv_mensaje||'</b></p>
               <br><br>');
            /*
            usp_print('<br><p align="center">');
            usp_print(PKU_XPORTAL_UTILS.UFUTIL_MKBTM(null,'Cerrar','javascript:window.close('));
            usp_print('</p><br>');
            */
    END;

    PROCEDURE BuscaCatalogoBC( v_desc varchar2 default null )
    IS
        v_item        varchar2(250);
        v_item_desc   varchar2(250);
        v_version     number;

        c_catalogo     ref_cursor;
        ln_cont       number;
        lv_mensaje     varchar2(200);
    BEGIN

        -- Java Script
        do_consultas_javascript;

        -- Estilos
        PKU_SS_ESTILO_CSS.estilos;
        ln_cont         := 0;
        c_catalogo      := f_get_catalogoBC(v_desc);

            usp_print('
                <table cellspacing="0" cellpadding="3" border="0" width="100%" align="center" class="tableform">
                   <tr valign="top">
                        <td width="38%" align="left"><h3>Busqueda de Bienes Comunes</h3></td>
                        <td width="62%" align="right">
                            <table width="100%">
                            <tr>
                                <td><b>Cod. &oacute; Descripci&oacute;n</b></td>
                                <td><input value="'||v_desc||'" onkeyPress="verifica();" type="text" id="v_desc" name="v_desc" maxlength="50" style="width:130;">&nbsp;</td>
                                <td><input type="button" value="Buscar Catalogo" onclick="thisform.scriptdo.value=''doBuscarCatBC'';thisform.submit();" />&nbsp;
                                <input type="button" value="Cerrar" onclick="javascript:window.close();" /></td>
                            </tr>
                            </table>
                        </td>
                   </tr>
                </table><br>');
            /*
            usp_print('<table border="0" align="center" class=tableform cellspacing="0" cellpadding="0">
                       <tr>
                            <td style="font-family:verdana;"><b>Codigo o Descripcion:</b></td>
                            <td><input value="'||v_desc||'" onkeyPress="verifica();" type="text"  id="v_desc" name="v_desc" maxlength="50" style="width:200;"></td>
                            <td align="left">'||PKU_XPORTAL_UTILS.UFUTIL_MKBTM('PKU_BUSCADORES.BuscaCatalogoBC','Buscar Catalogo',''));
            usp_print('</tr>
                       </table>');
            */
            --usp_print('<br>');
            usp_print('<table cellspacing="0" cellpadding="3" width="100%" align="center" class="tableform" border="0">');
            usp_print('<tr>
                            <td align="center" class="th1">&nbsp;</td>
                            <td align="center" class="th1">C&oacute;digo</td>
                            <td align="center" class="th1">Versi&oacute;n</td>
                            <td align="center" class="th1">Nombre</td>
                       <tr>');
             LOOP
                FETCH c_catalogo INTO v_item, v_version, v_item_desc ;

                    EXIT WHEN c_catalogo%NOTFOUND;

                usp_print('<tr valign="top"');
                    if mod(ln_cont + 1 ,2)<>0 then
                        usp_print(' style="background-color:#F5F5F5;"');
                    end if;
                usp_print('>');

                usp_print('  <td align="center">
                                  <input type=button value="..." onclick="retornaCatalogo(scriptdo,'''||v_item_desc||''','''||v_item||''')"></td>
                             <td align="left">'||v_item||'</td>
                             <td align="center">'||v_version||'</td>
                             <td align="left">'||v_item_desc||'</td>
                             ');


                --usp_print('<td align="center">');
                --usp_print('</td>');
                /*
                usp_print('<td class="data">
                           <a href="javascript:" title="Elegir este rubro"
                           onclick="retornaCatalogo(scriptdo,'''||v_item_desc||''','''||v_item||''')">
                           '||v_item||'
                           </a></td>
                            <td align="center"><font color = "blue">'||v_version||'</font></td>
                           ');
                */

                --usp_print('<td class="data">');
                /*
                usp_print('<a href="javascript:" title="Elegir este rubro"
                               onclick="retornaCatalogo(scriptdo,'''||v_item_desc||''','''||v_item||''')">
                           '||v_item_desc||'
                           </a>');
                */
                usp_print('
                        </tr>');

                ln_cont := ln_cont + 1;

                END LOOP;

            usp_print('</table>');

            /*
            if v_desc is null then
                lv_mensaje := 'Por favor, Ingrese la(s) palabras(s) que desea buscar';
            elsif ln_cont = 0 then
                lv_mensaje := 'No se encontraron resultados ...';
            end if;

            usp_print('
               <br><br>
                   <p align="center" style="font-family:verdana;font-size:12;">
                    <b>'||lv_mensaje||'</b></p>
               <br><br>');
            */
            --usp_print('<br><p align="center">');
            --usp_print(PKU_XPORTAL_UTILS.UFUTIL_MKBTM(null,'Cerrar','javascript:window.close('));
            --usp_print('</p><br>');

    END;

    PROCEDURE BuscaCatalogo_BC_Ajax( v_desc varchar2 default null, v_time varchar2 default null )
    IS
        v_item        varchar2(250);
        v_item_desc   varchar2(250);
        v_version     number;

        c_catalogo    ref_cursor;
        ln_cont       number;
        lv_mensaje    varchar2(200);
    BEGIN

        -- Java Script
        do_consultas_javascript;

        -- Estilos
        PKU_SS_ESTILO_CSS.estilos;
        ln_cont         := 0;
        c_catalogo      := f_get_catalogoBC(v_desc);

        LOOP

            FETCH c_catalogo INTO v_item, v_version, v_item_desc ;

                EXIT WHEN c_catalogo%NOTFOUND;

                usp_print('
                    <a href="#1" idcat1="'||v_item||'" decat1="'||v_item_desc||'" onclick="setcat1(this)" >
                        '||v_item_desc||'
                    </a>
                    <br>');

                ln_cont := ln_cont + 1;

        END LOOP;


    END;

PROCEDURE BuscaCatalogoNU_Ajax(
    v_desc          varchar2 default null,
    v_it_code_nu    varchar2 default null,
    v_time          varchar2 default null)
IS
    ls_cod          varchar2(20);
    ls_des          varchar2(200);
    c_CatalogoNU    ref_cursor;
    ln_cont         number;
    lv_mensaje      varchar2(200);
BEGIN
    ln_cont           := 0;
    c_CatalogoNU      := f_get_CatalogoNU_2(v_desc,v_it_code_nu);
    --f_get_CatalogoNU_2(v_desc,v_it_code_nu);
    LOOP FETCH c_CatalogoNU INTO ls_cod, ls_des;
        EXIT WHEN c_CatalogoNU%NOTFOUND;
        usp_print('
    <a href="#1" idcat="'||ls_cod||'" decat="'||ls_des||'" onclick="setcat(this)" >
        '||ls_des||'
    </a>
    <br>');
        ln_cont := ln_cont + 1 ;
    END LOOP;
END;

PROCEDURE BuscaCatalogoNU_Ajax_V2011(
    v_desc          varchar2 default null,
  --  v_it_code_nu    varchar2 default null,
    v_cod_objeto    varchar2 default null,
    v_time          varchar2 default null)
IS
    ls_cod          varchar2(20);
    ls_des          varchar2(200);
    ls_objeto       varchar2(2);
    c_CatalogoNU    ref_cursor;
    ln_cont         number;
    lv_mensaje      varchar2(200);
BEGIN
    ln_cont           := 0;
    c_CatalogoNU      := f_get_CatalogoNU_2_V2011(v_desc, v_cod_objeto);
    --f_get_CatalogoNU_2(v_desc,v_it_code_nu);
     LOOP FETCH c_CatalogoNU INTO ls_cod, ls_des, ls_objeto;
        EXIT WHEN c_CatalogoNU%NOTFOUND;
        usp_print('
    <a href="#1" idcat="'||TRIM(ls_cod)||'" decat="'||ls_des||'" objcat="'||ls_objeto||'" onclick="setcat(this)" >
        '||ls_des||'
    </a>
    <br>');
        ln_cont := ln_cont + 1 ;
    END LOOP;

END;

function valida_objeto (v_objeto in varchar2 default null, v_codigo in varchar2 default null) return integer
is
v_numero number;
fourFirt varchar2(20);
resto varchar (30);
begin

if v_objeto is not null and v_codigo is not null then
/*
    select count(*) into v_numero
    from reg_procesos.t_Cat_Nivel5 nivel5
    where nivel5.tipo_bien = 'A'
    and nivel5.codobjeto =v_objeto
    and trim(nivel5.grupo_bien)||trim(nivel5.clase_bien)||trim(nivel5.familia_bien)||trim(nivel5.item_bien)||trim(nivel5.nivel5)=trim(v_codigo);
*/
  fourFirt:= substr( trim(v_codigo),1,4);
   resto:=substr( trim(v_codigo),5,length ( trim(v_codigo)));

    select count(*) into v_numero
    from reg_procesos.t_Cat_Nivel5 nivel5
    where
    (nivel5.grupo_bien)||(nivel5.clase_bien)=fourFirt
    and (trim(nivel5.familia_bien)||trim(nivel5.item_bien)||trim(nivel5.nivel5)=resto
    and nivel5.tipo_bien = 'A' and nivel5.codobjeto =v_objeto
    )
    ;



end if;
return v_numero;
end ;

PROCEDURE BuscaCatalogoNU_V2011Excel(
    v_desc          varchar2 default null,
    v_objeto        varchar2 default null
  )
IS
    ls_cod          varchar2(20);
    ls_des          varchar2(200);
    ls_objeto       varchar2 (100);
    c_CatalogoNU    ref_cursor;
    ln_cont         number;
    lv_mensaje      varchar2(200);
BEGIN
    ln_cont           := 0;


            if ( length(v_desc) < 3 ) then
              usp_print('<script>
               alert("Ingrese por lo menos 3 caracteres para realizar la busqueda..")
            </script>');
             else


    c_CatalogoNU      := f_get_CatalogoNU_2_V2011Excel(v_desc, v_objeto);
    --f_get_CatalogoNU_2(v_desc,v_it_code_nu);
    LOOP FETCH c_CatalogoNU INTO ls_cod, ls_des;
        EXIT WHEN c_CatalogoNU%NOTFOUND;
        /*
        usp_print('
    <a href="#1" idcat="'||ls_cod||'" decat="'||ls_des||'" onclick="setcat(this)" >
        '||ls_des||'
    </a>
    <br>');*/

      usp_print('
    <input type=radio value="" name="R1" idcat="'||ls_cod||'" decat="'||ls_des||'" onclick="setcat(this,codigo,descripcion)" >
        '||ls_des||'

    <br>');

        ln_cont := ln_cont + 1 ;
    END LOOP;
    end if;
    usp_print('
    <input type=hidden name="codigo">
    <input type=hidden name="descripcion">

    <script>
    function setcat(obj,a,b){
        a.value=obj.getAttribute("idcat")
        b.value=obj.getAttribute("decat")
    }
    </script>
    ');
END;


PROCEDURE BuscaCatalogoNU_Ajax2(
    v_desc          varchar2 default null,
    v_it_code_nu    varchar2 default null,
    v_time          varchar2 default null)
IS
    ls_cod          varchar2(20);
    ls_des          varchar2(200);
    c_CatalogoNU    ref_cursor;
    ln_cont         number;
    lv_mensaje      varchar2(200);
BEGIN
    ln_cont           := 0;
    c_CatalogoNU      := f_get_CatalogoNU_2(v_desc,v_it_code_nu);
    LOOP FETCH c_CatalogoNU INTO ls_cod, ls_des;
        EXIT WHEN c_CatalogoNU%NOTFOUND;
        usp_print('
    <a href="#1" idcat="'||ls_cod||'" decat="'||ls_des||'" onclick="setcat(this)" >
        '||ls_des||'
    </a>
    <br>');
        ln_cont := ln_cont + 1 ;
    END LOOP;
END;

    PROCEDURE BuscaCatalogoNU( v_desc varchar2 default null )
    IS
        ls_cod          varchar2(8);
        ls_des          varchar2(200);
        c_CatalogoNU    ref_cursor;
        ln_cont         number;
    BEGIN
        -- Java Script
        do_consultas_javascript;

        ln_cont := 0;

        c_CatalogoNU := f_get_CatalogoNU_Seg(v_desc);
        -- Inicio JCarrillo 1375_OP_SEACE2_PRO 
        usp_print('
        <table cellspacing="0" cellpadding="3" border="0" width="100%" align="center" class=tableform>
            <tr>
                <td align="left" width="65%"><h3>B&uacute;squeda de Cat&aacute;logo de N.U.</h3></td>
                <td align="right" width="35%">
                    <table border="0" width="100%" align="right">
                        <tr>
                            <td><b>Descripcin:</b></td>
                            <td><input value="'||v_desc||'" onkeyPress="verifica1();" type="text" id="v_desc" name="v_desc" maxlength="50" style="width:130;"></td>
                            <td><input type="button" value="Buscar" onclick="thisform.scriptdo.value=''doBuscaCatalogoNU'';thisform.submit();" /></td>
                            <td><input type="button" value="Cerrar" onclick="javascript:window.close();" />
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <br>');
        -- Fin JCarrillo 1375_OP_SEACE2_PRO 
        usp_print('
        <table class="tableform" cellspacing="0" cellPadding="3" width="100%" align="center">
             <tr>
                <th class=th1 align="center">&nbsp;</th>
                <th class=th1 align="center">C&oacute;digo</th>
                <th class=th1 align="center">Nombre</th>
             <tr> ');
        LOOP
            FETCH c_CatalogoNU INTO ls_cod, ls_des;
                EXIT WHEN c_CatalogoNU%NOTFOUND;

                usp_print('
            <tr ');
                    if mod(ln_cont+1, 2) <> 0 then
                        usp_print(' style="background-color:#F5F5F5;"');
                    end if;
                usp_print('>');

                usp_print('
                <td align="center">
                    <input type=button value="..." onclick="retornaCatalogoNU('''||ls_des||''','''||ls_cod||''')">
                </td>
                <td>'||ls_cod||'</td>
                <td>'||ls_des||'</td>
            </tr>');

                ln_cont := ln_cont + 1 ;
        END LOOP;

        usp_print('
        </table>');
    END;

    PROCEDURE BuscaCatalogoNU_2_( v_desc varchar2 default null, v_grupo varchar2 default null )
    IS
        ls_cod          varchar2(20);
        ls_des          varchar2(200);
        c_CatalogoNU    ref_cursor;
        ln_cont         number;
        lv_mensaje      varchar2(200);
    BEGIN

     --  usp_print('v_desc: '||v_desc||'v_grupo: '||v_grupo);
        do_consultas_javascript;
      --  return;


        ln_cont           := 0;

        c_CatalogoNU      := f_get_CatalogoNU_2_(v_desc, v_grupo);
      --  usp_print('v_grupo: '||v_grupo);
            usp_print('
                <table cellspacing="0" cellpadding="3" border="0" width="100%" align="center" class=tableform>
                   <tr>
                        <td align="left" width="65%"><h3>Bsqueda de Catlogo de N.U.</h3></td>
                        <td align="right" width="35%">
                            <table border="0" width="100%" align="right">
                                <tr>
                                    <td><b>Descripcin:</b></td>
                                    <td><input value="'||v_desc||'" onkeyPress="verifica1();" type="text" id="v_desc" name="v_desc" maxlength="50" style="width:130;">
                                    <input value="'||v_grupo||'" type="hidden" id="v_grupo" name="v_grupo"/>
                                    </td>
                                    <td><input type="button" value="Buscar" onclick="thisform.scriptdo.value=''doBuscaCatalogoNU2'';thisform.submit();" /></td>
                                    <td><input type="button" value="Cerrar" onclick="javascript:window.close();" />
                                </tr>
                            </table>
                        </td>
                   </tr>
                 </table><br>');


            usp_print('<table class="tableform" cellspacing="0" cellPadding="3" width="100%" align="center">
                         <tr>
                            <th class=th1 align="center">&nbsp;</th>
                            <th class=th1 align="center">C&oacute;digo</th>
                            <th class=th1 align="center">Nombre</th>
                         <tr>');
             LOOP
                FETCH c_CatalogoNU INTO ls_cod, ls_des;
                    EXIT WHEN c_CatalogoNU%NOTFOUND;

                usp_print('<tr');
                    if mod(ln_cont + 1 ,2)<>0 then
                        usp_print(' style="background-color:#F5F5F5;"');
                    end if;
                usp_print('>');

                usp_print('  <td align="center">
                                  <input type=button value="..." onclick="retornaCatalogoNU2('''||ls_des||''','''||ls_cod||''')">
                             </td>');


                usp_print('<td>'||ls_cod||'</td>
                           <td>'||ls_des||'</td>
                        </tr>');

                ln_cont       := ln_cont + 1 ;

                END LOOP;

            usp_print('</table>');

    END;

      PROCEDURE BuscaCatalogoNU2( v_desc varchar2 default null, v_grupo varchar2 default null )
    IS
        ls_cod          varchar2(8);
        ls_des          varchar2(200);
        c_CatalogoNU    ref_cursor;
        ln_cont         number;
        lv_mensaje      varchar2(200);
    BEGIN


        do_consultas_javascript;


        ln_cont           := 0;

        c_CatalogoNU      := f_get_CatalogoNU2(v_desc, v_grupo);
      --  usp_print('v_grupo: '||v_grupo);
            usp_print('
                <table cellspacing="0" cellpadding="3" border="0" width="100%" align="center" class=tableform>
                   <tr>
                        <td align="left" width="65%"><h3>Bsqueda de Catlogo de N.U.</h3></td>
                        <td align="right" width="35%">
                            <table border="0" width="100%" align="right">
                                <tr>
                                    <td><b>Descripcin:</b></td>
                                    <td><input value="'||v_desc||'" onkeyPress="verifica1();" type="text" id="v_desc" name="v_desc" maxlength="50" style="width:130;">
                                    <input value="'||v_grupo||'" type="hidden" id="v_grupo" name="v_grupo"/>
                                    </td>
                                    <td><input type="button" value="Buscar" onclick="thisform.scriptdo.value=''doBuscaCatalogoNU2'';thisform.submit();" /></td>
                                    <td><input type="button" value="Cerrar" onclick="javascript:window.close();" />
                                </tr>
                            </table>
                        </td>
                   </tr>
                 </table><br>');


            usp_print('<table class="tableform" cellspacing="0" cellPadding="3" width="100%" align="center">
                         <tr>
                            <th class=th1 align="center">&nbsp;</th>
                            <th class=th1 align="center">C&oacute;digo</th>
                            <th class=th1 align="center">Nombre</th>
                         <tr>');
             LOOP
                FETCH c_CatalogoNU INTO ls_cod, ls_des;
                    EXIT WHEN c_CatalogoNU%NOTFOUND;

                usp_print('<tr');
                    if mod(ln_cont + 1 ,2)<>0 then
                        usp_print(' style="background-color:#F5F5F5;"');
                    end if;
                usp_print('>');

                usp_print('  <td align="center">
                                  <input type=button value="..." onclick="retornaCatalogoNU2('''||ls_des||''','''||ls_cod||''')">
                             </td>');


                usp_print('<td>'||ls_cod||'</td>
                           <td>'||ls_des||'</td>
                        </tr>');

                ln_cont       := ln_cont + 1 ;

                END LOOP;

            usp_print('</table>');

    END;


PROCEDURE BuscaCodigoPresu(
    v_desc varchar2 default null,
    codent varchar2,
    anho varchar2 )
IS
    ls_cod          varchar2(20);
    ls_des          varchar2(1000);
    c_CodPresup    ref_cursor;
    ln_cont         number;
    lv_mensaje      varchar2(200);
BEGIN
    -- Java Script
    do_consultas_javascript;
    ln_cont := 0;

    c_CodPresup := f_get_CodigoPresupuestal(v_desc,codent,anho);

    usp_print('
    <input type="hidden" name="codent" value="'||codent||'"/>
    <input type="hidden" name="anho" value="'||anho||'"/>
    <table cellspacing="0" cellpadding="3" border="0" width="100%" align="center" class=tableform>
        <tr>
            <td align="left" width="65%"><h3>Busqueda de Codigo Presupuestal</h3></td>
            <td align="right" width="35%">
                <table border="0" width="100%" align="right">
                    <tr>
                        <td><b>Descripcion:</b></td>
                        <td><input value="'||v_desc||'" onkeyPress="verifica1();" type="text" id="v_desc" name="v_desc" maxlength="50" style="width:130;"></td>
                        <td><input type="button" value="Buscar" onclick="thisform.scriptdo.value=''doBuscaCodigoPresu'';thisform.submit();" /></td>
                        <td><input type="button" value="Cerrar" onclick="javascript:window.close();" />
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <br>
    <table class="tableform" cellspacing="0" cellPadding="3" width="100%" align="center">
        <tr>
            <th class=th1 align="center">&nbsp;</th>
            <th class=th1 align="center">&nbsp;</th>
            <th class=th1 align="center">C&oacute;digo</th>
            <th class=th1 align="center">Nombre</th>
        <tr>');

    LOOP
        FETCH c_CodPresup INTO ls_cod, ls_des;
            EXIT WHEN c_CodPresup%NOTFOUND;
            ln_cont := ln_cont + 1 ;
            usp_print('
        <tr');
            if mod(ln_cont + 1 ,2)<>0 then
                usp_print(' style="background-color:#dedede;"');
            end if;
            usp_print('>');
            usp_print('<td>'||ln_cont);

            usp_print('
            <td align="center">
                <input type=button value="..." onclick="retornaCod_preupuestal('''||ls_des||''','''||ls_cod||''')">
            </td>
            <td>'||ls_cod||'</td>
            <td>'||ls_des||'</td>
        </tr>');


    END LOOP;
    usp_print('
    </table>');
END;

    function f_get_CodigoPresupuestal(v_desc in varchar2,coEnt varchar2,anho varchar2) return ref_cursor
    is
        c_CodPresup ref_cursor ;
    begin
        OPEN c_CodPresup FOR
        select a.* from (
        SELECT distinct
            m.proy_codigo cod_presupuestal,
            replace(replace(m.proy_descripcion,'"'),chr(39)) descripcion
        FROM
            REG_PROCESOS.mef_proyectos_entidades p
            join REG_PROCESOS.mef_proyectos m
                on p.proy_codigo = m.proy_codigo
        WHERE
            UPPER(m.proy_descripcion) like '%'||UPPER(v_desc)||'%'
            and p.codconsucode = LPAD(coEnt, 6, '0')
            and p.anhoentidad = anho
            and m.proy_estado = 'A'
        ) a where rownum<=100;

        return c_CodPresup;
    end;

    PROCEDURE BuscaCatalogoNU_V2011( v_desc varchar2 default null )
    IS
        ls_cod          varchar2(8);
        ls_des          varchar2(200);
        c_CatalogoNU    ref_cursor;
        ln_cont         number;
    BEGIN
        -- Java Script
        do_consultas_javascript;

        ln_cont := 0;

        c_CatalogoNU := f_get_CatalogoNU_Seg_V2011(v_desc);

        usp_print('
        <table cellspacing="0" cellpadding="3" border="0" width="100%" align="center" class=tableform>
            <tr>
                <td align="left" width="65%"><h3>B&uacute;squeda de Cat&aacute;logo de N.U.</h3></td>
                <td align="right" width="35%">
                    <table border="0" width="100%" align="right">
                        <tr>
                            <td><b>Descripci&oacute;n:</b></td>
                            <td><input value="'||v_desc||'" onkeyPress="verifica1();" type="text" id="v_desc" name="v_desc" maxlength="50" style="width:130;"></td>
                            <td><input type="button" value="Buscar" onclick="thisform.scriptdo.value=''doBuscaCatalogoNU_V2011'';thisform.submit();" /></td>
                            <td><input type="button" value="Cerrar" onclick="javascript:window.close();" />
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <br>');

        usp_print('
        <table class="tableform" cellspacing="0" cellPadding="3" width="100%" align="center">
             <tr>
                <th class=th1 align="center">&nbsp;</th>
                <th class=th1 align="center">C&oacute;digo</th>
                <th class=th1 align="center">Nombre</th>
             <tr> ');
        LOOP
            FETCH c_CatalogoNU INTO ls_cod, ls_des;
                EXIT WHEN c_CatalogoNU%NOTFOUND;

                usp_print('
            <tr ');
                    if mod(ln_cont+1, 2) <> 0 then
                        usp_print(' style="background-color:#F5F5F5;"');
                    end if;
                usp_print('>');

                usp_print('
                <td align="center">
                    <input type=button value="..." onclick="retornaCatalogoNU('''||ls_des||''','''||ls_cod||''')">
                </td>
                <td>'||ls_cod||'</td>
                <td>'||ls_des||'</td>
            </tr>');

                ln_cont := ln_cont + 1 ;
        END LOOP;

        usp_print('
        </table>');
    END;

    function f_get_CatalogoNU_Seg_V2011(v_desc in varchar2) return ref_cursor
    is
          cCursor   ref_cursor;
          ls_desc   varchar2(50);
    begin

        if v_desc is null then
            ls_desc := '';
        else
            ls_desc := v_desc;
        end if;

        open cCursor for
        select CODIGO, DESCRIPCION
        from
        (
            select
                rownum num,
                u.grupo_bien CODIGO,
                u.nombre_gru DESCRIPCION
            from
                reg_procesos.t_cat_grupo u
            where
                upper(u.nombre_gru)  like '%'||upper(ls_desc)||'%'
                and u.tipo_fuente = 'A'
                and u.estado = 'A'
        ) x
        where
            num between 1 and 60
        order by
            x.descripcion;

       return cCursor;
    end;


PROCEDURE doBuscaEntidadExcel( v_desc varchar2 default null )
    IS
        ls_eue_desc     varchar2(200);
        ls_eue_codigo   varchar2(6);
        ls_ruc          varchar2(11);
        ls_ubigeo       varchar2(200);
        ls_actins       varchar2(10);
        c_entidad       ref_cursor;
        ln_cont                 number;
        v_eue_anho          varchar2(4);
    BEGIN

        -- Java Script
        do_consultas_javascript;

        -- Estilos
      --  PKU_SS_ESTILO_CSS.estilos;

        ln_cont         := 0;
        v_eue_anho := to_char(SYSDATE,'yyyy');

        c_entidad      := f_get_entidad(v_desc ,v_eue_anho);

        usp_print('
            <table width="100%" cellspacing="0" cellpadding="3" border="0" align="center" class=tableform>
            <tr>
                <th class=th1>&nbsp;</th>
                <th class=th1 align="center">C&oacutedigo</th>
                <td class=th1 align="center">Nombre</th>
                <td class=th1 align="center">Ruc</th>
                <td class=th1 align="center">Ubigeo</th>
            </tr>
        ');

         LOOP
            FETCH c_entidad INTO ls_eue_codigo, ls_eue_desc, ls_ruc, ls_ubigeo,ls_actins;

                EXIT WHEN c_entidad%NOTFOUND;

            usp_print('<tr>
                        <td align="center"> <input type=radio value="" name="R1" idcat="'||ls_eue_codigo||'" decat="'||ls_eue_desc||'" deactins="'||ls_actins||'" onclick="setcat(this,codigo,descripcion,actins)" ></td>
                        <td align="center"> '||ls_eue_codigo||' </td>
                        <td align="left"> '||ls_eue_desc||'  </td>
                        <td> ' || ls_ruc ||  '  </td>
                        <td> ' ||ls_ubigeo|| '  </td>
                      </tr>  ');

             ln_cont := ln_cont +1;

         END LOOP;

        usp_print('</table>');
        
       usp_print('
    <input type=hidden name="codigo">
    <input type=hidden name="descripcion">
    <input type=hidden name="actins">

    <script>
    function setcat(obj,a,b,c){
        a.value=obj.getAttribute("idcat")
        b.value=obj.getAttribute("decat")
        c.value=obj.getAttribute("deactins")
    }
    </script>
    ');
    

    END;
    
/*    
PROCEDURE doBuscaConfigExcel( v_desc varchar2 default null )
    IS
     li_num numeric;   
    BEGIN
    li_num:=0;
    for xi in (
    select
    cod_categoria,cod_clasificacion,proc_tipo,cod_objeto,monto_minimo,monto_maximo 
    from reg_procesos.montos_procesos  
    where eue_anho=to_char(SYSDATE,'yyyy') and cod_categoria||cod_clasificacion=v_desc order by 1,2,3
    ) loop
      li_num:=li_num+1;
      usp_print ('
        <input name=cod_categoria'||li_num||' value="'||xi.cod_categoria||'">
        <input name=cod_clasificacion'||li_num||' value="'||xi.cod_clasificacion||'">
        <input name=proc_tipo'||li_num||' value="'||xi.proc_tipo||'">
        <input name=cod_objeto'||li_num||' value="'||xi.cod_objeto||'">
        <input name=monto_minimo'||li_num||' value="'||xi.monto_minimo||'">
        <input name=monto_maximo'||li_num||' value="'||xi.monto_maximo||'">   
        <br>
        '
        );
    end loop;
    li_num:=li_num+1;
    usp_print ('
        <input name=cod_categoria'||li_num||'>
        <input name=cod_clasificacion'||li_num||' >
        <input name=proc_tipo'||li_num||' >
        <input name=cod_objeto'||li_num||' >
        <input name=monto_minimo'||li_num||' >
        <input name=monto_maximo'||li_num||' >   
        <br>
        '
        );

END;    
*/

PROCEDURE doBuscaConfigExcel( v_desc varchar2 default null )
    IS
     li_num numeric;   
    BEGIN
    li_num:=0;
    for xi in (
    /*
    select
    cod_categoria,cod_clasificacion,proc_tipo,cod_objeto,monto_minimo,monto_maximo 
    from reg_procesos.montos_procesos  
    where eue_anho=to_char(SYSDATE,'yyyy') and cod_categoria||cod_clasificacion=v_desc order by 1,2,3
*/
    select
        mp.cod_clasificacion,
        mp.cod_categoria,
        mp.proc_tipo,
        mp.cod_objeto ,
        obj.obj_desc,
        /*decode(mp.monto_minimo,null,0,mp.monto_minimo)*/ mp.monto_minimo,
        /*decode(mp.monto_maximo,null,0,mp.monto_maximo)*/ mp.monto_maximo
    from reg_procesos.montos_procesos mp, sease.objeto obj
    where
        mp.cod_objeto = obj.obj_codigo
        and obj.obj_activo = 1
        and mp.eue_anho = to_char(SYSDATE,'yyyy') -- parametro
        and
        ( mp.cod_clasificacion, mp.cod_objeto, mp.cod_categoria ) in (
        select e.cod_clasificacion, eoc.cod_objeto,case when e.anhoentidad > 2010 and e.codconsucode <> 2433 then '0' else eoc.cod_categoria end cod_categoria         
            from
                reg_procesos.entidades e
                join reg_procesos.entidad_objeto_categoria eoc
                    on e.codconsucode = eoc.eue_codigo and e.anhoentidad = eoc.eue_anho
            where
                e.codconsucode = v_desc  -- parametro
                and e.anhoentidad = to_char(SYSDATE,'yyyy') -- parametro
        )

      order by mp.proc_tipo,mp.cod_objeto
      
    ) loop
      li_num:=li_num+1;
      usp_print ('
        <input name=cod_categoria'||li_num||' value="'||xi.cod_categoria||'">
        <input name=cod_clasificacion'||li_num||' value="'||xi.cod_clasificacion||'">
        <input name=proc_tipo'||li_num||' value="'||xi.proc_tipo||'">
        <input name=cod_objeto'||li_num||' value="'||xi.cod_objeto||'">
        <input name=monto_minimo'||li_num||' value="'||xi.monto_minimo||'">
        <input name=monto_maximo'||li_num||' value="'||xi.monto_maximo||'">   
        <br>
        '
        );
    end loop;
    li_num:=li_num+1;
    usp_print ('
        <input name=cod_categoria'||li_num||'>
        <input name=cod_clasificacion'||li_num||' >
        <input name=proc_tipo'||li_num||' >
        <input name=cod_objeto'||li_num||' >
        <input name=monto_minimo'||li_num||' >
        <input name=monto_maximo'||li_num||' >   
        <br>
        '
        );

END;    

   
PROCEDURE doBCExcel( v_desc varchar2 default null )
    IS
     li_num numeric;   
    BEGIN
    li_num:=0;
    for xi in (select      
        trim(grupo_bien)|| trim(clase_bien)|| trim(familia_bien)||trim(item_bien)||trim(nivel5) as codigo,
        nver_fich_tec_sub_inv,
        upper(trim(vnom_comercial)) vnom_comercial,
        vnum_resol_inscrip,
        to_char(dfec_aprob_resol_inscrip,'dd/mm/yyyy') dfec_aprob_resol_inscrip   
        from reg_procesos.ficha_tecnica_sub_inv
        where    
        nsts_ficha_tecnica = 5
        order by upper(vnom_comercial) asc
    ) loop
      li_num:=li_num+1;
      usp_print ('
        <input name=codigo'||li_num||' value="'||xi.codigo||'">
        <input name=nver_fich_tec_sub_inv'||li_num||' value="'||xi.nver_fich_tec_sub_inv||'">
        <input name=vnom_comercial'||li_num||' value="'||xi.vnom_comercial||'">
        <input name=vnum_resol_inscrip'||li_num||' value="'||xi.vnum_resol_inscrip||'">
        <input name=dfec_aprob_resol_inscrip'||li_num||' value="'||xi.dfec_aprob_resol_inscrip||'">
        <br>
        '
        );
    end loop;
    li_num:=li_num+1;
    usp_print ('
        <input name=codigo'||li_num||'>
        <input name=nver_fich_tec_sub_inv'||li_num||' >
        <input name=vnom_comercial'||li_num||' >
        <input name=vnum_resol_inscrip'||li_num||' >
        <input name=dfec_aprob_resol_inscrip'||li_num||' >
        <br>
        '
        );

END;    
    
END;
/
