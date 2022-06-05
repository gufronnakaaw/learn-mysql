CREATE TABLE categories (
	id VARCHAR(10),
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
) ENGINE = InnoDB;

DESC categories;

ALTER TABLE products ADD COLUMN id_category VARCHAR(10);

ALTER TABLE products ADD FOREIGN KEY (id_category) REFERENCES categories (id);

SELECT * FROM products;
SELECT * FROM categories;

DESC products;

INSERT INTO categories (id, name) VALUES ('C0001', 'Makanan'), ('C0002', 'Minuman'), ('C0003', 'Lain-lain');

UPDATE products SET id_category = 'C0001' WHERE id IN('P0001', 'P0002', 'P0003', 'P0004', 'P0005', 'P0007', 'P0008');

UPDATE products SET id_category = 'C0002' WHERE id = 'P0006';


SELECT p.name, cat.name FROM products AS p JOIN categories AS cat ON (p.id_category = cat.id);
