create database managementdb;
use managementdb;

create table student (
	studentid int primary key,
    studentname varchar(50),
    subjectid int
);

insert into student (studentid, studentname, subjectid) values
	(1, 'Ishan', 201),
    (2, 'Kavindu', 202),
    (3, 'Malith', NULL),
    (4, 'Sachini', 203),
    (5, 'Hiruni', NULL),
    (6, 'Pasindu', 202);

create table subject (
	subjectid int primary key,
    subjectname varchar(30)
);

insert into subject (subjectid, subjectname) values
	(201, 'Mathematics'),
    (202, 'Science'),
    (203, 'History'),
    (204, 'Geography');

select student.studentid, student.studentname, subject.subjectid, subject.subjectname
from student
inner join subject
on student.subjectid = subject.subjectid;

select student.studentid, student.studentname, subject.subjectid, subject.subjectname
from student
left join subject
on student.subjectid = subject.subjectid;

select student.studentid, student.studentname, subject.subjectid, subject.subjectname
from student
right join subject
on student.subjectid = subject.subjectid;

select student.studentname, subject.subjectname
from student
right join subject
on student.subjectid = subject.subjectid;

select studentname from student where subjectid is null;