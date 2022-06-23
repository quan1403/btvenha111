create database studentTestAsus;
use studentTestAsus;
create table test(
testId int primary key,
name varchar(50));
create table student(
Rn int primary key,
name varchar(50),
age int);
drop table student;
create table studentTest(
Rn int,
testId int,
date1 date,
mark float,
foreign key (Rn)references student(Rn),
foreign key (testId)references test(testId));
drop table studentTest;