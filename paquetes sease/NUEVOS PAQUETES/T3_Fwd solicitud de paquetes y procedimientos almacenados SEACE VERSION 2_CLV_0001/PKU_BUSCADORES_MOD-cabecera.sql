--------------------------------------------------------
-- Archivo creado  - domingo-noviembre-01-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Package PKU_BUSCADORES_MOD
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "SEASE"."PKU_BUSCADORES_MOD" 
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
