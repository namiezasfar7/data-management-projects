CREATE DATABASE shop_sales;
USE shop_sales;

CREATE TABLE category (
	category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);

CREATE TABLE product (
	product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category_id INT,
    price INT,
    quantity_sold INT
);

INSERT INTO category (category_id, category_name) VALUES
	(1, 'Electronics'),
	(2, 'Stationery'),
	(3, 'Groceries'),
	(4, 'Furniture');

INSERT INTO product (product_id, product_name, category_id, price, quantity_sold) VALUES
	(1, 'Laptop', 1, 120000, 3),
	(2, 'Mouse', 1, 1500, 10),
	(3, 'Notebook', 2, 300, 25),
	(4, 'Pen', 2, 100, 50),
	(5, 'Rice Bag', 3, 4500, 4),
	(6, 'Sugar Pack', 3, 1200, 6);

SELECT category.category_name,
	SUM(product.price * product.quantity_sold) AS total_per_category
FROM category
INNER JOIN product
ON category.category_id = product.category_id
GROUP BY category.category_name;

SELECT category.category_name,
	AVG(product.price) AS average_per_category
FROM category
INNER JOIN product
ON category.category_id = product.category_id
GROUP BY category.category_name;

SELECT category.category_name,
	SUM(product.price * product.quantity_sold) AS total_per_category
FROM category
INNER JOIN product
ON category.category_id = product.category_id
GROUP BY category.category_name
HAVING SUM(product.price * product.quantity_sold) > 10000;

SELECT category.category_name,
	SUM(product.quantity_sold) AS total_quantity_per_category
FROM category
INNER JOIN product
ON category.category_id = product.category_id
GROUP BY category.category_name
HAVING SUM(product.quantity_sold) > 10;

SELECT category.category_name,
	MAX(product.price) AS max_price_per_category
FROM category
INNER JOIN product
ON category.category_id = product.category_id
GROUP BY category.category_name
HAVING MAX(product.price) < 5000;

SELECT category.category_name,
	(MAX(product.price) - MIN(product.price)) AS difference_per_category
FROM category
INNER JOIN product
ON category.category_id = product.category_id
GROUP BY category.category_name
HAVING (MAX(product.price) - MIN(product.price)) > 1000;

SELECT category.category_name
FROM category
LEFT JOIN product
ON category.category_id = product.category_id
WHERE product.product_id IS NULL;