CREATE DATABASE prueba;

\c prueba;

CREATE TABLE cliente(
  id_cliente SERIAL,
  nombre VARCHAR NOT NULL,
  rut INT NOT NULL,
  direccion VARCHAR NOT NULL,
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
