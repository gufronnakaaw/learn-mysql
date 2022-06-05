-- subquery in where
SELECT * FROM products WHERE price > (SELECT AVG(price) FROM products);

-- subquery in from
SELECT MAX(price) FROM (SELECT price FROM categories INNER JOIN products ON (products.id_category = categories.id)) AS cat_prod;