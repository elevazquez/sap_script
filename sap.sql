--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: archivo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE archivo (
    id integer NOT NULL,
    id_item integer NOT NULL,
    nombre character(30),
    archivo bytea,
    mime character(15)
);


ALTER TABLE public.archivo OWNER TO postgres;

--
-- Name: archivo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE archivo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.archivo_id_seq OWNER TO postgres;

--
-- Name: atributo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE atributo (
    id integer NOT NULL,
    id_tipo_atributo integer NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion character varying(100) NOT NULL
);


ALTER TABLE public.atributo OWNER TO postgres;

--
-- Name: atributo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE atributo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.atributo_id_seq OWNER TO postgres;

--
-- Name: atributo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE atributo_id_seq OWNED BY atributo.id;


--
-- Name: fase; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE fase (
    id integer NOT NULL,
    nro_orden integer NOT NULL,
    estado character(1) DEFAULT 'i'::bpchar NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion character varying(100) NOT NULL,
    fecha_inicio date,
    fecha_fin date,
    id_proyecto integer NOT NULL
);


ALTER TABLE public.fase OWNER TO postgres;

--
-- Name: fase_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE fase_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fase_id_seq OWNER TO postgres;

--
-- Name: fase_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE fase_id_seq OWNED BY fase.id;


--
-- Name: item; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE item (
    id integer NOT NULL,
    id_usuario integer NOT NULL,
    id_fase integer NOT NULL,
    id_tipo_item integer NOT NULL,
    version integer NOT NULL,
    codigo character varying(50) NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion character varying(100) NOT NULL,
    estado character(1) DEFAULT 'i'::bpchar NOT NULL,
    complejidad integer NOT NULL,
    fecha date,
    costo numeric(10,2) NOT NULL,
    archivo bytea,
    mime character varying(15)
);


ALTER TABLE public.item OWNER TO postgres;

--
-- Name: item_atributo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE item_atributo (
    id integer NOT NULL,
    id_item integer NOT NULL,
    id_atributo integer NOT NULL,
    valor character varying(100)
);


ALTER TABLE public.item_atributo OWNER TO postgres;

--
-- Name: item_atributo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE item_atributo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.item_atributo_id_seq OWNER TO postgres;

--
-- Name: item_atributo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE item_atributo_id_seq OWNED BY item_atributo.id;


--
-- Name: item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.item_id_seq OWNER TO postgres;

--
-- Name: item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE item_id_seq OWNED BY item.id;


--
-- Name: lb_item; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE lb_item (
    id integer NOT NULL,
    id_linea_base integer NOT NULL,
    id_item integer NOT NULL
);


ALTER TABLE public.lb_item OWNER TO postgres;

--
-- Name: lb_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE lb_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lb_item_id_seq OWNER TO postgres;

--
-- Name: lb_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE lb_item_id_seq OWNED BY lb_item.id;


--
-- Name: linea_base; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE linea_base (
    id integer NOT NULL,
    estado character(1) DEFAULT 'i'::bpchar NOT NULL,
    descripcion character varying(100) NOT NULL,
    fecha_creacion date NOT NULL,
    fecha_ruptura date
);


ALTER TABLE public.linea_base OWNER TO postgres;

--
-- Name: linea_base_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE linea_base_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.linea_base_id_seq OWNER TO postgres;

--
-- Name: linea_base_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE linea_base_id_seq OWNED BY linea_base.id;


--
-- Name: miembros_comite; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE miembros_comite (
    id integer NOT NULL,
    id_proyecto integer NOT NULL,
    id_usuario integer NOT NULL
);


ALTER TABLE public.miembros_comite OWNER TO postgres;

--
-- Name: miembros_comite_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE miembros_comite_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.miembros_comite_id_seq OWNER TO postgres;

--
-- Name: miembros_comite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE miembros_comite_id_seq OWNED BY miembros_comite.id;


--
-- Name: permiso; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE permiso (
    id integer NOT NULL,
    codigo character varying(50) NOT NULL,
    descripcion character varying(100) NOT NULL,
    id_recurso integer NOT NULL
);


ALTER TABLE public.permiso OWNER TO postgres;

--
-- Name: permiso_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE permiso_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permiso_id_seq OWNER TO postgres;

--
-- Name: permiso_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE permiso_id_seq OWNED BY permiso.id;


--
-- Name: proyecto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE proyecto (
    id integer NOT NULL,
    id_usuario_lider integer NOT NULL,
    estado character(1) DEFAULT 'i'::bpchar NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion character varying(100) NOT NULL,
    cant_miembros integer DEFAULT 0 NOT NULL,
    fecha_inicio date,
    fecha_fin date,
    fecha_ultima_mod date
);


ALTER TABLE public.proyecto OWNER TO postgres;

--
-- Name: proyecto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE proyecto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.proyecto_id_seq OWNER TO postgres;

--
-- Name: proyecto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE proyecto_id_seq OWNED BY proyecto.id;


--
-- Name: recurso; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE recurso (
    nombre character varying(100) NOT NULL,
    id integer NOT NULL,
    id_fase integer,
    id_proyecto integer
);


ALTER TABLE public.recurso OWNER TO postgres;

--
-- Name: recurso_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE recurso_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recurso_id_seq OWNER TO postgres;

--
-- Name: recurso_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE recurso_id_seq OWNED BY recurso.id;


--
-- Name: relacion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE relacion (
    id integer NOT NULL,
    id_tipo_relacion integer NOT NULL,
    id_item integer NOT NULL,
    id_item_duenho integer NOT NULL,
    fecha_creacion date,
    fecha_modificacion date,
    estado character(1) DEFAULT 'A'::bpchar NOT NULL
);


ALTER TABLE public.relacion OWNER TO postgres;

--
-- Name: relacion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE relacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.relacion_id_seq OWNER TO postgres;

--
-- Name: relacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE relacion_id_seq OWNED BY relacion.id;


--
-- Name: resolucion_miembros; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE resolucion_miembros (
    id integer NOT NULL,
    id_solicitud_cambio integer NOT NULL,
    id_usuario integer NOT NULL,
    voto boolean NOT NULL
);


ALTER TABLE public.resolucion_miembros OWNER TO postgres;

--
-- Name: resolucion_miembros_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE resolucion_miembros_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resolucion_miembros_id_seq OWNER TO postgres;

--
-- Name: resolucion_miembros_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE resolucion_miembros_id_seq OWNED BY resolucion_miembros.id;


--
-- Name: rol; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE rol (
    id integer NOT NULL,
    codigo character varying(50) NOT NULL,
    descripcion character varying(100) NOT NULL
);


ALTER TABLE public.rol OWNER TO postgres;

--
-- Name: rol_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE rol_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rol_id_seq OWNER TO postgres;

--
-- Name: rol_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE rol_id_seq OWNED BY rol.id;


--
-- Name: rol_permiso; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE rol_permiso (
    id integer NOT NULL,
    id_rol integer NOT NULL,
    id_permiso integer NOT NULL
);


ALTER TABLE public.rol_permiso OWNER TO postgres;

--
-- Name: rol_permiso_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE rol_permiso_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rol_permiso_id_seq OWNER TO postgres;

--
-- Name: rol_permiso_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE rol_permiso_id_seq OWNED BY rol_permiso.id;


--
-- Name: solicitud_cambio; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE solicitud_cambio (
    id integer NOT NULL,
    id_usuario integer NOT NULL,
    id_proyecto integer NOT NULL,
    fecha date NOT NULL,
    estado character(1) NOT NULL,
    descripcion character varying NOT NULL,
    cant_votos integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.solicitud_cambio OWNER TO postgres;

--
-- Name: solicitud_cambio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE solicitud_cambio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solicitud_cambio_id_seq OWNER TO postgres;

--
-- Name: solicitud_cambio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE solicitud_cambio_id_seq OWNED BY solicitud_cambio.id;


--
-- Name: solicitud_item; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE solicitud_item (
    id integer NOT NULL,
    id_solicitud integer NOT NULL,
    id_item integer NOT NULL
);


ALTER TABLE public.solicitud_item OWNER TO postgres;

--
-- Name: solicitud_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE solicitud_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solicitud_item_id_seq OWNER TO postgres;

--
-- Name: solicitud_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE solicitud_item_id_seq OWNED BY solicitud_item.id;


--
-- Name: tipo_atributo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipo_atributo (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion character varying(100) NOT NULL
);


ALTER TABLE public.tipo_atributo OWNER TO postgres;

--
-- Name: tipo_atributo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipo_atributo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_atributo_id_seq OWNER TO postgres;

--
-- Name: tipo_atributo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipo_atributo_id_seq OWNED BY tipo_atributo.id;


--
-- Name: tipo_item; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipo_item (
    id integer NOT NULL,
    id_fase integer NOT NULL,
    codigo character varying(50) NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion character varying(100) NOT NULL
);


ALTER TABLE public.tipo_item OWNER TO postgres;

--
-- Name: tipo_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipo_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_item_id_seq OWNER TO postgres;

--
-- Name: tipo_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipo_item_id_seq OWNED BY tipo_item.id;


--
-- Name: tipo_relacion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipo_relacion (
    id integer NOT NULL,
    codigo character varying(50) NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion character varying(100) NOT NULL
);


ALTER TABLE public.tipo_relacion OWNER TO postgres;

--
-- Name: tipo_relacion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipo_relacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_relacion_id_seq OWNER TO postgres;

--
-- Name: tipo_relacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipo_relacion_id_seq OWNED BY tipo_relacion.id;


--
-- Name: titem_atributo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE titem_atributo (
    id integer NOT NULL,
    id_tipo_item integer NOT NULL,
    id_atributo integer NOT NULL
);


ALTER TABLE public.titem_atributo OWNER TO postgres;

--
-- Name: titem_atributo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE titem_atributo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.titem_atributo_id_seq OWNER TO postgres;

--
-- Name: titem_atributo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE titem_atributo_id_seq OWNED BY titem_atributo.id;


--
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE usuario (
    id integer NOT NULL,
    usuario character varying(50) NOT NULL,
    nombre character varying(100) NOT NULL,
    apellido character varying(100) NOT NULL,
    password character varying(100) NOT NULL,
    correo character varying(100) NOT NULL,
    domicilio character varying(150) NOT NULL,
    telefono character varying(50) NOT NULL,
    fecha_nac date NOT NULL
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_id_seq OWNER TO postgres;

--
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE usuario_id_seq OWNED BY usuario.id;


--
-- Name: usuario_rol; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE usuario_rol (
    id integer NOT NULL,
    id_rol integer NOT NULL,
    id_usuario integer NOT NULL,
    id_proyecto integer
);


ALTER TABLE public.usuario_rol OWNER TO postgres;

--
-- Name: usuario_rol_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE usuario_rol_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_rol_id_seq OWNER TO postgres;

--
-- Name: usuario_rol_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE usuario_rol_id_seq OWNED BY usuario_rol.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY atributo ALTER COLUMN id SET DEFAULT nextval('atributo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fase ALTER COLUMN id SET DEFAULT nextval('fase_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY item ALTER COLUMN id SET DEFAULT nextval('item_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY item_atributo ALTER COLUMN id SET DEFAULT nextval('item_atributo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lb_item ALTER COLUMN id SET DEFAULT nextval('lb_item_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY linea_base ALTER COLUMN id SET DEFAULT nextval('linea_base_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY miembros_comite ALTER COLUMN id SET DEFAULT nextval('miembros_comite_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permiso ALTER COLUMN id SET DEFAULT nextval('permiso_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proyecto ALTER COLUMN id SET DEFAULT nextval('proyecto_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY recurso ALTER COLUMN id SET DEFAULT nextval('recurso_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY relacion ALTER COLUMN id SET DEFAULT nextval('relacion_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY resolucion_miembros ALTER COLUMN id SET DEFAULT nextval('resolucion_miembros_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rol ALTER COLUMN id SET DEFAULT nextval('rol_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rol_permiso ALTER COLUMN id SET DEFAULT nextval('rol_permiso_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY solicitud_cambio ALTER COLUMN id SET DEFAULT nextval('solicitud_cambio_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY solicitud_item ALTER COLUMN id SET DEFAULT nextval('solicitud_item_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo_atributo ALTER COLUMN id SET DEFAULT nextval('tipo_atributo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo_item ALTER COLUMN id SET DEFAULT nextval('tipo_item_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo_relacion ALTER COLUMN id SET DEFAULT nextval('tipo_relacion_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY titem_atributo ALTER COLUMN id SET DEFAULT nextval('titem_atributo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario ALTER COLUMN id SET DEFAULT nextval('usuario_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario_rol ALTER COLUMN id SET DEFAULT nextval('usuario_rol_id_seq'::regclass);


--
-- Data for Name: archivo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY archivo (id, id_item, nombre, archivo, mime) FROM stdin;
2	235	links.txt                     	\\x	text/plain     
3	240	links.txt                     	\\x	text/plain     
4	241	links.txt                     	\\x	text/plain     
9	247	links.txt                     	\\x	text/plain     
\.


--
-- Name: archivo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('archivo_id_seq', 9, true);


--
-- Data for Name: atributo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY atributo (id, id_tipo_atributo, nombre, descripcion) FROM stdin;
1	1	Observacion	Observaciones a considerar
2	1	Responsable	responsabilidad
3	1	Tarea Realizada	Tarea hecha
4	1	Tiempo Dedicado	Tiempo
\.


--
-- Name: atributo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('atributo_id_seq', 4, true);


--
-- Data for Name: fase; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY fase (id, nro_orden, estado, nombre, descripcion, fecha_inicio, fecha_fin, id_proyecto) FROM stdin;
3	3	P	Desarrollo	Desarrollo	2013-06-15	2013-06-22	1
4	4	P	Implantacion	Implementacion	2013-06-22	2013-07-22	1
1	1	L	Analisis	Analisis de Requerimientos	2013-02-02	2013-04-05	1
2	2	L	Diseño	Diseño de partes	2013-04-05	2013-04-25	1
7	3	P	Ejecucion	Ejecicion	2013-06-01	2013-07-01	2
5	1	A	Estudio	Estudio- reconocimiento del problema	2013-05-02	2013-05-22	2
6	2	A	Creacion	Creacion	2013-05-22	2013-06-22	2
8	1	P	fase 1	fase uno	2013-05-02	2013-07-06	23
9	2	P	fase 2	fase 2	2013-05-02	2013-07-06	23
\.


--
-- Name: fase_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('fase_id_seq', 9, true);


--
-- Data for Name: item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY item (id, id_usuario, id_fase, id_tipo_item, version, codigo, nombre, descripcion, estado, complejidad, fecha, costo, archivo, mime) FROM stdin;
1	4	1	2	1	IT-1	Entrevistas	Entrevista a cajeros	I	2	2013-06-18	650000.00	\N	\N
2	4	1	2	2	IT-1	Entrevistas	Entrevista a cajeros	P	2	2013-06-18	650000.00	\N	\N
3	4	1	2	3	IT-1	Entrevistas	Entrevista a cajeros	V	2	2013-06-18	650000.00	\N	\N
4	4	1	2	4	IT-1	Entrevistas	Entrevista a cajeros	E	2	2013-06-18	650000.00	\N	\N
5	4	1	2	5	IT-1	Entrevistas	Entrevista a cajeros	V	2	2013-06-18	650000.00	\N	\N
6	4	1	2	1	IT-2	Visitas 	Visitas Programadas	I	1	2013-06-18	200000.00	\N	\N
7	4	1	1	1	IT-3	Funcionales	Requerimientos Funcionales	I	2	2013-06-18	2600000.00	\N	\N
8	4	1	1	1	IT-4	No Funcionales	Requerimiento No Funcional	I	2	2013-06-18	2000000.00	\N	\N
9	4	1	2	1	IT-5	Formularios	Formularios Completos	I	1	2013-06-18	30000.00	\N	\N
10	4	1	2	1	IT-6	Informes	Informes a partir de Formularios	I	2	2013-06-18	125000.00	\N	\N
11	4	2	3	1	IT-7	Boceto	Boceto del modelo	I	3	2013-06-18	1560000.00	\N	\N
12	4	2	3	1	IT-8	Boceto Parcial	Boceto Parcial	I	2	2013-06-18	125000.00	\N	\N
13	4	2	4	1	IT-9	Diag. Componente	Diagramas de Componentes	I	2	2013-06-18	126000.00	\N	\N
14	4	2	4	1	IT-10	Diag. Clases	Diagramas De clases	I	2	2013-06-18	135000.00	\N	\N
15	4	2	4	1	IT-11	Diag. de Objetos	Diagramas De Objetos	I	1	2013-06-18	14500.00	\N	\N
16	4	2	4	1	IT-12	Diag. Estados	Diagramas de estados	I	2	2013-06-18	15600.00	\N	\N
17	4	2	4	1	IT-13	Dig. Secuencia	Diagrama de secuencia	I	3	2013-06-18	1480000.00	\N	\N
18	4	1	2	2	IT-2	Visitas 	Visitas Programadas	R	1	2013-06-18	200000.00	\N	\N
19	4	1	2	6	IT-1	Entrevistas	Entrevista a cajeros	V	2	2013-06-18	650000.00	\N	\N
20	4	1	2	7	IT-1	Entrevistas	Entrevista a cajeros	R	2	2013-06-18	650000.00	\N	\N
21	4	1	1	2	IT-3	Funcionales	Requerimientos Funcionales	R	2	2013-06-18	2600000.00	\N	\N
22	4	1	1	2	IT-4	No Funcionales	Requerimiento No Funcional	R	2	2013-06-18	2000000.00	\N	\N
23	4	1	2	2	IT-5	Formularios	Formularios Completos	R	1	2013-06-18	30000.00	\N	\N
24	4	1	2	2	IT-6	Informes	Informes a partir de Formularios	V	2	2013-06-18	125000.00	\N	\N
25	4	1	2	3	IT-6	Informes	Informes a partir de Formularios	R	2	2013-06-18	125000.00	\N	\N
26	6	1	2	3	IT-2	Visitas 	Visitas Programadas	A	1	2013-06-18	200000.00	\N	\N
27	6	1	2	8	IT-1	Entrevistas	Entrevista a cajeros	V	2	2013-06-18	650000.00	\N	\N
28	6	1	2	9	IT-1	Entrevistas	Entrevista a cajeros	A	2	2013-06-18	650000.00	\N	\N
29	6	1	1	3	IT-3	Funcionales	Requerimientos Funcionales	Z	2	2013-06-18	2600000.00	\N	\N
30	6	1	1	3	IT-4	No Funcionales	Requerimiento No Funcional	A	2	2013-06-18	2000000.00	\N	\N
31	6	1	2	3	IT-5	Formularios	Formularios Completos	A	1	2013-06-18	30000.00	\N	\N
32	6	1	2	4	IT-6	Informes	Informes a partir de Formularios	V	2	2013-06-18	125000.00	\N	\N
33	6	1	2	5	IT-6	Informes	Informes a partir de Formularios	A	2	2013-06-18	125000.00	\N	\N
34	6	1	1	4	IT-3	Funcionales	Requerimientos Funcionales	R	2	2013-06-18	2600000.00	\N	\N
35	6	1	1	5	IT-3	Funcionales	Requerimientos Funcionales	A	2	2013-06-18	2600000.00	\N	\N
36	6	1	2	1	IT-14	Informes de Prueba	Pruebas	I	1	2013-06-18	1256000.00	\N	\N
37	6	1	2	2	IT-14	Informes de Prueba	Pruebas	P	1	2013-06-18	1256000.00	\N	\N
38	6	1	2	3	IT-14	Informes de Prueba	Pruebas	R	1	2013-06-18	1256000.00	\N	\N
39	6	1	2	4	IT-14	Informes de Prueba	Pruebas	Z	1	2013-06-18	1256000.00	\N	\N
40	6	1	2	5	IT-14	Informes de Prueba	Pruebas	R	1	2013-06-18	1256000.00	\N	\N
41	6	1	2	6	IT-14	Informes de Prueba	Pruebas	E	1	2013-06-18	1256000.00	\N	\N
42	6	2	3	2	IT-7	Boceto	Boceto del modelo	P	3	2013-06-18	1560000.00	\N	\N
43	6	2	3	2	IT-8	Boceto Parcial	Boceto Parcial	V	2	2013-06-18	125000.00	\N	\N
44	6	2	3	3	IT-8	Boceto Parcial	Boceto Parcial	P	2	2013-06-18	125000.00	\N	\N
45	6	2	4	2	IT-9	Diag. Componente	Diagramas de Componentes	P	2	2013-06-18	126000.00	\N	\N
46	6	2	4	2	IT-10	Diag. Clases	Diagramas De clases	V	2	2013-06-18	135000.00	\N	\N
47	6	2	4	3	IT-10	Diag. Clases	Diagramas De clases	P	2	2013-06-18	135000.00	\N	\N
48	6	2	4	2	IT-11	Diag. de Objetos	Diagramas De Objetos	P	1	2013-06-18	14500.00	\N	\N
49	6	2	4	2	IT-12	Diag. Estados	Diagramas de estados	P	2	2013-06-18	15600.00	\N	\N
50	6	2	4	2	IT-13	Dig. Secuencia	Diagrama de secuencia	P	3	2013-06-18	1480000.00	\N	\N
159	4	3	6	2	IT-24	Rep.Ventas	informe de ventas	I	2	2013-06-21	235000.00	\N	\N
57	6	2	3	3	IT-7	Boceto	Boceto del modelo	R	3	2013-06-18	1560000.00	\N	\N
62	6	1	2	5	IT-2	Visitas 	Visitas Programadas	A	1	2013-06-18	200000.00	\N	\N
161	4	1	2	7	IT-2	Visitas 	Visitas Programadas	R	1	2013-06-21	200000.00	\N	\N
163	4	1	2	16	IT-1	Entrevistas	Entrevista a cajeros	B	2	2013-06-21	652000.00	\N	\N
164	4	1	2	9	IT-2	Visitas 	Visitas Programadas	B	1	2013-06-21	200000.00	\N	\N
54	6	1	1	4	IT-4	No Funcionales	Requerimiento No Funcional	Z	2	2013-06-18	2000000.00	\N	\N
53	6	1	1	6	IT-3	Funcionales	Requerimientos Funcionales	Z	2	2013-06-18	2600000.00	\N	\N
55	6	1	2	4	IT-5	Formularios	Formularios Completos	Z	1	2013-06-18	30000.00	\N	\N
56	6	1	2	6	IT-6	Informes	Informes a partir de Formularios	Z	2	2013-06-18	125000.00	\N	\N
58	6	2	3	4	IT-8	Boceto Parcial	Boceto Parcial	R	2	2013-06-18	125000.00	\N	\N
61	6	2	3	4	IT-7	Boceto	Boceto del modelo	A	3	2013-06-18	1560000.00	\N	\N
60	6	1	2	11	IT-1	Entrevistas	Entrevista a cajeros	R	2	2013-06-18	650000.00	\N	\N
52	6	1	2	4	IT-2	Visitas 	Visitas Programadas	Z	1	2013-06-18	200000.00	\N	\N
59	6	2	3	5	IT-8	Boceto Parcial	Boceto Parcial	A	2	2013-06-18	125000.00	\N	\N
63	6	1	2	12	IT-1	Entrevistas	Entrevista a cajeros	A	2	2013-06-18	650000.00	\N	\N
72	6	1	2	15	IT-1	Entrevistas	Entrevista a cajeros	A	2	2013-06-18	652000.00	\N	\N
65	6	1	2	14	IT-1	Entrevistas	Entrevista a cajeros	Z	2	2013-06-18	652000.00	\N	\N
64	6	1	2	13	IT-1	Entrevistas	Entrevista a cajeros	R	2	2013-06-18	650000.00	\N	\N
73	6	1	2	6	IT-2	Visitas 	Visitas Programadas	Z	1	2013-06-18	200000.00	\N	\N
160	4	1	2	7	IT-14	Informes de Prueba	Pruebas	V	1	2013-06-21	1256000.00	\N	\N
75	4	3	5	1	IT-15	ABM-Persona	administrar persona	I	2	2013-06-19	4500000.00	\N	\N
76	4	3	5	1	IT-16	ABM-Usuario	administracion de usuario	I	2	2013-06-19	260000.00	\N	\N
77	4	3	5	1	IT-17	ABM-PROVEEDORES	ADM. DE PROVEEDORES	I	2	2013-06-19	1250000.00	\N	\N
78	4	3	5	1	IT-18	ABM-VENDEDORES	ADM. VENDEDORES	I	2	2013-06-19	1260000.00	\N	\N
79	4	3	5	1	IT-19	Ventas	Ventas	I	3	2013-06-19	8600000.00	\N	\N
80	4	3	5	1	IT-20	STOCK	STOCK	I	3	2013-06-19	5900000.00	\N	\N
81	4	3	5	1	IT-21	COMPRAS	COMPRAS	I	3	2013-06-19	8962000.00	\N	\N
82	4	3	6	1	IT-22	Rep. Compras	informe de compras	I	2	2013-06-19	1250000.00	\N	\N
83	4	3	6	1	IT-24	Rep.Ventas	informe de ventas	I	2	2013-06-19	235000.00	\N	\N
84	4	3	5	2	IT-15	ABM-Persona	administrar persona	P	2	2013-06-19	4500000.00	\N	\N
162	4	1	2	8	IT-2	Visitas 	Visitas Programadas	A	1	2013-06-21	200000.00	\N	\N
181	4	1	2	17	IT-1	Entrevistas	Entrevista a cajeros	A	2	2013-06-21	652000.00	\N	\N
182	4	1	2	10	IT-2	Visitas 	Visitas Programadas	V	1	2013-06-21	200000.00	\N	\N
183	4	2	3	5	IT-7	Boceto	Boceto del modelo	V	3	2013-06-21	1560000.00	\N	\N
184	4	1	2	11	IT-2	Visitas 	Visitas Programadas	R	1	2013-06-21	200000.00	\N	\N
185	4	1	2	12	IT-2	Visitas 	Visitas Programadas	A	1	2013-06-21	200000.00	\N	\N
186	4	1	2	18	IT-1	Entrevistas	Entrevista a cajeros	B	2	2013-06-21	652000.00	\N	\N
187	4	1	2	13	IT-2	Visitas 	Visitas Programadas	B	1	2013-06-21	200000.00	\N	\N
188	4	1	2	19	IT-1	Entrevistas	Entrevista a cajeros	A	2	2013-06-21	652000.00	\N	\N
51	6	1	2	10	IT-1	Entrevistas	Entrevista a cajeros	Z	2	2013-06-18	650000.00	\N	\N
189	4	2	3	6	IT-7	Boceto	Boceto del modelo	V	3	2013-06-21	1560000.00	\N	\N
190	4	1	2	14	IT-2	Visitas 	Visitas Programadas	V	1	2013-06-21	200000.00	\N	\N
191	4	1	2	15	IT-2	Visitas 	Visitas Programadas	R	1	2013-06-21	210000.00	\N	\N
192	4	1	2	16	IT-2	Visitas 	Visitas Programadas	A	1	2013-06-21	210000.00	\N	\N
193	4	1	2	20	IT-1	Entrevistas	Entrevista a cajeros	B	2	2013-06-21	652000.00	\N	\N
194	4	1	2	17	IT-2	Visitas 	Visitas Programadas	B	1	2013-06-21	210000.00	\N	\N
195	4	1	2	21	IT-1	Entrevistas	Entrevista a cajeros	A	2	2013-06-21	652000.00	\N	\N
196	4	2	3	7	IT-7	Boceto	Boceto del modelo	V	3	2013-06-21	1560000.00	\N	\N
197	4	1	2	18	IT-2	Visitas 	Visitas Programadas	V	1	2013-06-21	210000.00	\N	\N
198	4	1	2	19	IT-2	Visitas 	Visitas Programadas	R	1	2013-06-21	210000.00	\N	\N
199	4	1	2	20	IT-2	Visitas 	Visitas Programadas	A	1	2013-06-21	210000.00	\N	\N
200	4	1	2	22	IT-1	Entrevistas	Entrevista a cajeros	B	2	2013-06-21	652000.00	\N	\N
201	4	1	2	21	IT-2	Visitas 	Visitas Programadas	B	1	2013-06-21	210000.00	\N	\N
202	4	1	2	23	IT-1	Entrevistas	Entrevista a cajeros	A	2	2013-06-21	652000.00	\N	\N
203	4	2	3	8	IT-7	Boceto	Boceto del modelo	V	3	2013-06-21	1560000.00	\N	\N
204	4	1	2	22	IT-2	Visitas 	Visitas Programadas	V	1	2013-06-21	210000.00	\N	\N
205	4	1	2	23	IT-2	Visitas 	Visitas Programadas	R	1	2013-06-21	210000.00	\N	\N
206	4	1	2	24	IT-2	Visitas 	Visitas Programadas	A	1	2013-06-21	210000.00	\N	\N
207	4	1	2	24	IT-1	Entrevistas	Entrevista a cajeros	B	2	2013-06-21	652000.00	\N	\N
208	4	1	2	25	IT-2	Visitas 	Visitas Programadas	B	1	2013-06-21	210000.00	\N	\N
209	4	1	2	25	IT-1	Entrevistas	Entrevista a cajeros	A	2	2013-06-21	652000.00	\N	\N
210	4	2	3	9	IT-7	Boceto	Boceto del modelo	V	3	2013-06-21	1560000.00	\N	\N
211	4	1	2	26	IT-2	Visitas 	Visitas Programadas	V	1	2013-06-21	210000.00	\N	\N
212	4	1	2	27	IT-2	Visitas 	Visitas Programadas	R	1	2013-06-21	210000.00	\N	\N
213	4	1	2	28	IT-2	Visitas 	Visitas Programadas	A	1	2013-06-21	210000.00	\N	\N
214	4	1	2	26	IT-1	Entrevistas	Entrevista a cajeros	B	2	2013-06-21	652000.00	\N	\N
215	4	1	2	29	IT-2	Visitas 	Visitas Programadas	B	1	2013-06-21	210000.00	\N	\N
216	4	1	2	27	IT-1	Entrevistas	Entrevista a cajeros	A	2	2013-06-21	652000.00	\N	\N
217	4	2	3	10	IT-7	Boceto	Boceto del modelo	V	3	2013-06-21	1560000.00	\N	\N
218	4	1	2	30	IT-2	Visitas 	Visitas Programadas	V	1	2013-06-21	210000.00	\N	\N
219	4	1	2	31	IT-2	Visitas 	Visitas Programadas	R	1	2013-06-21	210000.00	\N	\N
220	4	1	2	32	IT-2	Visitas 	Visitas Programadas	A	1	2013-06-21	210000.00	\N	\N
221	4	1	2	28	IT-1	Entrevistas	Entrevista a cajeros	B	2	2013-06-21	652000.00	\N	\N
222	4	1	2	33	IT-2	Visitas 	Visitas Programadas	B	1	2013-06-21	210000.00	\N	\N
223	4	1	2	29	IT-1	Entrevistas	Entrevista a cajeros	A	2	2013-06-21	652000.00	\N	\N
224	4	2	3	11	IT-7	Boceto	Boceto del modelo	V	3	2013-06-21	1560000.00	\N	\N
225	4	1	2	34	IT-2	Visitas 	Visitas Programadas	V	1	2013-06-21	210000.00	\N	\N
226	4	1	2	35	IT-2	Visitas 	Visitas Programadas	R	1	2013-06-21	210000.00	\N	\N
227	4	1	2	36	IT-2	Visitas 	Visitas Programadas	A	1	2013-06-21	210000.00	\N	\N
235	4	4	7	1	IT-23	Servidor	SErvidor	I	1	2013-06-21	1235000.00	\N	\N
240	4	4	7	1	IT-25	BASE DE DATOS	BD	I	2	2013-06-21	5454000.00	\N	\N
241	4	4	7	1	IT-26	PRUBA	PUEN	I	2	2013-06-21	152.00	\N	\N
247	4	4	7	1	IT-28	OH	HIOH	I	2	2013-06-21	12.00	\N	\N
248	4	1	2	8	IT-14	Informes de Prueba	Pruebas	E	1	2013-06-22	1256000.00	\N	\N
249	4	1	2	30	IT-1	Entrevistas	Entrevista a cajeros	B	2	2013-06-22	652000.00	\N	\N
250	4	1	2	37	IT-2	Visitas 	Visitas Programadas	B	1	2013-06-22	210000.00	\N	\N
251	4	1	1	5	IT-4	No Funcionales	Requerimiento No Funcional	R	2	2013-06-22	2000000.00	\N	\N
252	4	1	1	6	IT-4	No Funcionales	Requerimiento No Funcional	A	2	2013-06-22	2000000.00	\N	\N
253	4	1	1	7	IT-3	Funcionales	Requerimientos Funcionales	R	2	2013-06-22	2600000.00	\N	\N
254	4	1	1	8	IT-3	Funcionales	Requerimientos Funcionales	A	2	2013-06-22	2600000.00	\N	\N
255	4	1	1	9	IT-3	Funcionales	Requerimientos Funcionales	B	2	2013-06-22	2600000.00	\N	\N
256	4	1	1	7	IT-4	No Funcionales	Requerimiento No Funcional	B	2	2013-06-22	2000000.00	\N	\N
257	4	1	2	7	IT-6	Informes	Informes a partir de Formularios	R	2	2013-06-22	125000.00	\N	\N
258	4	1	2	5	IT-5	Formularios	Formularios Completos	R	1	2013-06-22	30000.00	\N	\N
259	4	1	2	8	IT-6	Informes	Informes a partir de Formularios	V	2	2013-06-22	125000.00	\N	\N
260	4	1	2	9	IT-6	Informes	Informes a partir de Formularios	R	2	2013-06-22	125000.00	\N	\N
261	4	1	2	6	IT-5	Formularios	Formularios Completos	A	1	2013-06-22	30000.00	\N	\N
262	4	1	2	10	IT-6	Informes	Informes a partir de Formularios	V	2	2013-06-22	125000.00	\N	\N
263	4	1	2	7	IT-5	Formularios	Formularios Completos	R	1	2013-06-22	30000.00	\N	\N
264	4	1	2	11	IT-6	Informes	Informes a partir de Formularios	V	2	2013-06-22	125000.00	\N	\N
265	4	1	2	8	IT-5	Formularios	Formularios Completos	A	1	2013-06-22	30000.00	\N	\N
266	4	1	2	12	IT-6	Informes	Informes a partir de Formularios	V	2	2013-06-22	125000.00	\N	\N
267	4	1	2	13	IT-6	Informes	Informes a partir de Formularios	R	2	2013-06-22	125000.00	\N	\N
268	4	1	2	14	IT-6	Informes	Informes a partir de Formularios	A	2	2013-06-22	125000.00	\N	\N
269	4	1	2	9	IT-5	Formularios	Formularios Completos	B	1	2013-06-22	30000.00	\N	\N
270	4	1	2	15	IT-6	Informes	Informes a partir de Formularios	B	2	2013-06-22	125000.00	\N	\N
271	4	2	4	4	IT-10	Diag. Clases	Diagramas De clases	R	2	2013-06-22	135000.00	\N	\N
272	4	2	4	3	IT-9	Diag. Componente	Diagramas de Componentes	R	2	2013-06-22	126000.00	\N	\N
273	4	2	4	3	IT-11	Diag. de Objetos	Diagramas De Objetos	R	1	2013-06-22	14500.00	\N	\N
274	4	2	4	3	IT-12	Diag. Estados	Diagramas de estados	V	2	2013-06-22	15600.00	\N	\N
275	4	2	4	4	IT-11	Diag. de Objetos	Diagramas De Objetos	A	1	2013-06-22	14500.00	\N	\N
276	4	2	4	4	IT-12	Diag. Estados	Diagramas de estados	V	2	2013-06-22	15600.00	\N	\N
277	4	2	4	5	IT-12	Diag. Estados	Diagramas de estados	R	2	2013-06-22	15600.00	\N	\N
278	4	2	4	6	IT-12	Diag. Estados	Diagramas de estados	A	2	2013-06-22	15600.00	\N	\N
279	4	2	4	4	IT-9	Diag. Componente	Diagramas de Componentes	A	2	2013-06-22	126000.00	\N	\N
280	4	2	4	5	IT-10	Diag. Clases	Diagramas De clases	A	2	2013-06-22	135000.00	\N	\N
281	4	2	4	5	IT-9	Diag. Componente	Diagramas de Componentes	A	2	2013-06-22	126000.00	\N	\N
282	4	2	4	6	IT-10	Diag. Clases	Diagramas De clases	B	2	2013-06-22	135000.00	\N	\N
283	4	2	4	5	IT-11	Diag. de Objetos	Diagramas De Objetos	B	1	2013-06-22	14500.00	\N	\N
284	4	4	7	2	IT-28	OH	HIOH	E	2	2013-06-22	12.00	\N	\N
285	4	4	7	2	IT-26	PRUBA	PUEN	E	2	2013-06-22	152.00	\N	\N
287	5	5	10	1	ITS-1	Entrevistas	Entrevista a cajeros	I	2	2013-06-22	45.00	\N	\N
289	5	5	10	1	ITS-2	ERS	Especificaciones	I	3	2013-06-22	156.00	\N	\N
290	5	5	10	1	ITS-3	Reportes	Reportes	I	2	2013-06-22	46.00	\N	\N
291	5	5	10	2	ITS-1	Entrevistas	Entrevista a cajeros	P	2	2013-06-22	45.00	\N	\N
292	5	5	10	2	ITS-3	Reportes	Reportes	P	2	2013-06-22	46.00	\N	\N
293	5	5	10	2	ITS-2	ERS	Especificaciones	P	3	2013-06-22	156.00	\N	\N
294	5	5	10	3	ITS-1	Entrevistas	Entrevista a cajeros	R	2	2013-06-22	45.00	\N	\N
295	5	5	10	4	ITS-1	Entrevistas	Entrevista a cajeros	A	2	2013-06-22	45.00	\N	\N
296	5	5	10	3	ITS-2	ERS	Especificaciones	R	3	2013-06-22	156.00	\N	\N
297	5	5	10	4	ITS-2	ERS	Especificaciones	A	3	2013-06-22	156.00	\N	\N
298	5	5	10	3	ITS-3	Reportes	Reportes	R	2	2013-06-22	46.00	\N	\N
299	5	5	10	4	ITS-3	Reportes	Reportes	A	2	2013-06-22	46.00	\N	\N
300	5	6	11	1	ITS-4	Modulos	Modulos de Desarrollo	I	2	2013-06-22	68.00	\N	\N
301	5	6	11	1	ITS-5	Estrategias	Estrategias	I	3	2013-06-22	860.00	\N	\N
302	5	6	11	1	ITS-6	Reportes	Reportes	I	2	2013-06-22	125.00	\N	\N
303	5	6	11	2	ITS-6	Reportes	Reportes	P	2	2013-06-22	125.00	\N	\N
304	5	6	11	2	ITS-5	Estrategias	Estrategias	P	3	2013-06-22	860.00	\N	\N
305	5	6	11	2	ITS-4	Modulos	Modulos de Desarrollo	P	2	2013-06-22	68.00	\N	\N
306	5	6	11	3	ITS-4	Modulos	Modulos de Desarrollo	R	2	2013-06-22	68.00	\N	\N
307	5	6	11	3	ITS-5	Estrategias	Estrategias	R	3	2013-06-22	860.00	\N	\N
308	5	6	11	3	ITS-6	Reportes	Reportes	R	2	2013-06-22	125.00	\N	\N
309	5	5	10	5	ITS-1	Entrevistas	Entrevista a cajeros	B	2	2013-06-22	45.00	\N	\N
310	5	5	10	5	ITS-2	ERS	Especificaciones	B	3	2013-06-22	156.00	\N	\N
311	5	5	10	5	ITS-3	Reportes	Reportes	B	2	2013-06-22	46.00	\N	\N
312	5	5	10	1	ITS-7	prueba	prueba	I	1	2013-06-22	45.00	\N	\N
313	5	5	10	2	ITS-7	prueba	prueba	E	1	2013-06-22	45.00	\N	\N
315	5	7	12	1	ITS-8	Circuito	Circuito	I	2	2013-06-22	12.00	\N	\N
316	5	6	11	4	ITS-4	Modulos	Modulos de Desarrollo	A	2	2013-06-22	68.00	\N	\N
317	5	7	12	2	ITS-8	Circuito	Circuito	V	2	2013-06-22	12.00	\N	\N
318	5	6	11	4	ITS-5	Estrategias	Estrategias	A	3	2013-06-22	860.00	\N	\N
319	5	6	11	4	ITS-6	Reportes	Reportes	V	2	2013-06-22	125.00	\N	\N
320	5	6	11	5	ITS-6	Reportes	Reportes	R	2	2013-06-22	125.00	\N	\N
321	5	6	11	6	ITS-6	Reportes	Reportes	A	2	2013-06-22	125.00	\N	\N
322	5	7	12	3	ITS-8	Circuito	Circuito	R	2	2013-06-22	12.00	\N	\N
323	5	7	12	4	ITS-8	Circuito	Circuito	A	2	2013-06-22	12.00	\N	\N
324	5	7	12	1	ITS-9	Informes de Prueba	informe 	I	2	2013-06-22	23.00	\N	\N
325	5	7	12	2	ITS-9	Informes de Prueba	informe 	P	2	2013-06-22	23.00	\N	\N
326	5	7	12	3	ITS-9	Informes de Prueba	informe 	R	2	2013-06-22	23.00	\N	\N
327	5	7	12	4	ITS-9	Informes de Prueba	informe 	A	2	2013-06-22	23.00	\N	\N
328	5	6	11	5	ITS-4	Modulos	Modulos de Desarrollo	B	2	2013-06-22	68.00	\N	\N
329	5	6	11	5	ITS-5	Estrategias	Estrategias	B	3	2013-06-22	860.00	\N	\N
330	5	6	11	7	ITS-6	Reportes	Reportes	R	2	2013-06-22	125.00	\N	\N
331	5	6	11	8	ITS-6	Reportes	Reportes	A	2	2013-06-22	125.00	\N	\N
332	5	6	11	9	ITS-6	Reportes	Reportes	P	2	2013-06-22	125.00	\N	\N
333	5	6	11	10	ITS-6	Reportes	Reportes	E	2	2013-06-22	125.00	\N	\N
334	12	8	13	1	IT-1 TEST	ITEM1	ITEM 1	I	1	2013-06-23	23.00	\\x687474703a2f2f7665727473747564696f732e636f6d2f626c6f672f6e65772d666c61736b2d736974652f0d0a687474703a2f2f7065657765652e72656164746865646f63732e6f72672f656e2f322e302e322f7065657765652f6578616d706c652e68746d6c0d0a687474703a2f2f6e65742e74757473706c75732e636f6d2f7475746f7269616c732f707974686f6e2d7475746f7269616c732f616e2d696e74726f64756374696f6e2d746f2d707974686f6e732d666c61736b2d6672616d65776f726b2f0d0a687474703a2f2f6e65742e74757473706c75732e636f6d2f7475746f7269616c732f707974686f6e2d7475746f7269616c732f616e2d696e74726f64756374696f6e2d746f2d707974686f6e732d666c61736b2d6672616d65776f726b2f0d0a68747470733a2f2f666c61736b2e72656164746865646f63732e6f72672f656e2f302e312f7475746f7269616c2f0d0a0d0a0d0a687474703a2f2f7777772e63617073756e6c6f636b2e6e65742f323031312f30352f636f64696e672d776974682d666c61736b2d616e642d73716c616c6368656d792e68746d6c0d0a687474703a2f2f7777772e6d61726d616b6f6964652e6f72672f646f776e6c6f61642f7465616368696e672f6173642f6173642d666c61736b2d7475746f7269616c2e7064660d0a687474703a2f2f7777772e6a61766132732e636f6d2f5475746f7269616c2f507974686f6e2f303434305f5f4347492d5765622f4c6f67696e666f726d2e68746d0d0a687474703a2f2f707974686f6e2e6d616a6962752e6f72672f70726567756e7461732f3538312f63726561722d756e2d6c6f67696e	text/plain
335	12	8	13	1	IT-2 TEST	ITEM 2	ITEM 2	I	3	2013-06-23	156.00	\\x687474703a2f2f7665727473747564696f732e636f6d2f626c6f672f6e65772d666c61736b2d736974652f0d0a687474703a2f2f7065657765652e72656164746865646f63732e6f72672f656e2f322e302e322f7065657765652f6578616d706c652e68746d6c0d0a687474703a2f2f6e65742e74757473706c75732e636f6d2f7475746f7269616c732f707974686f6e2d7475746f7269616c732f616e2d696e74726f64756374696f6e2d746f2d707974686f6e732d666c61736b2d6672616d65776f726b2f0d0a687474703a2f2f6e65742e74757473706c75732e636f6d2f7475746f7269616c732f707974686f6e2d7475746f7269616c732f616e2d696e74726f64756374696f6e2d746f2d707974686f6e732d666c61736b2d6672616d65776f726b2f0d0a68747470733a2f2f666c61736b2e72656164746865646f63732e6f72672f656e2f302e312f7475746f7269616c2f0d0a0d0a0d0a687474703a2f2f7777772e63617073756e6c6f636b2e6e65742f323031312f30352f636f64696e672d776974682d666c61736b2d616e642d73716c616c6368656d792e68746d6c0d0a687474703a2f2f7777772e6d61726d616b6f6964652e6f72672f646f776e6c6f61642f7465616368696e672f6173642f6173642d666c61736b2d7475746f7269616c2e7064660d0a687474703a2f2f7777772e6a61766132732e636f6d2f5475746f7269616c2f507974686f6e2f303434305f5f4347492d5765622f4c6f67696e666f726d2e68746d0d0a687474703a2f2f707974686f6e2e6d616a6962752e6f72672f70726567756e7461732f3538312f63726561722d756e2d6c6f67696e	text/plain
336	12	9	14	1	IT- 3 TEST	ITEM 3	ITEM 3	I	1	2013-06-23	13.00	\\x687474703a2f2f7665727473747564696f732e636f6d2f626c6f672f6e65772d666c61736b2d736974652f0d0a687474703a2f2f7065657765652e72656164746865646f63732e6f72672f656e2f322e302e322f7065657765652f6578616d706c652e68746d6c0d0a687474703a2f2f6e65742e74757473706c75732e636f6d2f7475746f7269616c732f707974686f6e2d7475746f7269616c732f616e2d696e74726f64756374696f6e2d746f2d707974686f6e732d666c61736b2d6672616d65776f726b2f0d0a687474703a2f2f6e65742e74757473706c75732e636f6d2f7475746f7269616c732f707974686f6e2d7475746f7269616c732f616e2d696e74726f64756374696f6e2d746f2d707974686f6e732d666c61736b2d6672616d65776f726b2f0d0a68747470733a2f2f666c61736b2e72656164746865646f63732e6f72672f656e2f302e312f7475746f7269616c2f0d0a0d0a0d0a687474703a2f2f7777772e63617073756e6c6f636b2e6e65742f323031312f30352f636f64696e672d776974682d666c61736b2d616e642d73716c616c6368656d792e68746d6c0d0a687474703a2f2f7777772e6d61726d616b6f6964652e6f72672f646f776e6c6f61642f7465616368696e672f6173642f6173642d666c61736b2d7475746f7269616c2e7064660d0a687474703a2f2f7777772e6a61766132732e636f6d2f5475746f7269616c2f507974686f6e2f303434305f5f4347492d5765622f4c6f67696e666f726d2e68746d0d0a687474703a2f2f707974686f6e2e6d616a6962752e6f72672f70726567756e7461732f3538312f63726561722d756e2d6c6f67696e	text/plain
337	13	9	14	1	IT 4 TEST	ITEM 4	ITEM 4	I	1	2013-06-23	45.00	\N	\N
\.


--
-- Data for Name: item_atributo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY item_atributo (id, id_item, id_atributo, valor) FROM stdin;
1	1	2	 Miguel
2	2	2	Miguel González
3	3	2	 Miguel
4	4	2	 Miguel
5	5	2	 Miguel
6	6	2	Micaela
7	7	1	minimo 10
8	8	1	minimo 20
9	9	2	Adam
10	10	2	Tomas
11	11	1	ver anterior
12	12	1	mirar el fuente
13	13	1	ninguna
14	14	1	ver framework
15	15	1	mirar clases
16	16	1	mirar IT-9
17	17	1	mirar fuente
18	18	2	Micaela
19	19	2	 Miguel
20	20	2	Miguel
21	21	1	minimo
22	22	1	minimo
23	23	2	Adam
24	24	2	Tomas
25	25	2	Tomas
26	26	2	Micaela
27	27	2	Miguel
28	28	2	Miguel
29	29	1	minimo
30	30	1	minimo
31	31	2	Adam
32	32	2	Tomas
33	33	2	Tomas
34	34	1	minimo
35	35	1	minimo
36	36	2	Arami
37	37	2	Arami
38	38	2	Arami
39	39	2	Arami
40	40	2	Arami
41	41	2	Arami
42	42	1	ver
43	43	1	mirar el fuente
44	44	1	mirar
45	45	1	ninguna
46	46	1	ver framework
47	47	1	ver
48	48	1	mirar
49	49	1	mirar
50	50	1	mirar
51	51	2	Miguel
52	52	2	Micaela
53	53	1	minimo
54	54	1	minimo
55	55	2	Adam
56	56	2	Tomas
57	57	1	ver
58	58	1	mirar
59	59	1	mirar
60	60	2	Miguel
61	61	1	ver
62	62	2	Micaela
63	63	2	Miguel
64	64	2	Miguel
65	65	2	Miguel
66	72	2	Miguel
67	73	2	Micaela
68	75	1	ver si es juridica o no
69	75	2	Ramón
70	76	1	ninguna
71	76	2	Oscar
72	77	1	ninguna
73	77	2	Belén
74	78	1	calle o no
75	78	2	 Pamela
76	79	1	mirar stock
77	79	2	Guille
78	80	1	aviso acabado
79	80	2	 Miguel
80	81	1	ver Stock
81	81	2	Guille
82	82	1	ninguna
83	82	4	\N
84	83	1	ninguna
85	83	4	\N
86	84	1	ver
87	84	2	Ramón
165	159	1	ninguna
166	159	4	\N
167	160	2	Arami
168	161	2	Micaela
169	162	2	Micaela
170	163	2	Miguel
171	164	2	Micaela
187	181	2	Miguel
188	182	2	Micaela
189	183	1	ver
190	184	2	Micaela
191	185	2	Micaela
192	186	2	Miguel
193	187	2	Micaela
194	188	2	Miguel
195	189	1	ver
196	190	2	Micaela
197	191	2	Luis
198	192	2	Luis
199	193	2	Miguel
200	194	2	Luis
201	195	2	Miguel
202	196	1	ver
203	197	2	Luis
204	198	2	Luis
205	199	2	Luis
206	200	2	Miguel
207	201	2	Luis
208	202	2	Miguel
209	203	1	ver
210	204	2	Luis
211	205	2	Luis
212	206	2	Luis
213	207	2	Miguel
214	208	2	Luis
215	209	2	Miguel
216	210	1	ver
217	211	2	Luis
218	212	2	Enrique
219	213	2	Enrique
220	214	2	Miguel
221	215	2	Enrique
222	216	2	Miguel
223	217	1	ver
224	218	2	Enrique
225	219	2	Enrique
226	220	2	Enrique
227	221	2	Miguel
228	222	2	Enrique
229	223	2	Miguel
230	224	1	ver
231	225	2	Enrique
232	226	2	Enrique
233	227	2	Enrique
235	235	1	mirar
236	240	1	MIGRAR
237	241	1	JOLP
242	247	1	LPLP
243	248	2	Arami
244	249	2	Miguel
245	250	2	Enrique
246	251	1	minimo
247	252	1	minimo
248	253	1	minimo
249	254	1	minimo
250	255	1	minimo
251	256	1	minimo
252	257	2	Tomas
253	258	2	Adam
254	259	2	Tomas
255	260	2	Tomas
256	261	2	Adam
257	262	2	Tomas
258	263	2	Adam
259	264	2	Tomas
260	265	2	Adam
261	266	2	Tomas
262	267	2	Tomas
263	268	2	Tomas
264	269	2	Adam
265	270	2	Tomas
266	271	1	ver
267	272	1	ninguna
268	273	1	mirar
269	274	1	mirar
270	275	1	mirar
271	276	1	mirar
272	277	1	mirar
273	278	1	mirar
274	279	1	ninguna
275	280	1	ver
276	281	1	ver framework
277	282	1	ver
278	283	1	mirar
279	284	1	LPLP
280	285	1	JOLP
281	290	1	ninguno
282	291	1	\N
283	292	1	ninguno
284	293	1	\N
285	294	1	None
286	295	1	None
287	296	1	None
288	297	1	None
289	298	1	ninguno
290	299	1	ninguno
291	300	2	Pamela
292	301	2	Karim
293	302	2	Liz
294	303	2	Liz
295	304	2	Karim
296	305	2	Pamela
297	306	2	Pamela
298	307	2	Karim
299	308	2	Liz
300	309	1	None
301	310	1	None
302	311	1	ninguno
303	312	1	prueb
304	313	1	prueb
305	315	1	ver
306	316	2	Pamela
307	317	1	ver
308	318	2	Karim
309	319	2	Liz
310	320	2	Liz
311	321	2	Liz
312	322	1	ver
313	323	1	ver
314	324	1	ninguna
315	325	1	ninguna
316	326	1	ninguna
317	327	1	ninguna
318	328	2	Pamela
319	329	2	Karim
320	330	2	Liz
321	331	2	Liz
322	332	2	Liz
323	333	2	Liz
324	334	1	FIJATE
325	335	1	OJ
326	336	2	NINGUNA
327	337	2	NINGUNA
\.


--
-- Name: item_atributo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('item_atributo_id_seq', 327, true);


--
-- Name: item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('item_id_seq', 337, true);


--
-- Data for Name: lb_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY lb_item (id, id_linea_base, id_item) FROM stdin;
72	7	249
73	7	250
74	8	255
75	8	256
76	9	269
77	9	270
78	10	282
79	10	283
80	11	309
81	11	310
82	11	311
83	12	328
84	12	329
\.


--
-- Name: lb_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('lb_item_id_seq', 84, true);


--
-- Data for Name: linea_base; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY linea_base (id, estado, descripcion, fecha_creacion, fecha_ruptura) FROM stdin;
7	V	LB Analisis 1	2013-06-21	2013-06-21
8	V	LB Analisis 2	2013-06-22	\N
9	V	LB Analisis 3	2013-06-22	\N
10	V	LB Diseño 1	2013-06-22	\N
11	V	LB Fase 1	2013-06-22	\N
12	V	LB Fase 2	2013-06-22	\N
\.


--
-- Name: linea_base_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('linea_base_id_seq', 12, true);


--
-- Data for Name: miembros_comite; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY miembros_comite (id, id_proyecto, id_usuario) FROM stdin;
1	1	7
2	2	8
3	1	4
4	1	6
5	2	5
6	2	6
7	23	12
\.


--
-- Name: miembros_comite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('miembros_comite_id_seq', 7, true);


--
-- Data for Name: permiso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY permiso (id, codigo, descripcion, id_recurso) FROM stdin;
1	CONSULTAR PROYECTO	CONSULTAR PROYECTO	1
2	CONSULTAR PROYECTO	CONSULTAR PROYECTO	2
3	ELIMINAR ITEM	ELIMINAR ITEM F1- Rios	3
4	APROBAR ITEM	APROBACION ITEM F1- RIOS	3
7	MODIFICACION ITEM	MODIFICACION ITEM F1-RIOS	3
8	INSERTAR ITEM	INSERTAR ITEM F1- RIOS	3
9	CREAR LINEA BASE	CREAR LINEA BASE F1-RIOS	3
10	LIBERAR LINEA BASE	LIBERAR LINEA BASE F1- RIOS	3
11	VER LINEA BASE	VER LINEA BASE F1- RIOS	3
12	COMPONER LINEA BASE	COMPONER LINEA BASE F1-RIOS	3
13	AGREGAR ITEM LINEA BASE	AGREGAR ITEM LINEA BASE F1-RIOS	3
14	BUSCAR LINEA BASE	BUSCAR LINEA BASE F1-RIOS	3
15	QUITAR ITEM LINEA BASE	QUITAR ITEM LINEA BASE F1-RIOS	3
16	ADMINISTRAR LINEA BASE	ADMINISTRAR LINEA BASE F1-RIOS	3
17	INSERTAR ITEM	INSERTAR ITEM F2-RIOS	4
18	ELIMINAR ITEM	ELIMINAR ITEM F2- Rios	4
19	APROBAR ITEM	APROBACION ITEM F2- RIOS	4
20	MODIFICACION ITEM	MODIFICACION ITEM F2-RIOS	4
21	CREAR LINEA BASE	CREAR LINEA BASE F2-RIOS	4
22	LIBERAR LINEA BASE	LIBERAR LINEA BASE F2- RIOS	4
23	VER LINEA BASE	VER LINEA BASE F2- RIOS	4
24	COMPONER LINEA BASE	COMPONER LINEA BASE F2-RIOS	4
25	AGREGAR ITEM LINEA BASE	AGREGAR ITEM LINEA BASE F2-RIOS	4
26	BUSCAR LINEA BASE	BUSCAR LINEA BASE F2-RIOS	4
27	QUITAR ITEM LINEA BASE	QUITAR ITEM LINEA BASE F2-RIOS	4
28	APROBAR ITEM	APROBACION ITEM F3- RIOS	5
29	INSERTAR ITEM	INSERTAR ITEM F3- RIOS	5
30	MODIFICACION ITEM	MODIFICACION ITEM F3-RIOS	5
31	ELIMINAR ITEM	ELIMINAR ITEM F3- Rios	5
32	CREAR LINEA BASE	CREAR LINEA BASE F3-RIOS	5
33	LIBERAR LINEA BASE	LIBERAR LINEA BASE F3- RIOS	5
34	COMPONER LINEA BASE	COMPONER LINEA BASE F3-RIOS	5
35	AGREGAR ITEM LINEA BASE	AGREGAR ITEM LINEA BASE F3-RIOS	5
36	BUSCAR LINEA BASE	BUSCAR LINEA BASE F3-RIOS	5
37	INSERTAR ITEM	INSERTAR ITEM F4- RIOS	6
38	MODIFICACION ITEM	MODIFICACION ITEM F4-RIOS	6
39	ELIMINAR ITEM	ELIMINAR ITEM F4- Rios	6
40	APROBAR ITEM	APROBACION ITEM F4- RIOS	6
41	CREAR LINEA BASE	CREAR LINEA BASE F4-RIOS	6
42	LIBERAR LINEA BASE	LIBERAR LINEA BASE F4- RIOS	6
43	COMPONER LINEA BASE	COMPONER LINEA BASE F4-RIOS	6
44	AGREGAR ITEM LINEA BASE	AGREGAR ITEM LINEA BASE F4-RIOS	6
45	QUITAR ITEM LINEA BASE	QUITAR ITEM LINEA BASE F4-RIOS	6
46	BUSCAR LINEA BASE	BUSCAR LINEA BASE F4-RIOS	6
47	INSERTAR ITEM	INSERTAR ITEM F1- SICAP	9
48	ELIMINAR ITEM	ELIMINAR ITEM F1-SICAP	8
49	MODIFICACION ITEM	MODIFICACION ITEM F1-SICAP	8
50	APROBAR ITEM	APROBACION ITEM F1-SICAP	8
51	INSERTAR ITEM	INSERTAR ITEM F1- SICAP	8
52	INSERTAR ITEM	INSERTAR ITEM F2- SICAP	7
53	ELIMINAR ITEM	ELIMINAR ITEM F2-SICAP	7
54	MODIFICACION ITEM	MODIFICACION ITEM F2-SICAP	7
55	APROBAR ITEM	APROBACION ITEM F2-SICAP	7
56	CREAR LINEA BASE	CREAR LINEA BASE F1-sicap	8
57	LIBERAR LINEA BASE	LIBERAR LINEA BASE F1-sicap	8
58	BUSCAR LINEA BASE	BUSCAR LINEA BASE F1-sicap	8
59	AGREGAR ITEM LINEA BASE	AGREGAR ITEM LINEA BASE F1-sicap	8
60	QUITAR ITEM LINEA BASE	QUITAR ITEM LINEA BASE F1-SICAP	8
62	VER LINEA BASE	VER LINEA BASE F1-SICAP	8
63	COMPONER LINEA BASE	COMPONER LINEA BASE F1-SICAP	8
64	AGREGAR ITEM LINEA BASE	AGREGAR ITEM LINEA BASE F2-sicap	7
65	QUITAR ITEM LINEA BASE	QUITAR ITEM LINEA BASE F2-SICAP	7
66	VER LINEA BASE	VER LINEA BASE F2-SICAP	7
67	BUSCAR LINEA BASE	BUSCAR LINEA BASE F2-sicap	7
68	CREAR LINEA BASE	CREAR LINEA BASE F2-sicap	7
69	LIBERAR LINEA BASE	LIBERAR LINEA BASE F2-sicap	7
70	COMPONER LINEA BASE	COMPONER LINEA BASE F2-SICAP	7
71	ELIMINAR ITEM	ELIMINAR ITEM F3-SICAP	9
72	MODIFICACION ITEM	MODIFICACION ITEM F3-SICAP	9
73	APROBAR ITEM	APROBACION ITEM F3-SICAP	9
74	CREAR LINEA BASE	CREAR LINEA BASE F3-sicap	9
75	VER LINEA BASE	VER LINEA BASE F3-SICAP	9
76	COMPONER LINEA BASE	COMPONER LINEA BASE F3-SICAP	9
77	LIBERAR LINEA BASE	LIBERAR LINEA BASE F3-sicap	9
78	AGREGAR ITEM LINEA BASE	AGREGAR ITEM LINEA BASE F3-sicap	9
79	QUITAR ITEM LINEA BASE	QUITAR ITEM LINEA BASE F3-SICAP	9
80	ARCHIVO ITEM	ARCHIVO ITEM F1 RIOS	3
81	ARCHIVO ITEM	ARCHIVO ITEM F2 RIOS	4
82	ARCHIVO ITEM	ARCHIVO ITEM F3 RIOS	5
83	ARCHIVO ITEM	ARCHIVO ITEM F4 RIOS	6
84	CONSULTAR PROYECTO	CONSULTAR PROYECTO	10
85	APROBAR ITEM	APROBACION ITEM  F-1 TEST	11
86	INSERTAR ITEM	INSERTAR ITEM F1 TEST	11
87	MODIFICACION ITEM	MODIFICAR ITEM F1 TEST	11
88	ELIMINAR ITEM	ELIMINAR ITEM F1 TEST	11
89	AGREGAR ITEM LINEA BASE	AGREGAR ITEM LINEA BASE F1 TEST	11
90	LIBERAR LINEA BASE	LIBERAR LINEA BASE F1 TEST	11
91	COMPONER LINEA BASE	COMPONER LINEA BASE F1 TEST	11
93	QUITAR ITEM LINEA BASE	QUITAR ITEM LINEA BASE F1 TEST	11
94	VER LINEA BASE	VER LINEA BASE F1 TEST	11
95	ADMINISTRAR LINEA BASE	ADMINISTRAR LB F1 TEST	11
96	CREAR LINEA BASE	CREAR LINEA BASE F1 TEST	11
97	INSERTAR ITEM	INSERTAR ITEM F2 TEST	12
98	MODIFICACION ITEM	MODIFICAR ITEM F2 TEST	12
99	ELIMINAR ITEM	ELIMINAR ITEM F2 TEST	12
100	APROBAR ITEM	APROBACION ITEM F2 TEST	12
101	CREAR LINEA BASE	CREAR LINEA BASE F2 TEST	12
102	LIBERAR LINEA BASE	LIBERAR LINEA BASE F2 TEST	12
103	COMPONER LINEA BASE	COMPONER LINEA BASE F2 TEST	12
104	AGREGAR ITEM LINEA BASE	AGREGAR ITEM LINEA BASE F2 TEST	12
105	QUITAR ITEM LINEA BASE	QUITAR ITEM LINEA BASE F2 TEST	12
107	ARCHIVO ITEM	ARCHIVO ITEM F1 TEST	11
108	ARCHIVO ITEM	ARCHIVO ITEM F2 TEST	12
\.


--
-- Name: permiso_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('permiso_id_seq', 108, true);


--
-- Data for Name: proyecto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY proyecto (id, id_usuario_lider, estado, nombre, descripcion, cant_miembros, fecha_inicio, fecha_fin, fecha_ultima_mod) FROM stdin;
1	7	P	RiosWeb	Rios Java Web	3	2013-02-01	2013-06-22	2013-06-17
2	8	P	Sicap	Sicap	3	2013-03-05	2013-06-22	2013-06-17
23	12	N	proyectotest	proyecto para test	3	2013-05-02	2013-07-06	2013-06-23
\.


--
-- Name: proyecto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('proyecto_id_seq', 23, true);


--
-- Data for Name: recurso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY recurso (nombre, id, id_fase, id_proyecto) FROM stdin;
RiosWeb	1	\N	1
Sicap	2	\N	2
Analisis- RiosW	3	1	\N
Diseño RiosW	4	2	\N
Desarrollo RiosW	5	3	\N
Implementacion RiosW	6	4	\N
Estudio Sicap	7	5	\N
Creacion Sicap	8	6	\N
Ejecucion Sicap	9	7	\N
proyectotest	10	\N	23
fase1 test	11	8	\N
fase2 test	12	9	\N
proyecto test	13	\N	23
\.


--
-- Name: recurso_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('recurso_id_seq', 13, true);


--
-- Data for Name: relacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY relacion (id, id_tipo_relacion, id_item, id_item_duenho, fecha_creacion, fecha_modificacion, estado) FROM stdin;
138	2	72	73	2013-06-21	\N	E
140	2	72	161	2013-06-21	2013-06-21	E
141	2	72	162	2013-06-21	2013-06-21	E
139	3	72	61	2013-06-21	\N	E
142	2	163	162	2013-06-21	2013-06-21	E
172	3	200	196	2013-06-21	2013-06-21	E
174	2	200	201	2013-06-21	2013-06-21	E
176	2	202	204	2013-06-21	\N	E
177	2	202	205	2013-06-21	2013-06-21	E
175	3	202	203	2013-06-21	2013-06-21	E
178	2	202	206	2013-06-21	2013-06-21	E
180	2	207	206	2013-06-21	2013-06-21	E
179	3	207	203	2013-06-21	2013-06-21	E
181	2	207	208	2013-06-21	2013-06-21	E
184	2	207	211	2013-06-21	2013-06-21	E
183	2	209	211	2013-06-21	2013-06-21	E
185	2	209	212	2013-06-21	2013-06-21	E
182	3	209	210	2013-06-21	2013-06-21	E
186	2	209	213	2013-06-21	2013-06-21	E
144	2	163	164	2013-06-21	2013-06-21	E
143	3	163	61	2013-06-21	2013-06-21	E
153	2	163	182	2013-06-21	2013-06-21	E
155	2	181	182	2013-06-21	\N	E
156	2	181	184	2013-06-21	2013-06-21	E
154	3	181	183	2013-06-21	2013-06-21	E
157	2	181	185	2013-06-21	2013-06-21	E
159	2	186	185	2013-06-21	2013-06-21	E
158	3	186	183	2013-06-21	2013-06-21	E
160	2	186	187	2013-06-21	2013-06-21	E
162	2	188	190	2013-06-21	\N	E
163	2	188	191	2013-06-21	2013-06-21	E
161	3	188	189	2013-06-21	2013-06-21	E
164	2	188	192	2013-06-21	2013-06-21	E
166	2	193	192	2013-06-21	2013-06-21	E
165	3	193	189	2013-06-21	2013-06-21	E
167	2	193	194	2013-06-21	2013-06-21	E
169	2	195	197	2013-06-21	\N	E
170	2	195	198	2013-06-21	2013-06-21	E
168	3	195	196	2013-06-21	2013-06-21	E
171	2	195	199	2013-06-21	2013-06-21	E
173	2	200	199	2013-06-21	2013-06-21	E
188	2	214	213	2013-06-21	2013-06-21	E
187	3	214	210	2013-06-21	2013-06-21	E
189	2	214	215	2013-06-21	2013-06-21	E
192	2	214	218	2013-06-21	2013-06-21	E
191	2	216	218	2013-06-21	2013-06-21	E
193	2	216	219	2013-06-21	2013-06-21	E
190	3	216	217	2013-06-21	2013-06-21	E
194	2	216	220	2013-06-21	2013-06-21	E
196	2	221	220	2013-06-21	2013-06-21	E
195	3	221	217	2013-06-21	2013-06-21	E
197	2	221	222	2013-06-21	2013-06-21	E
199	2	223	225	2013-06-21	2013-06-21	E
200	2	223	226	2013-06-21	2013-06-21	E
203	2	55	160	2013-06-22	\N	E
198	3	223	224	2013-06-21	2013-06-21	E
204	3	249	224	2013-06-21	2013-06-22	A
201	2	223	227	2013-06-21	2013-06-21	E
205	2	249	227	2013-06-21	2013-06-22	E
206	2	249	250	2013-06-21	2013-06-22	A
207	3	252	47	2013-06-22	\N	E
208	3	252	45	2013-06-22	\N	E
202	2	55	56	2013-06-22	\N	E
211	2	55	257	2013-06-22	2013-06-22	E
212	2	258	259	2013-06-22	2013-06-22	E
213	2	258	260	2013-06-22	2013-06-22	E
214	2	261	262	2013-06-22	2013-06-22	E
215	2	263	264	2013-06-22	2013-06-22	E
216	2	265	266	2013-06-22	2013-06-22	E
217	2	265	267	2013-06-22	2013-06-22	E
218	2	265	268	2013-06-22	2013-06-22	E
219	2	269	268	2013-06-22	2013-06-22	E
220	2	269	270	2013-06-22	2013-06-22	A
221	3	250	59	2013-06-22	\N	A
209	3	256	47	2013-06-22	2013-06-22	E
210	3	256	45	2013-06-22	2013-06-22	E
222	2	48	49	2013-06-22	\N	E
223	2	48	50	2013-06-22	\N	E
226	2	273	274	2013-06-22	2013-06-22	E
228	2	275	276	2013-06-22	2013-06-22	E
229	2	275	277	2013-06-22	2013-06-22	E
225	3	256	272	2013-06-22	2013-06-22	E
224	3	256	271	2013-06-22	2013-06-22	E
231	3	256	279	2013-06-22	2013-06-22	E
233	3	256	281	2013-06-22	2013-06-22	A
232	3	256	280	2013-06-22	2013-06-22	E
234	3	256	282	2013-06-22	2013-06-22	A
230	2	275	278	2013-06-22	2013-06-22	E
235	2	283	278	2013-06-22	2013-06-22	A
236	2	78	79	2013-06-22	\N	A
237	2	78	80	2013-06-22	\N	A
238	2	81	82	2013-06-22	\N	A
239	3	282	77	2013-06-22	\N	A
240	3	283	79	2013-06-22	\N	A
241	3	270	50	2013-06-22	\N	A
242	3	269	278	2013-06-22	\N	A
243	2	283	50	2013-06-22	\N	A
244	3	255	283	2013-06-22	\N	A
246	3	295	306	2013-06-22	\N	E
245	2	297	299	2013-06-22	\N	E
248	3	297	306	2013-06-22	\N	E
249	3	299	308	2013-06-22	\N	E
251	2	310	299	2013-06-22	2013-06-22	E
254	2	310	311	2013-06-22	2013-06-22	A
255	3	306	315	2013-06-22	\N	E
250	3	309	306	2013-06-22	2013-06-22	E
252	3	310	306	2013-06-22	2013-06-22	E
247	2	307	308	2013-06-22	\N	E
259	2	318	319	2013-06-22	2013-06-22	E
260	2	318	320	2013-06-22	2013-06-22	E
256	3	316	317	2013-06-22	2013-06-22	E
262	3	316	322	2013-06-22	2013-06-22	E
263	3	316	323	2013-06-22	2013-06-22	E
264	3	328	323	2013-06-22	2013-06-22	A
257	3	309	316	2013-06-22	2013-06-22	E
265	3	309	328	2013-06-22	2013-06-22	A
261	2	318	321	2013-06-22	2013-06-22	E
266	2	329	321	2013-06-22	2013-06-22	E
267	2	329	330	2013-06-22	2013-06-22	E
268	2	329	331	2013-06-22	2013-06-22	E
269	2	329	332	2013-06-22	2013-06-22	E
253	3	311	308	2013-06-22	2013-06-22	E
270	2	334	335	2013-06-23	\N	A
\.


--
-- Name: relacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('relacion_id_seq', 270, true);


--
-- Data for Name: resolucion_miembros; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY resolucion_miembros (id, id_solicitud_cambio, id_usuario, voto) FROM stdin;
40	16	4	t
41	16	7	t
42	16	6	t
43	17	4	t
44	17	7	t
45	17	6	t
46	18	4	t
47	18	7	t
48	18	6	t
49	19	4	t
50	19	6	t
51	19	7	t
52	20	4	t
53	20	6	t
54	20	7	t
55	21	4	t
56	21	6	t
57	21	7	t
58	22	4	t
59	22	7	t
60	22	6	t
\.


--
-- Name: resolucion_miembros_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('resolucion_miembros_id_seq', 60, true);


--
-- Data for Name: rol; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rol (id, codigo, descripcion) FROM stdin;
2	LIDER PROYECTO	LIDER DE PROYECTO
1	ADMINISTRADOR	ADMINISTRADOR DEL SISTEMA
3	COMITE CAMBIOS	MIEMBOR DE COMITE DE CAMBIOS
4	ADMINISTRADOR ITEM	ADMINISTRADOR DE ITEMS
5	DESARROLLADOR	Desarrollador
6	DESARROLLADOR SICAP	Desarrollador Sicap
7	COMITE CAMBIOS SICAP	COMITE DE CAMBIOS SICAP
8	DESARROLLADOR TEST	DESARROLLADOR TEST
9	LIDER TEST	LIDER TEST
10	COMITE CAMBIOS TEST	COMITE DE CAMBIOS TEST
\.


--
-- Name: rol_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('rol_id_seq', 10, true);


--
-- Data for Name: rol_permiso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rol_permiso (id, id_rol, id_permiso) FROM stdin;
1	3	1
3	5	16
4	5	15
5	5	14
6	5	13
7	5	12
8	5	11
9	5	10
10	5	9
11	5	8
12	5	7
13	5	4
14	5	3
15	3	3
16	3	4
17	3	7
18	3	8
19	3	9
20	3	10
21	3	11
22	3	12
23	3	13
24	3	14
25	3	15
26	3	16
27	4	8
28	4	7
29	4	4
30	4	3
31	5	17
32	5	18
33	5	19
34	5	20
35	5	21
36	5	22
37	5	23
38	5	24
39	5	25
40	5	26
41	5	27
42	6	51
43	6	50
44	6	49
45	6	48
46	6	47
52	7	2
53	5	36
54	5	35
55	5	34
56	5	33
57	5	32
58	5	31
59	5	30
60	5	29
61	5	28
62	5	46
63	5	45
64	5	44
65	5	43
66	5	42
67	5	41
68	5	40
69	5	39
70	5	38
71	5	37
72	6	63
73	6	62
74	6	60
75	6	59
76	6	58
77	6	57
78	6	56
79	6	70
80	6	69
81	6	68
82	6	67
83	6	66
84	6	65
85	6	64
86	6	55
87	6	54
88	6	53
89	6	52
90	7	70
91	7	69
92	7	68
93	7	67
94	7	66
95	7	65
96	7	64
97	7	55
98	7	54
99	7	53
100	7	52
101	7	63
102	7	62
103	7	60
104	7	59
105	7	58
106	7	57
107	7	56
108	7	51
109	7	50
110	7	49
111	7	48
112	7	79
113	7	78
114	7	77
115	7	76
116	7	75
117	7	74
118	7	73
119	7	72
120	7	71
121	7	47
122	6	77
123	6	76
124	6	75
125	6	74
126	6	73
127	6	72
128	6	71
129	6	79
130	6	78
131	5	80
132	5	81
133	5	82
134	5	83
135	3	84
136	8	85
137	8	86
138	8	87
139	8	88
140	8	89
141	8	90
142	8	91
143	8	93
144	8	94
145	8	95
146	8	96
147	8	97
148	8	98
149	8	99
150	8	100
151	8	101
152	8	102
153	8	103
154	8	104
155	8	105
156	10	85
157	10	86
158	10	87
159	10	88
160	10	89
161	10	90
162	10	91
163	10	93
164	10	94
165	10	95
166	10	96
167	10	97
168	10	98
169	10	99
170	10	100
171	10	101
172	10	102
173	10	103
174	10	104
175	10	105
176	8	107
177	8	108
178	10	107
179	10	108
\.


--
-- Name: rol_permiso_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('rol_permiso_id_seq', 179, true);


--
-- Data for Name: solicitud_cambio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY solicitud_cambio (id, id_usuario, id_proyecto, fecha, estado, descripcion, cant_votos) FROM stdin;
22	4	1	2013-06-21	A	PRUEBA SOLICITUD	3
16	4	1	2013-06-21	A	CAMBIAR IT-1	3
17	4	1	2013-06-21	A	SE PRECISA CAMBIOS EN IT-1	3
18	4	1	2013-06-21	A	MOdificar IT-1	3
19	4	1	2013-06-21	A	Realizar modificacion en IT-1	3
20	4	1	2013-06-21	A	cambiar responsable IT-1	3
21	4	1	2013-06-21	A	verificar IT-1	3
\.


--
-- Name: solicitud_cambio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('solicitud_cambio_id_seq', 1, false);


--
-- Data for Name: solicitud_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY solicitud_item (id, id_solicitud, id_item) FROM stdin;
14	16	181
15	17	188
16	18	195
17	19	202
18	20	209
19	21	216
20	22	223
\.


--
-- Name: solicitud_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('solicitud_item_id_seq', 20, true);


--
-- Data for Name: tipo_atributo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tipo_atributo (id, nombre, descripcion) FROM stdin;
1	String	Alfanumerico
2	Boolean	Booleano
3	Numeric	Numerico
4	Date	Fecha
\.


--
-- Name: tipo_atributo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tipo_atributo_id_seq', 4, true);


--
-- Data for Name: tipo_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tipo_item (id, id_fase, codigo, nombre, descripcion) FROM stdin;
1	1	TI-1-1	Requerimientos	Requerimiento 
2	1	TI-1-2	Relevamiento	Relevamiento
3	2	TI-2-1	Arquitectura	Aquitectura del Sw
4	2	TI-2-2	Diagrama	Diagramas
5	3	TI-3-1	Caso de Uso	Casos de Uso
6	3	TI-3-2	Reporte	Reportes
7	4	TI-4-1	Prueba	Pruebas
10	5	TI-S2-1	Requerimientos	Requerimiento 
11	6	TI-S2-2	Patrones	Patrones
12	7	TI-S2-3	Comprobacion	Comprobacion
13	8	TI TEST F1	Investigaciones	Investigaciones
14	9	TI TEST F2	Desarrollo test	Desarrollo
\.


--
-- Name: tipo_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tipo_item_id_seq', 14, true);


--
-- Data for Name: tipo_relacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tipo_relacion (id, codigo, nombre, descripcion) FROM stdin;
2	Padre Hijo	Relacion de padre Relacion de padre a hijo	Relacion que se crea cuando los items son de la misma fase
3	Antecesor Sucesor	Relacion de antecesor y sucesor	Relacion que se crea cuando los items son de diferentes fase
\.


--
-- Name: tipo_relacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tipo_relacion_id_seq', 3, true);


--
-- Data for Name: titem_atributo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY titem_atributo (id, id_tipo_item, id_atributo) FROM stdin;
1	1	1
2	2	2
3	3	1
4	4	1
5	5	1
6	5	2
7	6	1
8	6	4
9	7	1
10	10	1
11	11	2
12	12	1
13	13	1
14	14	2
\.


--
-- Name: titem_atributo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('titem_atributo_id_seq', 14, true);


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY usuario (id, usuario, nombre, apellido, password, correo, domicilio, telefono, fecha_nac) FROM stdin;
3	admin	admin	admin	21232f297a57a5a743894a0e4a801fc3	admin@admin.com	admin	123456	2012-12-12
4	raquel	Raquel	Duarte	690c0ca1d95dd5731d948c48d9f3ae8a	raduac88@gmail.com	capiata	0961277762	1988-09-17
5	lila	Lila	Perez	fda6ef9f6ba8382c875468cd70d33ecf	lilapamelaperezmiranda@gmail.com	luque	0961838159	1988-08-05
6	elena	Elena	Vazquez	fadf17141f3f9c3389d10d09db99f757	mariaelena.vazquez@gmail.com	capiat	0961162773	1987-12-30
7	liderRios	Lider Rios R.G	Lider	64ff9e4a58fe52fb1a55987f34bc979d	lider@lider.com	asuncion	0961258699	1988-01-25
8	liderSicap	Lider Sicap	lider	64ff9e4a58fe52fb1a55987f34bc979d	lider@lider.com	luque	0981754623	1987-05-12
9	usuario	Usuario	Usuario	cc25dddbb8e44fbd804322fd50d2620f	usuario@gmail.com	capiata	0982568924	1994-06-12
10	user	user	user	ee11cbb19052e40b07aac0ca060c23ee	user@user.com	user	123	1998-05-25
11	testadmin	testadmin	testadmin	098f6bcd4621d373cade4e832627b4f6	testadmin@testadmin.com	testadmin	123456	1988-02-02
12	testlider	testlider	testlider	098f6bcd4621d373cade4e832627b4f6	testlider@testlider.com	testlider	123456	1988-02-03
13	testdesa	testdesa	testdesa	098f6bcd4621d373cade4e832627b4f6	testdesa@testdesa.com	testdesa	123	1988-02-04
\.


--
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('usuario_id_seq', 13, true);


--
-- Data for Name: usuario_rol; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY usuario_rol (id, id_rol, id_usuario, id_proyecto) FROM stdin;
1	1	3	\N
2	2	7	1
3	2	8	2
18	3	4	1
19	3	7	1
20	5	9	\N
21	5	6	1
22	3	6	1
24	6	9	2
25	5	10	1
26	5	4	1
27	6	5	2
28	7	5	2
29	6	4	2
30	6	5	\N
31	2	12	23
32	1	11	\N
33	10	13	23
34	10	12	23
35	10	9	23
\.


--
-- Name: usuario_rol_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('usuario_rol_id_seq', 35, true);


--
-- Name: pk_archivo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY archivo
    ADD CONSTRAINT pk_archivo PRIMARY KEY (id);


--
-- Name: pk_atributo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY atributo
    ADD CONSTRAINT pk_atributo PRIMARY KEY (id);


--
-- Name: pk_fase; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY fase
    ADD CONSTRAINT pk_fase PRIMARY KEY (id);


--
-- Name: pk_item; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY item
    ADD CONSTRAINT pk_item PRIMARY KEY (id);


--
-- Name: pk_item_atributo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY item_atributo
    ADD CONSTRAINT pk_item_atributo PRIMARY KEY (id);


--
-- Name: pk_lb_item; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY lb_item
    ADD CONSTRAINT pk_lb_item PRIMARY KEY (id);


--
-- Name: pk_linea_base; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY linea_base
    ADD CONSTRAINT pk_linea_base PRIMARY KEY (id);


--
-- Name: pk_miembros_comite; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY miembros_comite
    ADD CONSTRAINT pk_miembros_comite PRIMARY KEY (id);


--
-- Name: pk_permiso; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY permiso
    ADD CONSTRAINT pk_permiso PRIMARY KEY (id);


--
-- Name: pk_proyecto; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY proyecto
    ADD CONSTRAINT pk_proyecto PRIMARY KEY (id);


--
-- Name: pk_recurso; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY recurso
    ADD CONSTRAINT pk_recurso PRIMARY KEY (id);


--
-- Name: pk_relacion; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY relacion
    ADD CONSTRAINT pk_relacion PRIMARY KEY (id);


--
-- Name: pk_resolucion_miembros; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY resolucion_miembros
    ADD CONSTRAINT pk_resolucion_miembros PRIMARY KEY (id);


--
-- Name: pk_rol; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY rol
    ADD CONSTRAINT pk_rol PRIMARY KEY (id);


--
-- Name: pk_rol_permiso; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY rol_permiso
    ADD CONSTRAINT pk_rol_permiso PRIMARY KEY (id);


--
-- Name: pk_solicitud_cambio; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY solicitud_cambio
    ADD CONSTRAINT pk_solicitud_cambio PRIMARY KEY (id);


--
-- Name: pk_solicitud_item; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY solicitud_item
    ADD CONSTRAINT pk_solicitud_item PRIMARY KEY (id);


--
-- Name: pk_tipo_atributo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_atributo
    ADD CONSTRAINT pk_tipo_atributo PRIMARY KEY (id);


--
-- Name: pk_tipo_item; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_item
    ADD CONSTRAINT pk_tipo_item PRIMARY KEY (id);


--
-- Name: pk_tipo_relacion; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_relacion
    ADD CONSTRAINT pk_tipo_relacion PRIMARY KEY (id);


--
-- Name: pk_titem_atributo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY titem_atributo
    ADD CONSTRAINT pk_titem_atributo PRIMARY KEY (id);


--
-- Name: pk_usuario; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT pk_usuario PRIMARY KEY (id);


--
-- Name: pk_usuario_rol; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuario_rol
    ADD CONSTRAINT pk_usuario_rol PRIMARY KEY (id);


--
-- Name: uq_archivo_item; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY archivo
    ADD CONSTRAINT uq_archivo_item UNIQUE (id, id_item);


--
-- Name: uq_atributo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY atributo
    ADD CONSTRAINT uq_atributo UNIQUE (nombre);


--
-- Name: uq_fase_nro_orden; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY fase
    ADD CONSTRAINT uq_fase_nro_orden UNIQUE (nro_orden, id_proyecto);


--
-- Name: uq_item_codigo_version; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY item
    ADD CONSTRAINT uq_item_codigo_version UNIQUE (codigo, version);


--
-- Name: uq_permiso_recurso; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY permiso
    ADD CONSTRAINT uq_permiso_recurso UNIQUE (codigo, id_recurso);


--
-- Name: uq_proyecto_nombre; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY proyecto
    ADD CONSTRAINT uq_proyecto_nombre UNIQUE (nombre);


--
-- Name: uq_relacion; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY relacion
    ADD CONSTRAINT uq_relacion UNIQUE (id_item, id_item_duenho);


--
-- Name: uq_rol_codigo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY rol
    ADD CONSTRAINT uq_rol_codigo UNIQUE (codigo);


--
-- Name: uq_rolpermiso; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY rol_permiso
    ADD CONSTRAINT uq_rolpermiso UNIQUE (id_rol, id_permiso);


--
-- Name: uq_tipo_atributo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_atributo
    ADD CONSTRAINT uq_tipo_atributo UNIQUE (nombre);


--
-- Name: uq_tipoitem_codigo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_item
    ADD CONSTRAINT uq_tipoitem_codigo UNIQUE (codigo);


--
-- Name: uq_tiporelacion_codigo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_relacion
    ADD CONSTRAINT uq_tiporelacion_codigo UNIQUE (codigo);


--
-- Name: uq_usuario_usuario; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT uq_usuario_usuario UNIQUE (usuario);


--
-- Name: uq_usuariorol; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuario_rol
    ADD CONSTRAINT uq_usuariorol UNIQUE (id_rol, id_usuario, id_proyecto);


--
-- Name: fk_archivo_item; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY archivo
    ADD CONSTRAINT fk_archivo_item FOREIGN KEY (id_item) REFERENCES item(id);


--
-- Name: fk_atributo_tipoatributo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY atributo
    ADD CONSTRAINT fk_atributo_tipoatributo FOREIGN KEY (id_tipo_atributo) REFERENCES tipo_atributo(id);


--
-- Name: fk_fase_proyecto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fase
    ADD CONSTRAINT fk_fase_proyecto FOREIGN KEY (id_proyecto) REFERENCES proyecto(id);


--
-- Name: fk_item_fase; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY item
    ADD CONSTRAINT fk_item_fase FOREIGN KEY (id_fase) REFERENCES fase(id);


--
-- Name: fk_item_titem; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY item
    ADD CONSTRAINT fk_item_titem FOREIGN KEY (id_tipo_item) REFERENCES tipo_item(id);


--
-- Name: fk_item_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY item
    ADD CONSTRAINT fk_item_usuario FOREIGN KEY (id_usuario) REFERENCES usuario(id);


--
-- Name: fk_itematributo_atributo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY item_atributo
    ADD CONSTRAINT fk_itematributo_atributo FOREIGN KEY (id_atributo) REFERENCES atributo(id);


--
-- Name: fk_itematributo_item; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY item_atributo
    ADD CONSTRAINT fk_itematributo_item FOREIGN KEY (id_item) REFERENCES item(id);


--
-- Name: fk_lbitem_item; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lb_item
    ADD CONSTRAINT fk_lbitem_item FOREIGN KEY (id_item) REFERENCES item(id);


--
-- Name: fk_lbitem_lineabase; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lb_item
    ADD CONSTRAINT fk_lbitem_lineabase FOREIGN KEY (id_linea_base) REFERENCES linea_base(id);


--
-- Name: fk_miembroscomite_proyecto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY miembros_comite
    ADD CONSTRAINT fk_miembroscomite_proyecto FOREIGN KEY (id_proyecto) REFERENCES proyecto(id);


--
-- Name: fk_miembroscomite_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY miembros_comite
    ADD CONSTRAINT fk_miembroscomite_usuario FOREIGN KEY (id_usuario) REFERENCES usuario(id);


--
-- Name: fk_permiso_recurso; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permiso
    ADD CONSTRAINT fk_permiso_recurso FOREIGN KEY (id_recurso) REFERENCES recurso(id);


--
-- Name: fk_proyecto_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proyecto
    ADD CONSTRAINT fk_proyecto_usuario FOREIGN KEY (id_usuario_lider) REFERENCES usuario(id);


--
-- Name: fk_recurso_fase; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY recurso
    ADD CONSTRAINT fk_recurso_fase FOREIGN KEY (id_fase) REFERENCES fase(id);


--
-- Name: fk_recurso_proyecto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY recurso
    ADD CONSTRAINT fk_recurso_proyecto FOREIGN KEY (id_proyecto) REFERENCES proyecto(id);


--
-- Name: fk_relacion_item; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY relacion
    ADD CONSTRAINT fk_relacion_item FOREIGN KEY (id_item) REFERENCES item(id);


--
-- Name: fk_relacion_itemduenho; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY relacion
    ADD CONSTRAINT fk_relacion_itemduenho FOREIGN KEY (id_item_duenho) REFERENCES item(id);


--
-- Name: fk_relacion_tiporelacion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY relacion
    ADD CONSTRAINT fk_relacion_tiporelacion FOREIGN KEY (id_tipo_relacion) REFERENCES tipo_relacion(id);


--
-- Name: fk_resolucionmiembros_proyecto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY resolucion_miembros
    ADD CONSTRAINT fk_resolucionmiembros_proyecto FOREIGN KEY (id_solicitud_cambio) REFERENCES solicitud_cambio(id);


--
-- Name: fk_resolucionmiembros_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY resolucion_miembros
    ADD CONSTRAINT fk_resolucionmiembros_usuario FOREIGN KEY (id_usuario) REFERENCES usuario(id);


--
-- Name: fk_rolpermiso_permiso; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rol_permiso
    ADD CONSTRAINT fk_rolpermiso_permiso FOREIGN KEY (id_permiso) REFERENCES permiso(id);


--
-- Name: fk_rolpermiso_rol; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rol_permiso
    ADD CONSTRAINT fk_rolpermiso_rol FOREIGN KEY (id_rol) REFERENCES rol(id);


--
-- Name: fk_solicitudcambio_proyecto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY solicitud_cambio
    ADD CONSTRAINT fk_solicitudcambio_proyecto FOREIGN KEY (id_proyecto) REFERENCES proyecto(id);


--
-- Name: fk_solicitudcambio_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY solicitud_cambio
    ADD CONSTRAINT fk_solicitudcambio_usuario FOREIGN KEY (id_usuario) REFERENCES usuario(id);


--
-- Name: fk_solicituditem_item; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY solicitud_item
    ADD CONSTRAINT fk_solicituditem_item FOREIGN KEY (id_item) REFERENCES item(id);


--
-- Name: fk_solicituditem_solicitud; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY solicitud_item
    ADD CONSTRAINT fk_solicituditem_solicitud FOREIGN KEY (id_solicitud) REFERENCES solicitud_cambio(id);


--
-- Name: fk_tipoitem_fase; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo_item
    ADD CONSTRAINT fk_tipoitem_fase FOREIGN KEY (id_fase) REFERENCES fase(id);


--
-- Name: fk_titematributo_atributo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY titem_atributo
    ADD CONSTRAINT fk_titematributo_atributo FOREIGN KEY (id_atributo) REFERENCES atributo(id);


--
-- Name: fk_titematributo_tipoitem; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY titem_atributo
    ADD CONSTRAINT fk_titematributo_tipoitem FOREIGN KEY (id_tipo_item) REFERENCES tipo_item(id);


--
-- Name: fk_usuariorol_pro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario_rol
    ADD CONSTRAINT fk_usuariorol_pro FOREIGN KEY (id_proyecto) REFERENCES proyecto(id);


--
-- Name: fk_usuariorol_rol; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario_rol
    ADD CONSTRAINT fk_usuariorol_rol FOREIGN KEY (id_rol) REFERENCES rol(id);


--
-- Name: fk_usuariorol_usu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario_rol
    ADD CONSTRAINT fk_usuariorol_usu FOREIGN KEY (id_usuario) REFERENCES usuario(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

