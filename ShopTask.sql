SHOW DATABASES;
#CREATE DATABASE onlineShop;

DROP SCHEMA IF EXISTS onlineshop;
CREATE SCHEMA onlineshop ;
USE onlineshop;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS orderlines;

CREATE TABLE customers(
  customer_id int NOT NULL AUTO_INCREMENT,
  f_name varchar(60) NOT NULL,
  l_name varchar(60) NOT NULL,
  email varchar(120) NOT NULL,
  phone varchar(11) NOT NULL,
  postcode varchar(8) NOT NULL,
  PRIMARY KEY (customer_id)
);

CREATE TABLE products(
  product_id int NOT NULL AUTO_INCREMENT,
  title varchar(60) NOT NULL,
  price float NOT NULL,
  stock int NOT NULL,
  PRIMARY KEY (product_id)
);

CREATE TABLE orderlines(
  orderline_id int NOT NULL AUTO_INCREMENT,
  product_id int NOT NULL,
  order_id int NOT NULL,
  PRIMARY KEY (orderline_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
  #FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

CREATE TABLE orders(
  order_id int NOT NULL AUTO_INCREMENT,
  customer_id int NOT NULL,
  orderline_id int NOT NULL,
  PRIMARY KEY (order_id),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
  FOREIGN KEY (orderline_id) REFERENCES orderlines(orderline_id)
);

ALTER TABLE orderlines
ADD CONSTRAINT order_id
FOREIGN KEY (order_id) REFERENCES orders(order_id);

INSERT INTO customers (f_name, l_name,  email, phone, postcode)
	VALUES ('James', 'McBean', 'McBean@gmail.com', '07946522252' , 'GT76 8YW');
INSERT INTO customers (f_name, l_name,  email, phone, postcode)
	VALUES ('Hairy', 'Potty', 'HPotty@gmail.com', '07854891214', 'HW1 0YT' );
INSERT INTO customers (f_name, l_name,  email, phone, postcode)
	VALUES ('Conor',' Maguire', 'CMag@gmail.com', '07454492112', 'IR7 9QL');
INSERT INTO customers (f_name, l_name,  email, phone, postcode)
	VALUES ('Dave','Baptista', 'DBap@gmail.com', '07954130015', 'AM2 2UO' );
INSERT INTO customers (f_name, l_name,  email, phone, postcode)
	VALUES ('Ray','Mystics', 'MysticRay@gmail.com', '07494579513','IT99 3YZ');
    
SELECT * FROM customers;

INSERT INTO products (title, price, stock)
	VALUES ('16GB RAM', 24.99, 25 );
INSERT INTO products (title, price, stock)
	VALUES ('2TB Hard Drive', 54.99, 225 );
INSERT INTO products (title, price, stock)
	VALUES ('Webcam', 29.99, 125 );
INSERT INTO products (title, price, stock)
	VALUES ('Keyboard', 29.99, 175 );
INSERT INTO products (title, price, stock)
	VALUES ('HDMI 2m Cable', 39.99, 292 );
    
SELECT * FROM products;

SET FOREIGN_KEY_CHECKS=0;
INSERT INTO orderlines (product_id, order_id)
	VALUES (1,1);
INSERT INTO orderlines (product_id, order_id)
	VALUES (1,4);
INSERT INTO orderlines (product_id, order_id)
	VALUES (2,3);
INSERT INTO orderlines (product_id, order_id)
	VALUES (2,5);
INSERT INTO orderlines (product_id, order_id)
	VALUES (3,1);
INSERT INTO orderlines (product_id, order_id)
	VALUES (3,3);
INSERT INTO orderlines (product_id, order_id)
	VALUES (4,5);
INSERT INTO orderlines (product_id, order_id)
	VALUES (4,3);
INSERT INTO orderlines (product_id, order_id)
	VALUES (5,1);
INSERT INTO orderlines (product_id, order_id)
	VALUES (5,2);

SELECT * FROM orderlines;

INSERT INTO orders(customer_id, orderline_id)
	VALUES (1,2);
INSERT INTO orders(customer_id, orderline_id)
	VALUES (1,4);
INSERT INTO orders(customer_id, orderline_id)
	VALUES (2,1);
INSERT INTO orders(customer_id, orderline_id)
	VALUES (2,2);
INSERT INTO orders(customer_id, orderline_id)
	VALUES (3,5);
INSERT INTO orders(customer_id, orderline_id)
	VALUES (3,3);
INSERT INTO orders(customer_id, orderline_id)
	VALUES (4,4);
INSERT INTO orders(customer_id, orderline_id)
	VALUES (4,3);
INSERT INTO orders(customer_id, orderline_id)
	VALUES (5,1);
INSERT INTO orders(customer_id, orderline_id)
	VALUES (5,2);
    
SELECT * FROM orders;
SET FOREIGN_KEY_CHECKS=1;

SELECT f_name, l_name, COUNT(o.order_id) AS Number_of_Order FROM orders o JOIN customers c ON o.customer_id=c.customer_id 
JOIN orderlines ol ON ol.order_id=o.order_id;

SELECT * FROM orders WHERE order_id = (SELECT order_id FROM orderlines WHERE product_id = 2 LIMIT 5); 

SELECT COUNT(product_id) AS Orders FROM orderlines WHERE product_id = (SELECT product_id FROM products WHERE title = 'Webcam'); 

SELECT * FROM products ORDER BY stock DESC;

SELECT title,  ROUND(price* stock, 2) AS Inventory_Value FROM products;

SET SQL_SAFE_UPDATES = 0;
SET FOREIGN_KEY_CHECKS=0;
DELETE FROM customers WHERE f_Name='Ray';
DELETE FROM products WHERE title ='Webcam';

SET SQL_SAFE_UPDATES = 0;
SET FOREIGN_KEY_CHECKS=0;
