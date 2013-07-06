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

ALTER TABLE ONLY usuario
    ADD CONSTRAINT pk_usuario PRIMARY KEY (id);
ALTER TABLE ONLY usuario
    ADD CONSTRAINT uq_usuario_usuario UNIQUE (usuario);

CREATE SEQUENCE usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1;

ALTER SEQUENCE usuario_id_seq OWNED BY usuario.id;
ALTER TABLE ONLY usuario ALTER COLUMN id SET DEFAULT nextval('usuario_id_seq');


CREATE TABLE proyecto (
    id integer NOT NULL,
    id_usuario_lider integer NOT NULL,
    estado character(1) NOT NULL DEFAULT 'i',
    nombre character varying(50) NOT NULL,
    descripcion character varying(100) NOT NULL,
    cant_miembros integer NOT NULL DEFAULT 0,
    fecha_inicio date,
    fecha_fin date,
    fecha_ultima_mod date
);

ALTER TABLE ONLY proyecto
    ADD CONSTRAINT pk_proyecto PRIMARY KEY (id);
ALTER TABLE ONLY proyecto
    ADD CONSTRAINT fk_proyecto_usuario FOREIGN KEY (id_usuario_lider)
    references usuario (id);
ALTER TABLE ONLY proyecto
    ADD CONSTRAINT uq_proyecto_nombre UNIQUE (nombre);

CREATE SEQUENCE proyecto_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1;

ALTER SEQUENCE proyecto_id_seq OWNED BY proyecto.id;
ALTER TABLE ONLY proyecto ALTER COLUMN id SET DEFAULT nextval('proyecto_id_seq');


CREATE TABLE fase (
    id integer NOT NULL,
    nro_orden integer NOT NULL,
    estado character(1) NOT NULL DEFAULT 'i',
    nombre character varying(50) NOT NULL,
    descripcion character varying(100) NOT NULL,
    fecha_inicio date,
    fecha_fin date,
    id_proyecto integer NOT NULL
);

ALTER TABLE ONLY fase
    ADD CONSTRAINT pk_fase PRIMARY KEY (id);
ALTER TABLE ONLY fase
    ADD CONSTRAINT uq_fase_nro_orden UNIQUE (nro_orden, id_proyecto);
ALTER TABLE ONLY fase
    ADD CONSTRAINT fk_fase_proyecto FOREIGN KEY (id_proyecto)
    references proyecto (id);

CREATE SEQUENCE fase_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1;

ALTER SEQUENCE fase_id_seq OWNED BY fase.id;
ALTER TABLE ONLY fase ALTER COLUMN id SET DEFAULT nextval('fase_id_seq');

CREATE TABLE recurso
(
  nombre character varying(100) NOT NULL,
  id integer NOT NULL,
  id_fase integer,
  id_proyecto integer,
  CONSTRAINT pk_recurso PRIMARY KEY (id ),
  CONSTRAINT fk_recurso_fase FOREIGN KEY (id_fase)
      REFERENCES fase (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_recurso_proyecto FOREIGN KEY (id_proyecto)
      REFERENCES proyecto (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE SEQUENCE recurso_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1;

ALTER SEQUENCE recurso_id_seq OWNED BY recurso.id;
ALTER TABLE ONLY recurso ALTER COLUMN id SET DEFAULT nextval('recurso_id_seq');

CREATE TABLE permiso (
    id integer NOT NULL,
    codigo character varying(50) NOT NULL,
    descripcion character varying(100) NOT NULL,
    id_recurso integer NOT NULL
);

ALTER TABLE ONLY permiso
    ADD CONSTRAINT pk_permiso PRIMARY KEY (id);
ALTER TABLE ONLY permiso
    ADD CONSTRAINT fk_permiso_recurso FOREIGN KEY (id_recurso)
    references recurso (id);
ALTER TABLE ONLY permiso
    ADD CONSTRAINT uq_permiso_recurso UNIQUE (codigo, id_recurso);

CREATE SEQUENCE permiso_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1;

ALTER SEQUENCE permiso_id_seq OWNED BY permiso.id;
ALTER TABLE ONLY permiso ALTER COLUMN id SET DEFAULT nextval('permiso_id_seq');


CREATE TABLE rol (
    id integer NOT NULL,
    codigo character varying(50) NOT NULL,
    descripcion character varying(100) NOT NULL
);

ALTER TABLE ONLY rol
    ADD CONSTRAINT pk_rol PRIMARY KEY (id);
ALTER TABLE ONLY rol
    ADD CONSTRAINT uq_rol_codigo UNIQUE (codigo);

CREATE SEQUENCE rol_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1;

ALTER SEQUENCE rol_id_seq OWNED BY rol.id;
ALTER TABLE ONLY rol ALTER COLUMN id SET DEFAULT nextval('rol_id_seq');


CREATE TABLE tipo_item (
    id integer NOT NULL,
    id_fase integer NOT NULL,
    codigo character varying(50) NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion character varying(100) NOT NULL
);

ALTER TABLE ONLY tipo_item
    ADD CONSTRAINT pk_tipo_item PRIMARY KEY (id);
ALTER TABLE ONLY tipo_item
    ADD CONSTRAINT uq_tipoitem_codigo UNIQUE (codigo);

ALTER TABLE ONLY tipo_item
    ADD CONSTRAINT fk_tipoItem_fase FOREIGN KEY (id_fase)
    references fase (id);

CREATE SEQUENCE tipo_item_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1;

ALTER SEQUENCE tipo_item_id_seq OWNED BY tipo_item.id;
ALTER TABLE ONLY tipo_item ALTER COLUMN id SET DEFAULT nextval('tipo_item_id_seq');


--tipo de dato de complejidad cambiado
CREATE TABLE item (
    id integer NOT NULL,
    id_usuario integer NOT NULL,
    id_fase integer NOT NULL,
    id_tipo_item integer NOT NULL,
    version integer NOT NULL,
    codigo character varying(50) NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion character varying(100) NOT NULL,
    estado character(1) NOT NULL DEFAULT 'i',
    complejidad integer NOT NULL,
    fecha date,
    costo numeric(10,2) NOT NULL,
    archivo bytea,
    mime character varying(15)
);

ALTER TABLE ONLY item
    ADD CONSTRAINT pk_item PRIMARY KEY (id);
ALTER TABLE ONLY item
    ADD CONSTRAINT fk_item_usuario FOREIGN KEY (id_usuario)
    references usuario (id);
ALTER TABLE ONLY item
    ADD CONSTRAINT fk_item_fase FOREIGN KEY (id_fase)
    references fase (id);
ALTER TABLE ONLY item
    ADD CONSTRAINT fk_item_titem FOREIGN KEY (id_tipo_item)
    references tipo_item (id);

ALTER TABLE ONLY item
    ADD CONSTRAINT uq_item_codigo_version UNIQUE (codigo, version);

CREATE SEQUENCE item_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1;

ALTER SEQUENCE item_id_seq OWNED BY item.id;
ALTER TABLE ONLY item ALTER COLUMN id SET DEFAULT nextval('item_id_seq');


CREATE TABLE linea_base (
    id integer NOT NULL,
    estado character(1) NOT NULL DEFAULT 'i',
    descripcion character varying(100) NOT NULL,
    fecha_creacion date NOT NULL,
    fecha_ruptura date
);

ALTER TABLE ONLY linea_base
    ADD CONSTRAINT pk_linea_base PRIMARY KEY (id);

CREATE SEQUENCE linea_base_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1;

ALTER SEQUENCE linea_base_id_seq OWNED BY linea_base.id;
ALTER TABLE ONLY linea_base ALTER COLUMN id SET DEFAULT nextval('linea_base_id_seq');


CREATE TABLE tipo_atributo (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion character varying(100) NOT NULL
);

ALTER TABLE ONLY tipo_atributo
    ADD CONSTRAINT pk_tipo_atributo PRIMARY KEY (id);
ALTER TABLE ONLY tipo_atributo
    ADD CONSTRAINT uq_tipo_atributo UNIQUE (nombre);

CREATE SEQUENCE tipo_atributo_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1;

ALTER SEQUENCE tipo_atributo_id_seq OWNED BY tipo_atributo.id;
ALTER TABLE ONLY tipo_atributo ALTER COLUMN id SET DEFAULT nextval('tipo_atributo_id_seq');

--verificar si esta correcto el primary key ya que la combinacion debe ser unica
CREATE TABLE usuario_rol (
    id integer NOT NULL,
    id_rol integer NOT NULL,
    id_usuario integer NOT NULL,
    id_proyecto integer
);

ALTER TABLE ONLY usuario_rol
    ADD CONSTRAINT pk_usuario_rol PRIMARY KEY (id);
ALTER TABLE ONLY usuario_rol
    ADD CONSTRAINT fk_usuarioRol_rol FOREIGN KEY (id_rol)
    references rol (id);
ALTER TABLE ONLY usuario_rol
    ADD CONSTRAINT fk_usuarioRol_usu FOREIGN KEY (id_usuario)
    references usuario (id);
ALTER TABLE ONLY usuario_rol
    ADD CONSTRAINT fk_usuarioRol_pro FOREIGN KEY (id_proyecto)
    references proyecto (id);
ALTER TABLE ONLY usuario_rol
    ADD CONSTRAINT uq_usuarioRol UNIQUE (id_rol, id_usuario, id_proyecto);

CREATE SEQUENCE usuario_rol_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1;

ALTER SEQUENCE usuario_rol_id_seq OWNED BY usuario_rol.id;
ALTER TABLE ONLY usuario_rol ALTER COLUMN id SET DEFAULT nextval('usuario_rol_id_seq');


CREATE TABLE tipo_relacion (
    id integer NOT NULL,
    codigo character varying(50) NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion character varying(100) NOT NULL
);

ALTER TABLE ONLY tipo_relacion
    ADD CONSTRAINT pk_tipo_relacion PRIMARY KEY (id);
ALTER TABLE ONLY tipo_relacion
    ADD CONSTRAINT uq_tipoRelacion_codigo UNIQUE (codigo);

CREATE SEQUENCE tipo_relacion_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1;

ALTER SEQUENCE tipo_relacion_id_seq OWNED BY tipo_relacion.id;
ALTER TABLE ONLY tipo_relacion ALTER COLUMN id SET DEFAULT nextval('tipo_relacion_id_seq');


--verificar la relacion para  id_item_duenho
CREATE TABLE relacion (
    id integer NOT NULL,
    id_tipo_relacion integer NOT NULL,
    id_item integer NOT NULL,
    id_item_duenho integer NOT NULL,
    fecha_creacion date,
    fecha_modificacion date,
    estado character(1) NOT NULL default 'A'::bpchar
);

ALTER TABLE ONLY relacion
    ADD CONSTRAINT pk_relacion PRIMARY KEY (id);
ALTER TABLE ONLY relacion
    ADD CONSTRAINT fk_relacion_tipoRelacion FOREIGN KEY (id_tipo_relacion)
    references tipo_relacion (id);
ALTER TABLE ONLY relacion
    ADD CONSTRAINT fk_relacion_item FOREIGN KEY (id_item)
    references item (id);
ALTER TABLE ONLY relacion
    ADD CONSTRAINT fk_relacion_itemDuenho FOREIGN KEY (id_item_duenho)
    references item (id);
ALTER TABLE ONLY relacion
    ADD CONSTRAINT uq_relacion UNIQUE (id_item , id_item_duenho );

CREATE SEQUENCE relacion_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1;

ALTER SEQUENCE relacion_id_seq OWNED BY relacion.id;
ALTER TABLE ONLY relacion ALTER COLUMN id SET DEFAULT nextval('relacion_id_seq');

--verificar el primary key porque la combinacion debe ser unica
CREATE TABLE lb_item (
    id integer NOT NULL,
    id_linea_base integer NOT NULL,
    id_item integer NOT NULL
);

ALTER TABLE ONLY lb_item
    ADD CONSTRAINT pk_lb_item PRIMARY KEY (id);
ALTER TABLE ONLY lb_item
    ADD CONSTRAINT fk_lbItem_lineaBase FOREIGN KEY (id_linea_base)
    references linea_base (id);
ALTER TABLE ONLY lb_item
    ADD CONSTRAINT fk_lbItem_item FOREIGN KEY (id_item)
    references item (id);

CREATE SEQUENCE lb_item_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1;

ALTER SEQUENCE lb_item_id_seq OWNED BY lb_item.id;
ALTER TABLE ONLY lb_item ALTER COLUMN id SET DEFAULT nextval('lb_item_id_seq');

--verificar el primary key porque la combinacion debe ser unica
CREATE TABLE rol_permiso (
    id integer NOT NULL,
    id_rol integer NOT NULL,
    id_permiso integer NOT NULL
);

ALTER TABLE ONLY rol_permiso
    ADD CONSTRAINT pk_rol_permiso PRIMARY KEY (id);
ALTER TABLE ONLY rol_permiso
    ADD CONSTRAINT fk_rolPermiso_rol FOREIGN KEY (id_rol)
    references rol (id);
ALTER TABLE ONLY rol_permiso
    ADD CONSTRAINT fk_rolPermiso_permiso FOREIGN KEY (id_permiso)
    references permiso (id);
ALTER TABLE ONLY rol_permiso
    ADD CONSTRAINT uq_rolPermiso UNIQUE (id_rol, id_permiso);

CREATE SEQUENCE rol_permiso_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1;

ALTER SEQUENCE rol_permiso_id_seq OWNED BY rol_permiso.id;
ALTER TABLE ONLY rol_permiso ALTER COLUMN id SET DEFAULT nextval('rol_permiso_id_seq');


--tabla creada para los nuevos atributos para los tipos
CREATE TABLE atributo (
    id integer NOT NULL,
    id_tipo_atributo integer NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion character varying(100) NOT NULL
);

ALTER TABLE ONLY atributo
    ADD CONSTRAINT pk_atributo PRIMARY KEY (id);
ALTER TABLE ONLY atributo
    ADD CONSTRAINT fk_atributo_tipoAtributo FOREIGN KEY (id_tipo_atributo)
    references tipo_atributo (id);
ALTER TABLE ONLY atributo
    ADD CONSTRAINT uq_atributo UNIQUE (nombre);

CREATE SEQUENCE atributo_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1;

ALTER SEQUENCE atributo_id_seq OWNED BY atributo.id;
ALTER TABLE ONLY atributo ALTER COLUMN id SET DEFAULT nextval('atributo_id_seq');


--verificar se elimino la columna valor_atributo
CREATE TABLE titem_atributo (
    id integer NOT NULL,
    id_tipo_item integer NOT NULL,
    id_atributo integer NOT NULL
);

ALTER TABLE ONLY titem_atributo
    ADD CONSTRAINT pk_titem_atributo PRIMARY KEY (id);
ALTER TABLE ONLY titem_atributo
    ADD CONSTRAINT fk_titemAtributo_tipoItem FOREIGN KEY (id_tipo_item)
    references tipo_item (id);
ALTER TABLE ONLY titem_atributo
    ADD CONSTRAINT fk_titemAtributo_atributo FOREIGN KEY (id_atributo)
    references atributo (id);

CREATE SEQUENCE titem_atributo_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1;

ALTER SEQUENCE titem_atributo_id_seq OWNED BY titem_atributo.id;
ALTER TABLE ONLY titem_atributo ALTER COLUMN id SET DEFAULT nextval('titem_atributo_id_seq');

--tabla añadida para guardar los valores del atribtuo, verificar pk si es correcto
CREATE TABLE item_atributo (
    id integer NOT NULL,
    id_item integer NOT NULL,
    id_atributo integer NOT NULL,
    valor character varying(100)
);

ALTER TABLE ONLY item_atributo
    ADD CONSTRAINT pk_item_atributo PRIMARY KEY (id);
ALTER TABLE ONLY item_atributo
    ADD CONSTRAINT fk_itemAtributo_item FOREIGN KEY (id_item)
    references item (id);
ALTER TABLE ONLY item_atributo
    ADD CONSTRAINT fk_itemAtributo_atributo FOREIGN KEY (id_atributo)
    references atributo (id);

CREATE SEQUENCE item_atributo_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1;

ALTER SEQUENCE item_atributo_id_seq OWNED BY item_atributo.id;
ALTER TABLE ONLY item_atributo ALTER COLUMN id SET DEFAULT nextval('item_atributo_id_seq');


CREATE TABLE solicitud_cambio(
    id integer NOT NULL,
    id_usuario integer NOT NULL,
    id_proyecto integer NOT NULL,
    fecha date NOT NULL,
    estado character(1) NOT NULL,
    descripcion character varying NOT NULL,
    cant_votos integer DEFAULT 0 NOT NULL
);

ALTER TABLE ONLY solicitud_cambio
    ADD CONSTRAINT pk_solicitud_cambio PRIMARY KEY (id);
ALTER TABLE ONLY solicitud_cambio
    ADD CONSTRAINT fk_solicitudCambio_usuario FOREIGN KEY (id_usuario)
    references usuario (id);
ALTER TABLE ONLY solicitud_cambio
    ADD CONSTRAINT fk_solicitudCambio_proyecto FOREIGN KEY (id_proyecto)
    references proyecto (id);

CREATE SEQUENCE solicitud_cambio_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1;

ALTER SEQUENCE solicitud_cambio_id_seq OWNED BY solicitud_cambio.id;
ALTER TABLE ONLY solicitud_cambio ALTER COLUMN id SET DEFAULT nextval('solicitud_cambio_id_seq');


--verificar pk
CREATE TABLE solicitud_item (
    id integer NOT NULL,
    id_solicitud integer NOT NULL,
    id_item integer NOT NULL
);

ALTER TABLE ONLY solicitud_item
    ADD CONSTRAINT pk_solicitud_item PRIMARY KEY (id);
ALTER TABLE ONLY solicitud_item
    ADD CONSTRAINT fk_solicitudItem_solicitud FOREIGN KEY (id_solicitud)
    references solicitud_cambio (id);
ALTER TABLE ONLY solicitud_item
    ADD CONSTRAINT fk_solicitudItem_item FOREIGN KEY (id_item)
    references item (id);

CREATE SEQUENCE solicitud_item_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1;

ALTER SEQUENCE solicitud_item_id_seq OWNED BY solicitud_item.id;
ALTER TABLE ONLY solicitud_item ALTER COLUMN id SET DEFAULT nextval('solicitud_item_id_seq');


CREATE TABLE miembros_comite (
    id integer NOT NULL,
    id_proyecto integer NOT NULL,
    id_usuario integer NOT NULL
);

ALTER TABLE ONLY miembros_comite
    ADD CONSTRAINT pk_miembros_comite PRIMARY KEY (id);
ALTER TABLE ONLY miembros_comite
    ADD CONSTRAINT fk_miembrosComite_proyecto FOREIGN KEY (id_proyecto)
    references proyecto (id);
ALTER TABLE ONLY miembros_comite
    ADD CONSTRAINT fk_miembrosComite_usuario FOREIGN KEY (id_usuario)
    references usuario (id);
ALTER TABLE ONLY miembros_comite
    ADD CONSTRAINT uq_miembros_comite UNIQUE (id_proyecto,id_usuario); 

CREATE SEQUENCE miembros_comite_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1;

ALTER SEQUENCE miembros_comite_id_seq OWNED BY miembros_comite.id;
ALTER TABLE ONLY miembros_comite ALTER COLUMN id SET DEFAULT nextval('miembros_comite_id_seq');


CREATE TABLE resolucion_miembros (
    id integer NOT NULL,
    id_solicitud_cambio integer NOT NULL,
    id_usuario integer NOT NULL,
    voto boolean NOT NULL
);

ALTER TABLE ONLY resolucion_miembros
    ADD CONSTRAINT pk_resolucion_miembros PRIMARY KEY (id);
ALTER TABLE ONLY resolucion_miembros
    ADD CONSTRAINT fk_resolucionMiembros_proyecto FOREIGN KEY (id_solicitud_cambio)
    references solicitud_cambio (id);
ALTER TABLE ONLY resolucion_miembros
    ADD CONSTRAINT fk_resolucionMiembros_usuario FOREIGN KEY (id_usuario)
    references usuario (id);

CREATE SEQUENCE resolucion_miembros_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1;

ALTER SEQUENCE resolucion_miembros_id_seq OWNED BY resolucion_miembros.id;
ALTER TABLE ONLY resolucion_miembros ALTER COLUMN id SET DEFAULT nextval('resolucion_miembros_id_seq');
