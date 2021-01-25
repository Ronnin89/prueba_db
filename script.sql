-- creacion base de datos // creating database
CREATE DATABASE prueba_db;

-- acceso a la base de datos // access to database
\c prueba_db

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