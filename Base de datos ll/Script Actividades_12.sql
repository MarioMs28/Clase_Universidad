CREATE TABLE usuarios (
 usuario_id NUMBER PRIMARY KEY,
 nombre VARCHAR2(100),
 correo VARCHAR2(150)
);

INSERT INTO usuarios VALUES (1, 'Ana López', 'ana@correo.com');
INSERT INTO usuarios VALUES (2, 'Carlos Ruiz', 'carlos@correo.com');
INSERT INTO usuarios VALUES (3, 'Diana Gómez', 'diana@correo.com');
INSERT INTO usuarios VALUES (4, 'Fernando Pérez', 'fernando@correo.com');
INSERT INTO usuarios VALUES (5, 'Lucía Torres', 'lucia@correo.com');
INSERT INTO usuarios VALUES (6, 'Marcos Salas', 'marcos@correo.com');
INSERT INTO usuarios VALUES (7, 'Patricia Vega', 'patricia@correo.com');
INSERT INTO usuarios VALUES (8, 'Raúl Mendoza', 'raul@correo.com');
INSERT INTO usuarios VALUES (9, 'Silvia Castro', 'silvia@correo.com');
INSERT INTO usuarios VALUES (10, 'Tomás Fuentes', 'tomas@correo.com');

CREATE TABLE incidentes (
 incidente_id NUMBER PRIMARY KEY,
 descripcion VARCHAR2(200),
 criticidad VARCHAR2(20)
);

INSERT INTO incidentes VALUES (1, 'No enciende el equipo', 'Alta');
INSERT INTO incidentes VALUES (2, 'No hay internet', 'Media');
INSERT INTO incidentes VALUES (3, 'Pantalla azul', 'Alta');
INSERT INTO incidentes VALUES (4, 'No imprime', 'Baja');
INSERT INTO incidentes VALUES (5, 'Virus detectado', 'Alta');
INSERT INTO incidentes VALUES (6, 'Lentitud en sistema', 'Media');
INSERT INTO incidentes VALUES (7, 'Error al abrir app', 'Media');
INSERT INTO incidentes VALUES (8, 'Mouse no responde', 'Baja');
INSERT INTO incidentes VALUES (9, 'Teclado da doble letra', 'Baja');
INSERT INTO incidentes VALUES (10, 'Desbloqueo de cuenta', 'Media');

CREATE TABLE tickets (
 ticket_id NUMBER PRIMARY KEY,
 usuario_id NUMBER,
 incidente_id NUMBER,
 fecha_apertura TIMESTAMP DEFAULT SYSTIMESTAMP,
 estado VARCHAR2(20),
 FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
 FOREIGN KEY (incidente_id) REFERENCES incidentes(incidente_id)
 );


INSERT INTO tickets VALUES (1, 1, 1, SYSTIMESTAMP, 'Abierto');
INSERT INTO tickets VALUES (2, 2, 2, SYSTIMESTAMP, 'Cerrado');
INSERT INTO tickets VALUES (3, 3, 3, SYSTIMESTAMP, 'Abierto');
INSERT INTO tickets VALUES (4, 4, 4, SYSTIMESTAMP, 'Abierto');
INSERT INTO tickets VALUES (5, 5, 5, SYSTIMESTAMP, 'Cerrado');
INSERT INTO tickets VALUES (6, 6, 6, SYSTIMESTAMP, 'Abierto');
INSERT INTO tickets VALUES (7, 7, 7, SYSTIMESTAMP, 'Cerrado');
INSERT INTO tickets VALUES (8, 8, 8, SYSTIMESTAMP, 'Abierto');
INSERT INTO tickets VALUES (9, 9, 9, SYSTIMESTAMP, 'Cerrado');
INSERT INTO tickets VALUES (10, 10, 10, SYSTIMESTAMP, 'Abierto');


CREATE TABLE chat_ia (
 chat_id NUMBER PRIMARY KEY,
 ticket_id NUMBER,
 mensaje VARCHAR2(300),
 quien VARCHAR2(20),
 fecha TIMESTAMP DEFAULT SYSTIMESTAMP,
 FOREIGN KEY (ticket_id) REFERENCES tickets(ticket_id)
);


INSERT INTO chat_ia VALUES (1, 1, 'Hola, ¿puedes describir el problema?', 'IA',
SYSTIMESTAMP);
INSERT INTO chat_ia VALUES (2, 1, 'No enciende mi computadora', 'usuario',
SYSTIMESTAMP);
INSERT INTO chat_ia VALUES (3, 2, '¿Tienes el router conectado?', 'IA', SYSTIMESTAMP);
INSERT INTO chat_ia VALUES (4, 2, 'Sí, pero no hay señal', 'usuario', SYSTIMESTAMP);
INSERT INTO chat_ia VALUES (5, 3, '¿Te sale algún código de error?', 'IA',
SYSTIMESTAMP);
INSERT INTO chat_ia VALUES (6, 4, '¿Ya revisaste el papel en la impresora?', 'IA',
SYSTIMESTAMP);
INSERT INTO chat_ia VALUES (7, 5, 'Se detectó un virus, actualizando antivirus.', 'IA',
SYSTIMESTAMP);
INSERT INTO chat_ia VALUES (8, 6, '¿Qué aplicación va lenta?', 'IA', SYSTIMESTAMP);
INSERT INTO chat_ia VALUES (9, 7, 'Reinstala la app y reinicia.', 'IA', SYSTIMESTAMP);
INSERT INTO chat_ia VALUES (10, 8, 'Prueba otro puerto USB.', 'IA', SYSTIMESTAMP);


CREATE TABLE soluciones (
 solucion_id NUMBER PRIMARY KEY,
 ticket_id NUMBER,
 solucion_texto VARCHAR2(300),
 aplicada_por VARCHAR2(20),
 fecha TIMESTAMP DEFAULT SYSTIMESTAMP,
 FOREIGN KEY (ticket_id) REFERENCES tickets(ticket_id)
);


INSERT INTO soluciones VALUES (1, 1, 'Se cambió la fuente de poder.', 'Técnico',
SYSTIMESTAMP);
INSERT INTO soluciones VALUES (2, 2, 'Se reinició el módem.', 'IA', SYSTIMESTAMP);
INSERT INTO soluciones VALUES (3, 3, 'Actualización de drivers.', 'IA', SYSTIMESTAMP);
INSERT INTO soluciones VALUES (4, 4, 'Colocación de nuevo cartucho.', 'Técnico',
SYSTIMESTAMP);
INSERT INTO soluciones VALUES (5, 5, 'Limpieza de archivos infectados.', 'IA',
SYSTIMESTAMP);
INSERT INTO soluciones VALUES (6, 6, 'Optimización del sistema.', 'IA', SYSTIMESTAMP);
INSERT INTO soluciones VALUES (7, 7, 'Actualización del software.', 'Técnico',
SYSTIMESTAMP);
INSERT INTO soluciones VALUES (8, 8, 'Cambio de puerto USB.', 'IA', SYSTIMESTAMP);
INSERT INTO soluciones VALUES (9, 9, 'Revisión del teclado.', 'Técnico', SYSTIMESTAMP);
INSERT INTO soluciones VALUES (10, 10, 'Reset de credenciales.', 'IA', SYSTIMESTAMP);

-- EJERCICIOS VISTAS NORMALES -- 

--Vista 1 Normal--
CREATE OR REPLACE VIEW vista_1 AS SELECT u.nombre AS nombre_usuario, i.descripcion AS descripcion_incidente, t.estado AS estado_ticket FROM usuarios u JOIN tickets t ON u.usuario_id=t.usuario_id JOIN incidentes i ON t.incidente_id= i.incidente_id WHERE t.estado='Abierto';


--Select antes de pasarlo a vista--
SELECT u.nombre AS nombre_usuario, i.descripcion AS descripcion_incidente,  t.estado FROM tickets t JOIN usuarios u ON t.usuario_id = u.usuario_id JOIN incidentes i ON t.incidente_id = i.incidente_id WHERE  t.estado = 'Abierto';


--Select pero diferente ()--

SELECT u.nombre AS nombre_usuario, i.descripcion AS descripcion_incidente, t.estado AS estado_ticket FROM usuarios u JOIN tickets t ON u.usuario_id=t.usuario_id JOIN incidentes i ON t.incidente_id= i.incidente_id WHERE t.estado='Abierto';

SELECT * FROM vista_1;

--Vista 2 Normal--

CREATE OR REPLACE VIEW vista_historial_chat AS SELECT usuario.nombre AS Nombre, chat.mensaje AS mensaje, chat.quien AS Quien_Lo_Dijo, chat.fecha AS Fecha FROM usuarios usuario JOIN tickets ticket ON usuario.usuario_id = ticket.usuario_id JOIN chat_ia chat ON ticket.ticket_id= chat.ticket_id;


--antes de pasarlo a vista--
SELECT u.nombre AS nombre_usuario, c.mensaje, c.quien, c.fecha FROM  chat_ia c JOIN tickets t ON c.ticket_id = t.ticket_id JOIN usuarios u ON t.usuario_id = u.usuario_id;

--Diferente--
SELECT usuario.nombre AS Nombre, chat.mensaje AS mensaje, chat.quien AS Quien_Lo_Dijo, chat.fecha AS Fecha FROM usuarios usuario JOIN tickets ticket ON usuario.usuario_id = ticket.usuario_id JOIN chat_ia chat ON ticket.ticket_id= chat.ticket_id;

SELECT * FROM chat_ia;

SELECT * FROM tickets;

SELECT * FROM usuarios;

--Vista 3 Normal

CREATE OR REPLACE VIEW vista_soluciones_ia AS
SELECT 
    s.ticket_id,
    i.descripcion AS descripcion_incidente,
    s.solucion_texto
FROM 
    soluciones s
    JOIN tickets t ON s.ticket_id = t.ticket_id
    JOIN incidentes i ON t.incidente_id = i.incidente_id
WHERE 
    s.aplicada_por = 'IA';

--PERMISOS--
GRANT DBA TO C##ACTIVIDAD_12;

GRANT CREATE MATERIALIZED VIEW TO C##ACTIVIDAD_12;
GRANT QUERY REWRITE TO C##ACTIVIDAD_12;





/* VISTA MATERIALIZADA */

--Vista materializada de tickets cerrados con usuario y criticidad--

CREATE MATERIALIZED VIEW mv_tickets_cerrados
REFRESH COMPLETE ON DEMAND
AS
SELECT t.ticket_id, u.nombre AS usuario, i.criticidad
FROM tickets t
JOIN usuarios u ON t.usuario_id = u.usuario_id
JOIN incidentes i ON t.incidente_id = i.incidente_id
WHERE t.estado = 'Cerrado';




--Vista materializada de soluciones aplicadas por técnicos--

CREATE MATERIALIZED VIEW mv_soluciones_tecnicos
REFRESH COMPLETE ON DEMAND
AS
SELECT s.solucion_id, t.ticket_id, s.solucion_texto, s.fecha
FROM soluciones s
JOIN tickets t ON s.ticket_id = t.ticket_id
WHERE s.aplicada_por = 'Técnico';




--Vista materializada de tickets por criticidad--

CREATE MATERIALIZED VIEW mv_tickets_por_criticidad
REFRESH COMPLETE ON DEMAND
AS
SELECT 
    i.criticidad,
    SUM(CASE WHEN t.estado = 'Abierto' THEN 1 ELSE 0 END) AS tickets_abiertos,
    SUM(CASE WHEN t.estado = 'Cerrado' THEN 1 ELSE 0 END) AS tickets_cerrados
FROM tickets t
JOIN incidentes i ON t.incidente_id = i.incidente_id
GROUP BY i.criticidad;




/*Triggers*/

--Trigger para mensaje al insertar solución--
CREATE OR REPLACE TRIGGER tr_solucion_chat
AFTER INSERT ON soluciones
FOR EACH ROW
BEGIN
    INSERT INTO chat_ia (chat_id, ticket_id, mensaje, quien, fecha)
    VALUES (chat_seq.NEXTVAL, :NEW.ticket_id, 'Solución aplicada: ' || :NEW.solucion_texto, 'IA', SYSTIMESTAMP);
END;
/

INSERT INTO SOLUCIONES VALUES (11, 5, 'Cambio de disco duro', 'Técnico', SYSTIMESTAMP);
SELECT * FROM SOLUCIONES;
SELECT * FROM TICKETS;
SELECT * FROM CHAT_IA;


--Trigger para mensaje al cerrar ticket--

CREATE OR REPLACE TRIGGER tr_cierre_ticket
AFTER UPDATE ON tickets
FOR EACH ROW
WHEN (NEW.estado = 'Cerrado' AND OLD.estado != 'Cerrado')
BEGIN
    INSERT INTO chat_ia (chat_id, ticket_id, mensaje, quien, fecha)
    VALUES (chat_seq.NEXTVAL, :NEW.ticket_id, 'Ticket cerrado', 'IA', SYSTIMESTAMP);
END;
/

CREATE SEQUENCE chat_seq
START WITH 11
INCREMENT BY 1
nocache;


SELECT * FROM CHAT_IA ;

UPDATE TICKETS 
SET estado = 'Cerrado'
WHERE TICKET_ID = 10;

--Trigger para validar estado del ticket--

CREATE OR REPLACE TRIGGER tr_validar_estado_ticket
BEFORE INSERT ON tickets
FOR EACH ROW
BEGIN
    IF :NEW.estado NOT IN ('Abierto', 'Cerrado') THEN
        RAISE_APPLICATION_ERROR(-20001, 'El estado del ticket solo puede ser "Abierto" o "Cerrado"');
    END IF;
END;
/

INSERT INTO tickets
VALUES (11, 5 , 10, systimestamp, 'pendiente');

SELECT * FROM tickets;

/*Funciones*/

--Función para estado del ticket--

CREATE OR REPLACE FUNCTION fn_estado_ticket(p_ticket_id IN NUMBER)
RETURN VARCHAR2
IS
    v_estado VARCHAR2(20);
BEGIN
    SELECT estado INTO v_estado
    FROM tickets
    WHERE ticket_id = p_ticket_id;
    
    RETURN v_estado;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'No existe';
END;
/




--Función para contar tickets por usuario--

CREATE OR REPLACE FUNCTION fn_total_tickets_usuario(p_usuario_id IN NUMBER)
RETURN NUMBER
IS
    v_total NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_total
    FROM tickets
    WHERE usuario_id = p_usuario_id;
    
    RETURN v_total;
END;
/




--Función para información concatenada del ticket--

CREATE OR REPLACE FUNCTION fn_info_ticket(p_ticket_id IN NUMBER)
RETURN VARCHAR2
IS
    v_resultado VARCHAR2(500);
BEGIN
    SELECT 'Usuario: ' || u.nombre || ' - Incidente: ' || i.descripcion || ' - Estado: ' || t.estado
    INTO v_resultado
    FROM tickets t
    JOIN usuarios u ON t.usuario_id = u.usuario_id
    JOIN incidentes i ON t.incidente_id = i.incidente_id
    WHERE t.ticket_id = p_ticket_id;
    
    RETURN v_resultado;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'Ticket no encontrado';
END;
/




/* Procedimientos*/

-- Procedimiento para insertar nuevo ticket--

CREATE OR REPLACE PROCEDURE sp_insertar_ticket(
    p_usuario_id IN NUMBER,
    p_incidente_id IN NUMBER,
    p_estado IN VARCHAR2 DEFAULT 'Abierto'
)
IS
BEGIN
    INSERT INTO tickets (ticket_id, usuario_id, incidente_id, estado)
    VALUES (ticket_seq.NEXTVAL, p_usuario_id, p_incidente_id, p_estado);
    
    COMMIT;
END;
/




--Procedimiento para cerrar ticket--


CREATE OR REPLACE PROCEDURE sp_cerrar_ticket(p_ticket_id IN NUMBER)
IS
BEGIN
    UPDATE tickets
    SET estado = 'Cerrado'
    WHERE ticket_id = p_ticket_id;
    
    COMMIT;
END;
/




--Procedimiento para insertar solución--

CREATE OR REPLACE PROCEDURE sp_insertar_solucion(
    p_ticket_id IN NUMBER,
    p_solucion_texto IN VARCHAR2,
    p_aplicada_por IN VARCHAR2
)
IS
BEGIN
    INSERT INTO soluciones (solucion_id, ticket_id, solucion_texto, aplicada_por)
    VALUES (solucion_seq.NEXTVAL, p_ticket_id, p_solucion_texto, p_aplicada_por);
    
    COMMIT;
END;
/




/*INNER JOIN*/

--Usuarios con estado de ticket--
SELECT u.nombre, t.estado
FROM tickets t
INNER JOIN usuarios u ON t.usuario_id = u.usuario_id;




--Tickets con criticidad y usuario--

SELECT t.ticket_id, i.criticidad, u.nombre
FROM tickets t
INNER JOIN incidentes i ON t.incidente_id = i.incidente_id
INNER JOIN usuarios u ON t.usuario_id = u.usuario_id;




--Chats con soluciones--

SELECT c.mensaje, c.quien, s.solucion_texto
FROM chat_ia c
INNER JOIN soluciones s ON c.ticket_id = s.ticket_id;




/*LEFT JOIN*/


--Todos los usuarios con estado de ticket--

SELECT u.nombre, t.estado
FROM usuarios u
LEFT JOIN tickets t ON u.usuario_id = t.usuario_id;




--Incidentes con estado de ticket--

SELECT i.descripcion, t.estado
FROM incidentes i
LEFT JOIN tickets t ON i.incidente_id = t.incidente_id;




--Tickets con soluciones--

SELECT t.ticket_id, s.solucion_texto
FROM tickets t
LEFT JOIN soluciones s ON t.ticket_id = s.ticket_id;




/*RIGHT JOIN*/


--Tickets con usuarios (incluyendo sin usuario)--

SELECT t.ticket_id, u.nombre
FROM usuarios u
RIGHT JOIN tickets t ON u.usuario_id = t.usuario_id;




--Chats con estado de ticket--

SELECT c.mensaje, t.estado
FROM tickets t
RIGHT JOIN chat_ia c ON t.ticket_id = c.ticket_id;




--Soluciones con usuarios--

SELECT s.solucion_texto, u.nombre
FROM usuarios u
RIGHT JOIN tickets t ON u.usuario_id = t.usuario_id
RIGHT JOIN soluciones s ON t.ticket_id = s.ticket_id;




/*FULL OUTER JOIN*/

--Usuarios y tickets completos--

SELECT u.usuario_id, t.ticket_id
FROM usuarios u
FULL OUTER JOIN tickets t ON u.usuario_id = t.usuario_id;




--Incidentes y tickets completos--

SELECT i.incidente_id, t.ticket_id
FROM incidentes i
FULL OUTER JOIN tickets t ON i.incidente_id = t.incidente_id;




--Soluciones y chats completos--

SELECT s.solucion_id, c.chat_id
FROM soluciones s
FULL OUTER JOIN chat_ia c ON s.ticket_id = c.ticket_id;