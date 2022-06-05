CREATE TABLE orders (
	id INT NOT NULL AUTO_INCREMENT,
    total INT NOT NULL,
    order_date  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
) ENGINE = InnoDB;

CREATE TABLE orders_detail (
	id_product VARCHAR(10) NOT NULL,
    id_order INT NOT NULL,
    price INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (id_product, id_order)
) ENGINE = InnoDB;

ALTER TABLE orders_detail ADD FOREIGN KEY (id_product) REFERENCES products (id), ADD FOREIGN KEY (id_order) REFERENCES orders (id);

SHOW CREATE TABLE orders_detail;

DESC orders;

INSERT INTO orders (total) VALUES (10000);

INSERT INTO orders (total) VALUES (10000);

SELECT * FROM orders;
SELECT * FROM products;
SELECT * FROM orders_detail;

INSERT INTO orders_detail (id_product, id_order, price, quantity) VALUES ('P0001', 1, 20000, 1), ('P0002', 1, 10000, 20);

INSERT INTO orders_detail (id_product, id_order, price, quantity) VALUES ('P0003', 2, 20000, 1), ('P0004', 2, 10000, 20);

INSERT INTO orders_detail (id_product, id_order, price, quantity) VALUES ('P0005', 3, 20000, 1), ('P0006', 3, 10000, 20);

SELECT * FROM orders JOIN orders_detail ON (orders_detail.id_order = orders.id) JOIN products ON (products.id = orders_detail.id_product);
