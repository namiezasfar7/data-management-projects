# 🏦 Customer Account Management System

A beginner-level SQL project demonstrating **relational database design and JOIN operations** using a customer and bank account management scenario.

This project focuses on understanding how data from two related tables can be combined, including how to identify customers without accounts and accounts without customers.

---

## ✨ Features

* Created a `shopdb` database
* Created `customer` and `account` tables
* Used primary keys
* Established a logical relationship between customers and accounts
* Inserted sample customer and account data
* Demonstrated `INNER JOIN`
* Demonstrated `LEFT JOIN`
* Demonstrated `RIGHT JOIN`
* Used `IS NULL` to identify missing relationships
* Identified customers without accounts
* Identified accounts without customers

---

## 🛠️ Technologies Used

* SQL
* Relational Database Concepts
* `CREATE DATABASE`
* `CREATE TABLE`
* `INSERT INTO`
* `SELECT`
* `INNER JOIN`
* `LEFT JOIN`
* `RIGHT JOIN`
* `WHERE`
* `IS NULL`
* Primary Keys
* Table Relationships
* `NULL` Values

---

## 📁 Project Structure

```text
customer-account-management/
│── customer-account-management.sql
└── README.md
```

---

## ▶️ How to Run

1. Install a compatible database management system.
2. Open a SQL environment or database management tool.
3. Open `customer-account-management.sql`.
4. Execute the SQL script.
5. Run the individual queries to view the different JOIN results.

> **Note:** The script uses MySQL-style syntax such as `CREATE DATABASE` and `USE`. Syntax may vary depending on the database management system being used.

---

## 🗄️ Database Structure

### Customer Table

| Column         | Data Type   | Description                  |
| -------------- | ----------- | ---------------------------- |
| `customerid`   | INT         | Unique customer ID           |
| `customername` | VARCHAR(50) | Customer's name              |
| `accountid`    | INT         | ID of the customer's account |

### Account Table

| Column        | Data Type   | Description          |
| ------------- | ----------- | -------------------- |
| `accountid`   | INT         | Unique account ID    |
| `accounttype` | VARCHAR(50) | Type of bank account |

---

## 📊 Sample Customer Data

| Customer ID | Customer Name | Account ID |
| ----------: | ------------- | ---------: |
|           1 | Pradeep       |        501 |
|           2 | Anusha        |        502 |
|           3 | Thilina       |       NULL |
|           4 | Sashika       |        503 |
|           5 | Madusha       |       NULL |
|           6 | Nirosha       |        502 |

---

## 🏦 Sample Account Data

| Account ID | Account Type |
| ---------: | ------------ |
|        501 | Savings      |
|        502 | Current      |
|        503 | Fixed        |
|        504 | Senior       |

---

## 🔗 Table Relationship

The two tables are logically related through the `accountid` column:

```text
Customer
   │
   │ accountid
   ▼
Account
```

A customer can have a matching account ID.

However, the SQL script does **not** define an explicit `FOREIGN KEY` constraint. The relationship is demonstrated through the JOIN condition.

---

## 🔍 SQL Queries

### 01. INNER JOIN

```sql
select customer.customername, account.accounttype
from customer
inner join account
on customer.accountid = account.accountid;
```

Returns only customers who have a matching account.

**Expected matches:**

| Customer | Account Type |
| -------- | ------------ |
| Pradeep  | Savings      |
| Anusha   | Current      |
| Sashika  | Fixed        |
| Nirosha  | Current      |

---

### 02. LEFT JOIN

```sql
select customer.customername, account.accounttype
from customer
left join account
on customer.accountid = account.accountid;
```

Returns **all customers**, including customers who do not have an account.

Customers such as **Thilina** and **Madusha** will have `NULL` as their account type.

---

### 03. RIGHT JOIN

```sql
select customer.customername, account.accounttype
from customer
right join account
on customer.accountid = account.accountid;
```

Returns **all accounts**, including accounts that do not belong to any customer.

The `Senior` account has no matching customer, so its customer name will be `NULL`.

---

### 04. Find Customers Without Accounts

```sql
select customer.customername from customer
where accountid is null;
```

Finds customers whose `accountid` is `NULL`.

**Expected result:**

| Customer |
| -------- |
| Thilina  |
| Madusha  |

---

### 05. Find Accounts Without Customers

```sql
select account.accountid, account.accounttype
from account
left join customer
on customer.accountid = account.accountid
where customerid is null;
```

Finds accounts that do not have a matching customer.

**Expected result:**

| Account ID | Account Type |
| ---------: | ------------ |
|        504 | Senior       |

---

## 🧠 SQL Concepts Demonstrated

### INNER JOIN

Returns only records that have a match in both tables.

```text
Customer ∩ Account
```

### LEFT JOIN

Returns every record from the left table and matching records from the right table.

```text
All Customers
+ Matching Accounts
```

### RIGHT JOIN

Returns every record from the right table and matching records from the left table.

```text
All Accounts
+ Matching Customers
```

### IS NULL

Used to identify records where a value does not exist.

```sql
WHERE accountid IS NULL
```

This is useful for finding missing relationships.

---

## 📋 JOIN Comparison

| JOIN                  | What It Returns                   |
| --------------------- | --------------------------------- |
| `INNER JOIN`          | Customers with matching accounts  |
| `LEFT JOIN`           | All customers + matching accounts |
| `RIGHT JOIN`          | All accounts + matching customers |
| `LEFT JOIN + IS NULL` | Accounts without customers        |

---

## 🎯 Learning Objectives

This project helps develop an understanding of:

* Relational database concepts
* Designing basic database tables
* Primary keys
* Relationships between tables
* SQL JOIN operations
* Handling `NULL` values
* Filtering records with `WHERE`
* Identifying unmatched records
* Understanding how different JOIN types affect query results

---

## 🚀 Future Improvements

* Add an explicit `FOREIGN KEY` constraint
* Add account balance information
* Add account opening dates
* Add customer contact information
* Create transactions linked to accounts
* Add `UPDATE` and `DELETE` operations
* Add aggregate queries such as `COUNT()` and `SUM()`
* Expand the system into a complete banking database

---

## 👨‍💻 Author

**Namiez Asfar**

GitHub: [@namiezasfar7](https://github.com/namiezasfar7)