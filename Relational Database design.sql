create database projects;

use projects;

create table role
(id int not null primary key,
role_name varchar(100));

create table user_has_role
(id int not null primary key,
role_start_time time,
role_end_time timestamp not null,
user_account_id int,
role_id int foreign key references role(id));

create table user_account (
id int primary key,
user_name varchar(100),
email varchar(254),
password varchar(200),
password_salt varchar(50) not null,
password_hash_algorithm varchar(50));

alter table user_has_role 
add foreign key (user_account_id) references user_account(id);

alter table user_has_role
alter column role_start_time datetime;

create table status (
id int primary key,
status_name varchar(100),
is_user_working varchar(100));

create table user_has_status
(id int primary key,
status_start_time time,
status_end_time timestamp not null,
user_account_id int foreign key references user_account(id),
status_id int foreign key references status(id));

1. Insert data into each of the above tables. With at least two rows in each of
the tables. Make sure that you have created respective foreign keys.


insert into role values (1, 'business analyst'),
(2, 'data analyst');

insert into user_has_role values 
(101, '2024-01-01','2024-06-01', 201, 1),
(102, '2024-02-01','2024-07-01', 202, 2);

select * from role;
select * from user_has_role;
select * from user_account;
select * from status;
select * from user_has_status;

insert into user_has_role (id,role_start_time,role_end_time,user_account_id,role_id) values (
1, '2020-09-08 15:00:00','2023-09-08 15:00:00',50,100),
(2,'2020-06-05 15:00:00','2023-06-05 15:00:00',49,99);

