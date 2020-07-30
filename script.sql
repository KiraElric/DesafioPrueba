--Creacion base de datos y tablas
CREATE DATABASE prueba;

\c prueba;

CREATE TABLE cliente(
  id_cliente SERIAL,
  nombre VARCHAR NOT NULL,
  rut INT NOT NULL,
  direccion VARCHAR,
  PRIMARY KEY (id_cliente)
);

CREATE TABLE categoria(
  id_categoria SERIAL,
  nombre VARCHAR NOT NULL,
  descripcion VARCHAR DEFAULT 'descripcion categoria',
  PRIMARY KEY (id_categoria)
);

CREATE TABLE producto(
  id_producto SERIAL,
  id_categoria INT NOT NULL,
  nombre VARCHAR NOT NULL,
  descripcion VARCHAR DEFAULT 'descripcion producto',
  valor_unitario INT NOT NULL,
  PRIMARY KEY (id_producto),
  FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);

CREATE TABLE factura(
  numero_factura SERIAL,
  id_cliente INT NOT NULL,
  fecha DATE,
  subtotal INT,
  iva FLOAT(2) DEFAULT 1.19,
  precio_total INT,
  PRIMARY KEY (numero_factura),
  FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

CREATE TABLE detalle(
  numero_factura INT NOT NULL,
  id_producto INT NOT NULL,
  cantidad SMALLINT,
  total_producto INT,
  FOREIGN KEY (numero_factura) REFERENCES factura(numero_factura),
  FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

--Insertar registros
-- 5 Clientes
INSERT INTO cliente (nombre,rut,direccion) VALUES ('Kirios Hapteem',10345678,'Avenida Siempreviva 1313');
INSERT INTO cliente (nombre,rut,direccion) VALUES ('Harry Potter',7548236,'Calle falsa 123');
INSERT INTO cliente (nombre,rut,direccion) VALUES ('Satoshi Tajiri',14678456,'Dirtmouth 800');
INSERT INTO cliente (nombre,rut,direccion) VALUES ('Alicia Maravilla',12567345,'Forgotten Crossroads 2000');
INSERT INTO cliente (nombre,rut,direccion) VALUES ('Alucard Tepes',18564351,'Greenpath 3200');

--3 Categorias
INSERT INTO categoria (nombre, descripcion) VALUES ('Model Kits', 'Modelos a escala de robots de series animadas que no vuelan pero se ven lindos');
INSERT INTO categoria (nombre, descripcion) VALUES ('Videojuegos', 'Juegos para diferentes plataformas');
INSERT INTO categoria (nombre, descripcion) VALUES ('Funko POP', 'Articulos de coleccion decorativos');

--8 Productos
INSERT INTO producto (id_categoria,nombre,descripcion, valor_unitario) VALUES (1,'Exia Dark Matter', 'Modelo HG de Build Fighters',14000);
INSERT INTO producto (id_categoria,nombre,descripcion, valor_unitario) VALUES (1,'Jesta Cannon','Modelo HG de Gundam Unicorn',22000);
INSERT INTO producto (id_categoria,nombre,descripcion, valor_unitario) VALUES (2,'Hollow Knight','Videojuego Indie 2D Metroidvania para PC y Switch',6000);
INSERT INTO producto (id_categoria,nombre,descripcion, valor_unitario) VALUES (2, 'Pokemon Shield','Videojuego para Switch',35000);
INSERT INTO producto (id_categoria,nombre,descripcion, valor_unitario) VALUES (2, 'Profesor Layton y la mascara de los milagros','Videojuego de puzzles para Nintendo 3DS',30000);
INSERT INTO producto (id_categoria,nombre,descripcion, valor_unitario) VALUES (3, 'My Hero Academia - Deku','Figura del personaje principal de la serie MHA', 12000);
INSERT INTO producto (id_categoria,nombre,descripcion, valor_unitario) VALUES (3, 'Rescue','Figura de la armadura de Pepper Pots',15000);
INSERT INTO producto (id_categoria,nombre,descripcion, valor_unitario) VALUES (3, 'Daenerys & Drogon','Figura de Daenerys sobre su dragon Drogon',28000);

--10 Facturas
INSERT INTO factura (id_cliente,fecha,subtotal,precio_total) VALUES (1,'2020-03-20',250000,297500);
INSERT INTO factura (id_cliente,fecha,subtotal,precio_total) VALUES (1,'2020-04-15',700000,833000);
INSERT INTO factura (id_cliente,fecha,subtotal,precio_total) VALUES (2,'2020-05-12',480000,571200);
INSERT INTO factura (id_cliente,fecha,subtotal,precio_total) VALUES (2,'2020-05-22',995000,1184050);
INSERT INTO factura (id_cliente,fecha,subtotal,precio_total) VALUES (2,'2020-05-31',590000,702100);
INSERT INTO factura (id_cliente,fecha,subtotal,precio_total) VALUES (3,'2020-06-01',60000,71400);
INSERT INTO factura (id_cliente,fecha,subtotal,precio_total) VALUES (4,'2020-03-05',132000,157080);
INSERT INTO factura (id_cliente,fecha,subtotal,precio_total) VALUES (4,'2020-04-20',260000,309400);
INSERT INTO factura (id_cliente,fecha,subtotal,precio_total) VALUES (4,'2020-06-01',390000,464100);
INSERT INTO factura (id_cliente,fecha,subtotal,precio_total) VALUES (4,'2020-07-15',75000,89250);



INSERT INTO detalle (numero_factura,id_producto,cantidad,total_producto) VALUES (1,1,10,140000);
INSERT INTO detalle (numero_factura,id_producto,cantidad,total_producto) VALUES (1,2,5,110000);
INSERT INTO detalle (numero_factura,id_producto,cantidad,total_producto) VALUES (2,6,10,120000);
INSERT INTO detalle (numero_factura,id_producto,cantidad,total_producto) VALUES (2,7,20,300000);
INSERT INTO detalle (numero_factura,id_producto,cantidad,total_producto) VALUES (2,8,10,280000);
INSERT INTO detalle (numero_factura,id_producto,cantidad,total_producto) VALUES (3,6,10,120000);
INSERT INTO detalle (numero_factura,id_producto,cantidad,total_producto) VALUES (3,7,10,150000);
INSERT INTO detalle (numero_factura,id_producto,cantidad,total_producto) VALUES (3,1,15,210000);
INSERT INTO detalle (numero_factura,id_producto,cantidad,total_producto) VALUES (4,3,20,120000);
INSERT INTO detalle (numero_factura,id_producto,cantidad,total_producto) VALUES (4,4,25,875000);
INSERT INTO detalle (numero_factura,id_producto,cantidad,total_producto) VALUES (5,1,5,70000);
INSERT INTO detalle (numero_factura,id_producto,cantidad,total_producto) VALUES (5,5,8,240000);
INSERT INTO detalle (numero_factura,id_producto,cantidad,total_producto) VALUES (5,8,10,280000);
INSERT INTO detalle (numero_factura,id_producto,cantidad,total_producto) VALUES (6,3,10,60000);
INSERT INTO detalle (numero_factura,id_producto,cantidad,total_producto) VALUES (7,1,6,84000);
INSERT INTO detalle (numero_factura,id_producto,cantidad,total_producto) VALUES (7,6,4,48000);
INSERT INTO detalle (numero_factura,id_producto,cantidad,total_producto) VALUES (8,1,7,98000);
INSERT INTO detalle (numero_factura,id_producto,cantidad,total_producto) VALUES (8,3,12,72000);
INSERT INTO detalle (numero_factura,id_producto,cantidad,total_producto) VALUES (8,5,3,90000);
INSERT INTO detalle (numero_factura,id_producto,cantidad,total_producto) VALUES (9,2,1,22000);
INSERT INTO detalle (numero_factura,id_producto,cantidad,total_producto) VALUES (9,4,4,140000);
INSERT INTO detalle (numero_factura,id_producto,cantidad,total_producto) VALUES (9,6,12,144000);
INSERT INTO detalle (numero_factura,id_producto,cantidad,total_producto) VALUES (9,8,3,84000);
INSERT INTO detalle (numero_factura,id_producto,cantidad,total_producto) VALUES (10,7,5,75000);