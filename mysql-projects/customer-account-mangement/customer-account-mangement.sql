create database shopdb;
use shopdb;

create table customer (
	customerid int primary key,
    customername varchar(50),
    accountid int
);

insert into customer (customerid, customername, accountid) values
	(1, 'Pradeep', 501),
    (2, 'Anusha', 502),
    (3, 'Thilina', null),
    (4, 'Sashika', 503),
    (5, 'Madusha', null),
    (6, 'Nirosha', 502);

create table account (
	accountid int primary key,
    accounttype varchar(50)
);

insert into account (accountid, accounttype) values
	(501, 'Savings'),
    (502, 'Current'),
    (503, 'Fixed'),
    (504, 'Senior');

select customer.customername, account.accounttype
from customer
inner join account
on customer.accountid = account.accountid;

select customer.customername, account.accounttype
from customer
left join account
on customer.accountid = account.accountid;

select customer.customername, account.accounttype
from customer
right join account
on customer.accountid = account.accountid;

select customer.customername from customer
where accountid is null;

select account.accountid, account.accounttype
from account
left join customer
on customer.accountid = account.accountid
where customerid is null;