CREATE TABLE Libros(
Id_Libro integer PRIMARY KEY,
Titulo varchar2(100) NOT NULL,
Autor varchar2(100),
Fecha_Publicacion DATE,
Disponible NUMBER(1)
);

INSERT INTO Libros (Id_Libro, Titulo, Autor, Fecha_Publicacion, Disponible)
VALUES (1,'Matematicas I', 'Benito Juarez', TO_DATE('06/04/1943', 'DD/MM/YYYY'), 1);

INSERT INTO Libros (Id_Libro, Titulo, Autor, Fecha_Publicacion, Disponible)
VALUES (2,'Español', 'Jose Leon', TO_DATE('06/04/1943', 'DD/MM/YYYY'), 0);

INSERT INTO Libros (Id_Libro, Titulo, Autor, Fecha_Publicacion, Disponible)
VALUES (3,'Ingles', 'Ramon Valdez', TO_DATE('06/04/1943', 'DD/MM/YYYY'), 0);

INSERT INTO Libros (Id_Libro, Titulo, Autor, Fecha_Publicacion, Disponible)
VALUES (4,'Musica', 'Bethoben Lopez', TO_DATE('06/04/1943', 'DD/MM/YYYY'), 1);

INSERT INTO Libros (Id_Libro, Titulo, Autor, Fecha_Publicacion, Disponible)
VALUES (5,'Geografia', 'Luis Miguel', TO_DATE('06/04/1943', 'DD/MM/YYYY'), 1);

SELECT titulo FROM libros;

SELECT Titulo FROM libros WHERE Disponible =1;

SELECT Titulo,Autor FROM libros ORDER BY titulo ASC;
COMMENT ON TABLE libros IS 'en la consulta de agrupacion basicamente 
le estoy diciendo que me seleccione la columna titulo, autor de libros y me los ordene en titulo por orden 
de la a hasta la z';

UPDATE libros SET Disponible=0 WHERE Id_Libro=1; 

DELETE FROM libros WHERE Id_Libro=2;

SELECT * FROM libros;

