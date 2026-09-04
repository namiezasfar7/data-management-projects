# 🎓 Student Subject Management System

A simple SQL-based Student Subject Management System that demonstrates how to create relational database tables, insert records, establish relationships between students and subjects, and retrieve related data using different types of SQL joins.

---

## 📋 Features

* Creates a `managementdb` database
* Creates `student` and `subject` tables
* Uses primary keys to uniquely identify records
* Establishes a relationship between students and subjects
* Inserts sample student and subject data
* Demonstrates `INNER JOIN`
* Demonstrates `LEFT JOIN`
* Demonstrates `RIGHT JOIN`
* Identifies students who are not assigned to a subject
* Identifies subjects that do not have any students
* Retrieves related student and subject information
* Demonstrates handling of `NULL` values
* Demonstrates basic relational database concepts

---

## 🛠️ Technologies Used

* SQL
* Relational Databases
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

## 📂 Project Structure

```text
student-subject-management/
│── student-subject-management.sql
└── README.md
```

---

## ▶️ How to Run

1. Install the database management system required by the project.
2. Open a compatible SQL environment or database management tool.
3. Navigate to the project directory.
4. Open the SQL script.
5. Execute the script using the appropriate SQL environment.

The script will:

1. Create the `managementdb` database.
2. Select the database.
3. Create the `student` table.
4. Insert student records.
5. Create the `subject` table.
6. Insert subject records.
7. Execute several SQL queries demonstrating different types of joins.

> **Note:** This project uses SQL syntax compatible with MySQL. SQL syntax and supported features may vary between database management systems.

---

## 📖 Database Structure

The project contains two main tables:

```text
student
-------------------------
studentid
studentname
subjectid


subject
-------------------------
subjectid
subjectname
```

The `subjectid` connects students with their assigned subjects.

---

## 🗃️ Sample Data

### Student Table

| Student ID | Student Name | Subject ID |
| ---------: | ------------ | ---------: |
|          1 | Ishan        |        201 |
|          2 | Kavindu      |        202 |
|          3 | Malith       |       NULL |
|          4 | Sachini      |        203 |
|          5 | Hiruni       |       NULL |
|          6 | Pasindu      |        202 |

### Subject Table

| Subject ID | Subject Name |
| ---------: | ------------ |
|        201 | Mathematics  |
|        202 | Science      |
|        203 | History      |
|        204 | Geography    |

---

## 🔗 Table Relationship

The `subjectid` column in the `student` table is used to associate students with their respective subjects.

```text
             student
                 |
                 | subjectid
                 |
                 v
              subject
```

Example:

```text
subjectid = 202
      |
      +---- Science
               |
               +---- Kavindu
               |
               +---- Pasindu
```

Students with a `NULL` `subjectid` have not been assigned to a subject.

---

## 🔄 Query 01 — INNER JOIN

The first query displays only students who have a matching subject.

```sql
SELECT student.studentid, student.studentname,
       subject.subjectid, subject.subjectname
FROM student
INNER JOIN subject
ON student.subjectid = subject.subjectid;
```

An `INNER JOIN` returns only records where a matching value exists in both tables.

Students without a subject assignment are therefore excluded.

---

## 👥 Query 02 — LEFT JOIN

The second query displays all students, including students who have not been assigned a subject.

```sql
SELECT student.studentid, student.studentname,
       subject.subjectid, subject.subjectname
FROM student
LEFT JOIN subject
ON student.subjectid = subject.subjectid;
```

A `LEFT JOIN` returns every record from the left table (`student`).

If a student does not have a matching subject, the subject-related columns contain `NULL`.

---

## 📚 Query 03 — RIGHT JOIN

The third query displays all subjects, including subjects that currently have no students assigned to them.

```sql
SELECT student.studentid, student.studentname,
       subject.subjectid, subject.subjectname
FROM student
RIGHT JOIN subject
ON student.subjectid = subject.subjectid;
```

A `RIGHT JOIN` returns every record from the right table (`subject`).

Therefore, subjects without students are still included in the result.

For the current sample data, **Geography** has no assigned students.

---

## 🔍 Query 04 — RIGHT JOIN With Selected Columns

This query retrieves only the student name and subject name.

```sql
SELECT student.studentname, subject.subjectname
FROM student
RIGHT JOIN subject
ON student.subjectid = subject.subjectid;
```

This demonstrates how specific columns can be selected from joined tables instead of displaying all available information.

The result also shows subjects without students, with the student name appearing as `NULL`.

---

## ❓ Query 05 — Students Without Subjects

The final query identifies students who have not been assigned a subject.

```sql
SELECT studentname
FROM student
WHERE subjectid IS NULL;
```

The `IS NULL` condition is used to find records where `subjectid` does not contain a value.

For the current sample data, the students without assigned subjects are:

```text
Malith
Hiruni
```

---

## 🧠 SQL Concepts Demonstrated

### `INNER JOIN`

Returns only records with matching values in both tables.

```sql
FROM student
INNER JOIN subject
ON student.subjectid = subject.subjectid
```

---

### `LEFT JOIN`

Returns all records from the left table and matching records from the right table.

```sql
FROM student
LEFT JOIN subject
ON student.subjectid = subject.subjectid
```

This is useful when you want to make sure every student is included, even if they do not have a subject.

---

### `RIGHT JOIN`

Returns all records from the right table and matching records from the left table.

```sql
FROM student
RIGHT JOIN subject
ON student.subjectid = subject.subjectid
```

This is useful for identifying subjects that do not have any students assigned.

---

### `IS NULL`

Used to identify records where a column contains no value.

```sql
WHERE subjectid IS NULL;
```

---

### `NULL`

`NULL` represents the absence of a value.

In this project:

```text
Malith  → NULL
Hiruni  → NULL
```

This means these students currently do not have a subject assigned.

---

## 📊 Join Comparison

| Join Type    | What It Returns                                  |
| ------------ | ------------------------------------------------ |
| `INNER JOIN` | Only students and subjects with matching records |
| `LEFT JOIN`  | All students + matching subjects                 |
| `RIGHT JOIN` | All subjects + matching students                 |

```text
INNER JOIN
Student ∩ Subject

LEFT JOIN
All Students + Matching Subjects

RIGHT JOIN
All Subjects + Matching Students
```

---

## 🎯 Learning Objectives

This project demonstrates:

* Creating a relational database
* Creating database tables
* Inserting records
* Understanding primary keys
* Understanding table relationships
* Connecting related tables using IDs
* Using `INNER JOIN`
* Using `LEFT JOIN`
* Using `RIGHT JOIN`
* Understanding the difference between join types
* Working with `NULL` values
* Using `IS NULL`
* Retrieving data from multiple tables
* Identifying unmatched records
* Understanding basic relational database operations

---

## 🚀 Future Improvements

Possible enhancements include:

* Add a `teacher` table
* Add a `course` table
* Allow students to enroll in multiple subjects
* Create a separate enrollment table
* Add student grades
* Add examination results
* Add attendance records
* Add foreign key constraints
* Add `UPDATE` and `DELETE` operations
* Add search functionality
* Add aggregate queries
* Add `GROUP BY` and `HAVING` examples
* Add subqueries
* Add views
* Connect the database with a Java application using JDBC
* Create a complete Student Management System

---

## 👤 Author

**Namiez Asfar**

GitHub: [**https://github.com/namiezasfar7**](https://github.com/namiezasfar7)