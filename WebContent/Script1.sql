create table systemadmin(
sadmin_id int AUTO_INCREMENT PRIMARY KEY,
name varchar(20),
password varchar(20));

create table hradmin(
hradmin_id int AUTO_INCREMENT PRIMARY KEY,
name varchar(20),
password varchar(20));

create table manageradmin(
manageradmin_id int AUTO_INCREMENT PRIMARY KEY,
name varchar(20),
password varchar(20));

create table employee(
empregister_id int AUTO_INCREMENT PRIMARY KEY,
hradmin_id int,
name varchar(50),
password varchar(50),
email varchar(50),
salary double,
address varchar(255),
phone varchar(50),
FOREIGN KEY (hradmin_id) REFERENCES hradmin(hradmin_id) on delete cascade);


create table performance(
performance_id int AUTO_INCREMENT PRIMARY KEY,
empregister_id int,
attendence varchar(50),
assignment varchar(50),
english_skill varchar(50),
job_skill varchar(50),
job_position varchar(50),
teamwork varchar(50),
communication varchar(50),
FOREIGN KEY (empregister_id) REFERENCES employee(empregister_id) on delete cascade);





select * from employee;
select * from employee where employee.hradmin_id = 1;

select * from performance;

drop table employee;
drop table performance;

create table contact(
Contact_ID int AUTO_INCREMENT PRIMARY KEY,
conname varchar(50),
conemail varchar(50),
consubject varchar(50),
conmessage varchar(50));

insert into systemadmin(name,password) values('teamleader','leader123');
insert into hradmin(name,password) values('hradmin','hr1234');
insert into manageradmin(name,password) values('manager','manager123');

UPDATE performance SET assignment='half-complete' where empregister_id=1;

create view managerview as
select employee.name,employee.salary,performance.*
from employee,performance
where employee.empregister_id = performance.empregister_id;

select * from managerview where empregister_id=1;



delete from employee where empregister_id=6;
