CREATE TABLE wishlist (
	id INT NOT NULL AUTO_INCREMENT,
    id_product VARCHAR(10) NOT NULL,
    description TEXT,
    PRIMARY KEY (id),
    CONSTRAINT fk_wishlist_product FOREIGN KEY (id_product) REFERENCES products (id)
) ENGINE = InnoDB;


SELECT * FROM products;
SELECT * FROM wishlist;

DESCRIBE wishlist;


-- add foreign key
ALTER TABLE wishlist ADD CONSTRAINT fk_wishlist_product FOREIGN KEY (id_product) REFERENCES products (id);

-- delete
ALTER TABLE wishlist DROP CONSTRAINT fk_wishlist_product;

INSERT INTO wishlist (id_product, description) VALUES ('P0001', 'Makanan Kesukaan Anak Saya');
INSERT INTO wishlist (id_product, description) VALUES ('Pxxxx', 'Makanan Kesukaan Mama Saya');


DELETE FROM wishlist WHERE id = 3;

-- behavior foreign key
-- restrict
-- cascade
-- no action
-- set null
ALTER TABLE wishlist ADD CONSTRAINT fk_wishlist_product FOREIGN KEY (id_product) REFERENCES products (id) ON DELETE CASCADE ON UPDATE CASCADE;

INSERT INTO products (id, name, category, price, quantity) VALUES ('Pxxxx', 'Contoh', 'Lain-lain', 1000, 15);

DELETE FROM products WHERE id = 'Pxxxx';


-- join
SELECT * FROM wishlist JOIN products ON (wishlist.id_product = products.id);

SELECT p.id, p.name, p.description, w.description FROM products AS p JOIN wishlist AS w ON (p.id = w.id_product);

ALTER TABLE wishlist MODIFY COLUMN id_customer INT;

ALTER TABLE wishlist ADD CONSTRAINT fk_wishlist_customers FOREIGN KEY(id_customer) REFERENCES customers (id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE wishlist DROP CONSTRAINT fk_wishlist_customers;

SHOW CREATE TABLE customers;
SHOW CREATE TABLE wishlist;

SELECT * FROM wishlist AS w JOIN products AS p ON (w.id_product = p.id) JOIN customers as c ON (w.id_customer = c.id);

