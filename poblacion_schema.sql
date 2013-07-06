INSERT INTO tipo_atributo (id, nombre, descripcion) VALUES
(1, 'INTEGER', 'Número entero'),
(2, 'BOOLEAN', 'Valor booleano'),
(3, 'STRING', 'Cadena'),
(4, 'DOUBLE', 'Número decimal'),
(5, 'DATE', 'Fecha'),
(6, 'CHARACTER', 'Caracter');

INSERT INTO atributo (id, id_tipo_atributo, nombre, descripcion) VALUES
(1, 3, 'OBSERVACION', 'Observacion sobre el item'),
(2, 4, 'TIEMPO DEDICADO', 'Cantidad en horas del tiempo dedicado'),
(3, 3, 'TAREA REALIZADA', 'Comentario de lo realizado en la modificacion');

INSERT INTO usuario (id, usuario, nombre, apellido, password, correo, domicilio, telefono, fecha_nac) VALUES
(1, 'admin', 'Administrador', 'principal', '21232f297a57a5a743894a0e4a801fc3', 'admin@admin.com', 'San Lorenzo', '12345', '30/12/1990'),
(2, 'lider','lider','proyecto','64ff9e4a58fe52fb1a55987f34bc979d', 'lider@lider.com', 'San Lorenzo', '12345', '30/12/1990'),
(3, 'desarrollador','desarrollador','proyecto','e54cc06625bbadf12163b41a3cb92bf8', 'desarrollador@desarrollador.com', 'San Lorenzo', '12345', '30/12/1990');

INSERT INTO proyecto (id, id_usuario_lider, estado, nombre, descripcion, cant_miembros, fecha_inicio, fecha_fin, fecha_ultima_mod) VALUES
(1, 2, 'N', 'SistemaRIOS', 'Sistema de administración', 3, '10/05/2013', NULL, NULL );

INSERT INTO fase (id, nro_orden, estado, nombre, descripcion, fecha_inicio, fecha_fin, id_proyecto) VALUES
(1, 1, 'P', 'Analisis', 'Recoleccion de requerimientos', '2013-05-21', '2013-05-31', 1),
(2, 2, 'P', 'Diseño', 'Diseño segun el analisis', '2013-06-20', '2014-06-30', 1),
(3, 3, 'I', 'Desarrollo', 'Desarrollo en base a los requerimientos', '2013-07-01','2013-12-31',1),
(4, 4, 'I', 'Pruebas', 'Pruebas en la empresa', '2013-12-02', '2014-01-30', 1),
(5, 5, 'I', 'Depuracion', 'Depuracion del sistema', '2014-01-02', '2014-02-28', 1),
(6, 6, 'I', 'Implementacion', 'Implementacion del sistema', '2014-03-04', '2014-04-30', 1);

INSERT INTO tipo_item (id, id_fase, codigo, nombre, descripcion) VALUES
(1, 1, 'RELEVAMIENTO DE DATOS', 'RELEVAMIENTO DE DATOS', 'Relevamiento de datos generales'),
(2, 1, 'ENTREVISTA', 'ENTREVISTA', 'Entrevista a funcionarios'),
(3, 2, 'CASOS DE USOS', 'CASOS DE USOS', 'Aspectos relacionados a caso de usos');

INSERT INTO item (id, id_usuario, id_fase, id_tipo_item, version, codigo, nombre, descripcion, estado, complejidad, fecha, costo, archivo, mime) VALUES
(1, 3, 1, 1, 1, 'OBTENREQUERIMIE', 'Obtener requerimientos','Obtener requerimientos','I',2,'23-05-2013',30000,NULL,NULL ),
(2, 3, 1, 2, 1, 'ENTREGERGRAL', 'Entrevista a gerentes generales','Entrevista a gerentes generales','I',2,'23-05-2013',30000,NULL,NULL ),
(3, 3, 1, 2, 1, 'ENTRECAJE', 'Entrevista a cajeros','Entrevista a cajeros','I',2,'30-05-2013',30000,NULL,NULL ),
(4, 3, 2, 1, 1, 'CREARPROCESOS', 'Creacion de procesos de tareas','Creacion de procesos de tareas','I',2,'20-06-2013',30000,NULL,NULL ),
(5, 3, 2, 1, 1, 'DEPURPROCESO', 'Depurar procesos de tareas','Depurar procesos de tareas','I',2,'25-06-2013',30000,NULL,NULL );

INSERT INTO item_atributo (id, id_item, id_atributo, valor) VALUES
(1, 1, 2, '30'),
(2, 1, 3, 'Se inicia relevamiento'),
(3, 2, 2, '30'),
(4, 2, 3, 'Se inicia entrevista con 10 personas');


INSERT INTO linea_base (estado, descripcion, fecha_creacion, fecha_ruptura) VALUES
(, '', '', ''),
(, '', '', ''),
(, '', '', ''),
(, '', '', ''),
(, '', '', ''),
(, '', '', '');

INSERT INTO lb_item (id_linea_base, id_item) VALUES
(, '', '', ''),
(, '', '', ''),
(, '', '', ''),
(, '', '', ''),
(, '', '', ''),
(, '', '', '');

INSERT INTO miembros_comite (id_proyecto, id_usuario) VALUES
(, '', '', ''),
(, '', '', ''),
(, '', '', ''),
(, '', '', ''),
(, '', '', ''),
(, '', '', '');

--administracion de permiso solo lo realiza un administrador
--('CONSULTAR PERMISO', 'Permite visualizar los permisos existentes', NULL),
--('VER PERMISO', 'Permite visualizar los datos del permiso', NULL),
--('BUSCAR PERMISO', 'Permite buscar los permisos', NULL),
--('EDITAR PERMISO', 'Permite editar datos del proyecto', NULL);
--('ELIMINAR PERMISO', 'Permite eliminar una fase', NULL),
--('VER USUARIO P1', 'Permite visualizar los datos de un usuario', NULL),
--('BUSCAR USUARIO P1', 'Permite buscar los usuarios', NULL),
--('ASIGNAR/DESASIGNAR ROL P1', 'Permite asignar y desasignar roles a un usuario', NULL),
--('CONSULTAR ROL', 'Permite visualizar los roles existentes', NULL),
--('VER ROL', 'Permite visualizar los datos del rol', NULL),
--('BUSCAR ROL', 'Permite buscar los roles', NULL),
--('ASIGNAR/DESASIGNAR PERMISO', 'Permite asignar y desasignar permisos a un rol', NULL),
--('CONSULTAR PROYECTO', 'Permite visualizar los proyectos existentes', NULL),
--('VER PROYECTO', 'Permite visualizar los datos del proyecto', NULL),
--('BUSCAR PROYECTO', 'Permite buscar los proyectos', NULL),
--('EDITAR PROYECTO', 'Permite editar datos del proyecto', NULL),
INSERT INTO permiso (codigo, descripcion, id_fase) VALUES
--para lider de proyecto
('INICIAR PROYECTO P1')
('CONSULTAR USUARIO P1', 'Permite visualizar los usuarios existentes', NULL),
('CONSULTAR COMITE DE CAMBIO P1', 'Permite visualizar los miembros de un comite existente', NULL),
('CREAR COMITE DE CAMBIO P1', 'Permite crear un miembro comite de cambio', NULL),
('ELIMINAR COMITE DE CAMBIO P1', 'Permite eliminar un miembro del comite', NULL),
('BUSCAR COMITE DE CAMBIO P1', 'Permite buscar los miembros de un comite de cambio', NULL),
('CONSULTAR LINEA BASE P1', 'Permite visualizar las lineas bases existentes', NULL), --para UN MIEMBRO
('CREAR LINEA BASE F1', 'Permite crear una linea base', 1),
('LIBERAR LINEA BASE F1', 'Permite liberar una linea base', 1),
('BUSCAR LINEA BASE P1', 'Permite buscar las lineas bases', 1),
('EDITAR LINEA BASE F1', 'Permite editar datos de la linea base', 1),
--('CONSULTAR FASE P1', 'Permite visualizar las fases existentes', NULL), --para un MIEMBRO
--('CREAR FASE P1', 'Permite crear una fase', NULL);
--('ELIMINAR FASE P1', 'Permite eliminar una fase', NULL),
--('BUSCAR FASE P1', 'Permite buscar las fases', NULL), --para un MIEMBRO COMITE
--('EDITAR FASE P1', 'Permite editar datos de la fase', NULL),
--('FINALIZAR FASE P1', 'Permite finlizar una fase', NULL),
--('IMPORTAR FASE P1', 'Permite importar los datos de un fase', NULL),
('CONSULTAR TIPO ITEM P1', 'Permite visualizar los tipos de items existentes', NULL), --para un MIEMBRO COMITE
('CREAR TIPO ITEM P1', 'Permite crear un tipo de item', NULL),
('ELIMINAR TIPO ITEM P1', 'Permite eliminar un tipo item', NULL),
('BUSCAR TIPO ITEM P1', 'Permite buscar los tipos de item', NULL), --para un MIEMBRO COMITE
('EDITAR TIPO ITEM P1', 'Permite editar los datos de un tipo de item', NULL),
('IMPORTAR TIPO ITEM P1', 'Permite importar los datos de un tipo item', NULL),
('CONSULTAR TIPO ATRIBUTO', 'Permite visualizar los tipos de atributos existentes', NULL),
('CREAR TIPO ATRIBUTO', 'Permite crear un tipo de atributo', NULL),
('VER TIPO ATRIBUTO', 'Permite visualizar los datos de un tipo atributo', NULL),
('ELIMINAR TIPO ATRIBUTO', 'Permite eliminar un tipo atributo', NULL),
('BUSCAR TIPO ATRIBUTO', 'Permite buscar los tipos de atributo', NULL),
('EDITAR TIPO ATRIBUTO', 'Permite editar los datos del tipo atributo', NULL),
('CONSULTAR ATRIBUTO P1', 'Permite visualizar los atributos existentes', NULL),
('CREAR ATRIBUTO P1', 'Permite crear un atributo', NULL),
('VER ATRIBUTO P1', 'Permite visualizar los datos de un atributo', NULL),
('ELIMINAR ATRIBUTO P1', 'Permite eliminar un atributo', NULL),
('BUSCAR ATRIBUTO P1', 'Permite buscar los atributos', NULL),
('EDITAR ATRIBUTO P1', 'Permite editar los datos de un atributo', NULL),
--para un MIEMBRO COMITE
('VER LINEA BASE P1', 'Permite visualizar los datos de la linea base', NULL),
('VER FASE P1', 'Permite visualizar los datos de la fase', NULL),
('VER ITEM P1', 'Permite visualizar los datos de un item', NULL),
('VER TIPO ITEM P1', 'Permite visualizar los datos de un tipo item', NULL),
--para un usuario de fase o proyecto
('CONSULTAR ITEM F1', 'Permite visualizar los items existentes', 1), --para un MIEMBRO COMITE
('CREAR ITEM F1', 'Permite crear un item', 1);
('ELIMINAR ITEM F1', 'Permite eliminar un item', 1),
('BUSCAR ITEM F1', 'Permite buscar los items', 1), --para un MIEMBRO COMITE
('EDITAR ITEM F1', 'Permite editar datos del item', 1),
('REVERSION ITEM F1', 'Permite volver a una version anterior un item', 1),
('REVIVIR ITEM F1', 'Permite revivir un item eliminado', 1),
('CONSULTAR RELACION F1', 'Permite visualizar las relaciones existentes', 1),
('CREAR RELACION F1', 'Permite crear una relacion', 1),
('VER RELACION F1', 'Permite visualizar los datos de una relacion', 1),
('ELIMINAR RELACION F1', 'Permite eliminar una relacion', 1),
('BUSCAR RELACION F1', 'Permite buscar las relaciones', 1);

INSERT INTO tipo_relacion (id, codigo, nombre, descripcion) VALUES
(1, 'Padre Hijo','Relacion de padre a hijo','Relacion que se crea cuando los items son de la misma fase'),
(2, 'Antecesor Sucesor','Relacion de antecesor y sucesor','Relacion que se crea cuando los items son de diferentes fase');

INSERT INTO relacion (id, id_tipo_relacion, id_item, id_item_duenho, fecha_creacion, fecha_modificacion, estado) VALUES
(1, 1, 1, 2, '20-05-2013',NULL, 'A'),
(2, 1, 1, 3, '20-05-2013',NULL, 'A'),
(3, 2, 2, 4, '28-06-2013',NULL, 'A'),
(4, 2, 3, 4, '28-06-2013',NULL, 'A');

INSERT INTO solicitud_cambio (id_usuario, id_proyecto, fecha, estado, descripcion, cant_votos) VALUES
(, '', '', ''),
(, '', '', ''),
(, '', '', ''),
(, '', '', ''),
(, '', '', ''),
(, '', '', '');

INSERT INTO resolucion_miembros (id_solicitud_cambio, id_usuario, voto) VALUES
(, '', '', ''),
(, '', '', ''),
(, '', '', ''),
(, '', '', ''),
(, '', '', ''),
(, '', '', '');

INSERT INTO rol (id, codigo, descripcion) VALUES
(1, 'ADMINISTRADOR', 'Administrador del sistema'),
(2, 'LIDER PROYECTO', 'Lider de un proyecto'),
(3, 'COMITE CAMBIOS', 'Miembro de comite de cambios'),
(4, 'ADMINISTRADOR ITEM', 'Administrador de items');

INSERT INTO rol_permiso (id_rol, id_permiso) VALUES
(, ),
(, ),
(, ),
(, ),
(, ),
(, );

INSERT INTO solicitud_item (id_solicitud, id_item) VALUES
(, ),
(, ),
(, ),
(, ),
(, ),
(, );

INSERT INTO titem_atributo (id, id_tipo_item, id_atributo) VALUES
(1,1 ,2),
(2, 1,3),
(3, 2,2),
(4, 2,3);

INSERT INTO usuario_rol (id, id_rol, id_usuario, id_proyecto) VALUES
(1, 1, 1, NULL),
(2, 2, 2, 1),
(3, 3, 3, 1);
