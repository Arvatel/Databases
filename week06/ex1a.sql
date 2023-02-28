CREATE TABLE price_t (
  itemId INTEGER PRIMARY KEY,
  itemName VARCHAR(15),
  price REAL
);

CREATE TABLE customer_t (
  customerId INTEGER PRIMARY KEY,
  customerName VARCHAR(15),
  city VARCHAR(15)
);

CREATE TABLE order_date_t (
  orderId INT PRIMARY KEY,
  customerId INT,
  date DATE
);

CREATE TABLE  receipt_t (
  orderId INT,
  itemId INTEGER,
  quantity INT,
  PRIMARY KEY (orderId, itemId)
);

INSERT INTO order_date_t VALUES ('2301', '101', '2011-02-23');
INSERT INTO order_date_t VALUES ('2302', '107', '2012-02-25');
INSERT INTO order_date_t VALUES ('2303', '110', '2011-11-27');

INSERT INTO receipt_t VALUES ('2301', '3786', '3');
INSERT INTO receipt_t VALUES ('2301', '4011', '6');
INSERT INTO receipt_t VALUES ('2301', '9132', '8');
INSERT INTO receipt_t VALUES ('2302', '5794', '4');
INSERT INTO receipt_t VALUES ('2303', '4011', '2');
INSERT INTO receipt_t VALUES ('2303', '3141', '2');

INSERT INTO price_t VALUES ('3786', 'Net', '35.00');
INSERT INTO price_t VALUES ('4011', 'Racket', '65.00');
INSERT INTO price_t VALUES ('9132', 'Pack-3', '4.75');
INSERT INTO price_t VALUES ('5794', 'Pack-6', '5.00');
INSERT INTO price_t VALUES ('3141', 'Cover', '10.00');

INSERT INTO customer_t VALUES ('101', 'Martin', 'Prague');
INSERT INTO customer_t VALUES ('107', 'Herman', 'Madrid');
INSERT INTO customer_t VALUES ('110', 'Pedro', 'Moscow');
