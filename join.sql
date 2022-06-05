-- inner join 
-- left join 
-- right join 
-- cross join 


-- inner join
-- hanya mengambil data yang berelasi
SELECT * FROM categories INNER JOIN products ON (products.id_category = categories.id);

INSERT INTO categories (id, name) VALUES ('C0004', 'Elektronik'), ('C0005', 'Pakaian');
INSERT INTO categories (id, name) VALUES ('C0007', 'Komputer');

INSERT INTO products (id, name, price, quantity) VALUES ('P0009', 'Sate Ayam', 25000, 10), ('P0010', 'Sate Padang', 35000, 10), ('P0011', 'Soto Ayam', 15000, 10);

SELECT * FROM categories;
SELECT * FROM products;

-- left join
-- yang tidak berelasi akan ikut diambil dan berubah menjadi null
SELECT * FROM categories LEFT JOIN products ON (products.id_category = categories.id);

-- right join
-- yang tidak berelasi akan ikut diambil dan berubah menjadi null
SELECT * FROM categories RIGHT JOIN products ON (products.id_category = categories.id);

-- cross join
SELECT * FROM categories CROSS JOIN products;





