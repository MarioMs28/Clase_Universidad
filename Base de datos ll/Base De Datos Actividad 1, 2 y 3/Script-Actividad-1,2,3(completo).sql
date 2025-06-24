CREATE TABLE Productos(
Id_Producto integer PRIMARY KEY NOT NULL,
Nombre varchar2(20) NOT NULL,
Precio float NOT NULL,
Descripcion varchar2(200),
Fecha_Ingreso DATE NOT NULL
);

COMMENT ON TABLE productos IS 'Tabla que almacena datos de los Productos.';

COMMENT ON COLUMN productos.Id_Producto IS 'elegi tipo integer porque ese es para numeros enteros, y es para el id 
de el producto.';

COMMENT ON COLUMN Productos.Nombre IS 'use tipo varchar2 porque es para cadena de caracteres 
y es la mejor en comparacion a char y varchar, se usa para el nombre de el producto.';


COMMENT ON COLUMN Productos.Precio IS 'use tipo float porque es para calculos cientificos o matematicos
(devia usar number que es el mas adecuado para este tipo de dato pero apenas me di cuenta) 
 se usa para el precio de el producto.';

COMMENT ON COLUMN Productos.Descripcion IS 'use tipo varchar2 porque es para cadena de caracteres 
y es la mejor en comparacion a char y varchar, se usa para la descripcion de el producto.';

COMMENT ON COLUMN Productos.Fecha_Ingreso IS 'use tipo date para fechas simples 
y lo uso para la fecha de ingreso del producto.';

INSERT INTO productos(Id_Producto, Nombre, Precio, Descripcion, Fecha_Ingreso)
VALUES (1,'Coca Cola', 20 , 'Coca Cola Original De 600 Ml', TO_DATE('23/06/2025','DD/MM/YYYY'));

INSERT INTO productos(Id_Producto, Nombre, Precio, Descripcion, Fecha_Ingreso)
VALUES (2,'Pepsi', 16 , 'Pepsi  De 600 Ml', TO_DATE('23/06/2025','DD/MM/YYYY'));

INSERT INTO productos(Id_Producto, Nombre, Precio, Descripcion, Fecha_Ingreso)
VALUES (3,'Agua Ciel', 20 , 'Agua Ciel De 1.5 Litros', TO_DATE('23/06/2025','DD/MM/YYYY'));

SELECT * FROM productos; 

SELECT Nombre FROM productos WHERE precio < 20;

SELECT Nombre,Descripcion FROM productos WHERE precio=20;

SELECT * FROM productos WHERE precio >=10 AND precio <=20;

CREATE TABLE Proveedores (
Id_Proveedor integer PRIMARY KEY NOT NULL,
Id_Producto	integer NOT NULL,
Nombre varchar2(20) NOT NULL,
Telefono varchar2(20) NOT NULL,
CONSTRAINT Fk_Producto FOREIGN KEY (Id_Producto) REFERENCES productos (Id_Producto)
);

INSERT INTO proveedores (Id_Proveedor, Id_Producto, Nombre,Telefono)
VALUES (1,1,'FEMSA', 555-12);

INSERT INTO proveedores (Id_Proveedor, Id_Producto, Nombre,Telefono)
VALUES (2,2,'PepsiCo', 555-56);

INSERT INTO proveedores (Id_Proveedor, Id_Producto, Nombre,Telefono)
VALUES (3,3,'FEMSA', 555-78);

COMMENT ON TABLE proveedores IS 'La relacion yo la aria alreves, que en la tabla de productos este el id_Producto 
pero como lo hice siguiendo su documento al final me di cuenta que habia que relacionarlas hasta lo ultimo,
 pero a como lo hice quiere decir que cada proveedor puede surtir solo 1 producto y tube que investigar para 
la relacion me di cuenta que al final se hacia la restriccion donde le ponia el nombre de la restriccion,
 despues se pone la clave forania que va a estar compartida en las tablas, y por ultimo la referencia 
de cual es la tabla y la clave forania en la cual esta como principal';

SELECT * FROM proveedores;
