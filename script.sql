-- creacion base de datos // creating database
CREATE DATABASE prueba;

-- acceso a la base de datos // access to database
\c prueba

-- creacion de tabla clientes // creating tables customers
CREATE TABLE customers (
  id_customer SERIAL PRIMARY KEY,
  name_customer VARCHAR(40) NOT NULL,
  rut VARCHAR(20) NOT NULL UNIQUE,
  adress VARCHAR(100)
);

-- creacion de la tabla facturas // creating table invoices
CREATE TABLE invoices (
  invoice_number SERIAL PRIMARY KEY,
  id_customer INT NOT NULL REFERENCES customers(id_customer),
  invoice_date DATE NOT NULL,
  subtotal INT NOT NULL,
  iva FLOAT NOT NULL,
  final_price FLOAT NOT NULL
);

-- creacion de la tabla categorias // creating table categories
CREATE TABLE categories (
  id_category SERIAL PRIMARY KEY,
  category_name VARCHAR(30) NOT NULL UNIQUE,
  category_description VARCHAR(100)
);

-- creacion de la tabla productos // creating table products
CREATE TABLE products (
  id_product SERIAL PRIMARY KEY,
  id_category INT NOT NULL REFERENCES categories(id_category),
  product_name VARCHAR(30) NOT NULL,
  product_description VARCHAR(100),
  unit_value INT NOT NULL
);

-- creacion de la tabla listado de productos // creating table product_listing
CREATE TABLE invoices_list(
id_invoice INT NOT NULL REFERENCES invoices(invoice_number),
id_product INT NOT NULL REFERENCES products(id_product),
amount INT DEFAULT 1
);


-- asignado valores a las tablas // Assign values to tables

-- asignado valores a la tabla clientes // Assign values in to table customers
INSERT INTO customers(name_customer,rut,adress) VALUES
('Mauricio Yarad','rut cliente 1','su casa 124'),
('Diego Grandon','rut cliente 2','su casa 126'),
('Pablo Jacobi','rut cliente 3','al otro lado 69'),
('Juan Jose Rojas','rut cliente 4','en la esquina 101'),
('Nicolas Larrere','rut cliente 5','por debajo 102')
;

-- asignado valores a la tabla categorias // Assign values in to table categories
INSERT INTO categories(category_name, category_description) VALUES 
('computacion','articulos de electronica'),
('audio','parlantes y audifonos'),
('videojuegos','consolas y juegos')
;

-- asignado valores a la tabla productos // Assign values in to table products
INSERT INTO products(id_category, product_name, product_description, unit_value) VALUES 
(1, 'notebook','marca chancho', 950000),
(2, 'parlante bluetooth','sumergible', 40000),
(3, 'switch neon','consola de Nintendo', 350000),
(1, 'tarjeta de video','MasterRace aplicada', 800000),
(2, 'audifonos de estudio','conector usb', 180000),
(3, 'PlayStation 5','AGOTADA', 550000),
(3, 'Super Smash Bros Ultimate','Juego de Switch', 55000),
(3, 'TLOZ Breath of the wild 2','Juego de Switch', 55000)
;

-- asignado valores a la tabla de facturas // Assign values in to table invoices
INSERT INTO invoices(id_customer, invoice_date, subtotal, iva, final_price) VALUES 
(1,'2021-01-09', 1050000, 0.19, 1249500),
(1,'2021-01-15', 165000, 0.19, 196350),
(2,'2021-02-02', 2850000, 0.19, 3391500),
(2,'2021-02-20', 360000, 0.19, 428400),
(2,'2021-02-22', 2400000, 0.19, 2856000),
(3,'2021-03-11', 550000, 0.19, 654500),
(4,'2021-03-11', 80000, 0.19, 95200),
(4,'2021-03-12', 1050000, 0.19, 1249500),
(4,'2021-03-22', 900000, 0.19, 1071000),
(4,'2021-04-08', 55000, 0.19, 65450)
;

-- asignado valores a la tabla de listado de productos // Assign values in to table product listing
INSERT INTO invoices_list(id_invoice, id_product, amount) VALUES 
(1, 3, 2),
(2, 7, 3),
(3, 1, 3),
(4, 5, 2),
(5, 4, 3),
(6, 6, 1),
(7, 2, 2),
(8, 3, 3),
(9, 5, 4),
(10, 8, 1)
;