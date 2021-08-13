
 create table Questions(
 id int primary key identity(1,1),
 Course_id int foreign key references course(ID) ,
 Q_id int unique,
 Question varchar(200)
 )

 create table options(
 options_id int primary key identity(1,1),
 course_id int foreign key references course(ID),
 question_id int foreign key references Questions(Q_id),
 option1 varchar(100),
 option2 varchar(100),
 option3 varchar(100),
 option4 varchar(100),
 )

 create table answers(
 ans_id int primary key identity(1,1),
 course_id int foreign key references course(ID),
 Question_id int UNIQUE FOREIGN KEY REFERENCES Questions(Q_id),
 answer varchar(255),
 )



 select *from Questions
 select *from options
 select * from answers


 insert into Questions values(101, ' where is hyderabad')
insert into Questions values(102, ' where is taj mahal')


 insert into answers values(107,'telangana'),(108, 'UP')

 
 insert into options values
 (101,'telagana','ap','up','mp'),(102,'telagana','ap','up','mp')

-
-
-
-
-
-
-
-

select * from Users
select * from course
select * from Questions
select * from options
select * from answers


create table Users(
Id int identity(1,1) primary key,
FName varchar(20) not null,
LName varchar(20) not null,
UName varchar(20) not null,
Email varchar(40) not null,
Password varchar(max) null,
role varchar(10) not null)

insert into Users
values('TEACHER', 'TEACHER', 'TEACHER', 'teacher@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'teacher')


insert into Users
values('STUDENT', 'STUDENT', 'STUDENT', 'student@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'student')


create table course(
ID int not null primary key identity(1,1),
userId int not null,
course varchar(100) Unique not null,
role varchar(20) not null)


create table Questions(
course_id int foreign key references course(ID),
Q_id int primary key identity(1,1),
Question varchar(255))



insert into Questions values(
2, 'where is agra')


 create table options(
 question_id int foreign key references Questions(Q_id) identity(1,1) primary key,
 option1 varchar(100),
 option2 varchar(100),
 option3 varchar(100),
 option4 varchar(100))


 insert into options values(
 'UP', 'Delhi', 'Chennai', 'Hyd')
 


create table answers(
Question_id int FOREIGN KEY REFERENCES Questions(Q_id) identity(1,1) primary key,
answer varchar(255))


insert into answers values(
'UP')


select * from course
select * from Questions
select * from options
select * from answers

insert into Questions values(
'Python', 'where is Hyd')

insert into options values(
 'UP', 'Delhi', 'Chennai', 'Telangana')

insert into answers values(
'Telangana')

