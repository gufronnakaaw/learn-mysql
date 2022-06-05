CREATE TABLE products (
	id VARCHAR(10) NOT NULL,
	name VARCHAR(100) NOT NULL,
	description TEXT,
	price INT UNSIGNED NOT NULL,
	quantity INT UNSIGNED NOT NULL DEFAULT 0,
	created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE = InnoDB;

DESCRIBE products;

-- insert data
INSERT INTO products (id, name, price, quantity) VALUES ('P0001', 'Mie Ayam Original', 15000, 1000);
INSERT INTO products (id, name, description, price, quantity) VALUES ('P0002', 'Mie Ayam Bakso Tahu', 'Mie Ayam Original + Bakso Tahu', 15000, 1000);
INSERT INTO products (id, name, price, quantity) VALUES 
('P0003', 'Mie Ayam Ceker', 20000, 100),
('P0004', 'Mie Ayam Spesial', 25000, 100),
('P0005', 'Mie Ayam Yamin', 15000, 100);
INSERT INTO products (id, name, category, price, quantity) VALUES ('P0006', 'Es Jeruk Peras', 'Minuman', 5000, 10);

-- get data
SELECT * FROM products;
SELECT id, name, price, quantity FROM products;

-- primary key
ALTER TABLE products ADD PRIMARY KEY (id);

-- where clause
SELECT * FROM products WHERE quantity = 100;
SELECT * FROM products WHERE price = 15000;

-- update
ALTER TABLE products ADD COLUMN category ENUM('Makanan', 'Minuman', 'Lain-lain') AFTER name;
UPDATE products SET category = 'Makanan' WHERE id = 'P0001';
UPDATE products SET category = 'Makanan', description = 'Mie Ayam + Ceker Special' WHERE id = 'P0003';
UPDATE products SET price = price + 5000 WHERE id = 'P0001';
UPDATE products SET category = 'Lain-lain' WHERE id = 'P0005';

-- delete
DELETE FROM products WHERE id = 'P0006';

-- alias
SELECT 
	id AS kode, 
	name AS nama, 
    category AS kategori, 
    description AS deskripsi, 
    price AS harga, 
    quantity AS jumlah 
FROM products;

SELECT 
	p.id AS kode, 
	p.name AS nama, 
    p.category AS kategori, 
    p.description AS deskripsi, 
    p.price AS harga, 
    p.quantity AS jumlah 
FROM products AS p;

-- where operator
SELECT * FROM products WHERE category != 'Makanan';
SELECT * FROM products WHERE id = 'P0006' AND category = 'Minuman';

-- like operator
-- too slow
SELECT * FROM products WHERE name LIKE '%ayam%';
SELECT * FROM products WHERE name LIKE '%mie%';

-- null operator
SELECT * FROM products WHERE description IS NULL;
SELECT * FROM products WHERE description IS NOT NULL;

-- between
SELECT * FROM products WHERE price BETWEEN 10000 AND 20000;
SELECT * FROM products WHERE price NOT BETWEEN 10000 AND 20000;

-- IN operator
SELECT * FROM products WHERE category IN('Makanan', 'Minuman');
SELECT * FROM products WHERE category NOT IN('Makanan', 'Minuman');

-- order by clause
-- mengurutkan data berdasarkan kolom (ASC/DESC)
SELECT * FROM products ORDER BY id DESC;

-- LIMIT clause
SELECT * FROM products LIMIT 3;
-- skip query
SELECT * FROM products LIMIT 0, 3;
SELECT * FROM products LIMIT 3, 3;

-- distinct
-- hapus data duplikat dari hasil query
SELECT DISTINCT category FROM products; 

-- numeric function
SELECT 10 + 10 AS hasil;
SELECT 10, 10, 10 * 10 AS hasil;
SELECT id, name, price, price DIV 1000 AS 'Price in K' FROM products;

-- mathematical function
SELECT PI();
SELECT POWER(10, 2);

-- auto increment
CREATE TABLE admin (
	id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    PRIMARY KEY(id)
) ENGINE = InnoDB;

DESCRIBE admin;

SELECT * FROM admin;

INSERT INTO admin (first_name, last_name) VALUES ('test1', 'test1'), ('test2', 'test2'), ('test3', 'test3');
INSERT INTO admin (first_name, last_name) VALUES ('test4', 'test4');

DELETE FROM admin WHERE id = 2;

-- melihat id terakhir
SELECT LAST_INSERT_ID();

-- string function
SELECT id, LOWER(name) AS 'Name Lower' from products;

SELECT id, name, LENGTH(name) AS 'Name Length' from products;


-- date and time function
SELECT id, EXTRACT(YEAR FROM created_at) AS 'Year', EXTRACT(MONTH FROM created_at) AS 'Month' FROM products;

SELECT id, YEAR(created_at) AS 'Year', MONTH(created_at) AS 'Month' FROM products;

-- flow control function
SELECT id,
		CASE category
			WHEN 'Makanan' THEN 'Enak'
            WHEN 'Minuman' THEN 'Seger'
            ELSE 'Apa itu?'
            END AS 'kategori'
FROM products;

-- if function
SELECT id,
	price,
    IF(price <= 15000, 'Murah', IF(price <= 20000, 'Mahal', 'Mahal Banget')) AS 'Murah/Mahal'
FROM products;

-- if null
SELECT id, name, IFNULL(description, 'Kosong') FROM products;

-- aggregate function
SELECT COUNT(id) AS 'Total Product' FROM products;

SELECT AVG(price) AS 'Rata-Rata' FROM products;

SELECT MAX(price) AS 'Rata-Rata' FROM products;

SELECT SUM(price) AS 'Rata-Rata' FROM products;

-- group by clause
-- hanya bisa di aggregate function
SELECT category, COUNT(id) AS 'Total Product' FROM products GROUP BY category;

SELECT AVG(price) AS 'Rata-Rata', category FROM products GROUP BY category;

SELECT MAX(price) AS 'Rata-Rata', category FROM products GROUP BY category;

SELECT SUM(price) AS 'Rata-Rata', category FROM products GROUP BY category;

-- having clause
SELECT category, COUNT(id) as total FROM products GROUP BY category HAVING total > 1;

-- constraint
CREATE TABLE customers (
	id INT NOT NULL AUTO_INCREMENT,
    email VARCHAR(100) NOT NULL,
    firstname VARCHAR(100) NOT NULL,
    lastname VARCHAR(100) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY email_key (email)
) ENGINE = InnoDB;

DESCRIBE customers;

SELECT * FROM customers;

-- add constraint
ALTER TABLE customers ADD CONSTRAINT email_key UNIQUE (email); 

-- delete constraint
ALTER TABLE customers DROP CONSTRAINT email_key;

INSERT INTO customers (email, firstname, lastname) VALUES ('wildan@mail.com', 'wildan', 'wildan');

INSERT INTO customers (email, firstname, lastname) VALUES ('test@mail.com', 'test', 'test');

-- check constraint
ALTER TABLE products ADD CONSTRAINT price_check CHECK(price >= 1000);

ALTER TABLE products DROP CONSTRAINT price_check;

INSERT INTO products (id, name, category, price, quantity) VALUES ('P0008', 'permen lagi', 'Lain-lain', 1000, 10);

UPDATE products SET price = 500 WHERE id = 'P0008';

SELECT * FROM products;

DESC products;

SHOW CREATE TABLE products;


-- index
CREATE TABLE sellers (
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    PRIMARY KEY (id),
    UNIQUE KEY (email),
    INDEX name_index (name)
) ENGINE = InnoDB;

DESC sellers;

ALTER TABLE sellers ADD INDEX name_index (name);
ALTER TABLE sellers DROP INDEX name_index;

-- full text search
ALTER TABLE products ADD FULLTEXT product_search (name, description);

ALTER TABLE products DROP INDEX product_search;

DESC products;

SELECT * FROM products;

-- natural language
SELECT * FROM products WHERE MATCH(name, description) AGAINST('bakso' IN NATURAL LANGUAGE MODE);
-- boolean mode
SELECT * FROM products WHERE MATCH(name, description) AGAINST('+mie -bakso' IN BOOLEAN MODE);
-- query expansion
SELECT * FROM products WHERE MATCH(name, description) AGAINST('bakso' WITH QUERY EXPANSION);

SHOW CREATE TABLE products;































