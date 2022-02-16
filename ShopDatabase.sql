CREATE DATABASE shop;
USE shop;

CREATE TABLE users (
user_id int AUTO_INCREMENT,
first_name varchar(255) NOT NULL,
last_name varchar(255) NOT NULL,
address varchar(255) NOT NULL,
PRIMARY KEY(user_id)
);

CREATE TABLE products (
product_id int AUTO_INCREMENT,
name varchar(255) NOT NULL,
price dec(5,2) NOT NULL,
quantity varchar(255) NOT NULL,
PRIMARY KEY(product_id)
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT,
    fk_user_id INT NOT NULL,
    PRIMARY KEY (order_id),
    date_placed date NOT NULL,
	total dec(5,2) NOT NULL,
    FOREIGN KEY (fk_user_id) REFERENCES users (user_id)
);

CREATE TABLE orderline (
    orderline_id INT AUTO_INCREMENT,
    fk_order_id INT NOT NULL,
    fk_product_id INT NOT NULL,
    PRIMARY KEY (orderline_id),
    FOREIGN KEY (fk_order_id) REFERENCES orders (order_id),
    FOREIGN KEY (fk_product_id) REFERENCES products (product_id)
);

INSERT INTO users (first_name, last_name, address)
VALUES ("Michelle", "Anton John", "12 The Alders, TW5 0HP");
DESCRIBE users;

INSERT INTO users (first_name, last_name, address)
VALUES ("Mike", "Ginger", "53 Box Lane, ULG 6NT");

INSERT INTO users (first_name, last_name, address)
VALUES ("Tom", "Ramsey", "115 Widow Lane, LQ3 3GP");

INSERT INTO users (first_name, last_name, address)
VALUES ("Jane", "Cowell", "9 Winchester Road, PL3 0FT");

INSERT INTO users (first_name, last_name, address)
VALUES ("Lisa", "Margo", "45 Goat Road, XD4 9QP");

INSERT INTO products (name, price, quantity)
VALUES ("Kitkat", 1.59, 16);

INSERT INTO products (name, price, quantity)
VALUES ("Snickers", 1.09, 24);

INSERT INTO products (name, price, quantity)
VALUES ("Twix", 0.60, 48);

INSERT INTO products (name, price, quantity)
VALUES ("Chocolate digestives", 1.25, 9);

INSERT INTO products (name, price, quantity)
VALUES ("Chocolate cake", 3.50, 4);

SELECT * FROM users;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM orderline;

INSERT INTO orders (fk_user_id, date_placed, total)
VALUES (1, '2022.01.20' , 2.94);

INSERT INTO orders (fk_user_id, date_placed, total)
VALUES (2, '2021.11.12' , 1.69);

INSERT INTO orders (fk_user_id, date_placed, total)
VALUES (3, '2021.12.03' , 2.89);

INSERT INTO orders (fk_user_id, date_placed, total)
VALUES (4, '2022.01.25' , 8.14);

INSERT INTO orders (fk_user_id, date_placed, total)
VALUES (5, '2022.01.10' , 6.18);

INSERT INTO orderline (fk_order_id, fk_product_id )
VALUES (1,2);
INSERT INTO orderline (fk_order_id, fk_product_id )
VALUES (1,3);
INSERT INTO orderline (fk_order_id, fk_product_id )
VALUES (1,4);

INSERT INTO orderline (fk_order_id, fk_product_id )
VALUES (2,2);
INSERT INTO orderline (fk_order_id, fk_product_id )
VALUES (2,3);

INSERT INTO orderline (fk_order_id, fk_product_id )
VALUES (3,1);
INSERT INTO orderline (fk_order_id, fk_product_id )
VALUES (3,2);
INSERT INTO orderline (fk_order_id, fk_product_id )
VALUES (3,4);

INSERT INTO orderline (fk_order_id, fk_product_id )
VALUES (4,1);
INSERT INTO orderline (fk_order_id, fk_product_id )
VALUES (4,5);
INSERT INTO orderline (fk_order_id, fk_product_id )
VALUES (4,3);
INSERT INTO orderline (fk_order_id, fk_product_id )
VALUES (4,3);
INSERT INTO orderline (fk_order_id, fk_product_id )
VALUES (4,3);
INSERT INTO orderline (fk_order_id, fk_product_id )
VALUES (4,4);

INSERT INTO orderline (fk_order_id, fk_product_id )
VALUES (5,1);
INSERT INTO orderline (fk_order_id, fk_product_id )
VALUES (5,2);
INSERT INTO orderline (fk_order_id, fk_product_id )
VALUES (5,5);

UPDATE products SET price='0.60' WHERE price='0.50';
UPDATE products SET price='3.50' WHERE price='4.50';
UPDATE orders SET total='2.94' WHERE total='1.69';
UPDATE orders SET total='2.89' WHERE total='1.69' AND fk_user_id =1;
UPDATE orders SET date_placed='2021.11.02' WHERE date_placed='2022.01.20';
UPDATE users SET first_name='Michael' WHERE first_name='Mike';
SET SQL_SAFE_UPDATES=1;

SELECT Name, price FROM products WHERE price >=1 ORDER BY price ASC; 
SELECT * FROM users ORDER BY first_name ASC; 
SELECT * FROM orders ORDER BY date_placed DESC; 
SELECT Name, quantity FROM products WHERE quantity <=10 ORDER BY price ASC; 

SELECT *
FROM users
JOIN orders
ON users.user_id = orders.fk_user_id
WHERE orders.total>= 2 ORDER BY total DESC LIMIT 5;

SELECT COUNT(orderline_id) FROM orderline;
SELECT COUNT(user_id) FROM users;

SELECT *
FROM orderline
JOIN products
ON products.product_id = orderline.fk_product_id;

SELECT Name, price
FROM products
WHERE price=(
    SELECT MIN(price)
    FROM products
);

SELECT Name, price
FROM products
WHERE price=(
    SELECT MAX(price)
    FROM products
);

SELECT COUNT(orderline_id) FROM orderline WHERE fk_product_id  LIKE "5";

SET SQL_SAFE_UPDATES=0;

DELETE FROM orderline WHERE fk_order_id = 2;
DELETE FROM orderline WHERE fk_product_id = 5;
DELETE FROM orders WHERE fk_user_id = 3;
DELETE FROM users WHERE user_id = 3;
DELETE FROM products WHERE price <= 1;
SET FOREIGN_KEY_CHECKS=1;

CREATE TABLE reviews (
    review_id INT AUTO_INCREMENT,
    fk_order_id INT NOT NULL,
    fk_product_id INT NOT NULL,
    fk_user_id INT NOT NULL,
    PRIMARY KEY (review_id),
    FOREIGN KEY (fk_order_id) REFERENCES orders (order_id),
    FOREIGN KEY (fk_product_id) REFERENCES products (product_id),
    FOREIGN KEY (fk_user_id) REFERENCES users (user_id),
    description varchar(255) NOT NULL,
	starts int NOT NULL
);
