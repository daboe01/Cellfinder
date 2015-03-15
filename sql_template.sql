--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: cellfinder; Type: COMMENT; Schema: -; Owner: daboe01
--

COMMENT ON DATABASE cellfinder IS 'encoding=SQL_ASCII';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: tablefunc_crosstab_2; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE tablefunc_crosstab_2 AS (
	row_name text,
	category_1 text,
	category_2 text
);


ALTER TYPE public.tablefunc_crosstab_2 OWNER TO postgres;

--
-- Name: tablefunc_crosstab_3; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE tablefunc_crosstab_3 AS (
	row_name text,
	category_1 text,
	category_2 text,
	category_3 text
);


ALTER TYPE public.tablefunc_crosstab_3 OWNER TO postgres;

--
-- Name: tablefunc_crosstab_4; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE tablefunc_crosstab_4 AS (
	row_name text,
	category_1 text,
	category_2 text,
	category_3 text,
	category_4 text
);


ALTER TYPE public.tablefunc_crosstab_4 OWNER TO postgres;

--
-- Name: Z_point_neighbourhood3(integer); Type: FUNCTION; Schema: public; Owner: root
--

CREATE FUNCTION "Z_point_neighbourhood3"(integer) RETURNS TABLE(id integer, c1 double precision, c2 double precision, c3 double precision)
    LANGUAGE sql
    AS $_$

select * from crosstab('
with radial_neighbours as
(
select ((((sign(y)+1-abs(sign(y)))*acos(x/r))/3.142*180)/60)::integer*60 as angle, r as dist, id from (
select  sqrt(((a."row" - b."row") * (a."row" - b."row") + (a.col - b.col) * (a.col - b.col))) as r,
b.id,  (b."row" - a."row") as x , (b.col - a.col) as y
from results a
join results b on a.idanalysis=b.idanalysis where a.id='||$1||' and a.id<>b.id) a  )


select '||$1||', a.angle, round( (a.dist/(max(a.dist) over (order by true)) )::numeric,2)::double precision from (
select min(dist) as dist, angle from radial_neighbours group by angle order by 2) a join radial_neighbours b on a.dist=b.dist and a.angle=b.angle order by 2') as ct(id integer, dist1 double precision, dist2 double precision, dist3 double precision)$_$;


ALTER FUNCTION public."Z_point_neighbourhood3"(integer) OWNER TO root;

--
-- Name: _final_median(numeric[]); Type: FUNCTION; Schema: public; Owner: root
--

CREATE FUNCTION _final_median(numeric[]) RETURNS numeric
    LANGUAGE sql IMMUTABLE
    AS $_$
   SELECT AVG(val)
   FROM (
     SELECT val
     FROM unnest($1) val
     ORDER BY 1
     LIMIT  2 - MOD(array_upper($1, 1), 2)
     OFFSET CEIL(array_upper($1, 1) / 2.0) - 1
   ) sub;
$_$;


ALTER FUNCTION public._final_median(numeric[]) OWNER TO root;

--
-- Name: affine_matrix_for_analysis(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION affine_matrix_for_analysis(integer) RETURNS text
    LANGUAGE sql
    AS $_$
select '['||sx||', '||rx||', '||ry||', '||sy||', '||tx||', '||ty||']' as affine from (
select c as sx,
	s as rx,
	s*(-1) as	ry,
	c as sy,
	-(cx*c)-(cy*s) as tx,
	-(cx*s)+(cy*c) as ty from (
select cos(radians) as c, sin(radians) as s, -5 as cx, 100 as cy from (
select sign(y1-y2)* acos((x2-x1)/sqrt( (x2-x1)^2+ (y2-y1)^2 ) ) as radians from (
select x1,y1 , x2,y2 from (select row as x1,col as y1 from results where idanalysis=$1	
 order by id limit 1) a join (select row as x2,col as y2 from results where idanalysis=$1	
 order by id offset 1 limit 1) b on true) a) a) a) a;
    $_$;


ALTER FUNCTION public.affine_matrix_for_analysis(integer) OWNER TO postgres;

--
-- Name: affine_matrix_for_analysis_0(integer); Type: FUNCTION; Schema: public; Owner: root
--

CREATE FUNCTION affine_matrix_for_analysis_0(integer) RETURNS text
    LANGUAGE sql
    AS $_$
select '['||sx||', '||rx||', '||ry||', '||sy||', '||tx||', '||ty||']' as affine from (
select c as sx,
	s as rx,
	s*(-1) as	ry,
	c as sy,
	0 as tx,
	300 as ty from (
select cos(radians) as c, sin(radians) as s, -5 as cx, 100 as cy from (
select sign(y1-y2)* acos((x2-x1)/sqrt( (x2-x1)^2+ (y2-y1)^2 ) ) as radians from (
select x1,y1 , x2,y2 from (select row as x1,col as y1 from results where idanalysis=$1	
 order by id limit 1) a join (select row as x2,col as y2 from results where idanalysis=$1	
 order by id offset 1 limit 1) b on true) a) a) a) a;
    $_$;


ALTER FUNCTION public.affine_matrix_for_analysis_0(integer) OWNER TO root;

--
-- Name: commacat(text, text); Type: FUNCTION; Schema: public; Owner: root
--

CREATE FUNCTION commacat(acc text, instr text) RETURNS text
    LANGUAGE plpgsql
    AS $$
  BEGIN
    IF acc IS NULL OR acc = '' THEN
      RETURN instr;
    ELSE
      RETURN acc || ', ' || instr;
    END IF;
  END;
$$;


ALTER FUNCTION public.commacat(acc text, instr text) OWNER TO root;

--
-- Name: connectby(text, text, text, text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION connectby(text, text, text, text, integer) RETURNS SETOF record
    LANGUAGE c STABLE STRICT
    AS '$libdir/tablefunc', 'connectby_text';


ALTER FUNCTION public.connectby(text, text, text, text, integer) OWNER TO postgres;

--
-- Name: connectby(text, text, text, text, integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION connectby(text, text, text, text, integer, text) RETURNS SETOF record
    LANGUAGE c STABLE STRICT
    AS '$libdir/tablefunc', 'connectby_text';


ALTER FUNCTION public.connectby(text, text, text, text, integer, text) OWNER TO postgres;

--
-- Name: connectby(text, text, text, text, text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION connectby(text, text, text, text, text, integer) RETURNS SETOF record
    LANGUAGE c STABLE STRICT
    AS '$libdir/tablefunc', 'connectby_text_serial';


ALTER FUNCTION public.connectby(text, text, text, text, text, integer) OWNER TO postgres;

--
-- Name: connectby(text, text, text, text, text, integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION connectby(text, text, text, text, text, integer, text) RETURNS SETOF record
    LANGUAGE c STABLE STRICT
    AS '$libdir/tablefunc', 'connectby_text_serial';


ALTER FUNCTION public.connectby(text, text, text, text, text, integer, text) OWNER TO postgres;

--
-- Name: crosstab(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION crosstab(text) RETURNS SETOF record
    LANGUAGE c STABLE STRICT
    AS '$libdir/tablefunc', 'crosstab';


ALTER FUNCTION public.crosstab(text) OWNER TO postgres;

--
-- Name: crosstab(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION crosstab(text, integer) RETURNS SETOF record
    LANGUAGE c STABLE STRICT
    AS '$libdir/tablefunc', 'crosstab';


ALTER FUNCTION public.crosstab(text, integer) OWNER TO postgres;

--
-- Name: crosstab(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION crosstab(text, text) RETURNS SETOF record
    LANGUAGE c STABLE STRICT
    AS '$libdir/tablefunc', 'crosstab_hash';


ALTER FUNCTION public.crosstab(text, text) OWNER TO postgres;

--
-- Name: crosstab2(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION crosstab2(text) RETURNS SETOF tablefunc_crosstab_2
    LANGUAGE c STABLE STRICT
    AS '$libdir/tablefunc', 'crosstab';


ALTER FUNCTION public.crosstab2(text) OWNER TO postgres;

--
-- Name: crosstab3(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION crosstab3(text) RETURNS SETOF tablefunc_crosstab_3
    LANGUAGE c STABLE STRICT
    AS '$libdir/tablefunc', 'crosstab';


ALTER FUNCTION public.crosstab3(text) OWNER TO postgres;

--
-- Name: crosstab4(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION crosstab4(text) RETURNS SETOF tablefunc_crosstab_4
    LANGUAGE c STABLE STRICT
    AS '$libdir/tablefunc', 'crosstab';


ALTER FUNCTION public.crosstab4(text) OWNER TO postgres;

--
-- Name: nearest_distances_avg(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION nearest_distances_avg(integer, integer) RETURNS double precision
    LANGUAGE sql
    AS $_$
   SELECT  avg(dist) from (select * from (select sqrt(((a."row" - b."row") * (a."row" - b."row") + (a.col - b.col) * (a.col - b.col))::double precision) AS dist
    FROM results a , results b where a.id=$1 and a.id <> b.id and a.idanalysis =b.idanalysis) c order by dist limit $2) d;
    $_$;


ALTER FUNCTION public.nearest_distances_avg(integer, integer) OWNER TO postgres;

--
-- Name: nearest_distances_max(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION nearest_distances_max(integer, integer) RETURNS double precision
    LANGUAGE sql
    AS $_$
   SELECT  max(dist) from (select * from (select sqrt(((a."row" - b."row") * (a."row" - b."row") + (a.col - b.col) * (a.col - b.col))::double precision) AS dist
    FROM results a , results b where a.id=$1 and a.idanalysis =b.idanalysis) c order by dist limit $2) d;
    $_$;


ALTER FUNCTION public.nearest_distances_max(integer, integer) OWNER TO postgres;

--
-- Name: nearest_distances_median(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION nearest_distances_median(integer, integer) RETURNS numeric
    LANGUAGE sql
    AS $_$
   SELECT  median(dist::numeric) from (select * from (select sqrt(((a."row" - b."row") * (a."row" - b."row") + (a.col - b.col) * (a.col - b.col))::double precision) AS dist
    FROM results a , results b where a.id=$1 and a.idanalysis =b.idanalysis) c order by dist limit $2) d;
    $_$;


ALTER FUNCTION public.nearest_distances_median(integer, integer) OWNER TO postgres;

--
-- Name: nearest_distances_min(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION nearest_distances_min(integer, integer) RETURNS double precision
    LANGUAGE sql
    AS $_$
   SELECT  min(dist) from (select * from (select sqrt(((a."row" - b."row") * (a."row" - b."row") + (a.col - b.col) * (a.col - b.col))::double precision) AS dist
    FROM results a , results b where a.id=$1 and a.id<>b.id and a.idanalysis =b.idanalysis) c order by dist limit $2) d;
    $_$;


ALTER FUNCTION public.nearest_distances_min(integer, integer) OWNER TO postgres;

--
-- Name: nearest_distances_std(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION nearest_distances_std(integer, integer) RETURNS double precision
    LANGUAGE sql
    AS $_$
   SELECT  stddev(dist) from (select * from (select sqrt(((a."row" - b."row") * (a."row" - b."row") + (a.col - b.col) * (a.col - b.col))::double precision) AS dist
    FROM results a , results b where a.id=$1 and a.idanalysis =b.idanalysis) c where dist>2 order by dist limit $2) d;
    $_$;


ALTER FUNCTION public.nearest_distances_std(integer, integer) OWNER TO postgres;

--
-- Name: normal_rand(integer, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION normal_rand(integer, double precision, double precision) RETURNS SETOF double precision
    LANGUAGE c STRICT
    AS '$libdir/tablefunc', 'normal_rand';


ALTER FUNCTION public.normal_rand(integer, double precision, double precision) OWNER TO postgres;

--
-- Name: outer_geom_for_analysis(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION outer_geom_for_analysis(integer) RETURNS text
    LANGUAGE sql
    AS $_$
   SELECT  max(row)-min(row)  ||'x'|| max(col)-min(col)||'+'||min(row)||'+'|| min(col) as geom from results where idanalysis=$1;
    $_$;


ALTER FUNCTION public.outer_geom_for_analysis(integer) OWNER TO postgres;

--
-- Name: median(numeric); Type: AGGREGATE; Schema: public; Owner: root
--

CREATE AGGREGATE median(numeric) (
    SFUNC = array_append,
    STYPE = numeric[],
    INITCOND = '{}',
    FINALFUNC = _final_median
);


ALTER AGGREGATE public.median(numeric) OWNER TO root;

--
-- Name: textcat_all(text); Type: AGGREGATE; Schema: public; Owner: root
--

CREATE AGGREGATE textcat_all(text) (
    SFUNC = commacat,
    STYPE = text,
    INITCOND = ''
);


ALTER AGGREGATE public.textcat_all(text) OWNER TO root;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: aggregations; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE aggregations (
    id integer NOT NULL,
    idanalysis integer NOT NULL,
    name text,
    value text
);


ALTER TABLE public.aggregations OWNER TO root;

--
-- Name: aggregations_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE aggregations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aggregations_id_seq OWNER TO root;

--
-- Name: aggregations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE aggregations_id_seq OWNED BY aggregations.id;


--
-- Name: analyses; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE analyses (
    id integer NOT NULL,
    idimage integer,
    width integer,
    height integer,
    manual_edit boolean,
    idcomposition_for_analysis integer,
    idcomposition_for_editing integer,
    idparent_analysis integer,
    setup_params text,
    idstack integer
);


ALTER TABLE public.analyses OWNER TO postgres;

--
-- Name: COLUMN analyses.idcomposition_for_analysis; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN analyses.idcomposition_for_analysis IS '<!> add contstraints';


--
-- Name: COLUMN analyses.idcomposition_for_editing; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN analyses.idcomposition_for_editing IS '<!> add contstraints';


--
-- Name: analyses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE analyses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.analyses_id_seq OWNER TO postgres;

--
-- Name: analyses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE analyses_id_seq OWNED BY analyses.id;


--
-- Name: images; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE images (
    id integer NOT NULL,
    filename character varying(1024) NOT NULL,
    idtrial integer,
    idcentre integer,
    name character varying(1024),
    uploadtime timestamp without time zone DEFAULT now(),
    image_time timestamp without time zone
);


ALTER TABLE public.images OWNER TO postgres;

--
-- Name: trials; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE trials (
    id integer NOT NULL,
    name character varying(128),
    valid_ldap_names character varying(1024),
    image_repository text,
    composition_for_editing integer,
    composition_for_celldetection integer,
    composition_for_upload integer,
    composition_for_overlay integer,
    composition_for_fixup integer,
    composition_for_javascript integer,
    composition_for_aggregation integer,
    composition_for_saving integer,
    composition_for_hovering integer,
    entity_regex text,
    composition_marking_registration_markers integer,
    editing_controller text,
    composition_for_ransac integer,
    composition_for_clustering integer
);


ALTER TABLE public.trials OWNER TO postgres;

--
-- Name: COLUMN trials.composition_for_editing; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN trials.composition_for_editing IS '<!> constraints fehlen';


--
-- Name: COLUMN trials.composition_for_celldetection; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN trials.composition_for_celldetection IS '<!> add constraints';


--
-- Name: COLUMN trials.composition_for_fixup; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN trials.composition_for_fixup IS '<!> fix constraints';


--
-- Name: images_name; Type: VIEW; Schema: public; Owner: root
--

CREATE VIEW images_name AS
 SELECT images.id,
    images.name,
    COALESCE(images.name, images.filename) AS name2,
    images.idtrial,
    images.idcentre,
    images.filename,
    trials.image_repository,
    images.uploadtime,
    images.image_time
   FROM (images
     JOIN trials ON ((trials.id = images.idtrial)));


ALTER TABLE public.images_name OWNER TO root;

--
-- Name: results; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE results (
    id integer NOT NULL,
    "row" integer,
    col integer,
    idanalysis integer,
    tag integer
);


ALTER TABLE public.results OWNER TO postgres;

--
-- Name: number_points; Type: VIEW; Schema: public; Owner: root
--

CREATE VIEW number_points AS
 SELECT count(*) AS count,
    results.idanalysis
   FROM results
  GROUP BY results.idanalysis;


ALTER TABLE public.number_points OWNER TO root;

--
-- Name: analyses_idtrial; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW analyses_idtrial AS
 SELECT analyses.id,
    analyses.idimage,
    analyses.width,
    analyses.height,
    analyses.manual_edit,
    analyses.idcomposition_for_analysis,
    analyses.idcomposition_for_editing,
    analyses.idparent_analysis,
    analyses.setup_params,
    images.idtrial,
    number_points.count,
    images_name.name2 AS name
   FROM ((((analyses
     JOIN images ON ((images.id = analyses.idimage)))
     JOIN number_points ON ((number_points.idanalysis = analyses.id)))
     JOIN images_name ON ((images_name.id = analyses.idimage)))
     JOIN ( SELECT max(analyses_1.id) AS lastid,
            analyses_1.idimage
           FROM analyses analyses_1
          GROUP BY analyses_1.idimage) a ON ((a.lastid = analyses.id)));


ALTER TABLE public.analyses_idtrial OWNER TO postgres;

--
-- Name: patch_chains; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE patch_chains (
    id integer NOT NULL,
    ordering integer,
    idpatch_composition integer,
    name text
);


ALTER TABLE public.patch_chains OWNER TO root;

--
-- Name: TABLE patch_chains; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON TABLE patch_chains IS '<!>constraints fehlen';


--
-- Name: patch_compositions; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE patch_compositions (
    id integer NOT NULL,
    name text,
    description text,
    idtrials integer,
    primary_chain integer,
    type integer
);


ALTER TABLE public.patch_compositions OWNER TO root;

--
-- Name: COLUMN patch_compositions.primary_chain; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN patch_compositions.primary_chain IS '<!> constraints fehlen';


--
-- Name: patch_input_values; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE patch_input_values (
    id integer NOT NULL,
    idparameter integer,
    idpatch integer,
    interactive boolean,
    value text,
    disabled boolean
);


ALTER TABLE public.patch_input_values OWNER TO root;

--
-- Name: patch_parameters; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE patch_parameters (
    id integer NOT NULL,
    name text,
    default_value text DEFAULT ''::text,
    type text,
    range1 text,
    range2 text,
    idpatch integer,
    cmd_name text,
    description text
);


ALTER TABLE public.patch_parameters OWNER TO root;

--
-- Name: patch_repository; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE patch_repository (
    id integer NOT NULL,
    type integer,
    code text,
    name text,
    filetype text
);


ALTER TABLE public.patch_repository OWNER TO root;

--
-- Name: patches; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE patches (
    id integer NOT NULL,
    ordering integer,
    idpatch_chain integer,
    idpatch integer
);


ALTER TABLE public.patches OWNER TO root;

--
-- Name: composition_interactive_parameters; Type: VIEW; Schema: public; Owner: root
--

CREATE VIEW composition_interactive_parameters AS
 SELECT patch_chains.idpatch_composition,
    patch_chains.id AS idpatch_chain,
    COALESCE(patches.ordering, patches.id) AS patch_ordering,
    patch_repository.type AS patch_type,
    patch_repository.name AS patch,
    patch_parameters.name,
    patch_parameters.type,
    patch_input_values.value,
    patch_parameters.range1,
    patch_parameters.range2,
    patches.id AS idpatch,
    patch_input_values.id AS idinput,
    patch_input_values.disabled,
    patch_parameters.id AS idparameter
   FROM (((((patch_chains
     JOIN patches ON ((patches.idpatch_chain = patch_chains.id)))
     JOIN patch_repository ON ((patch_repository.id = patches.idpatch)))
     JOIN patch_input_values ON ((patch_input_values.idpatch = patches.id)))
     JOIN patch_parameters ON ((patch_parameters.id = patch_input_values.idparameter)))
     JOIN patch_compositions ON ((patch_compositions.id = patch_chains.idpatch_composition)))
  WHERE (patch_input_values.interactive = true)
  ORDER BY patches.id, patch_input_values.id;


ALTER TABLE public.composition_interactive_parameters OWNER TO root;

--
-- Name: folder_content; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW folder_content AS
 SELECT DISTINCT a.idimage,
    a.folder_name,
    (a.idtrial || a.folder_name) AS linkname,
    a.oname AS name
   FROM ( SELECT a_1.idimage,
            "substring"((a_1.oname)::text, a_1.entity_regex) AS folder_name,
            a_1.idtrial,
            a_1.oname
           FROM ( SELECT images.id AS idimage,
                    images.idtrial,
                    COALESCE(trials.entity_regex, '.+'::text) AS entity_regex,
                    COALESCE(images.name, images.filename) AS oname
                   FROM (images
                     JOIN trials ON ((trials.id = images.idtrial)))) a_1) a
  WHERE (a.folder_name IS NOT NULL);


ALTER TABLE public.folder_content OWNER TO postgres;

--
-- Name: folders; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW folders AS
 SELECT a.idtrial,
    a.folder_name,
    (a.idtrial || a.folder_name) AS linkname
   FROM ( SELECT DISTINCT a_1.idtrial,
            "substring"((a_1.oname)::text, a_1.entity_regex) AS folder_name
           FROM ( SELECT images.id,
                    images.idtrial,
                    COALESCE(trials.entity_regex, '.+'::text) AS entity_regex,
                    COALESCE(images.name, images.filename) AS oname
                   FROM (images
                     JOIN trials ON ((trials.id = images.idtrial)))) a_1) a
  WHERE (a.folder_name IS NOT NULL);


ALTER TABLE public.folders OWNER TO postgres;

--
-- Name: global_messages; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE global_messages (
    id integer NOT NULL,
    idtrial integer,
    message text,
    "user" text,
    message_time timestamp without time zone DEFAULT now(),
    type integer DEFAULT 0
);


ALTER TABLE public.global_messages OWNER TO root;

--
-- Name: global_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE global_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.global_messages_id_seq OWNER TO root;

--
-- Name: global_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE global_messages_id_seq OWNED BY global_messages.id;


--
-- Name: images_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.images_id_seq OWNER TO postgres;

--
-- Name: images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE images_id_seq OWNED BY images.id;


--
-- Name: montage_images; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE montage_images (
    id integer NOT NULL,
    idimage integer,
    parameter text,
    idmontage integer,
    disable boolean DEFAULT false,
    idanalysis_reference integer,
    idanalysis integer
);


ALTER TABLE public.montage_images OWNER TO root;

--
-- Name: montage_image_list; Type: VIEW; Schema: public; Owner: root
--

CREATE VIEW montage_image_list AS
 SELECT textcat_all((montage_images.idimage)::text) AS list,
    montage_images.idmontage,
    montage_images.idmontage AS id
   FROM ( SELECT montage_images_1.id,
            montage_images_1.idimage,
            montage_images_1.parameter,
            montage_images_1.idmontage,
            montage_images_1.disable,
            montage_images_1.idanalysis_reference,
            montage_images_1.idanalysis
           FROM (montage_images montage_images_1
             JOIN images ON ((montage_images_1.idimage = images.id)))
          ORDER BY images.name) montage_images
  GROUP BY montage_images.idmontage;


ALTER TABLE public.montage_image_list OWNER TO root;

--
-- Name: montage_images_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE montage_images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.montage_images_id_seq OWNER TO root;

--
-- Name: montage_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE montage_images_id_seq OWNED BY montage_images.id;


--
-- Name: montages; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE montages (
    id integer NOT NULL,
    idtrial integer,
    name character varying(128) NOT NULL,
    width integer,
    height integer,
    idpatch integer,
    idcompo_with_points integer,
    geometry text
);


ALTER TABLE public.montages OWNER TO root;

--
-- Name: montages_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE montages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.montages_id_seq OWNER TO root;

--
-- Name: montages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE montages_id_seq OWNED BY montages.id;


--
-- Name: parameter_lists; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE parameter_lists (
    id integer NOT NULL,
    value text,
    idpatch_parameter integer
);


ALTER TABLE public.parameter_lists OWNER TO root;

--
-- Name: parameter_lists_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE parameter_lists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.parameter_lists_id_seq OWNER TO root;

--
-- Name: parameter_lists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE parameter_lists_id_seq OWNED BY parameter_lists.id;


--
-- Name: patch_chains_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE patch_chains_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.patch_chains_id_seq OWNER TO root;

--
-- Name: patch_chains_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE patch_chains_id_seq OWNED BY patch_chains.id;


--
-- Name: patch_chains_with_parameters; Type: VIEW; Schema: public; Owner: root
--

CREATE VIEW patch_chains_with_parameters AS
 SELECT patch_chains.id AS idpatch_chain,
    COALESCE(patches.ordering, patches.id) AS patch_ordering,
    patch_repository.type AS patch_type,
    COALESCE(patch_repository.code, patch_repository.name) AS patch,
    textcat_all((((('"'::text || COALESCE(patch_parameters_sorted.cmd_name, patch_parameters_sorted.name)) || '"'::text) || '=>'::text) ||
        CASE
            WHEN (patch_parameters_sorted.type = '4'::text) THEN
            CASE
                WHEN (patch_input_values.value IS NULL) THEN '$readImageFunction->()'::text
                ELSE (('imageForDBHAndRenderchainIDAndImage($dbh,'::text || patch_input_values.value) || ', $readImageFunction)'::text)
            END
            WHEN (patch_parameters_sorted.type = '5'::text) THEN (('"'::text || ( SELECT parameter_lists.value
               FROM parameter_lists
              WHERE (parameter_lists.id = (patch_input_values.value)::integer))) || '"'::text)
            ELSE (('"'::text || COALESCE(patch_input_values.value, ''::text)) || '"'::text)
        END)) AS params,
    COALESCE(patch_repository.filetype, 'jpg'::text) AS filetype,
    patch_chains.id
   FROM ((((patch_chains
     JOIN patches ON ((patches.idpatch_chain = patch_chains.id)))
     JOIN patch_repository ON ((patch_repository.id = patches.idpatch)))
     LEFT JOIN patch_input_values ON ((patch_input_values.idpatch = patches.id)))
     LEFT JOIN ( SELECT patch_parameters.id,
            patch_parameters.name,
            patch_parameters.default_value,
            patch_parameters.type,
            patch_parameters.range1,
            patch_parameters.range2,
            patch_parameters.idpatch,
            patch_parameters.cmd_name,
            patch_parameters.description
           FROM patch_parameters
          ORDER BY patch_parameters.id) patch_parameters_sorted ON ((patch_parameters_sorted.id = patch_input_values.idparameter)))
  WHERE ((patch_input_values.disabled = false) OR (patch_input_values.disabled IS NULL))
  GROUP BY patch_chains.id, COALESCE(patches.ordering, patches.id), patch_repository.type, patch_repository.name, patch_repository.code, patch_repository.filetype
  ORDER BY COALESCE(patches.ordering, patches.id);


ALTER TABLE public.patch_chains_with_parameters OWNER TO root;

--
-- Name: patch_compositions_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE patch_compositions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.patch_compositions_id_seq OWNER TO root;

--
-- Name: patch_compositions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE patch_compositions_id_seq OWNED BY patch_compositions.id;


--
-- Name: patch_input_values_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE patch_input_values_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.patch_input_values_id_seq OWNER TO root;

--
-- Name: patch_input_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE patch_input_values_id_seq OWNED BY patch_input_values.id;


--
-- Name: patch_input_values_type; Type: VIEW; Schema: public; Owner: root
--

CREATE VIEW patch_input_values_type AS
 SELECT patch_input_values.id,
    patch_input_values.idparameter,
    patch_input_values.idpatch,
    patch_input_values.interactive,
    patch_input_values.value,
    COALESCE(patch_parameters.type, '1'::text) AS type
   FROM (patch_input_values
     JOIN patch_parameters ON ((patch_parameters.id = patch_input_values.idparameter)));


ALTER TABLE public.patch_input_values_type OWNER TO root;

--
-- Name: patch_parameters_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE patch_parameters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.patch_parameters_id_seq OWNER TO root;

--
-- Name: patch_parameters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE patch_parameters_id_seq OWNED BY patch_parameters.id;


--
-- Name: patch_repository_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE patch_repository_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.patch_repository_id_seq OWNER TO root;

--
-- Name: patch_repository_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE patch_repository_id_seq OWNED BY patch_repository.id;


--
-- Name: patches_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE patches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.patches_id_seq OWNER TO root;

--
-- Name: patches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE patches_id_seq OWNED BY patches.id;


--
-- Name: results_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE results_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.results_id_seq OWNER TO postgres;

--
-- Name: results_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE results_id_seq OWNED BY results.id;


--
-- Name: rois; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE rois (
    id integer NOT NULL,
    geom_string text,
    idimage integer
);


ALTER TABLE public.rois OWNER TO root;

--
-- Name: rois_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE rois_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rois_id_seq OWNER TO root;

--
-- Name: rois_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE rois_id_seq OWNED BY rois.id;


--
-- Name: scan_ins; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE scan_ins (
    id integer NOT NULL,
    piz integer,
    referrer_ldap text,
    download_permission integer DEFAULT 1,
    scandate timestamp without time zone DEFAULT now()
);


ALTER TABLE public.scan_ins OWNER TO root;

--
-- Name: scan_ins_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE scan_ins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scan_ins_id_seq OWNER TO root;

--
-- Name: scan_ins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE scan_ins_id_seq OWNED BY scan_ins.id;


--
-- Name: stacks; Type: VIEW; Schema: public; Owner: root
--

CREATE VIEW stacks AS
 SELECT montages.id,
    montages.idtrial,
    montages.name,
    montage_images.idimage,
    montage_images.idanalysis_reference,
    montage_images.idanalysis,
    montage_images.parameter
   FROM (montages
     JOIN montage_images ON ((montage_images.idmontage = montages.id)));


ALTER TABLE public.stacks OWNER TO root;

--
-- Name: tag_repository; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE tag_repository (
    id integer NOT NULL,
    idtrial integer,
    name character varying(1024),
    type integer,
    offset_days integer
);


ALTER TABLE public.tag_repository OWNER TO root;

--
-- Name: tag_repository_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE tag_repository_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tag_repository_id_seq OWNER TO root;

--
-- Name: tag_repository_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE tag_repository_id_seq OWNED BY tag_repository.id;


--
-- Name: taglist_repository; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE taglist_repository (
    id integer NOT NULL,
    idtag integer,
    ordering integer,
    name text
);


ALTER TABLE public.taglist_repository OWNER TO root;

--
-- Name: taglist_repository_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE taglist_repository_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taglist_repository_id_seq OWNER TO root;

--
-- Name: taglist_repository_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE taglist_repository_id_seq OWNED BY taglist_repository.id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE tags (
    id integer NOT NULL,
    idimage integer,
    idtag integer,
    value text
);


ALTER TABLE public.tags OWNER TO root;

--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tags_id_seq OWNER TO root;

--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE tags_id_seq OWNED BY tags.id;


--
-- Name: test_images; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE test_images (
    id integer NOT NULL,
    idimage integer,
    idpatch_composition integer,
    render_size integer DEFAULT 100000
);


ALTER TABLE public.test_images OWNER TO root;

--
-- Name: test_images_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE test_images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.test_images_id_seq OWNER TO root;

--
-- Name: test_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE test_images_id_seq OWNED BY test_images.id;


--
-- Name: trials_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE trials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trials_id_seq OWNER TO postgres;

--
-- Name: trials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE trials_id_seq OWNED BY trials.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY aggregations ALTER COLUMN id SET DEFAULT nextval('aggregations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY analyses ALTER COLUMN id SET DEFAULT nextval('analyses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY global_messages ALTER COLUMN id SET DEFAULT nextval('global_messages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY images ALTER COLUMN id SET DEFAULT nextval('images_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY montage_images ALTER COLUMN id SET DEFAULT nextval('montage_images_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY montages ALTER COLUMN id SET DEFAULT nextval('montages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY parameter_lists ALTER COLUMN id SET DEFAULT nextval('parameter_lists_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY patch_chains ALTER COLUMN id SET DEFAULT nextval('patch_chains_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY patch_compositions ALTER COLUMN id SET DEFAULT nextval('patch_compositions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY patch_input_values ALTER COLUMN id SET DEFAULT nextval('patch_input_values_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY patch_parameters ALTER COLUMN id SET DEFAULT nextval('patch_parameters_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY patch_repository ALTER COLUMN id SET DEFAULT nextval('patch_repository_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY patches ALTER COLUMN id SET DEFAULT nextval('patches_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY results ALTER COLUMN id SET DEFAULT nextval('results_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY rois ALTER COLUMN id SET DEFAULT nextval('rois_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY scan_ins ALTER COLUMN id SET DEFAULT nextval('scan_ins_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY tag_repository ALTER COLUMN id SET DEFAULT nextval('tag_repository_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY taglist_repository ALTER COLUMN id SET DEFAULT nextval('taglist_repository_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY tags ALTER COLUMN id SET DEFAULT nextval('tags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY test_images ALTER COLUMN id SET DEFAULT nextval('test_images_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY trials ALTER COLUMN id SET DEFAULT nextval('trials_id_seq'::regclass);


--
-- Data for Name: aggregations; Type: TABLE DATA; Schema: public; Owner: root
--

COPY aggregations (id, idanalysis, name, value) FROM stdin;
\.


--
-- Name: aggregations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('aggregations_id_seq', 188436, true);


--
-- Data for Name: analyses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY analyses (id, idimage, width, height, manual_edit, idcomposition_for_analysis, idcomposition_for_editing, idparent_analysis, setup_params, idstack) FROM stdin;
174213	\N	\N	\N	\N	\N	\N	174210	 	\N
\.


--
-- Name: analyses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('analyses_id_seq', 216279, true);


--
-- Data for Name: global_messages; Type: TABLE DATA; Schema: public; Owner: root
--

COPY global_messages (id, idtrial, message, "user", message_time, type) FROM stdin;
\.


--
-- Name: global_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('global_messages_id_seq', 1279, true);


--
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY images (id, filename, idtrial, idcentre, name, uploadtime, image_time) FROM stdin;
\.


--
-- Name: images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('images_id_seq', 34568, true);


--
-- Data for Name: montage_images; Type: TABLE DATA; Schema: public; Owner: root
--

COPY montage_images (id, idimage, parameter, idmontage, disable, idanalysis_reference, idanalysis) FROM stdin;
\.


--
-- Name: montage_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('montage_images_id_seq', 60864, true);


--
-- Data for Name: montages; Type: TABLE DATA; Schema: public; Owner: root
--

COPY montages (id, idtrial, name, width, height, idpatch, idcompo_with_points, geometry) FROM stdin;
\.


--
-- Name: montages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('montages_id_seq', 17836, true);


--
-- Data for Name: parameter_lists; Type: TABLE DATA; Schema: public; Owner: root
--

COPY parameter_lists (id, value, idpatch_parameter) FROM stdin;
1	Multiply	10
2	Modulate	10
3	Darken	10
4	Difference	10
5	Saturate	10
6	Atop	10
7	Blend	10
8	Bumpmap	10
9	Minus	10
10	Threshold	10
11	Xor	10
12	SoftLight	10
13	Plus	10
14	Out	10
38	Mask	10
39	Exclusion	10
104	setDrawingAngle	73
106	red	214
82	green	197
20	Gray	55
21	True	56
22	False	56
23	Red	58
24	Green	58
25	Blue	58
26	Yellow	58
27	Red	60
28	Green	60
29	Blue	60
30	Yellow	60
31	Red	61
32	Green	61
33	Black	60
34	White	60
35	Black	61
36	White	61
37	Dissolve	10
159	Median	330
45	rectangle	87
46	circle	87
47	Yes	91
48	No	91
49	Gray	97
50	Brighten	10
60	Center	177
61	South	177
57	Black	172
62	West	177
58	White	172
59	Transparent	172
63	North	177
64	East	177
145	l-star	265
146	lightness	265
147	luminance	265
68	Black	179
69	White	179
70	Transparent	179
71	NorthWest	177
77	Red	195
78	Green	195
79	Blue	195
80	Yellow	195
84	Yes	198
85	No	198
86	Open	202
87	Close	202
88	Dilate	202
98	Black	211
90	Erode	202
91	Thinning	202
92	Smooth	202
93	EdgeOut	202
94	EdgeIn	202
95	TopHat	202
97	Hit-And-Miss	202
99	White	211
100	Green	211
101	Background	172
102	setNumberingPoints	73
103	setDrawingLines	73
107	green	214
108	blue	214
109	box	251
110	disc	251
111	diamond	251
112	gaussian	251
113	line	251
114	setClosingPolygons	73
115	coalesce	254
116	composite	254
117	flatten	254
118	merge	254
119	mosaic	254
120	Add	255
121	Atop	255
122	Blend	255
123	Bumpmap	255
124	ColorBurn	255
125	Dissolve	255
126	Lighten	255
127	Multiply	255
128	Modulate	255
148	value	265
149	evaluate.agreement4	269
150	evaluate.agreement	269
160	Min	330
161	Max	330
96	BottomHat	202
162	Mean	330
155	black	277
156	white	277
157	On	278
158	Off	278
83	blue	197
81	red	197
\.


--
-- Name: parameter_lists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('parameter_lists_id_seq', 171, true);


--
-- Data for Name: patch_chains; Type: TABLE DATA; Schema: public; Owner: root
--

COPY patch_chains (id, ordering, idpatch_composition, name) FROM stdin;
58	1	40	chain1
59	2	40	chain2
60	\N	41	chain1
61	\N	42	chain1
169	\N	121	chain1
170	\N	122	chain1
171	\N	123	chain1
172	\N	124	chain1
196	\N	144	chain1
259	\N	202	chain1
\.


--
-- Name: patch_chains_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('patch_chains_id_seq', 471, true);


--
-- Data for Name: patch_compositions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY patch_compositions (id, name, description, idtrials, primary_chain, type) FROM stdin;
1	preprocessing	\N	\N	\N	\N
2	compo1	\N	\N	\N	\N
40	viewing	\N	1	58	1
41	overlay_green	\N	1	60	2
42	analysis	\N	1	61	5
121	neigbourhood	\N	1	169	4
122	neigbourhood2	\N	1	170	4
123	pointid	\N	1	171	4
124	points_enhanced	\N	1	172	1
144	align	\N	1	196	1
202	contrast	\N	1	259	1
\.


--
-- Name: patch_compositions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('patch_compositions_id_seq', 395, true);


--
-- Data for Name: patch_input_values; Type: TABLE DATA; Schema: public; Owner: root
--

COPY patch_input_values (id, idparameter, idpatch, interactive, value, disabled) FROM stdin;
1	\N	\N	\N	\N	\N
2	\N	\N	\N	\N	\N
3	\N	\N	\N	\N	\N
4	\N	\N	\N	\N	\N
5	\N	\N	\N	\N	\N
6	\N	\N	\N	\N	\N
7	\N	\N	\N	\N	\N
387	15	178	t	10	\N
404	62	183	\N	20%	\N
381	21	176	\N	All	\N
384	10	177	\N	7	\N
385	62	177	\N	50%	\N
391	77	179	\N	4	\N
390	78	179	\N	4	\N
389	79	179	\N	10	\N
388	80	179	\N	0.5	\N
398	21	181	\N	All	\N
399	22	181	\N	1%x75%	\N
383	7	177	\N	59	\N
401	61	182	\N	35	\N
400	60	182	\N	28	\N
402	7	183	\N	\N	\N
403	10	183	\N	37	\N
406	15	184	\N	8	\N
405	16	184	\N	12	\N
386	16	178	t	10	\N
1567	168	691	\N	1.2	\N
1592	150	708	\N	1	\N
1593	151	708	\N	Dilate	\N
1580	16	701	\N	6	\N
1594	149	708	\N	Disk:3	\N
1581	15	701	\N	6	\N
1573	56	697	t	21	\N
1577	150	700	\N	1	\N
1578	151	700	\N	TopHat	\N
1579	149	700	\N	Disk:12	\N
1582	7	702	\N	\N	\N
1583	10	702	\N	37	\N
1589	108	706	\N	my $sql = 'select row,col,nearest_distances_avg(id,1) as size from results where idanalysis= ?'; my $sth = $dbh->prepare($sql); $sth->execute(($idanalysis)); my $lines=$sth->fetchall_arrayref(); foreach (@$lines) {\tmy ($x,$y,$rad)=($_->[0],$_->[1],$_->[2]/5.5); \t$p->Draw(primitive=>'Circle', fill=>'White', points=>$x.','.$y.' '.($x+$rad).','.$y); }	\N
1584	62	702	\N	95%	\N
1797	173	804	\N	AffineProjection	\N
1796	169	804	\N	<handover>	\N
1798	172	804	\N	59	\N
382	22	176	t	2%x1%	\N
1569	15	694	t	1.5	\N
2291	21	1031	\N	All	\N
1568	16	694	t	0.333333333333333	\N
1572	56	696	t	21	\N
2292	22	1031	\N		\N
\.


--
-- Name: patch_input_values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('patch_input_values_id_seq', 4181, true);


--
-- Data for Name: patch_parameters; Type: TABLE DATA; Schema: public; Owner: root
--

COPY patch_parameters (id, name, default_value, type, range1, range2, idpatch, cmd_name, description) FROM stdin;
11	sharpen	True	2	\N	\N	7	\N	\N
13	sigma	2	1	0	30	8	\N	\N
16	sigma	2	1	0	10	10	\N	\N
15	radius	1	1	0	10	10	\N	\N
17	gamma	1	1	0	10	11	\N	\N
18	channel	All	3	\N	\N	11	\N	\N
9	geometry	702x458+40+61	3	\N	\N	6	\N	\N
314	CV_Q_Gate	0.25	\N	\N	\N	107	\N	\N
55	colorspace	20	5	\N	\N	20	\N	\N
317	window_size	8	1	\N	\N	141	\N	\N
64	connectivity	6	1	1	32	25	\N	\N
7	image	\N	4	\N	\N	5	\N	\N
10	compose	1	5	\N	\N	5	\N	\N
21	channel	All	3	\N	\N	12	\N	\N
22	levels	15%x5%	3			12	\N	\N
56	gray	21	5	\N	\N	21	\N	\N
74	radius	2	1	1	100	30	\N	\N
25	radius	1	1	0	10	14	\N	\N
320	window_size	12	1	\N	\N	134	\N	\N
247	brushsize		1	1	100	109	\N	\N
58	fill	23	5	\N	\N	23	\N	\N
12	radius	3	1	0	30	8	\N	\N
59	opacity	50	1	0	100	23	\N	\N
60	fill	\N	5	\N	\N	24	\N	\N
61	color	\N	5	\N	\N	24	\N	\N
62	blend	\N	1	\N	\N	5	\N	\N
82	width	800	1	\N	\N	33	\N	\N
81	sd_gate	10	1	0	10	28	\N	\N
69	min_dist	1	1	1	100	25	\N	\N
83	height	600	1	\N	\N	33	\N	\N
68	max_dist	80	1	5	200	25	\N	\N
71	connectivity	6	1	3	12	28	\N	\N
72	factor	1000	1	1	10000	28	\N	\N
90	new_compo	\N	3	\N	\N	38	\N	give the name of e.g. a cropping compo (geom-> <handover>)
80	threshold	0.01	1	0	1	32	\N	\N
89	_anonymous_	\N	3	\N	\N	37	\N	this imposes security risks, unless type is immutable
91	copy_points	47	5	\N	\N	38	\N	\N
79	amount	1	1	0	100	32	\N	\N
97	type	Grayscale	0	\N	\N	42	\N	\N
85	fill	white	3	\N	\N	35	\N	\N
78	sigma	1	1	0	100	32	\N	\N
77	radius	1	1	0	100	32	\N	\N
87	primitive	\N	5	\N	\N	36	\N	\N
92	stripewidth	10	1	2	100	39	\N	\N
88	points	10,10,100,100	3	\N	\N	36	\N	\N
93	connectivity	6	1	1	32	41	\N	\N
94	max_sd	10	1	0	50	41	\N	\N
96	max_dist	80	1	5	200	41	\N	\N
108	_anonymous_	my $sql = 'select row,col,nearest_distances_avg(id,1) as size from results where idanalysis= ?'; my $sth = $dbh->prepare($sql); $sth->execute(($idanalysis)); my $lines=$sth->fetchall_arrayref(); foreach (@$lines) {\tmy ($x,$y,$rad)=($_->[0],$_->[1],$_->[2]/5.5); \t$p->Draw(primitive=>'Circle', fill=>'White', points=>$x.','.$y.' '.($x+$rad).','.$y); }	0	\N	\N	50	\N	\N
115	radius	14	1	\N	\N	54	\N	\N
104	aggregator_name	\N	3	\N	\N	48	\N	\N
113	new_compo_aggregator	\N	3	\N	\N	46	\N	\N
102	new_compo_filter	\N	3	\N	\N	46	\N	\N
112	new_compo_analysis	\N	3	\N	\N	46	\N	\N
116	sigma	5	1	\N	\N	54	\N	\N
321	coefficients	[1,1,1,1,-8,1,1,1,1]	3	\N	\N	144	\N	\N
121	threshold	\N	1	\N	\N	57	\N	\N
120	sigma	\N	1	\N	\N	57	\N	\N
119	radius	\N	1	\N	\N	57	\N	\N
124	gate	3	1	\N	\N	61	\N	\N
125	horizon	1.5	1	\N	\N	61	\N	\N
194	stripewidth	10	1	2	100	92	\N	\N
201	iterations	1	\N	\N	\N	96	\N	\N
73	method	41	5	\N	\N	29	\N	\N
248	offset	0.02	1	0.01	0.5	109	\N	\N
249	pixelarea_lower_gate	300	1	1	10000	109	\N	\N
122	threshold	50%	3	\N	\N	58	\N	\N
147	height		1	\N	\N	71	\N	\N
146	width		1	\N	\N	71	\N	\N
150	iterations	1	\N	\N	\N	74	\N	\N
151	method	Dilate	\N	\N	\N	74	\N	\N
149	kernel	Disk:3	\N	\N	\N	74	\N	\N
254	method		5	\N	\N	113	\N	\N
253	factor	1	1	0	100	112	\N	\N
255	compose		5	\N	\N	113	\N	\N
261	_anonymous_	my $out=$p->[0];my $in=$p;$out->Composite(image=>$_, compose=> 'Saturate') for @$in;$p=$out;	3	\N	\N	117	\N	\N
98	_anonymous_	my $sql = 'select row,col,nearest_distances_median(id,6) as size from results where idanalysis= ?'; my $sth = $dbh->prepare($sql); $sth->execute(($idanalysis)); my $lines=$sth->fetchall_arrayref(); foreach (@$lines) {\tmy ($x,$y,$rad)=($_->[0],$_->[1],$_->[2]/1.35); \t$p->Draw(primitive=>'Circle', fill=>'Black', points=>$x.','.$y.' '.($x+$rad).','.$y); }	0	\N	\N	43	\N	\N
264	ContrastWeight	1	1	0	1	118	--contrast-weight=%s	\N
262	ExposureWeight	0	1	0	1	118	--exposure-weight=%s	\N
266	ContrastEdgeScale	0.3	1	0	1	118	--contrast-edge-scale=%s	\N
267	identityradius	8	1	1	30	119	\N	\N
268	iterations	15	1	1	100	119	\N	\N
269	cfunc		5	\N	\N	119	\N	\N
270	aiterations	12	1	1	40	119	\N	\N
63	max_cov	10	1	0	50	25	\N	\N
295	lambda	0	1	0	1	127	\N	\N
324	saturation		1	\N	\N	145	\N	\N
323	brightness		1	\N	\N	145	\N	\N
322	factor		1	\N	\N	145	\N	\N
328	blackness		1	\N	\N	145	\N	\N
327	whiteness		1	\N	\N	145	\N	\N
326	lightness		1	\N	\N	145	\N	\N
325	hue		1	\N	\N	145	\N	\N
331	gate_factor	0.01	1	\N	\N	151	\N	\N
168	horizon	1.3	1	\N	\N	79	\N	\N
169	points	[1,0,0,1,0,0]	1	\N	\N	82	\N	\N
173	method	AffineProjection	3	\N	\N	82	\N	\N
177	gravity		5	\N	\N	85	\N	\N
176	geometry	400x400-100-100	3	\N	\N	85	\N	\N
135	neighbours	3	1	\N	\N	64	\N	\N
136	horizon	1.4	1	\N	\N	64	\N	\N
137	viewing_compo	\N	3	\N	\N	65	\N	\N
139	fixup	\N	3	\N	\N	46	\N	\N
138	chainup	\N	3	\N	\N	46	\N	\N
145	_anonymous_	my $sql = 'select row,col from results where idanalysis= ?'; my $sth = $dbh->prepare($sql); $sth->execute(($idanalysis)); my $lines=$sth->fetchall_arrayref(); foreach (@$lines) {\tmy ($x,$y,$rad)=($_->[0],$_->[1],1); \t$p->Draw(primitive=>'Point', fill=>'Black', points=>$x.','.$y); }	3	\N	\N	70	\N	\N
172	virtual-pixel		5	\N	\N	82	\N	\N
179	background		5	\N	\N	85	\N	\N
183	maxy	10000	1	\N	\N	87	\N	\N
182	miny	0	1	\N	\N	87	\N	\N
197	channel		5	\N	\N	95	\N	\N
181	maxx	10000	1	\N	\N	87	\N	\N
195	channel	\N	5	\N	\N	93	\N	\N
180	minx	0	1	\N	\N	87	\N	\N
184	stripewidth	10	1	2	100	88	\N	\N
198	preserve_setup_params		5	\N	\N	46	\N	\N
123	threshold	50%	1	0%	100%	59	\N	\N
202	method	Dilate	5	\N	\N	96	\N	\N
203	kernel	Disk:3	3	\N	\N	96	\N	\N
211	fill	98	5	\N	\N	98	\N	\N
36	threshold	50%	1	0%	100%	17	\N	\N
210	geometry	1x1	3	\N	\N	98	\N	\N
212	_anonymous_	my($nx, $ny) = $p->Get('base-columns','base-rows'); $p->Draw(stroke=>'white', fill=>'transparent', primitive=>'rectangle', points=>'0,0,'. ($nx-1).', '.($ny-1)); \n	3	\N	\N	99	\N	\N
332	window_size	8	1	\N	\N	151	\N	\N
330	Operator		5	\N	\N	149	%s	\N
214	channel		5	\N	\N	100	-channel %s	\N
215	fx	(u+v)/2	3	\N	\N	100	-fx "%s"	\N
219	offset	0.1	1	0	1	101	\N	\N
218	tolerance	2	1	1	10	101	\N	\N
217	brush	7	1	11	40	101	\N	\N
220	hullbrush	21	1	9	30	101	\N	\N
241	factor	0.008	1	0	0.1	107	\N	\N
296	gate_factor	0.01	1	\N	\N	132	\N	\N
57	_anonymous_	1000	1	\N	\N	22	\N	\N
251	brush		5	\N	\N	109	\N	\N
250	_anonymous_	my $sql = 'select row,col from results where idanalysis= ?'; my $sth = $dbh->prepare($sql); $sth->execute(($idanalysis)); my $allpoints=$sth->fetchall_arrayref(); my @mypoints= map {$_->[0].','.$_->[0]} @$allpoints; my $points= join(qq/ /, @mypoints); $p->Draw(primitive=>'Polygon', fill=>'black',points=>$points);\n	3	\N	\N	110	\N	\N
265	GrayProjector	145	5	\N	\N	118	--gray-projector=%s	
252	breaks	10	1	1	1000	111	\N	\N
263	SaturationWeight	0	1	0	1	118	--saturation-weight=%s	\N
299	window_size	8	1	\N	\N	132	\N	\N
277	color	155	5	\N	\N	121	\N	\N
278	alpha	157	5	\N	\N	122	\N	\N
271	thresh	30	1	10	1000	119	\N	\N
284	degrees	10	1	0	360	124	\N	\N
152	width	15	1	\N	\N	76	\N	\N
153	height	15\n	1	\N	\N	76	\N	\N
154	offset	5%	3	\N	\N	76	\N	\N
335	tag		3	\N	\N	153	\N	\N
311	h	10	1	1	100	136	%d	\N
336	_anonymous_	my $out=shift @$p;my $in=$p;$out->Composite(image=>$_, compose=> 'Exclusion') for @$in;$p=$out;	3	\N	\N	156	\N	\N
344	window_size	8	1	\N	\N	159	\N	\N
339	upper_limit	100	1	\N	\N	157	\N	\N
338	lower_limit	30	1	\N	\N	157	\N	\N
343	cluster_min_size	2	1	\N	\N	158	\N	\N
340	cluster_min_size	2	1	\N	\N	157	\N	\N
353	scale	10\n	1	\N	\N	161	\N	\N
345	offset	0.007	1	\N	\N	159	\N	\N
333	scale	10	1	\N	\N	152	\N	\N
356	window_size	25	1	\N	\N	161	\N	\N
346	blur	4	1	\N	\N	159	\N	\N
347	tolerance	0.15	1	\N	\N	159	\N	\N
354	blur1	25	1	\N	\N	161	\N	\N
355	blur2	5\n	1	\N	\N	161	\N	\N
\.


--
-- Name: patch_parameters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('patch_parameters_id_seq', 362, true);


--
-- Data for Name: patch_repository; Type: TABLE DATA; Schema: public; Owner: root
--

COPY patch_repository (id, type, code, name, filetype) FROM stdin;
12	1	\N	ContrastStretch	\N
17	1	\N	BlackThreshold	\N
11	1	\N	Gamma	\N
7	1	\N	Contrast	\N
6	1	\N	Crop	\N
5	1	\N	Composite	\N
10	1	\N	GaussianBlur	\N
14	\N	\N	Edge	\N
20	1	\N	Quantize	\N
21	1	\N	Negate	\N
23	1	\N	Colorize	\N
22	1	\N	Resize	\N
24	1	\N	Opaque	\N
30	1	Edge	Edge	\N
124	1	\N	Rotate	\N
32	1	\N	UnsharpMask	\N
28	4	select <factor>/(avg_dist*avg_dist) as density, n as n_analysis from (\nSELECT avg(a.nearest_distances_avg) as avg_dist, count(*) as n, a.idanalysis\n   FROM ( SELECT results.idanalysis, nearest_distances_median(results.id, <connectivity>) AS nearest_distances_avg\n           FROM results where idanalysis=<idanalysis> and nearest_distances_std(results.id, <connectivity>) < <sd_gate>) a group by a.idanalysis) a	density_median	\N
8	1	AdaptiveBlur	AdaptiveBlur	\N
33	1	Resize	Resize_XY	\N
42	1	Set	ConvertToBlackWhite	\N
35	1	Colorize	Clear	\N
36	1	\N	Draw	\N
37	1	\N	Perl	\N
39	4	delete from results where idanalysis=<idanalysis> and id not in (select id from results b join (\nselect idanalysis, min(col) as col,(row/<stripewidth>)::integer  as row from results where idanalysis=<idanalysis> group by (row/<stripewidth>)::integer, idanalysis) a \non a.idanalysis=b.idanalysis and  a.col=b.col and (b.row/<stripewidth>)::integer=a.row)	only_the_topmost_points	\N
54	1	\N	AdaptiveSharpen	\N
71	1	\N	ReduceNoise	\N
43	1	Perl	MaskOutDetectedPoints	\N
136	2	/Users/Shared/bin/endothel_hdome_filter  <infiles>        <outfile>       <args>	hdomes	\N
29	5	<method>	ImageViewConfig	\N
57	1	\N	SelectiveBlur	\N
63	6	system('rm /tmp/cellf*');\n	clear_cache	\N
58	1	\N	Threshold	\N
59	1	\N	WhiteThreshold	\N
41	4	delete from results where idanalysis=<idanalysis> and id in (SELECT id FROM results a  where a.idanalysis=<idanalysis>  and  nearest_distances_std(a.id, <connectivity>) > <max_sd> or (nearest_distances_min(a.id, <connectivity>) > <max_dist> or  nearest_distances_max(a.id, <connectivity>)> <max_dist>))	delete_implausible_points2	\N
61	4	delete from results where idanalysis=<idanalysis> and id in (select  id from (select C.id ,\n(select  count(*) from results b where idanalysis=<idanalysis> and c.id<>b.id and c.idanalysis =b.idanalysis\nand sqrt(((c.row - b.row) * (c.row - b.row) + (c.col - b.col) * (c.col - b.col)))   between nearest_distances_min and nearest_distances_min * <horizon>) as cnt from results c join\n(SELECT a.id, a.idanalysis, min( nearest_distances_avg(a.id, 1)) AS nearest_distances_min\n   FROM results a where idanalysis=<idanalysis> group by a.id, a.idanalysis) a on a.id=c.id ) a where cnt= <gate>)	delete_solitary_points	\N
44	6	my $sql='delete from aggregations where idanalysis=?';\nmy $sth=$dbh->prepare($sql);\n$sth->execute(($idanalysis));\n	delete_aggregations	\N
65	6	if('<viewing_compo>'){\n\tmy $other_compo= API::getCompoNamed('<viewing_compo>');\n\tmy $imgH=getObjectFromDBHandID($dbh,'images', $idimage);\n\tmy $idtrial= $imgH->{idtrial};\n\tmy $sql='delete from analyses where idcomposition_for_editing=?';\n\tmy $sth=$dbh->prepare($sql);\n\t$sth->execute( $other_compo->{id});\n}	delete_analyses	\N
70	1	Perl	DotDetectedPoints	\N
74	1	\N	Morphology	\N
82	1	Distort	AffineTransform	\N
85	1	\N	Extent	\N
96	1	Morphology	Morphology2	\N
98	1	\N	Border	\N
143	7	N=nrow(d0)\nout=toJSON(c("Anzahl"=N))\n	counting	\N
110	1	Perl	Polygon	\N
111	3	if(length(dim(e))==3) e=e[,,1]\nx=hist(unclass(e), breaks=<breaks>, plot=F)\nx=data.frame(x$breaks, c(0,x$counts))\nnames(x)=c('variable','value')\nx$variable=paste('P',x$variable,sep='_')\nx$variable=gsub('\\\\\\\\.','_',x$variable)\nlibrary(reshape)\nout=toJSON(subset(cast(x,~variable), select=-value))\n	histogram	\N
113	1	\N	Layers	\N
117	1	Perl	MaxIntensityProjection	\N
101	3	e=filter2(e, makeBrush(<brush>, shape='disc', step=FALSE) )\nnmask=thresh(e, w=<brush>*2, h=<brush>*2, offset=<offset>)\nif(<hullbrush>) nmask = fillHull(opening(nmask, makeBrush(<hullbrush>, shape='disc')))\nnmask = bwlabel(nmask)\nwx=(watershed(distmap(nmask), tolerance=<tolerance>, ext=2))\nif(length(dim(wx))==3) wx=wx[,,1]\n\nd0=subset(data.frame( computeFeatures.moment(wx )), select=c(m.cx,m.cy))\nnames(d0)=c("xpoint","ypoint")\n\nout=toJSON(d0)\n	basic_ws_extraction	\N
100	2	/usr/local/bin/convert <infiles> <args> <outfile>; echo <outfile> > "<outfile>_out"	FX	\N
144	1	Convolve	HighPass	\N
145	1	\N	Modulate	\N
149	2	/usr/local/bin/convert  -evaluate-sequence <args> <infiles>  <outfile>; echo <outfile> > "<outfile>_out"	Stacks	\N
154	3		noop	\N
156	1	Perl	CompositeProjection	\N
38	6	use SQL::Abstract;\nuse LWP::Simple;\n\nmy $other_compo= API::getCompoNamed('<new_compo>');\n\nmy $curr_ana=getObjectFromDBHandID($dbh,'analyses', $idanalysis);\n\nmy $sql=qq/select  outer_geom_for_analysis(?) as geom/;\nmy $sth=$dbh->prepare($sql);\n$sth->execute(($idanalysis));\nmy $geom_string= $sth->fetchrow_hashref()->{geom};\n\n\nmy $sql = SQL::Abstract->new;\nmy($stmt, @bind) = $sql->insert('analyses', {idimage=>$idimage, idparent_analysis=> $idanalysis, setup_params=> $geom_string, idcomposition_for_editing=> $other_compo->{id} });\nmy $sth = $dbh->prepare($stmt);\n$sth->execute(@bind);\n\nmy $newidanalysis=$dbh->last_insert_id(undef, undef,'analyses', 'id');\n\nmy $f= LWP::Simple::get("http://localhost/cellfinder_image?idanalysis=$newidanalysis&cmp=$other_compo->{id}&spc=geom");\nmy ( $w,$h )= split /\\s+/o, $f;\n\n\nmy($stmt, @bind) = $sql->update('analyses', {width=>$w, height=>$h}, {id=>$newidanalysis} );\nmy $sth = $dbh->prepare($stmt);\n$sth->execute(@bind);\n\n\nif('<copy_points>' eq 'Yes')\n{\tmy (undef,undef, $offX,$offY)=$geom_string=~/^([0-9]+)x([0-9]+)\\+([0-9]+)\\+([0-9]+)/i;\nwarn "$geom_string: $offX,$offY";\n\t$dbh->{AutoCommit}=0;\n\tmy $sql = 'select row, col from results where idanalysis = ?';\n\tmy $sth = $dbh->prepare($sql);\n\t$sth->execute(($idanalysis));\n\tmy $lines=$sth->fetchall_arrayref();\n\tmy $sql = 'insert into results (idanalysis, row, col) values (?, ?, ?)';\n\tmy $sth = $dbh->prepare($sql);\n\tforeach (@$lines)\n\t{\tmy ($x,$y)=($_->[0],$_->[1]);\n\t\t$sth->execute(($newidanalysis, $x-$offX, $y-$offY));\n\t}\n\t$dbh->{AutoCommit}=1;\n\n}\n	new_for_cropping	\N
50	1	Perl	EnhanceDetectedPoints	\N
72	1	\N	Trim	\N
76	1	\N	AdaptiveThreshold	\N
48	6	use SQL::Abstract;\nuse LWP::Simple;\n\nmy $agg= API::getCompoNamed('<aggregator_name>');\nif($agg){\nmy $aggid= $agg->{id};\n\nmy $f= LWP::Simple::get('http://localhost/cellfinder_image?cmp='.$aggid.'&idanalysis='.$idanalysis);\n\nuse JSON::XS;\n$result=JSON::XS->new->utf8->decode($f);\nforeach my $crow (@$result)\n{\tfor(keys %$crow)\n\t{\tnext if $_ eq 'idanalysis';\n\n\t\tmy $sql = SQL::Abstract->new;\n\t\tmy($stmt, @bind) = $sql->insert('aggregations', {idanalysis => $idanalysis, name=> $_, value => sprintf('%8.1f',$crow->{$_}) });\n\t\tmy $sth = $dbh->prepare($stmt);\n\t\t$sth->execute(@bind);\n\t}\n}\n\n}	run_aggregator	\N
79	4	select id, count_neighbours from\n( select id,\n  (select count(*) from results b where idanalysis=<idanalysis> and c.id<>b.id and c.idanalysis =b.idanalysis\nand sqrt(((c."row" - b."row") * (c."row" - b."row") + (c.col - b.col) * (c.col - b.col)))  < ndmin*1.2 ) as count_neighbours\nfrom results c \n\njoin (select nearest_distances_min(<idpoint>, 1) as ndmin, nearest_distances_avg(<idpoint>, 6) as ndmax ) z on true\n\nwhere id=<idpoint> group by id, idanalysis, count_neighbours   ) a	count_neighbours	\N
95	1	\N	Channel	\N
99	1	Perl	DrawWhiteBorder	\N
109	3	e.1=whiteTopHatGreyScale(e, makeBrush(<brushsize>, shape=c('<brush>')))\ne.bw=thresh(normalize(e.1), w=<brushsize>, h=<brushsize>, offset=<offset>)\ne.lab=bwlabel(e.bw)\nif(length(dim(e.lab))==3) e.lab=e.lab[,,1]\nd0= computeFeatures.shape(e.lab )\nirm = which(d0[,'s.area']< <pixelarea_lower_gate>)\ne.lab.1 = rmObjects(e.lab, irm)\nwriteImage(e.lab.1,"<infile>")\nout=""	tophatextractor	\N
120	2	/usr/local/bin/enblend-openmp   <infiles>  -o <outfile>; echo <outfile> > "<outfile>_out"	EndblendStacks	png
64	6	my $sql='select a.id, b.id, results.row,results.col, b.row, b.col from results join \n(select  distinct id from (select C.id ,\n(select count(*) from results b where idanalysis=? and c.id<>b.id and c.idanalysis =b.idanalysis\nand sqrt(((c.row - b.row) * (c.row - b.row) + (c.col - b.col) * (c.col - b.col)))   between nearest_distances_min and nearest_distances_min * <horizon> ) as cnt from results c join\n(SELECT a.id, a.idanalysis, min( nearest_distances_avg(a.id, 1)) AS nearest_distances_min\n   FROM results a where idanalysis=? group by a.id, a.idanalysis) a on a.id=c.id ) a where cnt<= <neighbours>) a on a.id=results.id join\n\n(select a.id, row,col from results join \n(select distinct  id from (select C.id ,\n(select count(*) from results b where idanalysis=? and c.id<>b.id and c.idanalysis =b.idanalysis\nand sqrt(((c.row - b.row) * (c.row - b.row) + (c.col - b.col) * (c.col - b.col)))   between nearest_distances_min and nearest_distances_min *  <horizon>) as cnt from results c join\n(SELECT a.id, a.idanalysis, min( nearest_distances_avg(a.id, 1)) AS nearest_distances_min\n   FROM results a where idanalysis=? group by a.id, a.idanalysis) a on a.id=c.id ) a where cnt<=<neighbours>) a on a.id=results.id ) b \n   on sqrt(((results.row - b.row) * (results.row - b.row) + (results.col - b.col) * (results.col - b.col)))   between nearest_distances_avg(results.id, 1) and nearest_distances_avg(results.id, 1)* <horizon>';\nmy $sth=$dbh->prepare($sql);\nmy $sql2='delete from results where id=? or id=?';\nmy $sth2=$dbh->prepare($sql2);\nmy $sql3='insert into results (idanalysis, row, col) values (?,?,?)';\nmy $sth3=$dbh->prepare($sql3);\n$sth->execute((<idanalysis>, <idanalysis>, <idanalysis>, <idanalysis>));\nmy $a=$sth->fetchall_arrayref();\nmy %seen;\nfor (@$a)\n{\t$sth2->execute($_->[0],$_->[1]);\n\t$sth3->execute(<idanalysis>, int(($_->[2]+$_->[4])/2) , int(($_->[3]+$_->[5])/2) ) unless exists $seen{$_->[2].' '.$_->[3]};\n\t$seen{$_->[2].' '.$_->[3]}='';\nwarn 'hekko';\n}	coalesce_points	\N
81	4	select <idpoint> as id	show_id	\N
87	4	delete from results where idanalysis=<idanalysis> and ((row not between <minx> and <maxx>) or (col  not between <miny> and <maxy>))	select_rect	\N
92	4	delete from results where idanalysis=<idanalysis> and id not in (select id from results b join (\nselect idanalysis, max(col) as col,(row/<stripewidth>)::integer  as row from results where idanalysis=<idanalysis> group by (row/<stripewidth>)::integer, idanalysis) a \non a.idanalysis=b.idanalysis and  a.col=b.col and (b.row/<stripewidth>)::integer=a.row)	only_the_inferiorest_points	\N
88	4	delete from results where idanalysis=<idanalysis> and id not in (select id from results b join (\nselect idanalysis, min(row) as row,(col/<stripewidth>)::integer  as col from results where idanalysis=<idanalysis> group by (col/<stripewidth>)::integer, idanalysis) a \non a.idanalysis=b.idanalysis and  a.row=b.row and (b.col/<stripewidth>)::integer=a.col)\n	only_the_leftmost_points	\N
46	6	use SQL::Abstract;\nuse LWP::Simple;\nuse Data::Dumper;\n\n\nmy $curr_ana=getObjectFromDBHandID($dbh,'analyses', <idanalysis>);\n\n\n\nif('<new_compo_filter>'){\n\tmy $other_compo= API::getCompoNamed('<new_compo_filter>');\n\t$curr_ana->{idcomposition_for_editing}=$other_compo->{id} if $other_compo;\nwarn Dumper "<new_compo_filter>: ".$other_compo;\n}\nif('<new_compo_analysis>'){\n\tmy $other_compo= API::getCompoNamed('<new_compo_analysis>');\n\t$curr_ana->{idcomposition_for_analysis}=$other_compo->{id} if $other_compo;\n} else\n{\tdelete $curr_ana->{idcomposition_for_analysis};\n}\n\n$curr_ana->{idparent_analysis}=<idanalysis>;\n$curr_ana->{setup_params}=' ' if('<preserve_setup_params>' ne 'Yes');\n\ndelete $curr_ana->{id};\nmy $sql = SQL::Abstract->new;\nmy($stmt, @bind) = $sql->insert('analyses', $curr_ana);\nmy $sth = $dbh->prepare($stmt);\n$sth->execute(@bind);\n\nmy $newidanalysis=$dbh->last_insert_id(undef, undef,'analyses', 'id');\nwarn 'newidanalysis is '.$newidanalysis;\nuse Data::Dumper;\nwarn Dumper $curr_ana;\n\n$dbh->{AutoCommit}=0;\nmy $sqlS = 'select row, col from results where idanalysis = ?';\nmy $sth = $dbh->prepare($sqlS);\n$sth->execute((<idanalysis>));\nmy $lines=$sth->fetchall_arrayref();\nmy $sqlS = 'insert into results (idanalysis, row, col) values (?, ?, ?)';\nmy $sth = $dbh->prepare($sqlS);\nforeach (@$lines)\n{\tmy ($x,$y)=($_->[0],$_->[1]);\n\t$sth->execute(($newidanalysis, $x, $y));\n}\n$dbh->{AutoCommit}=1;\n\nif( $curr_ana->{idcomposition_for_analysis} )\n{\tLWP::Simple::get('http://localhost/cellfinder_image/'.$curr_ana->{idimage}.'?cmp='.$curr_ana->{idcomposition_for_analysis}.'&preload='.$curr_ana->{idcomposition_for_editing}.'&idanalysis='.$newidanalysis);\n\tmy $f= LWP::Simple::get('http://localhost/cellfinder_image/'.$curr_ana->{idimage}.'?cmp='.$curr_ana->{idcomposition_for_editing}.'&spc=geom');\n\tmy ( $w,$h )= split /\\s+/o, $f;\n\tmy($stmt, @bind) = $sql->update('analyses',  {width=>$w, height=>$h }, {id=> $newidanalysis});\n\tmy $sth = $dbh->prepare($stmt);\n\t$sth->execute(@bind);\n}\n\nif('<new_compo_aggregator>'){\n\tmy $agg= API::getCompoNamed('<new_compo_aggregator>');\n\n\tif($agg){\n\t\tmy $aggid= $agg->{id};\n\n\t\tmy $f= LWP::Simple::get('http://localhost/cellfinder_image?cmp='.$aggid.'&idanalysis='.$newidanalysis);\n\n\t\twarn $f;\n\t\tuse JSON::XS;\n\t\t$result=JSON::XS->new->utf8->decode($f);\n\t\tforeach my $crow (@$result)\n\t\t{\tfor(keys %$crow)\n\t\t\t{\tnext if $_ eq 'idanalysis';\n\t\t\t\tmy($stmt, @bind) = $sql->insert('aggregations', {idanalysis => $newidanalysis, name=> $_, value => sprintf('%8.1f',$crow->{$_}) });\n\t\t\t\tmy $sth = $dbh->prepare($stmt);\n\t\t\t\t$sth->execute(@bind);\n\t\t\t}\n\t\t}\n\t}\n}\nif('<fixup>'){\n\tmy $other_compo=API::getCompoNamed('<fixup>');\n\tmy $f= LWP::Simple::get('http://localhost/cellfinder_image/'.$curr_ana->{idimage}.'?cmp='.$other_compo->{id}.'&idanalysis='.$newidanalysis);\n}\n\nif('<chainup>'){\n\tmy $other_compo=API::getCompoNamed('<chainup>');\n\tmy $f= LWP::Simple::get('http://localhost/cellfinder_image/'.$curr_ana->{idimage}.'?cmp='.$other_compo->{id}.'&idanalysis='.$newidanalysis);\n}\n	duplicate_analysis	\N
93	1	\N	AutoGamma	\N
118	2	/usr/local/bin/enfuse-openmp  <args> <infiles> --hard-mask -o <outfile>; echo <outfile> > "<outfile>_out"	EnfuseFocusStacks	\N
121	1	Transparent	Transparent	\N
112	7	library(plyr)\nlibrary(reshape)\nd1=ddply(d0, .(tag), function(slice){\n\tif(nrow(slice)-1 <1) return(0)\n\tresult=0\n\tfor (i in 1:(nrow(slice)-1) ) {\n\t\tx=slice[i,]$row-slice[i+1,]$row\n\t\ty=slice[i,]$col-slice[i+1,]$col\n\t\tresult=result+sqrt(x^2+y^2)\n\t}\n\treturn(result)\n\t\n})\nd1$tag=paste("Tag",d1$tag,sep="_")\nnames(d1)=c("variable","value")\nd1$value=d1$value*<factor>\nd2=cast(d1,~variable) # cast to single row\n\nout=toJSON(subset(d2, select=-value))\n	length_per_tag	\N
119	8	\N	RANSAC	\N
122	1	Set	SwitchAlphaChannel	\N
146	7	library(plyr)\nlibrary(reshape)\nd1=ddply(d0, .(tag), function(slice){\n\tif(nrow(slice)-1 <1) return(0)\n\tresult=0\n\tfor (i in 1:(nrow(slice)-1) ) {\n\t\tx=slice[i,]$row-slice[i+1,]$row\n\t\ty=slice[i,]$col-slice[i+1,]$col\n\t\tresult=result+sqrt(x^2+y^2)\n\t}\n\treturn(result)\n\t\n})\n\nw2w= read.delim("http://augimageserver:3000/ANA/tags_image/<idimage>")[1,4]\nd1$tag=paste("Tag",d1$tag,sep="_")\nnames(d1)=c("variable","value")\nd1$value=d1$value*(w2w/d1[1,]$value)*10\nd2=cast(d1,~variable) # cast to single row\n\nout=toJSON(subset(d2, select=-value))\n	length_per_tag_w2w	\N
153	7	library(RJSONIO)\nexif= fromJSON(URLdecode(paste('http://augimageserver:3000/IMG/',<idimage>,'?exif=1', sep='')))\ntag='exif:DateTime='\n#out=toJSON(c("Tag"=tag, "Wert"= gsub(paste(tag,'(.+)',sep=""),'\\\\1',exif[grep(tag, exif)])))\nwert=gsub(paste(tag,'([0-9]{4}).([0-9]{2}).([0-9]{2}).([0-9]{2}).([0-9]{2}).([0-9]{2})',sep=""),'\\\\1-\\\\2-\\\\3 \\\\4:\\\\5:\\\\6',exif[grep(tag, exif)])\nout=paste('{"DateTime": "' , wert, '"}', sep="")	EXIF:DateTime	\N
127	3	seeds = array(0, dim=c(nrow(e), ncol(e)))\nfor(i in c(1:nrow(d1)))\n{\n    seeds[min(dim(seeds)[1],floor(d1[i,]$row)),min(dim(seeds)[2],floor(d1[i,]$col))]=i\n}\ne2=filter2(e, makeBrush(1, shape='disc', step=FALSE) )\nprop = propagate(e2, seeds, lambda=<lambda>)\nla = matrix(1, nc=3, nr=3)\nla[2,2] = -8\ne1=filter2(prop,la)\ne=((e1>0.1)+e*1)\nwriteImage(e,"<infile>", quality=100)\nout=""	view_borders_watershed	\N
147	3	e.lab=bwlabel(e>0.5)\nif(length(dim(e.lab))==3) e.lab=e.lab[,,1]\nd0= computeFeatures.shape(e.lab )\nirm = which(d0[,'s.area']< mean(d0[,'s.area']) )\ne.lab.1 = rmObjects(e.lab, irm)\nwriteImage(e.lab.1,"<infile>")\nout=""	bw_filter_out_small_objects	\N
132	3	library(deldir)\nlibrary(plyr)\nprocessImage=function(e, tol, blr)\n{\ne=(e^0.3*1000000)\ne= gblur(e, 2)\ne= blackTopHatGreyScale(e, makeBrush(2, shape=c('disc')))\ne.lab=bwlabel(thresh(e, w=<window_size>, h=<window_size>, offset=0.5))\nnmask = rmObjects(e.lab, which(data.frame(computeFeatures.shape(e.lab))$s.area<quantile(data.frame(computeFeatures.shape(e.lab))$s.area, prob=c(0.95))))>0\ne.lab=bwlabel(1-nmask)\nnmask = rmObjects(e.lab, which(data.frame(computeFeatures.shape(e.lab))$s.area<quantile(data.frame(computeFeatures.shape(e.lab))$s.area, prob=c(0.05))))>0\ne= gblur(nmask, blr)\nwx= watershed(e, tolerance=tol, ext=1)\nif(length(dim(wx))==3) wx=wx[,,1]\nd0=subset(data.frame( computeFeatures.moment(wx )), select=c(m.cx,m.cy))\nnames(d0)=c("xpoint","ypoint")\ntry=deldir(d0$xpoint,d0$ypoint,list(ndx=2,ndy=2))\nsum=try$summary\nsum=sum[sum$nbpt==0,]\nd0=subset(sum, select=c(x,y))\nnames(d0)=c("xpoint","ypoint")\nreturn(d0)\n}\nevalueMeasurement=function(d1)\n{\ttry=deldir(d1$xpoint,d1$ypoint,list(ndx=2,ndy=2))\n\tsum=try$summary\n\tsum=sum[sum$nbpt==0,]\n\ta= sum$del.area\n\tM= median(a)\n\tM=100/(M*<gate_factor>^2)\n\treturn (M)\n}\n\nlibrary(deldir)\n\nd0<-processImage(e, 0.2,3)\nif(1){\nrq=evalueMeasurement (d0)\nif(rq>1500) d0<-processImage(e, 0.01,3)\nelse if(rq>1000) d0<-processImage(e, 0.05,3)\nelse if(rq< 900) d0<-processImage(e, 0.4,3)\n}\nout=toJSON(d0)\n	mosaic_centroid_extraction	\N
141	3	library(deldir)\nlibrary(plyr)\nprocessImage=function(e, tol)\n{\ne= normalize(gblur(e, 2))\ne= blackTopHatGreyScale(e, makeBrush(3, shape=c('disc')))\ne=thresh(e, w=<window_size>, h=<window_size>, offset=0.007) \ne= dilateGreyScale(e, makeBrush(7, shape=c('disc')))\ne.lab=bwlabel(e)\nnmask = rmObjects(e.lab, which(data.frame(computeFeatures.shape(e.lab))$s.area<quantile(data.frame(computeFeatures.shape(e.lab))$s.area, prob=c(0.90))))>0\ne= gblur(1-nmask, 4)\nwx= watershed(e, tolerance=tol, ext=2)\nif(length(dim(wx))==3) wx=wx[,,1]\nd0=subset(data.frame( computeFeatures.moment(wx )), select=c(m.cx,m.cy))\nnames(d0)=c("xpoint","ypoint")\ntry=deldir(d0$xpoint,d0$ypoint,list(ndx=2,ndy=2))\nsum=try$summary\n\nsum=sum[sum$nbpt==0,]\n\n\nd0=subset(sum, select=c(x,y))\nnames(d0)=c("xpoint","ypoint")\nreturn(d0)\n}\n\nd0<-processImage(e, 0.15)\n\nout=toJSON(d0)\n	mosaic_centroid_extraction_hhb	\N
151	3	library(deldir)\nlibrary(plyr)\nprocessImageScout=function(e, tol)\n{\n    f = array(1, dim=c(3, 3))\n    f[2, 2] = -1e+9\n    e = filter2(e, f)\n\n    e=thresh(e, w=20, h=20, offset=0.1)\n    f = bwlabel(e)\n    sizes=computeFeatures.shape(f)[,'s.area']\n    thresh=quantile(sizes, probs=c(0.999))\n    f = rmObjects(f, which( sizes < thresh)) \n    e= gblur(1-f, 4)\n    wx= watershed(e, tolerance=tol, ext=1)\n    if(length(dim(wx))==3) wx=wx[,,1]\n    d0=subset(data.frame( computeFeatures.moment(wx )), select=c(m.cx,m.cy))\n    names(d0)=c("xpoint","ypoint")\n    return(d0)\n}\n\n\nd0<-processImageScout(e, 0.1)\n\nout=toJSON(d0)\n	mosaic_centroid_extraction_masa	\N
157	3	library(cluster)\nlibrary(fpc)\n\nread.stackset=function(id){\n \td1=read.delim(paste("http://augimageserver:3000/ANA/stackresults/", id, sep=""))\n        d1$X=d1$row\n        d1$Y=d1$col\n\treturn (d1)\n}\n\nd0= read.stackset(<idstack>)\n\nk=kmeansruns(cbind(d0$row, d0$col),krange=<lower_limit>:<upper_limit>)\nd0=data.frame(k$centers)[k$size><cluster_min_size>,]\nnames(d0)=c("xpoint","ypoint")\nout=toJSON(d0)\n	cluster	\N
158	3	library(cluster)\nlibrary(fpc)\nlibrary(plyr)\n\nread.stackset=function(id){\n \td1=read.delim(paste("http://augimageserver:3000/ANA/stackresults/", id, sep=""))\n        d1$X=d1$row\n        d1$Y=d1$col\n\treturn (d1)\n}\n\nd0= read.stackset(<idstack>)\nd1= ddply(d0,.(idanalysis), nrow)\n\nk=kmeansruns(cbind(d0$row, d0$col),krange= quantile(d1$V1, prob=0.25):max(d1$V1))\nd0=data.frame(k$centers)[k$size><cluster_min_size>,]\nnames(d0)=c("xpoint","ypoint")\nout=toJSON(d0)\n	cluster_auto	\N
152	3	e=e>0.5\n    f = bwlabel(e)\n    d0=subset(data.frame( computeFeatures.moment(f )), select=c(m.cx,m.cy))\n    names(d0)=c("xpoint","ypoint")\n    d0$xpoint=d0$xpoint*<scale>\n    d0$ypoint=d0$ypoint*<scale>\n    out=toJSON(d0)\n	whitedot_extraction	\N
140	3	library(deldir)\nlibrary(plyr)\nprocessImageScout=function(e, tol)\n{\n    f = array(1, dim=c(3, 3))\n    f[2, 2] = -1e+5\n    e = filter2(e, f)\n\n    e=thresh(e, w=9, h=9, offset=0.1)\n    f = bwlabel(e)\n    sizes=computeFeatures.shape(f)[,'s.area']\n    thresh=quantile(sizes, probs=c(0.99))\n    f = rmObjects(f, which( sizes < thresh)) \n    e= gblur(1-f, 4)\n    wx= watershed(e, tolerance=tol, ext=1)\n    if(length(dim(wx))==3) wx=wx[,,1]\n    d0=subset(data.frame( computeFeatures.moment(wx )), select=c(m.cx,m.cy))\n    names(d0)=c("xpoint","ypoint")\n    try=deldir(d0$xpoint,d0$ypoint,list(ndx=2,ndy=2))\n    sum=try$summary\nsum=sum[sum$del.area< quantile( sum$del.area, probs=c(0.90)),]\n    sum=sum[sum$nbpt==0,]\n    d0=subset(sum, select=c(x,y))\n    names(d0)=c("xpoint","ypoint")\n    return(d0)\n}\n\nevalueMeasurement=function(d1)\n{\ttry=deldir(d1$xpoint,d1$ypoint,list(ndx=2,ndy=2))\n\tsum=try$summary\n\tsum=sum[sum$nbpt==0,]\n\ta= sum$del.area\n\tM= median(a)\n\tM=100/(M*0.012^2)\n\treturn (M)\n}\n\nlibrary(deldir)\n\nd0<-processImageScout(e, 0.1)\n\nrq=evalueMeasurement (d0)\nif(rq>1000) \n{  d0<-processImageScout(readImage("http://augimageserver:3000/IMG/<idimage>?cmp=301", type="jpeg"),0.01)\n} else  if(rq<800) \n{  d0<-processImageScout(e,0.2)}\n\nout=toJSON(d0)\n	mosaic_centroid_extraction4	\N
25	4	delete from results where idanalysis=<idanalysis> and id in (SELECT id FROM results a  where a.idanalysis=<idanalysis>  and  nearest_distances_std(a.id, <connectivity>)/nearest_distances_min(a.id, <connectivity>) > <max_cov> or (nearest_distances_min(a.id, <connectivity>) < <min_dist> or  nearest_distances_max(a.id, <connectivity>)>  <max_dist>))	delete_implausible_points	\N
134	3	library(deldir)\nlibrary(plyr)\nprocessImage=function(e, tol)\n{\ne= normalize(gblur(e, 2))\ne= blackTopHatGreyScale(e, makeBrush(3, shape=c('disc')))\ne=thresh(e, w=<window_size>, h=<window_size>, offset=0.005) \ne= dilateGreyScale(e, makeBrush(7, shape=c('disc')))\ne.lab=bwlabel(e)\nnmask = rmObjects(e.lab, which(data.frame(computeFeatures.shape(e.lab))$s.area<quantile(data.frame(computeFeatures.shape(e.lab))$s.area, prob=c(0.90))))>0\ne= gblur(1-nmask, 4)\nwx= watershed(e, tolerance=tol, ext=2)\nif(length(dim(wx))==3) wx=wx[,,1]\nd0=subset(data.frame( computeFeatures.moment(wx )), select=c(m.cx,m.cy))\nnames(d0)=c("xpoint","ypoint")\ntry=deldir(d0$xpoint,d0$ypoint,list(ndx=2,ndy=2))\nsum=try$summary\nsum=sum[sum$nbpt==0,]\nd0=subset(sum, select=c(x,y))\nnames(d0)=c("xpoint","ypoint")\nreturn(d0)\n}\n\nd0<-processImage(e, 0.15)\n\nout=toJSON(d0)\n	mosaic_centroid_extraction_robo	\N
107	7	library(deldir)\ntry = deldir(d0$row,d0$col,list(ndx=2,ndy=2))\n\tsum=try$summary\n\tsum=sum[sum$nbpt==0,]\nN.real=length(sum$del.area)\n\ta= sum$del.area\n\ta= a[a< quantile(a,probs=c(0.95))]\nCD=100/(summary(a)['Median']*(<factor>^2))\nQ1=100/(summary(a)['1st Qu.']*(<factor>^2))\nQ3=100/(summary(a)['3rd Qu.']*(<factor>^2))\nSD=sd(100/(a*(<factor>^2)))\nCOV=SD/CD*100\nN=nrow(d0)\n# N.FF= (N/sum(a))*1e+5\nIQR=(   Q1 -  Q3  )/CD\ntry.1=tile.list(try)\nlibrary(plyr)\nlibrary(reshape)\nt=table(ldply(try.1, function(x) c(neighbours=length(x$x),x$pt[1:2]))$neighbours)/N*100\nm=melt(t)\nm$variable=paste(m$Var.1,'Ecken', sep=' ')\nm=subset(m, select=-Var.1)\nc=cast(m, .~variable)\nout=toJSON(cbind(N,CD,Q1,Q3,SD,COV, N.real, IQR, subset(c, select=-value)))\n\n#if(N.real<5 | (CD-Q3)/CD><CV_Q_Gate>| (Q1-CD)/CD><CV_Q_Gate>) out=toJSON(c("Wert unsicher"=1))\nif(N.real<5) out=toJSON(c("Wert unsicher"=1))\n	celldensity	\N
159	3	library(deldir)\nlibrary(plyr)\nprocessImage=function(e)\n{\ne= normalize(gblur(e, 2))\ne= blackTopHatGreyScale(e, makeBrush(3, shape=c('disc')))\ne=thresh(e, w=<window_size>, h=<window_size>, offset=<offset>) \ne= dilateGreyScale(e, makeBrush(7, shape=c('disc')))\ne.lab=bwlabel(e)\nnmask = rmObjects(e.lab, which(data.frame(computeFeatures.shape(e.lab))$s.area<quantile(data.frame(computeFeatures.shape(e.lab))$s.area, prob=c(0.90))))>0\ne= gblur(1-nmask, <blur>)\nwx= watershed(e, tolerance=<tolerance>, ext=2)\nif(length(dim(wx))==3) wx=wx[,,1]\nd0=subset(data.frame( computeFeatures.moment(wx )), select=c(m.cx,m.cy))\nnames(d0)=c("xpoint","ypoint")\ntry=deldir(d0$xpoint,d0$ypoint,list(ndx=2,ndy=2))\nsum=try$summary\n\nsum=sum[sum$nbpt==0,]\n\n\nd0=subset(sum, select=c(x,y))\nnames(d0)=c("xpoint","ypoint")\nreturn(d0)\n}\n\nd0<-processImage(e)\n\nout=toJSON(d0)\n	mosaic_centroid_extraction_hhb_improved	\N
161	3	e=resize(e, dim(e)[1]/<scale>, dim(e)[2]/<scale>)\ne=1-e\ne=thresh(e, w=<window_size>, h=<window_size>, offset=0.01) \ne.lab=bwlabel(e>0.5)\nif(length(dim(e.lab))==3) e.lab=e.lab[,,1]\nd0= computeFeatures.shape(e.lab )\nirm = which(d0[,'s.area']< 10)\ne = rmObjects(e.lab, irm)\nwriteImage(e,"<infile>", quality=100)\nout=""	view_vessel_features	\N
\.


--
-- Name: patch_repository_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('patch_repository_id_seq', 162, true);


--
-- Data for Name: patches; Type: TABLE DATA; Schema: public; Owner: root
--

COPY patches (id, ordering, idpatch_chain, idpatch) FROM stdin;
176	1	58	12
177	2	58	5
178	3	58	10
179	4	58	32
181	1	59	12
182	1	60	24
183	2	60	5
184	1	61	10
691	\N	169	79
696	9	172	21
708	12	172	74
694	2	172	10
697	13	172	21
701	4	172	10
702	16	172	5
693	\N	171	81
700	3	172	74
706	0	172	50
804	\N	196	82
1031	\N	259	12
\.


--
-- Name: patches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('patches_id_seq', 1986, true);


--
-- Data for Name: results; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY results (id, "row", col, idanalysis, tag) FROM stdin;
\.


--
-- Name: results_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('results_id_seq', 27328546, true);


--
-- Data for Name: rois; Type: TABLE DATA; Schema: public; Owner: root
--

COPY rois (id, geom_string, idimage) FROM stdin;
\.


--
-- Name: rois_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('rois_id_seq', 1, false);


--
-- Data for Name: scan_ins; Type: TABLE DATA; Schema: public; Owner: root
--

COPY scan_ins (id, piz, referrer_ldap, download_permission, scandate) FROM stdin;
\.


--
-- Name: scan_ins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('scan_ins_id_seq', 1, false);


--
-- Data for Name: tag_repository; Type: TABLE DATA; Schema: public; Owner: root
--

COPY tag_repository (id, idtrial, name, type, offset_days) FROM stdin;
\.


--
-- Name: tag_repository_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('tag_repository_id_seq', 51, true);


--
-- Data for Name: taglist_repository; Type: TABLE DATA; Schema: public; Owner: root
--

COPY taglist_repository (id, idtag, ordering, name) FROM stdin;
\.


--
-- Name: taglist_repository_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('taglist_repository_id_seq', 1, false);


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: root
--

COPY tags (id, idimage, idtag, value) FROM stdin;
\.


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('tags_id_seq', 1757, true);


--
-- Data for Name: test_images; Type: TABLE DATA; Schema: public; Owner: root
--

COPY test_images (id, idimage, idpatch_composition, render_size) FROM stdin;
\.


--
-- Name: test_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('test_images_id_seq', 161, true);


--
-- Data for Name: trials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY trials (id, name, valid_ldap_names, image_repository, composition_for_editing, composition_for_celldetection, composition_for_upload, composition_for_overlay, composition_for_fixup, composition_for_javascript, composition_for_aggregation, composition_for_saving, composition_for_hovering, entity_regex, composition_marking_registration_markers, editing_controller, composition_for_ransac, composition_for_clustering) FROM stdin;
1	Test	\N		40	42	\N	41	\N	\N	\N	\N	121	^([LR]A[0-9]+)	124	\N	\N	\N
\.


--
-- Name: trials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('trials_id_seq', 65, true);


--
-- Name: aggregations_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY aggregations
    ADD CONSTRAINT aggregations_pkey PRIMARY KEY (id);


--
-- Name: analyses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY analyses
    ADD CONSTRAINT analyses_pkey PRIMARY KEY (id);


--
-- Name: global_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY global_messages
    ADD CONSTRAINT global_messages_pkey PRIMARY KEY (id);


--
-- Name: images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);


--
-- Name: montage_images_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY montage_images
    ADD CONSTRAINT montage_images_pkey PRIMARY KEY (id);


--
-- Name: montages_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY montages
    ADD CONSTRAINT montages_pkey PRIMARY KEY (id);


--
-- Name: parameter_lists_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY parameter_lists
    ADD CONSTRAINT parameter_lists_pkey PRIMARY KEY (id);


--
-- Name: patch_chains_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY patch_chains
    ADD CONSTRAINT patch_chains_pkey PRIMARY KEY (id);


--
-- Name: patch_compositions_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY patch_compositions
    ADD CONSTRAINT patch_compositions_pkey PRIMARY KEY (id);


--
-- Name: patch_input_values_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY patch_input_values
    ADD CONSTRAINT patch_input_values_pkey PRIMARY KEY (id);


--
-- Name: patch_parameters_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY patch_parameters
    ADD CONSTRAINT patch_parameters_pkey PRIMARY KEY (id);


--
-- Name: patch_repository_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY patch_repository
    ADD CONSTRAINT patch_repository_pkey PRIMARY KEY (id);


--
-- Name: patches_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY patches
    ADD CONSTRAINT patches_pkey PRIMARY KEY (id);


--
-- Name: results_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY results
    ADD CONSTRAINT results_pkey PRIMARY KEY (id);


--
-- Name: rois_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY rois
    ADD CONSTRAINT rois_pkey PRIMARY KEY (id);


--
-- Name: scan_ins_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY scan_ins
    ADD CONSTRAINT scan_ins_pkey PRIMARY KEY (id);


--
-- Name: tag_repository_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY tag_repository
    ADD CONSTRAINT tag_repository_pkey PRIMARY KEY (id);


--
-- Name: taglist_repository_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY taglist_repository
    ADD CONSTRAINT taglist_repository_pkey PRIMARY KEY (id);


--
-- Name: tags_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: test_images_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY test_images
    ADD CONSTRAINT test_images_pkey PRIMARY KEY (id);


--
-- Name: trials_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY trials
    ADD CONSTRAINT trials_name_key UNIQUE (name);


--
-- Name: trials_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY trials
    ADD CONSTRAINT trials_pkey PRIMARY KEY (id);


--
-- Name: glob_msg_type_idx; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX glob_msg_type_idx ON global_messages USING btree (type);


--
-- Name: glob_msg_usr_name_idx; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX glob_msg_usr_name_idx ON global_messages USING btree ("user");


--
-- Name: test; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX test ON results USING btree (idanalysis);


--
-- Name: interactive_params_update_rule; Type: RULE; Schema: public; Owner: root
--

CREATE RULE interactive_params_update_rule AS
    ON UPDATE TO composition_interactive_parameters DO INSTEAD  UPDATE patch_input_values SET value = new.value, disabled = new.disabled
  WHERE (patch_input_values.id = old.idinput);


--
-- Name: aggregations_idanalysis_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY aggregations
    ADD CONSTRAINT aggregations_idanalysis_fkey FOREIGN KEY (idanalysis) REFERENCES analyses(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: analyses_idimage_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY analyses
    ADD CONSTRAINT analyses_idimage_fkey FOREIGN KEY (idimage) REFERENCES images(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: analyses_idstack_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY analyses
    ADD CONSTRAINT analyses_idstack_fkey FOREIGN KEY (idstack) REFERENCES montages(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: global_errors_idtrial_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY global_messages
    ADD CONSTRAINT global_errors_idtrial_fkey FOREIGN KEY (idtrial) REFERENCES trials(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: images_idtrial_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY images
    ADD CONSTRAINT images_idtrial_fkey FOREIGN KEY (idtrial) REFERENCES trials(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: montage_images_idimage_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY montage_images
    ADD CONSTRAINT montage_images_idimage_fkey FOREIGN KEY (idimage) REFERENCES images(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: montage_images_idmontage_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY montage_images
    ADD CONSTRAINT montage_images_idmontage_fkey FOREIGN KEY (idmontage) REFERENCES montages(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: montages_idpatch_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY montages
    ADD CONSTRAINT montages_idpatch_fkey FOREIGN KEY (idpatch) REFERENCES patch_compositions(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: montages_idtrial_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY montages
    ADD CONSTRAINT montages_idtrial_fkey FOREIGN KEY (idtrial) REFERENCES trials(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: parameter_lists_idpatch_parameter_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY parameter_lists
    ADD CONSTRAINT parameter_lists_idpatch_parameter_fkey FOREIGN KEY (idpatch_parameter) REFERENCES patch_parameters(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: patch_chains_idpatch_composition_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY patch_chains
    ADD CONSTRAINT patch_chains_idpatch_composition_fkey FOREIGN KEY (idpatch_composition) REFERENCES patch_compositions(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: patch_compositions_idtrials_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY patch_compositions
    ADD CONSTRAINT patch_compositions_idtrials_fkey FOREIGN KEY (idtrials) REFERENCES trials(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: patch_input_values_idparameter_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY patch_input_values
    ADD CONSTRAINT patch_input_values_idparameter_fkey FOREIGN KEY (idparameter) REFERENCES patch_parameters(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: patch_input_values_idpatch_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY patch_input_values
    ADD CONSTRAINT patch_input_values_idpatch_fkey FOREIGN KEY (idpatch) REFERENCES patches(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: patch_parameters_idpatch_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY patch_parameters
    ADD CONSTRAINT patch_parameters_idpatch_fkey FOREIGN KEY (idpatch) REFERENCES patch_repository(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: patches_idpatch_chain_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY patches
    ADD CONSTRAINT patches_idpatch_chain_fkey FOREIGN KEY (idpatch_chain) REFERENCES patch_chains(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: patches_idpatch_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY patches
    ADD CONSTRAINT patches_idpatch_fkey FOREIGN KEY (idpatch) REFERENCES patch_repository(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: results_idanalysis_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY results
    ADD CONSTRAINT results_idanalysis_fkey FOREIGN KEY (idanalysis) REFERENCES analyses(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: rois_idimage_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY rois
    ADD CONSTRAINT rois_idimage_fkey FOREIGN KEY (idimage) REFERENCES images(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: tag_repository_idtrial_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY tag_repository
    ADD CONSTRAINT tag_repository_idtrial_fkey FOREIGN KEY (idtrial) REFERENCES trials(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: taglist_repository_idtag_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY taglist_repository
    ADD CONSTRAINT taglist_repository_idtag_fkey FOREIGN KEY (idtag) REFERENCES tag_repository(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: tags_idimage_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY tags
    ADD CONSTRAINT tags_idimage_fkey FOREIGN KEY (idimage) REFERENCES images(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: tags_idtag_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY tags
    ADD CONSTRAINT tags_idtag_fkey FOREIGN KEY (idtag) REFERENCES tag_repository(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: test_images_idimage_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY test_images
    ADD CONSTRAINT test_images_idimage_fkey FOREIGN KEY (idimage) REFERENCES images(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: test_images_idpatch_composition_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY test_images
    ADD CONSTRAINT test_images_idpatch_composition_fkey FOREIGN KEY (idpatch_composition) REFERENCES patch_compositions(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: public; Type: ACL; Schema: -; Owner: daboe01
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM daboe01;
GRANT ALL ON SCHEMA public TO daboe01;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

