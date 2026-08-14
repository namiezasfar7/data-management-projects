# 🛒 Shop Sales Analysis

A simple MySQL-based Shop Sales Analysis project that demonstrates how to create a relational database, define tables, insert records, join related tables, perform aggregate calculations, group results, filter grouped data using `HAVING`, and identify categories without any products.

---

## 📋 Features

* Creates a `shop_sales` database
* Creates `category` and `product` tables
* Uses primary keys to uniquely identify records
* Establishes a relationship between categories and products
* Inserts sample category and product data
* Uses `INNER JOIN` to combine related tables
* Uses `LEFT JOIN` to identify categories without products
* Calculates total sales per category
* Calculates average product price per category
* Calculates total quantity sold per category
* Finds the maximum product price per category
* Calculates the price difference between the most and least expensive products
* Uses `GROUP BY` for category-based analysis
* Uses `HAVING` to filter grouped results
* Uses aggregate functions such as `SUM()`, `AVG()`, `MAX()`, and `MIN()`

---

## 🛠️ Technologies Used

* MySQL
* SQL
* `CREATE DATABASE`
* `CREATE TABLE`
* `INSERT INTO`
* `SELECT`
* `INNER JOIN`
* `LEFT JOIN`
* `WHERE`
* `GROUP BY`
* `HAVING`
* `SUM()`
* `AVG()`
* `MAX()`
* `MIN()`
* Primary Keys
* Foreign Key Relationship Concept
* Aggregate Functions

---

## 📂 Project Structure

```text
shop-sales-analysis/
│── shop-sales-analysis.sql
└── README.md
```

---

## ▶️ How to Run

### 1. Open MySQL

Open MySQL Workbench, MySQL Command Line, or another MySQL-compatible SQL environment.

### 2. Run the SQL Script

Execute the following file:

```text
shop_sales.sql
```

The script will:

1. Create the `shop_sales` database.
2. Select the database.
3. Create the `category` table.
4. Create the `product` table.
5. Insert sample data.
6. Execute several sales-analysis queries.

---

## 📖 Database Structure

The project contains two main tables:

```text
category
-------------------------
category_id
category_name


product
-------------------------
product_id
product_name
category_id
price
quantity_sold
```

The `category_id` connects products to their respective categories.

---

## 🗃️ Sample Data

### Category Table

| Category ID | Category Name |
| ----------: | ------------- |
|           1 | Electronics   |
|           2 | Stationery    |
|           3 | Groceries     |
|           4 | Furniture     |

### Product Table

| Product ID | Product Name | Category ID |  Price | Quantity Sold |
| ---------: | ------------ | ----------: | -----: | ------------: |
|          1 | Laptop       |           1 | 120000 |             3 |
|          2 | Mouse        |           1 |   1500 |            10 |
|          3 | Notebook     |           2 |    300 |            25 |
|          4 | Pen          |           2 |    100 |            50 |
|          5 | Rice Bag     |           3 |   4500 |             4 |
|          6 | Sugar Pack   |           3 |   1200 |             6 |

---

## 🔗 Table Relationship

The `category_id` in the `product` table is used to associate each product with a category.

```text
             category
                 |
                 | category_id
                 |
                 v
              product
```

Example:

```text
category_id = 1
      |
      +---- Electronics
               |
               +---- Laptop
               |
               +---- Mouse
```

This allows the database to perform category-based sales analysis.

---

## 📊 Query 01 — Total Sales Per Category

The first query calculates the total sales value for each category.

```sql
SELECT category.category_name,
    SUM(product.price * product.quantity_sold) AS total_per_category
FROM category
INNER JOIN product
ON category.category_id = product.category_id
GROUP BY category.category_name;
```

The calculation used is:

```text
Total Sales = Price × Quantity Sold
```

`SUM()` is then used to calculate the total for each category.

---

## 📊 Query 02 — Average Price Per Category

The second query calculates the average product price for each category.

```sql
SELECT category.category_name,
    AVG(product.price) AS average_per_category
FROM category
INNER JOIN product
ON category.category_id = product.category_id
GROUP BY category.category_name;
```

The `AVG()` function calculates the average price of products within each category.

---

## 💰 Query 03 — Categories With Sales Above 10,000

This query identifies categories whose total sales exceed `10,000`.

```sql
SELECT category.category_name,
    SUM(product.price * product.quantity_sold) AS total_per_category
FROM category
INNER JOIN product
ON category.category_id = product.category_id
GROUP BY category.category_name
HAVING SUM(product.price * product.quantity_sold) > 10000;
```

The `HAVING` clause is used because the condition is applied to an aggregate result.

---

## 📦 Query 04 — Categories With More Than 10 Items Sold

This query finds categories where the total quantity sold is greater than `10`.

```sql
SELECT category.category_name,
    SUM(product.quantity_sold) AS total_quantity_per_category
FROM category
INNER JOIN product
ON category.category_id = product.category_id
GROUP BY category.category_name
HAVING SUM(product.quantity_sold) > 10;
```

`SUM()` calculates the total quantity sold for each category.

---

## 💵 Query 05 — Maximum Price Below 5,000

This query finds categories where the most expensive product costs less than `5,000`.

```sql
SELECT category.category_name,
    MAX(product.price) AS max_price_per_category
FROM category
INNER JOIN product
ON category.category_id = product.category_id
GROUP BY category.category_name
HAVING MAX(product.price) < 5000;
```

`MAX()` finds the highest product price within each category.

---

## 📈 Query 06 — Price Difference Greater Than 1,000

This query calculates the difference between the highest and lowest product prices in each category.

```sql
SELECT category.category_name,
    (MAX(product.price) - MIN(product.price)) AS difference_per_category
FROM category
INNER JOIN product
ON category.category_id = product.category_id
GROUP BY category.category_name
HAVING (MAX(product.price) - MIN(product.price)) > 1000;
```

The calculation is:

```text
Price Difference = Maximum Price - Minimum Price
```

The query only returns categories where this difference is greater than `1,000`.

---

## 🔍 Query 07 — Categories Without Products

The final query identifies categories that do not have any associated products.

```sql
SELECT category.category_name
FROM category
LEFT JOIN product
ON category.category_id = product.category_id
WHERE product.product_id IS NULL;
```

A `LEFT JOIN` keeps every category, including categories that do not have matching products.

The condition:

```sql
WHERE product.product_id IS NULL
```

filters the results to only categories without products.

For the current sample data, this identifies:

```text
Furniture
```

---

## 🧠 SQL Concepts Demonstrated

### `INNER JOIN`

Used to combine categories with their related products.

```sql
FROM category
INNER JOIN product
ON category.category_id = product.category_id
```

Only categories with matching products are included.

---

### `LEFT JOIN`

Used to keep all categories, including categories that have no products.

```sql
FROM category
LEFT JOIN product
ON category.category_id = product.category_id
```

---

### `GROUP BY`

Used to group products by category.

```sql
GROUP BY category.category_name
```

This allows aggregate calculations to be performed separately for each category.

---

### `HAVING`

Used to filter grouped or aggregated results.

```sql
HAVING SUM(product.quantity_sold) > 10;
```

Unlike `WHERE`, `HAVING` can filter based on aggregate calculations.

---

### Aggregate Functions

The project demonstrates several SQL aggregate functions:

```text
SUM()  → Calculates a total
AVG()  → Calculates an average
MAX()  → Finds the highest value
MIN()  → Finds the lowest value
```

---

## 🎯 Learning Objectives

This project demonstrates:

* Creating a MySQL database
* Creating relational database tables
* Inserting records
* Understanding table relationships
* Working with primary keys
* Using `INNER JOIN`
* Using `LEFT JOIN`
* Understanding `WHERE`
* Understanding `GROUP BY`
* Understanding `HAVING`
* Using aggregate functions
* Performing sales calculations
* Filtering grouped data
* Finding records without matching relationships
* Performing basic business data analysis using SQL

---

## 🚀 Future Improvements

Possible enhancements include:

* Add a `customer` table
* Add an `orders` table
* Add an `order_details` table
* Add product stock information
* Add sales dates
* Add customer information
* Add monthly sales analysis
* Add yearly sales analysis
* Add top-selling product queries
* Add low-stock product queries
* Add foreign key constraints
* Add `DECIMAL` for more appropriate price storage
* Create SQL views for frequently used reports
* Add stored procedures
* Add triggers for stock management
* Create a sales dashboard using a visualization tool

---

## 👤 Author

**Namiez Asfar**

GitHub: [**https://github.com/namiezasfar7**](https://github.com/namiezasfar7)